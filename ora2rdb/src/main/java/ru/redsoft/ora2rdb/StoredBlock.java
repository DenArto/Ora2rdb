package ru.redsoft.ora2rdb;

import java.util.ArrayList;
import java.util.TreeMap;

public interface StoredBlock {

    boolean equals(StoredBlock storedBlock);
    boolean containOutParameters();
    boolean equals(FinderBlockCall finder);
    boolean equalsIgnoreParent (FinderBlockCall finder);
    boolean equalsIgnoreParameters (FinderBlockCall finder);

    String getName();
    void setName(String name);

    String getParamType(String name);
    TreeMap<Integer, Parameter> getParameters();
    void setParameters(Integer sequence_number, String name, String type, boolean is_out);
    void setParameters(Integer sequence_number, String name, String type);

    ArrayList<Parameter> getDeclaredVariables();
    void setDeclaredVariables(String name,String type);

    StoredBlock getParent();
    void setParent(StoredBlock parent);

    ArrayList<StoredBlock> getChildren();
    void setChildren(StoredBlock children);

    String getPackage_name();
    void setPackage_name(String package_name);

    String getMaybe_package_name();
    void setMaybe_package_name(String maybe_package_name);

     ArrayList<StoredBlock> getCalledStorageBlocks();
     void setCalledStorageBlocks(StoredBlock calledStorageBlocks);








}
