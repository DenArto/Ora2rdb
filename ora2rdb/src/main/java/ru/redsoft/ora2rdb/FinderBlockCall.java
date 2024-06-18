package ru.redsoft.ora2rdb;

import java.util.TreeMap;

public class FinderBlockCall {

    private String name;
    private String package_name;
    private String area_package_name;
    private TreeMap<Integer, Parameter> parameters = new TreeMap<>();
    private StoredBlock parent;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPackage_name() {
        return package_name;
    }

    public void setPackage_name(String package_name) {
        this.package_name = package_name;
    }

    public String getArea_package_name() {
        return area_package_name;
    }

    public void setArea_package_name(String area_package_name) {
        this.area_package_name = area_package_name;
    }

    public TreeMap<Integer, Parameter> getParameters(){
        return parameters;
    }

    public void setParameters(Integer sequence_number, String name, String type) {
        Parameter parameter = new Parameter();
        parameter.setType(type);
        parameter.setName(name);
        parameter.setOut(false);
        this.parameters.put(sequence_number, parameter);
    }

    public StoredBlock getParent() {
        return parent;
    }

    public void setParent(StoredBlock parent) {
        this.parent = parent;
    }
}
