package ru.redsoft.ora2rdb;

import java.io.*;
import java.util.ArrayList;
import java.util.List;
import java.util.TreeMap;
import java.util.TreeSet;

import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.*;

public class Ora2rdb {
    public static boolean reorder = false;

    static String stripQuotes(String str) {
        if (str.startsWith("\""))
            return str.substring(1, str.length() - 1);
        else
            return str;
    }

    static String getRealName(String str) {
        if (str.startsWith("\""))
            return str.substring(1, str.length() - 1);
        else
            return str.toUpperCase();
    }

    static void printUsage() {
        System.err.println("Usage: ora2rdb.jar <input_file> [options]\n" +
                "Options:\n" +
                "    -o <output_file>    Specify output file.\n" +
                "    -r                  Reorder CREATE VIEW statements in according to their\n" +
                "                        dependencies. It allows to perform FORCE clause\n" +
                "                        conversion. Use this option only for scripts which\n" +
                "                        contain DB metadata.\n" +
                "Notes:\n" +
                "    \"stdin\" may be used as a value of <input_file>.");
    }

    static RewritingListener convert(InputStream is) throws IOException {
        List<String> splitBlocks = splitMetadataIntoBlocks(is);
        System.out.println("splitBlocks");
        for (String s : splitBlocks){
            System.out.println("Block");
            System.out.println(s);
        }

        StringBuilder mergedBlocks = new StringBuilder();
        for (String singleBlock : splitBlocks) {
            try {
                CharStream input = CharStreams.fromString(singleBlock);
                PlSqlLexer lexer = new PlSqlLexer(input);
                CommonTokenStream tokens = new CommonTokenStream(lexer);
                PlSqlParser parser = new PlSqlParser(tokens);
                parser.setErrorHandler(new BailErrorStrategy());
                ParserRuleContext tree = parser.sql_script();  // пытаемся запарсить
                mergedBlocks.append(singleBlock).append("\n");
            } catch (Exception e) {
                mergedBlocks.append("/*").append(singleBlock).append("*/").append("\n");
            }
        }

        CharStream input = CharStreams.fromString(mergedBlocks.toString());
        PlSqlLexer lexer = new PlSqlLexer(input);
        CommonTokenStream tokens = new CommonTokenStream(lexer);
        PlSqlParser parser = new PlSqlParser(tokens);
        parser.setErrorHandler(new BailErrorStrategy());
        ParserRuleContext tree;
        tree = parser.sql_script();


        ParseTreeWalker walker = new ParseTreeWalker();

        ScanListener scan_listener = new ScanListener();
        walker.walk(scan_listener, tree);

        RewritingListener converter = new RewritingListener(tokens);
        walker.walk(converter, tree);


        StorageInfo.clearInfo();
        return converter;
    }

    private static List<String> splitMetadataIntoBlocks(InputStream inputStream) {
        List<String> sqlQueries = new ArrayList<>();
        StringBuilder currentBlock = new StringBuilder();
        BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream));

        String line;
        boolean insideCommentBlock = false;

        try {
            while ((line = reader.readLine()) != null) {
                line = line.trim();
                if (!line.isEmpty()) { // Игнорируем пустые строки
                    if (line.startsWith("/*") || insideCommentBlock) {  // проверям на наличие комментариев /* */
                        insideCommentBlock = true;
                        if (line.contains("*/")) {
                            insideCommentBlock = false;
                            currentBlock.append(line).append("\n");
                            sqlQueries.add(currentBlock.toString());
                            currentBlock.setLength(0); // Очищаем буфер для следующего запроса
                            continue;
                        } else {
                            currentBlock.append(line).append("\n");
                            continue;
                        }
                    }
                    currentBlock.append(line).append("\n");
                    if (line.endsWith(";")) { // Найден конец SQL запроса
                        sqlQueries.add(currentBlock.toString());
                        currentBlock.setLength(0); // Очищаем буфер для следующего запроса
                    }
                }
            }
            // Если последний блок не заканчивается ; , то тоже добавляем
            if (currentBlock.length() > 0) {
                sqlQueries.add(currentBlock.toString().trim());
            }

            reader.close();
        } catch (IOException e) {
            System.err.println(e.getMessage());
        }

        return sqlQueries;
    }

    public static void main(String[] args) throws Exception {
        InputStream is;
        PrintStream ps = System.out;
        String output_file = null;

        if (args.length > 0) {
            if (args[0].equals("stdin")) {
                is = System.in;
            } else {
                try {
                    is = new FileInputStream(args[0]);
                } catch (Exception e) {
                    System.err.println("Unable to open: " + args[0]);
                    return;
                }
            }

            for (int i = 1; i < args.length; i++) {
                switch (args[i]) {
                    case "-o":
                        if (i < args.length - 1) {
                            i++;
                            output_file = args[i];
                        } else {
                            System.err.println("Missing argument for option: " + args[i]);
                            printUsage();
                            return;
                        }

                        break;

                    case "-r":
                        reorder = true;
                        break;

                    default:
                        System.err.println("Unknown option: " + args[i]);
                        printUsage();
                        return;
                }
            }
        } else {
            printUsage();
            return;
        }

        RewritingListener converter;
        try {
            converter = convert(is);
        } catch (Exception e) {
            System.err.println(e.fillInStackTrace());
            System.err.println("Output will not be generated");
            return;
        }

        //RewritingVisitor rv = new RewritingVisitor(parser);

        if (output_file != null) {
            try {
                ps = new PrintStream(output_file);
            } catch (Exception e) {
                System.err.println("Unable to write: " + output_file);
                return;
            }
        }

        if (reorder)
            ps.print(converter.getText());
        else
            ps.print(converter.rewriter.getText());


        ps.close();
    }
}
