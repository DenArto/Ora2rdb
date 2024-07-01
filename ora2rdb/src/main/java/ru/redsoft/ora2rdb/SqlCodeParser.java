package ru.redsoft.ora2rdb;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

public class SqlCodeParser {

    BlockType type = BlockType.UNKNOWN;
    BlockType previousType = BlockType.UNKNOWN;
    List<String> sqlQueries = new ArrayList<>();
    StringBuilder currentBlock = new StringBuilder();
    List<String> splittedInput;
    Integer beginEndCount = null;
    Integer quoteCount = null;

    List<String> splitMetadataIntoBlocks(InputStream inputStream) {

        splittedInput = fromStreamToString(inputStream);


        for (int i = 0; i < splittedInput.size() - 1; i++) {
            if (splittedInput.get(i).isEmpty()) {
                continue;
            }
            if (splittedInput.get(i).matches("^[ ]*$")) {
                currentBlock.append(splittedInput.get(i));
                continue;
            }
            if (checkIfInCommentOrQuote(splittedInput.get(i))) {
                continue;
            }

            if (type == BlockType.UNKNOWN) {
                type = checkIfSimpleBlockOrNot(i);
            }

            switch (type) {
                case PACKAGE:
                case FUNCTION_PROCEDURE_TRIGGER:
                    i = functionProcedureTriggerPackageParser(i);
                    break;
                case SIMPLE_COMMAND:
                    simpleBlockParser(splittedInput.get(i));
                    break;
            }
        }
        if (currentBlock.length() != 0) {
            sqlQueries.add(currentBlock.toString());
        }

        return sqlQueries;
    }


    private boolean checkIfInCommentOrQuote(String el) {
        boolean result;
        if (type == BlockType.QUOTE || type == BlockType.SINGLE_LINE_COMMENT || type == BlockType.MULTI_LINE_COMMENT) {
            result = true;
            currentBlock.append(el).append(" ");
            switch (type) {
                case SINGLE_LINE_COMMENT:
                    if (el.contains("\n")) {
                        type = previousType;
                        previousType = null;
                    }
                    break;
                case MULTI_LINE_COMMENT:
                    if (el.contains("*/")) {
                        type = previousType;
                        previousType = null;
                    }
                    break;
                case QUOTE:
                    if (el.contains("'") || el.contains("\"")) {
                        quoteCount = (quoteCount == null) ? -1 : quoteCount - 1;
                        if (quoteCount == 0) {
                            type = previousType;
                            previousType = null;
                        }
                    }
                    break;
            }
        } else {
            result = false;
            if (el.startsWith("/*")) {
                previousType = type;
                type = BlockType.MULTI_LINE_COMMENT;
                currentBlock.append(el).append(" ");
                result = true;
                if (el.endsWith("*/")) {
                    type = previousType;
                    previousType = null;
                }
            } else if (el.startsWith("--")) {
                previousType = type;
                type = BlockType.SINGLE_LINE_COMMENT;
                currentBlock.append(el).append(" ");
                result = true;
            } else if (el.startsWith("'") || el.startsWith("\"")) {
                previousType = type;
                type = BlockType.QUOTE;
                currentBlock.append(el).append(" ");
                result = true;
                quoteCount = (quoteCount == null) ? 1 : quoteCount + 1;
                if ((el.indexOf("'") != el.lastIndexOf("'")) || (el.indexOf("\"") != el.lastIndexOf("\""))) {
                    quoteCount = quoteCount - 1;
                    if (quoteCount == 0) {
                        type = previousType;
                        previousType = null;
                    }
                }
            }
        }
        return result;
    }

    private BlockType checkIfSimpleBlockOrNot(int identificator) {
        if (splittedInput.get(identificator).equals("\n")) {
            type = BlockType.UNKNOWN;
            return type;
        }
        if (splittedInput.get(identificator).equals("/")) {
            currentBlock.append(splittedInput.get(identificator)).append("\n");
            type = BlockType.UNKNOWN;
            return type;
        }
        StringBuilder command = new StringBuilder();
        int cnt = 0;
        for (int i = identificator; i < splittedInput.size(); i++) {
            if (!(splittedInput.get(i).equals("\n"))) {
                command.append(splittedInput.get(i)).append(" ");
                cnt++;
            }
            if (cnt >= 10)
                break;
        }
        if (command.toString().matches("(?i).*CREATE\\s+(OR\\s+REPLACE\\s+)?(FUNCTION|PROCEDURE|TRIGGER).*")) {
            type = BlockType.FUNCTION_PROCEDURE_TRIGGER;
            return type;
        }
        if (command.toString().matches("(?i).*CREATE\\s+(OR\\s+REPLACE\\s+)?PACKAGE(\\s+BODY)?.*")) {
            type = BlockType.PACKAGE;
            return type;
        }
        type = BlockType.SIMPLE_COMMAND;
        return type;
    }

    private int functionProcedureTriggerPackageParser(int id) {
        if (splittedInput.get(id).toUpperCase().contains("BEGIN")) {
            beginEndCount = (beginEndCount == null) ? 1 : beginEndCount + 1;
        }
        if (splittedInput.get(id).toUpperCase().contains("END")) {
            StringBuilder string = new StringBuilder();
            int cnt = 0;
            while (id + cnt < splittedInput.size()) {
                if (!(splittedInput.get(id + cnt).equals("\n"))) {
                    string.append(splittedInput.get(id + cnt));
                }
                if (cnt == 2) {
                    break;
                }
                cnt++;
            }
            if (!(string.toString().matches("(?i)END\\s*(LOOP|IF)\\s*;?.*"))) {
                beginEndCount = (beginEndCount == null) ? -1 : beginEndCount - 1;
            }
        }
        currentBlock.append(splittedInput.get(id)).append(" ");
        if ((beginEndCount != null && beginEndCount == 0 && type == BlockType.FUNCTION_PROCEDURE_TRIGGER)
                || (beginEndCount != null && beginEndCount == -1 && type == BlockType.PACKAGE)) {
            if (!(splittedInput.get(id).contains(";"))) {
                while (id <= splittedInput.size() - 1) {
                    id += 1;
                    currentBlock.append(splittedInput.get(id)).append(" ");
                    if (splittedInput.get(id).contains(";")) {
                        break;
                    }
                }
            }
            sqlQueries.add(currentBlock.toString());
            currentBlock.setLength(0);
            type = BlockType.UNKNOWN;
            beginEndCount = null;
        }
        return id;
    }

    private void simpleBlockParser(String el) {
        currentBlock.append(el).append(" ");
        if (el.endsWith(";")) {
            sqlQueries.add(currentBlock.toString());
            currentBlock.setLength(0);
            type = BlockType.UNKNOWN;
        }
    }

    private List<String> fromStreamToString(InputStream is) {
        List<String> combinedWords = new ArrayList<>();
        try (BufferedReader reader = new BufferedReader(new InputStreamReader(is))) {
            String line;
            while ((line = reader.readLine()) != null) {
                if (line.isEmpty()) {
                    continue;
                }
                String[] lines = line.split("\\r?\\n");

                for (String l : lines) {
                    String whiteSpace = countLeadingSpaces(l);
                    String[] words = l.split("\\s+");
                    combinedWords.add(whiteSpace);
                    for (String word : words) {
                        combinedWords.add(word);
                    }
                    combinedWords.add("\n");
                }
            }

        } catch (IOException e) {
            System.err.println(e.getMessage());
        }
        return combinedWords;
    }

    private String countLeadingSpaces(String text) {
        StringBuilder whiteSpace = new StringBuilder();
        for (int i = 0; i < text.length(); i++) {
            if (text.charAt(i) == ' ') {
                whiteSpace.append(' ');
            } else {
                break;
            }
        }
        return whiteSpace.toString();
    }

}
