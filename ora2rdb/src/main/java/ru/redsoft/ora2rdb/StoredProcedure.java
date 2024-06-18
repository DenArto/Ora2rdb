package ru.redsoft.ora2rdb;

import java.util.ArrayList;
import java.util.Objects;
import java.util.TreeMap;

public class StoredProcedure implements StoredBlock{
    private String name;
    private TreeMap<Integer, Parameter> parameters = new TreeMap<>();
    private ArrayList<Parameter> declaredVariables = new ArrayList<>();
    private StoredBlock parent;
    private ArrayList<StoredBlock> children = new ArrayList<>();
    private ArrayList<StoredFunction> calledFunctions = new ArrayList<>();
    private ArrayList<StoredProcedure> calledProcedure = new ArrayList<>();
    private ArrayList<StoredBlock> calledStorageBlocks = new ArrayList<>();
    private String package_name;
    private String maybe_package_name;


    private boolean equalsParent(StoredProcedure procedure){
//        return Objects.equals(
//                this.getParent() != null ? this.getParent().getName() : null,
//                procedure.getParent() != null ? procedure.getParent().getName() : null);
//        return this.parent.equals(procedure.getParent());
        return Objects.equals(this.parent, procedure.getParent());
    }
    private boolean equalProcedureNames(StoredProcedure procedure){
        return Objects.equals(this.name, procedure.getName());
    }
    private boolean equalProcedurePackage(StoredProcedure procedure){
        return Objects.equals(this.package_name, procedure.getPackage_name());
    }
    private boolean equalProcedureParameters(StoredProcedure procedure){
        TreeMap<Integer, Parameter> parameters = procedure.getParameters();
        if(parameters.size() != this.getParameters().size())
            return false;
        for(Integer seq_num : parameters.keySet()){
            if(!this.getParameters().get(seq_num).equalParameter(parameters.get(seq_num))){
                return false;
            }
        }
        return true;
    }
    private boolean equalsProcedure(StoredProcedure procedure){
        return equalProcedureNames(procedure)
                && equalProcedureParameters(procedure)
                && equalsParent(procedure)
                && equalProcedurePackage(procedure);
    }

    @Override
    public boolean equals(StoredBlock storedBlock) {
        if(storedBlock instanceof StoredProcedure){
            return equalsProcedure((StoredProcedure)storedBlock);
        }
        return false;
    }

    @Override
    public boolean equalsIgnoreParameters(FinderBlockCall finder){
        return equalFinderBlockName(finder)
                && equalFinderBlockPackage(finder)
                && equalFinderBlockParent(finder);
    }

//    public boolean equalsFunctionsIgnoreParent(StoredFunction function){
//        return equalFunctionsNames(function)
//                && equalFunctionsParameters(function)
//                && equalFunctionsPackage(function);
//    }

//    @Override
//    public boolean equalsIgnoreParent(StoredBlock storedBlock) {
//        return false;
//    }

    @Override
    public boolean containOutParameters() {
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

        if(finder.getPackage_name() != null)
            return Objects.equals(this.package_name, finder.getPackage_name());
        else if(finder.getArea_package_name() != null)
            return Objects.equals(this.package_name, finder.getArea_package_name());
        return Objects.equals(this.package_name, finder.getPackage_name());
    }
    private boolean equalFinderBlockParameters(FinderBlockCall finder){
        TreeMap<Integer, Parameter> parameters = finder.getParameters();
        if(parameters.size() != this.getParameters().size())
            return false;
        for(Integer seq_num : parameters.keySet()){
            if(!this.getParameters().get(seq_num).equalParameter(parameters.get(seq_num)))
                return false;

        }
        return true;
    }
    @Override
    public boolean equals(FinderBlockCall finder) {
        return equalFinderBlockName(finder)
                && equalFinderBlockPackage(finder)
                && equalFinderBlockParameters(finder)
                && equalFinderBlockParent(finder);
    }

    @Override
    public boolean equalsIgnoreParent (FinderBlockCall finder){
        return equalFinderBlockName(finder)
                && equalFinderBlockPackage(finder)
                && equalFinderBlockParameters(finder);
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
        return   declaredVariables.stream()
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


    public ArrayList<StoredBlock> getCalledStorageBlocks() {
        return calledStorageBlocks;
    }

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

    public ArrayList<StoredProcedure> getCalledProcedure() {
        return calledProcedure;
    }
}


