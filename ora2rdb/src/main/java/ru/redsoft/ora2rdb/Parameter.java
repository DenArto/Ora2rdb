package ru.redsoft.ora2rdb;

import java.util.Objects;

public class Parameter {


    private String name;
    private String type;
    private boolean out;
//    private String convertType_spec;

    public Parameter(){
        this.name = null;
        this.type = null;
        this.out = false;
    }

    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }
    public void setType(String type) {
        this.type = type;
    }
    public boolean getOut() {
        return out;
    }
    public void setOut(boolean out) {
        this.out = out;
    }
    public boolean equalParameter(Parameter parameter) {
        return (Objects.equals(parameter.getType(), this.getType()));
    }


//    public String getConvertType_spec() {
//        return convertType_spec;
//    }
//
//    public void setConvertType_spec(String convertType_spec) {
//        this.convertType_spec = convertType_spec;
//    }
}

