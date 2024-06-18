package ru.redsoft.ora2rdb;

import java.util.Objects;
import java.util.Stack;
import java.util.TreeMap;
import java.util.TreeSet;
import ru.redsoft.ora2rdb.PlSqlParser.*;

public class ScanListener extends PlSqlParserBaseListener {
    Stack<StoredBlock> storedBlocksStack = new Stack<>();
    String currentProcedureName;
    String current_package_name = null;

    @Override
    public void enterCreate_package_body(Create_package_bodyContext ctx) {
        current_package_name = Ora2rdb.getRealName(ctx.package_name(0).getText());
        for (Package_obj_bodyContext obj_body : ctx.package_obj_body()) {
            if (obj_body.type_declaration() != null) {
                Type_declarationContext type = obj_body.type_declaration();
                if (type.record_type_def() != null) {
                    for (Field_specContext field_spec : type.record_type_def().field_spec()) {
                        if (field_spec.type_spec() != null) {
                            Type_specContext typeSpec = field_spec.type_spec();
                            if (typeSpec.type_name() != null) {
                                String tableName = Ora2rdb.getRealName(typeSpec.type_name().id_expression(0).getText());
                                String columnName = Ora2rdb.getRealName(typeSpec.type_name().id_expression(1).getText());
                                if (StorageInfo.types_of_column.containsKey(tableName)) {
                                    StorageInfo.types_of_column.get(tableName).put(columnName, null);
                                } else {
                                    TreeMap<String, String> unknown_column_type = new TreeMap<>();
                                    unknown_column_type.put(columnName, null);
                                    StorageInfo.types_of_column.put(tableName, unknown_column_type);
                                }
                            }
                        }
                    }
                }
            }
        }
    }

    @Override
    public void exitCreate_package_body(Create_package_bodyContext ctx){
         current_package_name = null;
    }

    @Override
    public void enterAlter_table(Alter_tableContext ctx) {
        Column_clausesContext columns_ctx = ctx.column_clauses();
        Constraint_clausesContext constraint_clauses_ctx = ctx.constraint_clauses();

        if (columns_ctx != null) {
            Add_modify_drop_column_clausesContext add_modify_drop_column_clauses_ctx = columns_ctx.add_modify_drop_column_clauses();
            if (add_modify_drop_column_clauses_ctx != null) {
                if (add_modify_drop_column_clauses_ctx.constraint_clauses() != null) {
                    Modify_column_clausesContext modify_column_clauses_ctx = add_modify_drop_column_clauses_ctx.modify_column_clauses(0);
                    if (!modify_column_clauses_ctx.modify_col_properties().isEmpty()) {
                        Modify_col_propertiesContext modify_col_properties_ctx = modify_column_clauses_ctx.modify_col_properties(0);

                        if (!modify_col_properties_ctx.inline_constraint().isEmpty()) {
                            Inline_constraintContext inline_constraint_ctx = modify_col_properties_ctx.inline_constraint(0);

                            if (inline_constraint_ctx.NOT() != null && inline_constraint_ctx.NULL_() != null) {
                                String table_name = Ora2rdb.getRealName(ctx.tableview_name().id_expression().getText());
                                String column_name = Ora2rdb.getRealName(modify_col_properties_ctx.column_name().getText());

                                if (StorageInfo.table_not_null_cols.containsKey(table_name)) {
                                    StorageInfo.table_not_null_cols.get(table_name).add(column_name);
                                } else {
                                    TreeSet<String> columns_set = new TreeSet<String>();
                                    columns_set.add(column_name);
                                    StorageInfo.table_not_null_cols.put(table_name, columns_set);
                                }
                            }
                        }
                    }
                }
            }
        } else if (constraint_clauses_ctx != null) {
            if (!constraint_clauses_ctx.out_of_line_constraint().isEmpty()) {
                Out_of_line_constraintContext out_of_line_constraint_ctx = constraint_clauses_ctx.out_of_line_constraint(0);

                if (out_of_line_constraint_ctx.PRIMARY() != null) {
                    TreeSet<String> columns_set = new TreeSet<String>();

                    for (Column_nameContext column_name_ctx : out_of_line_constraint_ctx.column_name())
                        columns_set.add(Ora2rdb.getRealName(column_name_ctx.getText()));

                    String table_name = Ora2rdb.getRealName(ctx.tableview_name().id_expression().getText());

                    if (StorageInfo.table_not_null_cols.containsKey(table_name))
                        StorageInfo.table_not_null_cols.get(table_name).addAll(columns_set);
                    else
                        StorageInfo.table_not_null_cols.put(table_name, columns_set);
                }
                if (out_of_line_constraint_ctx.PRIMARY() != null)
                    StorageInfo.index_names.add(Ora2rdb.getRealName(out_of_line_constraint_ctx.constraint_name().getText()));
                else if (out_of_line_constraint_ctx.UNIQUE() != null)
                    StorageInfo.index_names.add(Ora2rdb.getRealName(out_of_line_constraint_ctx.constraint_name().getText()));
                else if (out_of_line_constraint_ctx.foreign_key_clause() != null) {
                    if (out_of_line_constraint_ctx.foreign_key_clause().FOREIGN() != null)
                        StorageInfo.index_names.add(Ora2rdb.getRealName(out_of_line_constraint_ctx.constraint_name().getText()));

                }


            }
        }
    }

    @Override
    public void enterCreate_procedure_body(Create_procedure_bodyContext ctx) {
        String procedureName;
        StoredProcedure storedProcedure = new StoredProcedure();
        if (ctx.procedure_name().id_expression() != null)
            procedureName = Ora2rdb.getRealName(ctx.procedure_name().id_expression().getText());
        else
            procedureName = Ora2rdb.getRealName(ctx.procedure_name().identifier().id_expression().getText());

        storedProcedure.setName(procedureName);
        storedProcedure.setPackage_name(current_package_name);

        if(ctx.parameter() != null){
            for(int i = 0; i < ctx.parameter().size(); i++ ){
                String name = Ora2rdb.getRealName(ctx.parameter(i).parameter_name().getText());
                String type;
                if(ctx.parameter(i).type_spec().datatype() != null)
                    type = Ora2rdb.getRealName(ctx.parameter(i).type_spec().datatype().native_datatype_element().getText());
                else
                    type = Ora2rdb.getRealName(ctx.parameter(i).type_spec().getText());
                storedProcedure.setParameters(i, name, type, !ctx.parameter(i).OUT().isEmpty());
            }
        }
        currentProcedureName = procedureName;
        storedBlocksStack.push(storedProcedure);
    }

    @Override
    public void exitCreate_procedure_body(Create_procedure_bodyContext ctx) {
        currentProcedureName = null;
        StorageInfo.stored_blocks_list.add(storedBlocksStack.pop());
    }

    @Override
    public void enterProcedure_body(Procedure_bodyContext ctx) {
        StoredProcedure storedProcedure = new StoredProcedure();
        String procedureName = Ora2rdb.getRealName(ctx.identifier().id_expression().getText());


        storedProcedure.setName(procedureName);
        storedProcedure.setPackage_name(current_package_name);

        if(ctx.parameter() != null){
            for(int i = 0; i < ctx.parameter().size(); i++ ){
                String name = Ora2rdb.getRealName(ctx.parameter(i).parameter_name().getText());
                String type;
                if(ctx.parameter(i).type_spec().datatype() != null)
                    type = Ora2rdb.getRealName(ctx.parameter(i).type_spec().datatype().native_datatype_element().getText());
                else
                    type = Ora2rdb.getRealName(ctx.parameter(i).type_spec().getText());
                storedProcedure.setParameters(i, name, type, !ctx.parameter(i).OUT().isEmpty());
            }
        }
        if(!storedBlocksStack.isEmpty()) {
            storedProcedure.setParent(storedBlocksStack.peek());
            storedBlocksStack.peek().setChildren(storedProcedure);
        }
        storedBlocksStack.push(storedProcedure);
        currentProcedureName = procedureName;

    }

    @Override
    public void exitProcedure_body(Procedure_bodyContext ctx) {
        currentProcedureName = null;
        StorageInfo.stored_blocks_list.add(storedBlocksStack.pop());
    }

    @Override
    public void enterCreate_function_body(Create_function_bodyContext ctx) {
        String functionName;
        StoredFunction storedFunction = new StoredFunction();
        if (ctx.function_name().id_expression() != null)
            functionName = Ora2rdb.getRealName(ctx.function_name().id_expression().getText());
        else
            functionName = Ora2rdb.getRealName(ctx.function_name().identifier().id_expression().getText());

        storedFunction.setName(functionName);
        storedFunction.setPackage_name(current_package_name);
        if(ctx.type_spec().datatype() != null)
            storedFunction.setFunction_returns_type(Ora2rdb.getRealName(ctx.type_spec().datatype().native_datatype_element().getText()));
        else
            storedFunction.setFunction_returns_type(Ora2rdb.getRealName(ctx.type_spec().getText()));
        storedFunction.setConvert_function_return_type(getConvertType(ctx.type_spec()));
        if(ctx.parameter() != null){
            for(int i = 0; i < ctx.parameter().size(); i++ ){
                String name = Ora2rdb.getRealName(ctx.parameter(i).parameter_name().getText());
                String type;
                if(ctx.parameter(i).type_spec().datatype() != null)
                    type = Ora2rdb.getRealName(ctx.parameter(i).type_spec().datatype().native_datatype_element().getText());
                else
                    type = Ora2rdb.getRealName(ctx.parameter(i).type_spec().getText());
                storedFunction.setParameters(i, name, type, !ctx.parameter(i).OUT().isEmpty());
            }
        }
        currentProcedureName = functionName;
        storedBlocksStack.push(storedFunction);
    }

    @Override
    public void exitCreate_function_body(Create_function_bodyContext ctx){
        StorageInfo.stored_blocks_list.add(storedBlocksStack.pop());
    }

    @Override
    public void enterFunction_body(Function_bodyContext ctx) {
        StoredFunction storedFunction = new StoredFunction();
        String functionName = Ora2rdb.getRealName(ctx.identifier().id_expression().getText());

        storedFunction.setName(functionName);
        storedFunction.setPackage_name(current_package_name);
        if(ctx.type_spec().datatype() != null)
            storedFunction.setFunction_returns_type(Ora2rdb.getRealName(ctx.type_spec().datatype().native_datatype_element().getText()));
        else
            storedFunction.setFunction_returns_type(Ora2rdb.getRealName(ctx.type_spec().getText()));
        storedFunction.setConvert_function_return_type(getConvertType(ctx.type_spec()));
        if(ctx.parameter() != null){
            for(int i = 0; i < ctx.parameter().size(); i++ ){
                String name = Ora2rdb.getRealName(ctx.parameter(i).parameter_name().getText());
                String type;
                if(ctx.parameter(i).type_spec().datatype() != null)
                    type = Ora2rdb.getRealName(ctx.parameter(i).type_spec().datatype().native_datatype_element().getText());
                else
                    type = Ora2rdb.getRealName(ctx.parameter(i).type_spec().getText());
                storedFunction.setParameters(i, name, type, !ctx.parameter(i).OUT().isEmpty());
            }
        }

        if(!storedBlocksStack.isEmpty()){
            storedFunction.setParent(storedBlocksStack.peek());
            storedBlocksStack.peek().setChildren(storedFunction);
        }
        storedBlocksStack.push(storedFunction);

    }

    @Override
    public void exitFunction_body(Function_bodyContext ctx){
        StorageInfo.stored_blocks_list.add(storedBlocksStack.pop());
    }

    @Override
    public void enterFunction_call(Function_callContext ctx) {
        FinderBlockCall finder = new FinderBlockCall();
        String name;
        String package_name;
        if(ctx.routine_name().id_expression(0) != null){
            name = Ora2rdb.getRealName(ctx.routine_name().id_expression(0).getText());
            package_name = Ora2rdb.getRealName(ctx.routine_name().identifier().getText());
        } else {
            name = Ora2rdb.getRealName(ctx.routine_name().identifier().getText());
            package_name = null;
        }
        finder.setName(name);
        finder.setPackage_name(package_name);
        finder.setArea_package_name(current_package_name);

        if (ctx.function_argument() != null && !storedBlocksStack.isEmpty() ) {
            String arg_name;
            for (int i = 0; i < ctx.function_argument().argument().size(); i++) {
                arg_name = Ora2rdb.getRealName(ctx.function_argument().argument(i).getText());
                finder.setParameters(
                        i,
                        arg_name,
                        storedBlocksStack.peek().getParamType(arg_name)
                );
            }
        }
        if(!storedBlocksStack.isEmpty())
            storedBlocksStack.peek().getChildren().stream()
                .filter(e -> e.equalsIgnoreParent(finder))
                .findFirst().ifPresent(child -> finder.setParent(child.getParent()));


        StoredBlock storedBlock = StorageInfo.stored_blocks_list.stream()
                .filter(e -> e.equals(finder))
                .findFirst().orElse(null);
        if(storedBlock != null && !storedBlocksStack.isEmpty())
            if(!storedBlocksStack.peek().getCalledStorageBlocks().contains(storedBlock))
                storedBlocksStack.peek().setCalledStorageBlocks(storedBlock);
    }

    @Override 
    public void enterGeneral_element_part(General_element_partContext ctx) {
        if(ctx.function_argument() != null){
            FinderBlockCall finder = new FinderBlockCall();
            String name;
            String package_name;
            if(!ctx.PERIOD().isEmpty()){
                name = Ora2rdb.getRealName(ctx.id_expression(1).getText());
                package_name = Ora2rdb.getRealName(ctx.id_expression(0).getText());
            }
            else{
                name = Ora2rdb.getRealName(ctx.id_expression(0).getText());
                package_name = null;
            }
            finder.setName(name);
            finder.setPackage_name(package_name);
            finder.setArea_package_name(current_package_name);

            if (ctx.function_argument() != null && !storedBlocksStack.isEmpty()) {
                String arg_name;
                for (int i = 0; i < ctx.function_argument().argument().size(); i++) {
                    arg_name = Ora2rdb.getRealName(ctx.function_argument().argument(i).getText());
                    finder.setParameters(
                            i,
                            arg_name,
                            storedBlocksStack.peek().getParamType(arg_name)
                    );
                }
            }
            if( !storedBlocksStack.isEmpty())
                 storedBlocksStack.peek().getChildren().stream()
                    .filter(e -> e.equalsIgnoreParent(finder))
                    .findFirst().ifPresent(child -> finder.setParent(child.getParent()));


            StoredBlock storedBlock = StorageInfo.stored_blocks_list.stream()
                    .filter(e -> e.equals(finder))
                    .findFirst().orElse(null);
            if(storedBlock != null && !storedBlocksStack.isEmpty())
                if(!storedBlocksStack.peek().getCalledStorageBlocks().contains(storedBlock))
                    storedBlocksStack.peek().setCalledStorageBlocks(storedBlock);
        }
    }


    @Override
    public void exitVariable_declaration(Variable_declarationContext ctx) {
        if (ctx.CONSTANT() != null
                && ctx.parent.getClass().equals(PlSqlParser.Package_obj_specContext.class)
                || ctx.parent.getClass().equals(PlSqlParser.Package_obj_bodyContext.class)) {

            StorageInfo.package_constant_names.add(ctx.identifier().getText());
        }
        if(!storedBlocksStack.isEmpty()){
            String name = Ora2rdb.getRealName(ctx.identifier().getText());
            String type;
            if(ctx.type_spec().datatype() != null)
                type = Ora2rdb.getRealName(ctx.type_spec().datatype().native_datatype_element().getText());
            else
                type = Ora2rdb.getRealName(ctx.type_spec().getText());
            storedBlocksStack.peek().setDeclaredVariables(name, type);
        }
    }
    @Override
    public void enterCreate_view(Create_viewContext ctx) {
        StorageInfo.views.put(Ora2rdb.getRealName(ctx.id_expression(0).getText()), new View(ctx));
    }

    private String getConvertType(Type_specContext ctx) { //todo переделать стандартные значения
        String type = Ora2rdb.getRealName(ctx.getText());
        if (ctx.datatype() != null) {
            DatatypeContext datatype = ctx.datatype();
            if (datatype.native_datatype_element() != null) {
                Native_datatype_elementContext nde = datatype.native_datatype_element();

                if (nde.VARCHAR2() != null || nde.NVARCHAR2() != null)
                    type = "VARCHAR (4000)";
                else if (nde.NUMBER() != null)
                    type = "NUMERIC (18, 4)";
                else if (nde.BINARY_FLOAT() != null)
                    type = "FLOAT";
                else if (nde.BINARY_DOUBLE() != null)
                    type = "DOUBLE PRECISION";
                else if (nde.NCHAR() != null)
                    type = "CHAR (250)";
                else if (nde.BINARY_INTEGER() != null)
                    type = "INTEGER";
            }
        }
        return type;
    }
}
