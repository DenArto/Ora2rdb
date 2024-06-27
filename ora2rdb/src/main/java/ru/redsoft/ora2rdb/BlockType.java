package ru.redsoft.ora2rdb;

public enum BlockType {
    UNKNOWN,
    FUNCTION_PROCEDURE_TRIGGER,
    SINGLE_LINE_COMMENT,
    MULTI_LINE_COMMENT,
    SIMPLE_COMMAND,
    QUOTE,
    PACKAGE
}

