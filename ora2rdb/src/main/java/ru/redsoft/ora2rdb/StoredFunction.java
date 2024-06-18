package ru.redsoft.ora2rdb;

import java.util.*;

public class StoredFunction implements StoredBlock {

    private String name;
    private TreeMap<Integer, Parameter> parameters = new TreeMap<>();
    private ArrayList<Parameter> declaredVariables = new ArrayList<>();
    private String function_returns_type;
    private String convert_function_return_type;
    private StoredBlock parent;
    private ArrayList<StoredBlock> children = new ArrayList<>();
    private ArrayList<StoredFunction> calledFunctions = new ArrayList<>();
    private ArrayList<StoredProcedure> calledProcedure = new ArrayList<>();
    private ArrayList<StoredBlock> calledStorageBlocks = new ArrayList<>();
    private String package_name;
    private String maybe_package_name;

    private boolean equalsParent(StoredFunction function){
      return Objects.equals(
              this.getParent() != null ? this.getParent().getName() : null,
              function.getParent() != null ? function.getParent().getName() : null);
    }
    private boolean equalFunctionsNames(StoredFunction function){
        return Objects.equals(this.getName(), function.getName());
    }
    private boolean equalFunctionsPackage(StoredFunction function){
        return Objects.equals(this.getPackage_name(), function.getPackage_name());
    }
    private boolean equalFunctionsParameters(StoredFunction function){
        TreeMap<Integer, Parameter> parameters = function.getParameters();
        if(parameters.size() != this.getParameters().size())
            return false;
        for(Integer seq_num : parameters.keySet()){
            if(!this.getParameters().get(seq_num).equalParameter(parameters.get(seq_num))){
                return false;
            }
        }
        return true;
    }
    private boolean equalsFunctions(StoredFunction function){
        return equalFunctionsNames(function)
                && equalFunctionsParameters(function)
                && equalsParent(function)
                && equalFunctionsPackage(function);
    }

    @Override
    public boolean equals(StoredBlock storedBlock) {
        if(storedBlock instanceof StoredFunction){
            return equalsFunctions((StoredFunction) storedBlock);
        }
        return false;
    }


    public boolean equalsFunctionsIgnoreParent(StoredFunction function){
        return equalFunctionsNames(function)
                && equalFunctionsParameters(function)
                && equalFunctionsPackage(function);
    }

//    @Override
//    public boolean equalsIgnoreParent (StoredBlock storedBlock){
//        if(storedBlock instanceof StoredFunction){
//            return equalsFunctionsIgnoreParent((StoredFunction) storedBlock);
//       }
//        return false;
//    }

    @Override
    public boolean containOutParameters(){
        return parameters.values().stream()
                .anyMatch(Parameter::getOut);
    }





    private boolean equalFinderBlockName(FinderBlockCall finder){
        return Objects.equals(this.getName(), finder.getName());
    }
    private boolean equalFinderBlockParent(FinderBlockCall finder){
        return Objects.equals(this.parent, finder.getParent());
    }
    private boolean equalFinderBlockPackage(FinderBlockCall finder){
        if(finder.getPackage_name() != null){
            return Objects.equals(this.getPackage_name(), finder.getPackage_name());
        }else if(finder.getArea_package_name() != null) {
            return Objects.equals(this.getPackage_name(), finder.getArea_package_name());
        }
        return Objects.equals(this.getPackage_name(), finder.getPackage_name());


    }
    private boolean equalFinderBlockParameters(FinderBlockCall finder){
        TreeMap<Integer, Parameter> parameters = finder.getParameters();
        if(parameters.size() != this.getParameters().size())
            return false;
        for(Integer seq_num : parameters.keySet()){
            if(!this.getParameters().get(seq_num).equalParameter(parameters.get(seq_num))){
                return false;
            }
        }
        return true;
    }

    @Override
    public boolean equals(FinderBlockCall finder) {//todo
        return equalFinderBlockName(finder)
                && equalFinderBlockPackage(finder)
                && equalFinderBlockParameters(finder)
                && equalFinderBlockParent(finder);
    }

    @Override
    public boolean equalsIgnoreParent(FinderBlockCall finder) {//todo
        return equalFinderBlockName(finder)
                && equalFinderBlockPackage(finder)
                && equalFinderBlockParameters(finder);
    }

    @Override
    public boolean equalsIgnoreParameters(FinderBlockCall finder){
        return equalFinderBlockName(finder)
                && equalFinderBlockPackage(finder)
                && equalFinderBlockParent(finder);
    }

    public boolean containFunctionCallWithOutParameters(){
        return calledFunctions.stream()
                .anyMatch(StoredFunction::containOutParameters);
    }





    @Override
    public String getName() {
        return name;
    }

    @Override
    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String getParamType(String name){
        return declaredVariables.stream()
                .filter(e -> e.getName().equals(name))
                .findFirst().orElse(new Parameter()).getType();
    }

    @Override
    public TreeMap<Integer, Parameter> getParameters() {
        return parameters;
    }

    @Override
    public void setParameters(Integer sequence_number, String name, String type, boolean is_out) {
        Parameter parameter = new Parameter();
        parameter.setType(type);
        parameter.setName(name);
        parameter.setOut(is_out);
        this.parameters.put(sequence_number, parameter);
        this.declaredVariables.add(parameter);
    }

    @Override
    public void setParameters(Integer sequence_number, String name, String type) {
        Parameter parameter = new Parameter();
        parameter.setType(type);
        parameter.setName(name);
        parameter.setOut(false);
        this.parameters.put(sequence_number, parameter);
        this.declaredVariables.add(parameter);
    }

    @Override
    public ArrayList<Parameter> getDeclaredVariables() {
        return declaredVariables;
    }

    @Override
    public void setDeclaredVariables(String name,String type) {
        Parameter parameter = new Parameter();
        parameter.setType(type);
        parameter.setName(name);
        parameter.setOut(false);
        this.declaredVariables.add(parameter) ;
    }

    public String getFunction_returns_type() {
        return function_returns_type;
    }

    public void setFunction_returns_type(String function_returns_type) {
        this.function_returns_type = function_returns_type;
    }

    public String getConvert_function_return_type() {
        return convert_function_return_type;
    }

    public void setConvert_function_return_type(String convert_function_return_type) {
        this.convert_function_return_type = convert_function_return_type;
    }

    @Override
    public StoredBlock getParent() {
        return parent;
    }

    @Override
    public void setParent(StoredBlock parent) {
        this.parent = parent;
    }

    @Override
    public ArrayList<StoredBlock> getChildren() {
        return children;
    }

    @Override
    public void setChildren(StoredBlock children) {
        this.children.add(children);
    }

    @Override
    public String getPackage_name() {
        return package_name;
    }

    @Override
    public void setPackage_name(String package_name) {
        this.package_name = package_name;
    }

    @Override
    public String getMaybe_package_name() {
        return maybe_package_name;
    }

    @Override
    public void setMaybe_package_name(String maybe_package_name) {
        this.maybe_package_name = maybe_package_name;
    }

    @Override
    public ArrayList<StoredBlock> getCalledStorageBlocks() {
        return calledStorageBlocks;
    }

    @Override
    public void setCalledStorageBlocks(StoredBlock calledBlock) {
        this.calledStorageBlocks.add(calledBlock);
        if(calledBlock instanceof StoredFunction)
            this.calledFunctions.add((StoredFunction) calledBlock);
        else if(calledBlock instanceof StoredProcedure)
            this.calledProcedure.add((StoredProcedure) calledBlock);
    }

    public ArrayList<StoredFunction> getCalledFunctions() {
        return calledFunctions;
    }



    public ArrayList<StoredProcedure> getCalledProcedure() {//todo
        return calledProcedure;
    }


}