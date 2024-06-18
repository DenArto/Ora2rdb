package ru.redsoft.ora2rdb;

import java.util.*;


import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.tree.TerminalNode;

import ru.redsoft.ora2rdb.PlSqlParser.*;

public class RewritingListener extends PlSqlParserBaseListener {

    static final int SPACES_TYPE = 2282;
    TokenStreamRewriter rewriter;
    CommonTokenStream tokens;

    Stack<StoredBlock> storedBlocksStack = new Stack<>();
    String current_package_name = null;

    View current_view;
    PLSQLBlock current_plsql_block;

    ArrayList<Create_sequenceContext> sequences = new ArrayList<Create_sequenceContext>();
    ArrayList<Create_tableContext> tables = new ArrayList<Create_tableContext>();
    ArrayList<Comment_on_tableContext> comments = new ArrayList<Comment_on_tableContext>();
    ArrayList<Alter_tableContext> alter_tables = new ArrayList<Alter_tableContext>();
    ArrayList<Create_indexContext> create_indexes = new ArrayList<Create_indexContext>();
    ArrayList<Create_function_bodyContext> create_functions = new ArrayList<Create_function_bodyContext>();
    ArrayList<Create_procedure_bodyContext> create_procedures = new ArrayList<Create_procedure_bodyContext>();
    ArrayList<Create_triggerContext> create_triggers = new ArrayList<Create_triggerContext>();
    ArrayList<Alter_triggerContext> alter_triggers = new ArrayList<Alter_triggerContext>();

    ArrayList<String> create_temporary_tables = new ArrayList<String>();
    ArrayList<String> loop_index_names = new ArrayList<String>();
    TreeMap<String, String> loop_rec_name_and_cursor_name = new TreeMap<>();


    boolean containsException = false;
    boolean exceptionExist = false;

    public RewritingListener(CommonTokenStream tokens) {
        rewriter = new TokenStreamRewriter(tokens);
        this.tokens = tokens;
    }

    public String getText() {
        StringBuilder out = new StringBuilder();

        for (Create_sequenceContext sequence : sequences)
            out.append(getRewriterText(sequence)).append("\n\n");

        for (Create_tableContext table : tables)
            out.append(getRewriterText(table)).append("\n\n");

        ArrayList<View> views = View.sort(StorageInfo.views.values());

        for (View view : views)
            out.append(getRewriterText(view.ctx)).append("\n\n");

        for (Comment_on_tableContext comment : comments)
            out.append(getRewriterText(comment)).append("\n\n");

        for (Alter_tableContext alter_table : alter_tables)
            out.append(getRewriterText(alter_table)).append("\n\n");

        for (Create_indexContext create_index : create_indexes)
            out.append(getRewriterText(create_index)).append("\n\n");

        for (String create_temporary_table : create_temporary_tables)
            out.append(create_temporary_table);

        boolean plsql = !create_functions.isEmpty() ||
                !create_procedures.isEmpty() ||
                !create_triggers.isEmpty();

        if (plsql)
            out.append("SET TERM ^ ;\n\n");

        for (Create_function_bodyContext create_function : create_functions)
            out.append(getRewriterText(create_function)).append("\n\n");

        for (Create_procedure_bodyContext create_procedure : create_procedures)
            out.append(getRewriterText(create_procedure)).append("\n\n");

        for (Create_triggerContext create_trigger : create_triggers)
            out.append(getRewriterText(create_trigger)).append("\n\n");

        if (plsql)
            out.append("SET TERM ; ^\n\n");

        for (Alter_triggerContext alter_trigger : alter_triggers)
            out.append(getRewriterText(alter_trigger)).append("\n\n");

        return out.toString();
    }

    void insertBefore(ParserRuleContext ctx, Object text) {
        if (ctx != null)
            rewriter.insertBefore(ctx.start, text);
    }

    void insertBefore(TerminalNode term, Object text) {
        if (term != null)
            rewriter.insertBefore(term.getSymbol(), text);
    }

    void insertAfter(ParserRuleContext ctx, Object text) {
        if (ctx != null)
            rewriter.insertAfter(ctx.stop, text);
    }

    void insertAfter(TerminalNode term, Object text) {
        if (term != null)
            rewriter.insertAfter(term.getSymbol(), text);
    }

    void replace(ParserRuleContext ctx, Object text) {
        if (ctx != null)
            rewriter.replace(ctx.start, ctx.stop, text);
        sisoutRewriter();
    }

    void replace(TerminalNode term, Object text) {
        if (term != null)
            rewriter.replace(term.getSymbol(), text);
        sisoutRewriter();
    }

    void delete(ParserRuleContext ctx) {
        if (ctx != null)
            rewriter.delete(ctx.start, ctx.stop);
        sisoutRewriter();
    }

    void delete(TerminalNode term) {
        if (term != null)
            rewriter.delete(term.getSymbol());
        sisoutRewriter();
    }

    void delete(List<? extends ParserRuleContext> ctx_list) {
        if (!ctx_list.isEmpty())
            rewriter.delete(ctx_list.get(0).start, ctx_list.get(ctx_list.size() - 1).stop);
        sisoutRewriter();
    }

    Token getPreviousToken(Token token){
        if (token != null) {
            int tokenIndex = token.getTokenIndex();
            if (tokens.size() <= tokenIndex && tokenIndex != 0) return null;
            return tokens.get(tokenIndex - 1);
        }return null;
    }

    void deleteSpacesLeft(Token token){
        if(token != null) {
            if (token.getType() == SPACES_TYPE) {
                rewriter.delete(token);
                deleteSpacesLeft(getPreviousToken(token));
            }
        }
    }

    void deleteSpacesLeft(ParserRuleContext ctx) {
        if (ctx != null)
            deleteSpacesLeft(getPreviousToken(ctx.start));
    }

    void deleteSpacesLeft(TerminalNode term) {
        if(term != null)
            deleteSpacesLeft(getPreviousToken(term.getSymbol()));
    }

    Token getNextToken(Token token){
        if (token != null) {
            int tokenIndex = token.getTokenIndex();
            if (tokens.size() <= tokenIndex && tokenIndex != 0) return null;
            return tokens.get(tokenIndex + 1);
        }return null;
    }

    void deleteSpacesRight(Token token){
        if(token != null) {
            if (token.getType() == SPACES_TYPE) {
                rewriter.delete(token);
                deleteSpacesRight(getNextToken(token));
            }
        }
    }

    void deleteSpacesRight(ParserRuleContext ctx) {
        if (ctx != null) {
            deleteSpacesRight(getNextToken(ctx.stop));
        }
    }

    void deleteSpacesRight(TerminalNode term) {
        if (term != null) {
            deleteSpacesRight(getNextToken(term.getSymbol()));
        }
    }

    void deleteSpacesAbut(ParserRuleContext ctx){
        if (ctx != null) {
            deleteSpacesLeft(getPreviousToken(ctx.start));
            deleteSpacesRight(getNextToken(ctx.stop));
        }
    }

    void deleteSpacesAbut(TerminalNode term){
        if (term != null) {
            deleteSpacesLeft(getPreviousToken(term.getSymbol()));
            deleteSpacesRight(getNextToken(term.getSymbol()));
        }
    }

    void sisoutRewriter() {

//        System.out.println("\n==========================================");
//        System.out.println(rewriter.getText());
//        System.out.println("==========================================\n");

    }

    void commentBlock(int start_tok_idx, int stop_tok_idx) {
        rewriter.insertBefore(start_tok_idx, "/*");
        rewriter.insertAfter(stop_tok_idx, "*/");

        List<Token> multi_line_comments = tokens.getTokens(start_tok_idx, stop_tok_idx, PlSqlLexer.MULTI_LINE_COMMENT);

        if (multi_line_comments != null)
            for (Token tok : multi_line_comments)
                rewriter.delete(tok);
    }

    String getIndentation(ParserRuleContext ctx) {
        Integer tok_idx = ctx.start.getTokenIndex();

        if (tok_idx > 0) {
            List<Token> spc_tok_list = tokens.getTokens(tok_idx - 1, tok_idx, PlSqlLexer.SPACES);

            if (spc_tok_list != null) {
                String spc = spc_tok_list.get(0).getText();
                Integer idx1 = spc.lastIndexOf('\r');
                Integer idx2 = spc.lastIndexOf('\n');
                return spc.substring((idx1 > idx2 ? idx1 : idx2) + 1);
            }
        }

        return "";
    }

    String getRuleText(RuleContext ctx) {
        return tokens.getText(ctx);
    }

    String getRewriterText(ParserRuleContext ctx) {
        return rewriter.getText(ctx.getSourceInterval());
    }

    void pushScope() {
        if (current_plsql_block == null)
            current_plsql_block = new PLSQLBlock();
        else
            current_plsql_block.pushScope();
    }

    void popScope() {
        if (current_plsql_block.scopes.size() == 1)
            current_plsql_block = null;
        else
            current_plsql_block.popScope();
    }



    @Override
    public void exitUnit_statement(Unit_statementContext ctx) {
        if (!exceptionExist & containsException) {
            String exception = "CREATE EXCEPTION CUSTOM_EXCEPTION 'error';";
            insertBefore(ctx, exception + "\n\n");
            exceptionExist = true;
        }
    }

    @Override
    public void exitRelational_table(Relational_tableContext ctx) {
        delete(ctx.column_properties());
        delete(ctx.physical_properties());
    }

    @Override
    public void exitCreate_table(Create_tableContext ctx) {

        String table_name;
        if (ctx.tableview_name().id_expression() != null) {
            delete(ctx.tableview_name().PERIOD(0));
            delete(ctx.tableview_name().identifier());
            table_name = Ora2rdb.getRealName(getRuleText(ctx.tableview_name().id_expression()));
        } else
            table_name = Ora2rdb.getRealName(getRuleText(ctx.tableview_name().identifier()));


        if (StorageInfo.table_not_null_cols.containsKey(table_name)) {
            TreeSet<String> columns_set = StorageInfo.table_not_null_cols.get(table_name);


            if (ctx.relational_table() != null) {
                Relational_tableContext relational_tableContext = ctx.relational_table();

                for (Relational_propertyContext rel_prop_ctx : relational_tableContext.relational_property()) {

                    Column_definitionContext col_def_ctx = rel_prop_ctx.column_definition();
                    if (col_def_ctx != null) {
                        String column_name = Ora2rdb.getRealName(getRuleText(col_def_ctx.column_name()));

                        if (columns_set.contains(column_name)) {
                            boolean not_null = false;

                            for (Inline_constraintContext inl_con_ctx : col_def_ctx.inline_constraint()) {
                                if (inl_con_ctx.NOT() != null) {
                                    not_null = true;
                                    break;
                                }
                            }

                            if (!not_null)
                                insertAfter(col_def_ctx, " NOT NULL");
                        }
                    }

                    if(rel_prop_ctx.out_of_line_constraint() != null){
                        delete(rel_prop_ctx);
                        deleteSpacesLeft(rel_prop_ctx);
                        delete(relational_tableContext.COMMA(relational_tableContext.COMMA().size() -1));
                    }
                }
            }
        }

        tables.add(ctx);
        if (StorageInfo.types_of_column.containsKey(table_name)) {
            if (ctx.relational_table() != null) {
                Relational_tableContext relational_table = ctx.relational_table();
                for (Relational_propertyContext property : relational_table.relational_property()) {
                    if (property.column_definition() != null) {
                        Column_definitionContext columnDefinition = property.column_definition();
                        String column_name = Ora2rdb.getRealName(columnDefinition.column_name().getText());
                        String column_type = getRewriterText(columnDefinition.datatype());
                        if (StorageInfo.types_of_column.get(table_name).containsKey(column_name)) {
                            StorageInfo.types_of_column.get(table_name).put(column_name, column_type);
                        }
                    }
                }
            }
        }
    }

    @Override
    public void exitColumn_definition(Column_definitionContext ctx) {
        if (ctx != null) {
            if (ctx.datatype() != null)
                if (ctx.datatype().native_datatype_element() != null)
                    if (ctx.datatype().native_datatype_element().RAW() != null) {
                        replace(ctx, ctx.column_name().getText() + " BLOB ");
                    }
        }
    }

    @Override
    public void exitDatatype(DatatypeContext ctx) {
        if (ctx.native_datatype_element() != null) {
            if (ctx.native_datatype_element().NUMBER() != null) {
                if (ctx.precision_part() != null)
                    replace(ctx.precision_part().ASTERISK(), "18");
                else
                    replace(ctx, getRewriterText(ctx) + "(18, 4)");
            } else if (ctx.native_datatype_element().FLOAT() != null) {
                if (ctx.precision_part() != null)
                    replace(ctx, "DOUBLE PRECISION");
            } else if (ctx.native_datatype_element().TIMESTAMP() != null) {
                delete(ctx.precision_part());
            } else if (ctx.native_datatype_element().VARCHAR2() != null ||
                    ctx.native_datatype_element().VARCHAR() != null) {
                if (ctx.precision_part() == null)
                    replace(ctx, getRewriterText(ctx) + "(250)");
            } else if (ctx.native_datatype_element().NUMERIC() != null) {
                if (ctx.precision_part() == null)
                    replace(ctx, getRewriterText(ctx) + "(18, 4)");
            }
        }
    }

    @Override
    public void exitPrecision_part(Precision_partContext ctx) {
        delete(ctx.BYTE());
        delete(ctx.CHAR());
    }

    @Override
    public void exitNative_datatype_element(Native_datatype_elementContext ctx) {
        if (ctx.VARCHAR2() != null || ctx.NVARCHAR2() != null)
            replace(ctx, "VARCHAR");
        else if (ctx.CLOB() != null)
            replace(ctx, "BLOB SUB_TYPE TEXT");
        else if (ctx.NUMBER() != null)
            replace(ctx, "NUMERIC");
        else if (ctx.BINARY_FLOAT() != null)
            replace(ctx, "FLOAT");
        else if (ctx.BINARY_DOUBLE() != null)
            replace(ctx, "DOUBLE PRECISION");
        else if (ctx.NCHAR() != null)
            replace(ctx, "CHAR");
        else if (ctx.BINARY_INTEGER() != null)
            replace(ctx, "INTEGER");
    }

    @Override
    public void exitComment_on_column(Comment_on_columnContext ctx) {
        if (ctx.column_name() != null) {
            Column_nameContext column_nameContext = ctx.column_name();
            if (column_nameContext.identifier() != null) {
                delete(column_nameContext.identifier());
                delete(column_nameContext.PERIOD(0));
            }
        }
    }

    @Override
    public void exitTableview_name(Tableview_nameContext ctx) {
        if (ctx.id_expression() != null) {
            delete(ctx.identifier());

            if (!ctx.PERIOD().isEmpty())
                delete(ctx.PERIOD(0));

        }
    }

    @Override
    public void exitOut_of_line_constraint(Out_of_line_constraintContext ctx) {
        delete(ctx.constraint_state());
    }

    @Override
    public void exitAlter_table(Alter_tableContext ctx) {

        if (ctx.tableview_name().PERIOD() != null) {
            delete(ctx.tableview_name().PERIOD(0));
            delete(ctx.tableview_name().identifier());
        }
        Constraint_clausesContext constraint_clauses_ctx = ctx.constraint_clauses();
        Column_clausesContext column_clauses_ctx = ctx.column_clauses();

        if (constraint_clauses_ctx != null) {
            if (!constraint_clauses_ctx.out_of_line_constraint().isEmpty()) {
                Constraint_stateContext constraint_state_ctx = constraint_clauses_ctx.out_of_line_constraint(0).constraint_state();
                delete(constraint_state_ctx);
            }
        } else if (column_clauses_ctx != null) {

            Add_modify_drop_column_clausesContext add_modify_drop_column_clausesContext = column_clauses_ctx.add_modify_drop_column_clauses();
            if (add_modify_drop_column_clausesContext != null) {
                Modify_column_clausesContext modify_column_clauses_ctx = add_modify_drop_column_clausesContext.modify_column_clauses(0);

                if (!modify_column_clauses_ctx.modify_col_properties().isEmpty()) {
                    Modify_col_propertiesContext modify_col_properties_ctx = modify_column_clauses_ctx.modify_col_properties(0);

                    if (!modify_col_properties_ctx.inline_constraint().isEmpty()) {
                        if (modify_col_properties_ctx.inline_constraint(0).NULL_() != null) {
                            delete(ctx);
                            return;
                        }
                    }
                }
            }
        }

        alter_tables.add(ctx);
    }

    @Override
    public void exitString_function(String_functionContext ctx) {
        if (ctx.SUBSTR() != null) {
            replace(ctx.SUBSTR(), "SUBSTRING");
            replace(ctx.COMMA(0), " FROM ");
            if (ctx.COMMA(1) != null)
                replace(ctx.COMMA(1), " FOR ");

        }
    }







    private StoredBlock findFunctionCall(Function_callContext ctx){

        FinderBlockCall finder = new FinderBlockCall();
        if(ctx.routine_name().id_expression(0) != null){
            finder.setName(Ora2rdb.getRealName(ctx.routine_name().id_expression(0).getText()));
            finder.setPackage_name(Ora2rdb.getRealName(ctx.routine_name().identifier().getText()));
        }
        else{
            finder.setName(Ora2rdb.getRealName(ctx.routine_name().identifier().getText()));
            finder.setPackage_name(null);
        }
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
        if(!storedBlocksStack.isEmpty())
            storedBlocksStack.peek().getChildren().stream()
                .filter(e -> e.equalsIgnoreParent(finder))
                .findFirst().ifPresent(child -> finder.setParent(child.getParent()));

        StoredBlock returnBlock = StorageInfo.stored_blocks_list.stream()// todo crutch
                .filter(e -> e.equals(finder))
                .findFirst().orElse(null);
        if(returnBlock == null)
            returnBlock = StorageInfo.stored_blocks_list.stream()
                    .filter(e -> e.equalsIgnoreParameters(finder))
                    .findFirst().orElse(null);
        return returnBlock;
    }

    private StoredBlock findFunctionCall(General_element_partContext ctx) {
        FinderBlockCall finder = new FinderBlockCall();
        if (!ctx.PERIOD().isEmpty()) {
            finder.setName(Ora2rdb.getRealName(ctx.id_expression(1).getText()));
            finder.setPackage_name(Ora2rdb.getRealName(ctx.id_expression(0).getText()));
        } else {
            finder.setName(Ora2rdb.getRealName(ctx.id_expression(0).getText()));
            finder.setPackage_name(null);
        }
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

        if(!storedBlocksStack.isEmpty())
            storedBlocksStack.peek().getChildren().stream()
                .filter(e -> e.equalsIgnoreParent(finder))
                .findFirst().ifPresent(child -> finder.setParent(child.getParent()));

        StoredBlock returnBlock = StorageInfo.stored_blocks_list.stream()// todo crutch
                .filter(e -> e.equals(finder))
                .findFirst().orElse(null);
        if(returnBlock == null)
            returnBlock = StorageInfo.stored_blocks_list.stream()
                    .filter(e -> e.equalsIgnoreParameters(finder))
                    .findFirst().orElse(null);

        return returnBlock;
    }

    //    todo part233
    private StoredFunction findStorageFunction(Create_function_bodyContext ctx){
        StoredFunction storedFunction = new StoredFunction();
        String name;
        if (ctx.function_name().id_expression() != null) {
            name = Ora2rdb.getRealName(ctx.function_name().id_expression().getText());
        } else {
            name = Ora2rdb.getRealName(ctx.function_name().identifier().id_expression().getText());
        }
        String type;

        if(ctx.type_spec().datatype() != null)
            type = Ora2rdb.getRealName(
                    ctx.type_spec().datatype().native_datatype_element().getText());
        else
            type = Ora2rdb.getRealName(ctx.type_spec().getText());

        storedFunction.setName(name);
        storedFunction.setFunction_returns_type(type);
        storedFunction.setPackage_name(current_package_name);
        if(ctx.parameter() != null){
            for(int i = 0; i < ctx.parameter().size(); i++ ){
                String parameter_name = Ora2rdb.getRealName(ctx.parameter(i).parameter_name().getText());
                String parameter_type;
                if(ctx.parameter(i).type_spec().datatype() != null)
                    parameter_type = Ora2rdb.getRealName(ctx.parameter(i).type_spec().datatype().native_datatype_element().getText());
                else
                    parameter_type = Ora2rdb.getRealName(ctx.parameter(i).type_spec().getText());
                storedFunction.setParameters(i, parameter_name, parameter_type, !ctx.parameter(i).OUT().isEmpty());
            }
        }

        return (StoredFunction) StorageInfo.stored_blocks_list.stream()
                .filter(e -> e.equals(storedFunction))
                .findFirst().orElse(null);
    }

    private StoredFunction findStorageFunction(Function_bodyContext ctx){
        StoredFunction storedFunction = new StoredFunction();
        String name;
        name = Ora2rdb.getRealName(ctx.identifier().id_expression().getText());
        String type;

        if(ctx.type_spec().datatype() != null)
            type = Ora2rdb.getRealName(
                    ctx.type_spec().datatype().native_datatype_element().getText());
        else
            type = Ora2rdb.getRealName(ctx.type_spec().getText());

        String package_name = current_package_name;


        storedFunction.setName(name);
        storedFunction.setFunction_returns_type(type);
        storedFunction.setPackage_name(package_name);
        if(ctx.parameter() != null){
            for(int i = 0; i < ctx.parameter().size(); i++ ){
                String parameter_name = Ora2rdb.getRealName(ctx.parameter(i).parameter_name().getText());
                String parameter_type;
                if(ctx.parameter(i).type_spec().datatype() != null)
                    parameter_type = Ora2rdb.getRealName(ctx.parameter(i).type_spec().datatype().native_datatype_element().getText());
                else
                    parameter_type = Ora2rdb.getRealName(ctx.parameter(i).type_spec().getText());
                storedFunction.setParameters(i, parameter_name, parameter_type, !ctx.parameter(i).OUT().isEmpty());
            }
        }

        if (!storedBlocksStack.isEmpty()) {
            storedFunction.setParent(storedBlocksStack.peek());
        }

        return (StoredFunction) StorageInfo.stored_blocks_list.stream()
                .filter(e -> e.equals(storedFunction))
                .findFirst().orElse(null);
    }

    private StoredProcedure findStorageProcedure(Create_procedure_bodyContext ctx){
        StoredProcedure storedProcedure = new StoredProcedure();
        String name;
        if (ctx.procedure_name().id_expression() != null)
            name = Ora2rdb.getRealName(ctx.procedure_name().id_expression().getText());
        else
            name = Ora2rdb.getRealName(ctx.procedure_name().identifier().id_expression().getText());
        storedProcedure.setName(name);
        storedProcedure.setPackage_name(current_package_name);

        if(ctx.parameter() != null){
            for(int i = 0; i < ctx.parameter().size(); i++ ){
                String parameter_name = Ora2rdb.getRealName(ctx.parameter(i).parameter_name().getText());
                String parameter_type;
                if(ctx.parameter(i).type_spec().datatype() != null)
                    parameter_type = Ora2rdb.getRealName(ctx.parameter(i).type_spec().datatype().native_datatype_element().getText());
                else
                    parameter_type = Ora2rdb.getRealName(ctx.parameter(i).type_spec().getText());
                storedProcedure.setParameters(i, parameter_name, parameter_type, !ctx.parameter(i).OUT().isEmpty());
            }
        }

        return  (StoredProcedure) StorageInfo.stored_blocks_list.stream()
                .filter(e -> e.equals(storedProcedure))
                .findFirst().orElse(null);
    }

    private StoredProcedure findStorageProcedure(Procedure_bodyContext ctx){
        StoredProcedure storedProcedure = new StoredProcedure();
        String name;
        name = Ora2rdb.getRealName(ctx.identifier().getText());

        storedProcedure.setName(name);
        storedProcedure.setPackage_name(current_package_name);

        if(ctx.parameter() != null){
            for(int i = 0; i < ctx.parameter().size(); i++ ){
                String parameter_name = Ora2rdb.getRealName(ctx.parameter(i).parameter_name().getText());
                String parameter_type;
                if(ctx.parameter(i).type_spec().datatype() != null)
                    parameter_type = Ora2rdb.getRealName(ctx.parameter(i).type_spec().datatype().native_datatype_element().getText());
                else
                    parameter_type = Ora2rdb.getRealName(ctx.parameter(i).type_spec().getText());
                storedProcedure.setParameters(i, parameter_name, parameter_type, !ctx.parameter(i).OUT().isEmpty());
            }
        }

        if(!storedBlocksStack.isEmpty())
            storedProcedure.setParent(storedBlocksStack.peek());

        return  (StoredProcedure) StorageInfo.stored_blocks_list.stream()
                .filter(e -> e.equals(storedProcedure))
                .findFirst().orElse(null);
    }


    @Override
    public void exitGeneral_element_part(General_element_partContext ctx) {

        if (ctx.id_expression().size() == 1) {
            Id_expressionContext id_expr_ctx = ctx.id_expression(0);

            if (id_expr_ctx.regular_id().non_reserved_keywords_pre12c() != null) {

                if (id_expr_ctx.regular_id().non_reserved_keywords_pre12c().TO_NUMBER() != null) {
                    replace(id_expr_ctx.regular_id().non_reserved_keywords_pre12c().TO_NUMBER(), "CAST");
                    delete(ctx.function_argument().RIGHT_PAREN());
                    insertAfter(ctx.function_argument(), " AS NUMERIC)");
                }

                if (id_expr_ctx.regular_id().non_reserved_keywords_pre12c().TO_DATE() != null) {
                    replace(id_expr_ctx.regular_id().non_reserved_keywords_pre12c().TO_DATE(), "CAST");
                    delete(ctx.function_argument().RIGHT_PAREN());
                    insertAfter(ctx.function_argument(), " AS TIMESTAMP)");

                    if (ctx.function_argument().argument().size() > 1) {
                        for (int i = 1; i < ctx.function_argument().argument().size(); i++) {
                            delete(ctx.function_argument().COMMA(i - 1));
                            delete(ctx.function_argument().argument(i));
                        }
                    }
                }

                if (id_expr_ctx.regular_id().non_reserved_keywords_pre12c().INSTR() != null) {
                    replace(id_expr_ctx.regular_id().non_reserved_keywords_pre12c().INSTR(), "POSITION");
                    String tempArgument = ctx.function_argument().argument(0).getText();
                    replace(ctx.function_argument().argument(0), ctx.function_argument().argument(1).getText());
                    replace(ctx.function_argument().argument(1), tempArgument);
                }
            }
        }

        if (ctx.id_expression().size() > 1) {
            for (Id_expressionContext id_expr_ctx : ctx.id_expression()) {
                String id = getRewriterText(id_expr_ctx);

                if (id.startsWith(":"))
                    replace(id_expr_ctx, id.substring(1));
            }
        }
        else {
            String name = Ora2rdb.getRealName(getRuleText(ctx.id_expression(0)));

            if (current_plsql_block != null && current_plsql_block.array_to_table.containsKey(name) &&
                    ctx.function_argument() != null) {
                String select_stmt = "(SELECT VAL FROM " + current_plsql_block.array_to_table.get(name) + " WHERE ";
                boolean abort = false;

                if (ctx.function_argument().argument().size() == 1) {

                    select_stmt += "I" + 1 + " = " + getRewriterText(ctx.function_argument().argument(0));
                } else {
                    abort = true;
                }


                if (!abort) {
                    select_stmt += ")";
                    replace(ctx, select_stmt);
                    return;
                }
            }

            Regular_idContext regular_id_ctx = ctx.id_expression(0).regular_id();

            if (regular_id_ctx != null) {
                if (regular_id_ctx.non_reserved_keywords_pre12c() != null) {
                    if (regular_id_ctx.non_reserved_keywords_pre12c().REPLACE() != null) {
                        if (ctx.function_argument() != null) {
                            Function_argumentContext function_argument_ctx = ctx.function_argument();

                            if (function_argument_ctx != null)
                                if (function_argument_ctx.argument().size() == 2)
                                    insertAfter(function_argument_ctx.argument(1), ", ''");
                        }
                    }
                    replace(regular_id_ctx.non_reserved_keywords_pre12c().LENGTH(), "CHAR_LENGTH");
                }
            }
        }
        if(ctx.function_argument() != null)
            convertFunctionCall(ctx);
    }
    private void convertFunctionCall(General_element_partContext ctx) {

        StoredBlock storedBlock = findFunctionCall(ctx);
            if(storedBlock != null){
                if(storedBlock instanceof StoredFunction) {
                    if (storedBlock.containOutParameters())
                        convertFunctionWithOutParameters(ctx);
                }
                else if(storedBlock instanceof StoredProcedure){
                    if(storedBlock.containOutParameters())
                        convertProcedureWithOutParameters(ctx, (StoredProcedure) storedBlock);
                }
            }
//            else insertBefore(ctx, "\n/*ФУНКЦИЯ НЕ ОПРЕДЕЛИЛАСЬ*/\n");

    }
    private void convertFunctionWithOutParameters(General_element_partContext ctx) {
        StringBuilder selectQuery = new StringBuilder();
        StoredBlock storedFunction = findFunctionCall(ctx);
        if (storedFunction != null) {
            if (storedFunction.containOutParameters()) {
                selectQuery.append("SELECT ").append("RET_VAL, ");
                for (int i : storedFunction.getParameters().keySet()) {
                    if (storedFunction.getParameters().get(i).getOut()) {
                        if (!Objects.equals(i, storedFunction.getParameters().lastKey()))
                            selectQuery.append(storedFunction.getParameters().get(i).getName()).append("_OUT, ");
                        else
                            selectQuery.append(storedFunction.getParameters().get(i).getName()).append("_OUT ");
                    }

                }
                selectQuery.append(" FROM ").append(getRewriterText(ctx));
                selectQuery.append(" INTO ").append(storedFunction.getName()).append("_RET_VAL").append(", ");

                for (int i : storedFunction.getParameters().keySet()) {
                    if (storedFunction.getParameters().get(i).getOut()) {
                        if (!Objects.equals(i, storedFunction.getParameters().lastKey()))
                            selectQuery.append(ctx.function_argument().argument(i).getText()).append(", ");
                        else
                            selectQuery.append(ctx.function_argument().argument(i).getText()).append("\n");
                    }
                }

                if (current_plsql_block.getStatement() != null) {
                    StatementContext statement = current_plsql_block.getStatement();
                    if (statement.loop_statement() != null) {
                        Loop_statementContext loop = statement.loop_statement();
                        String loopBodyIndentation = getIndentation(loop.seq_of_statements());
                        StringBuilder stringBuilder = new StringBuilder();
                        stringBuilder
                                .append(selectQuery.toString())
                                .append(loopBodyIndentation).append("if( NOT :")
                                .append(storedFunction.getName().concat("_RET_VAL )\n"))
                                .append(loopBodyIndentation).append("\tLEAVE;\n");

                        replace(loop.condition(), "TRUE");
                        insertBefore(loop.seq_of_statements(), stringBuilder.toString());
                    } else {
                        insertBefore(statement, selectQuery.toString());
                        replace(ctx, storedFunction.getName().concat("_RET_VAL"));
                    }
                }
            }
        }
    }

    private void convertProcedureWithOutParameters(General_element_partContext ctx, StoredProcedure storedProcedure) {


        if(storedProcedure != null){
            StringBuilder selectQuery = new StringBuilder();
            selectQuery.append("SELECT ");
            for (int i : storedProcedure.getParameters().keySet()) {
                if (storedProcedure.getParameters().get(i).getOut()) {
                    if (!Objects.equals(i, storedProcedure.getParameters().lastKey()))
                        selectQuery.append(storedProcedure.getParameters().get(i).getName()).append("_OUT, ");
                    else
                        selectQuery.append(storedProcedure.getParameters().get(i).getName()).append("_OUT ");
                }

            }
            selectQuery.append(" FROM ").append(getRewriterText(ctx));
            selectQuery.append(" INTO ");

            for (int i : storedProcedure.getParameters().keySet()) {
                if (storedProcedure.getParameters().get(i).getOut()) {
                    if (!Objects.equals(i, storedProcedure.getParameters().lastKey()))
                        selectQuery.append(ctx.function_argument().argument(i).getText()).append(", ");
                    else
                        selectQuery.append(ctx.function_argument().argument(i).getText()).append("\n");
                }
            }
            replace(ctx, selectQuery.toString());
        }
    }

    @Override
    public void exitFunction_call(Function_callContext ctx) {


        if (Ora2rdb.getRealName(getRuleText(ctx.routine_name())).equals("RAISE_APPLICATION_ERROR")) {
            containsException = true;
            replace(ctx.routine_name(), "EXCEPTION CUSTOM_EXCEPTION");
            delete(ctx.function_argument().argument(0));
            delete(ctx.function_argument().COMMA(0));
        }
        convertFunctionCall(ctx);
    }
    private void convertFunctionCall(Function_callContext ctx) {

        StoredBlock storedBlock = findFunctionCall(ctx);
        if(storedBlock != null){
            if(storedBlock instanceof StoredFunction) {
                if (storedBlock.containOutParameters())
                    convertFunctionWithOutParameters(ctx, (StoredFunction) storedBlock);
            }else if(storedBlock instanceof StoredProcedure)
                if(storedBlock.containOutParameters())
                    convertProcedureWithOutParameters(ctx, (StoredProcedure) storedBlock);
                else
                    replace(ctx, "EXECUTE PROCEDURE " + getRewriterText(ctx));


        }else {
            String name = Ora2rdb.getRealName(ctx.routine_name().getText());
            storedBlock = StorageInfo.stored_blocks_list.stream().filter(e -> e.getName().equals(name)).findFirst().orElse(null);
            if (storedBlock instanceof StoredProcedure)
                replace(ctx, "EXECUTE PROCEDURE " + getRewriterText(ctx));
        }


    }
    private void convertFunctionWithOutParameters(Function_callContext ctx, StoredFunction storedFunction) {
        StringBuilder selectQuery = new StringBuilder();
        if(storedFunction != null) {

            selectQuery.append("SELECT ").append("RET_VAL, ");
            for (int i : storedFunction.getParameters().keySet()) {
                if (storedFunction.getParameters().get(i).getOut()) {
                    if (!Objects.equals(i, storedFunction.getParameters().lastKey()))
                        selectQuery.append(storedFunction.getParameters().get(i).getName()).append("_OUT, ");
                    else
                        selectQuery.append(storedFunction.getParameters().get(i).getName()).append("_OUT ");
                }

            }
            selectQuery.append(" FROM ").append(getRewriterText(ctx));
            selectQuery.append(" INTO ").append(storedFunction.getName()).append("_RET_VAL").append(", ");

            for (int i : storedFunction.getParameters().keySet()) {
                if (storedFunction.getParameters().get(i).getOut()) {
                    if (!Objects.equals(i, storedFunction.getParameters().lastKey()))
                        selectQuery.append(ctx.function_argument().argument(i).getText()).append(", ");
                    else
                        selectQuery.append(ctx.function_argument().argument(i).getText()).append(";\n");
                }
            }

        }


        delete(ctx);
        if (current_plsql_block.getStatement().loop_statement() != null)
            return;
        if (current_plsql_block.getStatement() != null) {
            insertBefore(current_plsql_block.getStatement(), selectQuery.toString());
            current_plsql_block.clearStatement();
        }
    }
    private void convertProcedureWithOutParameters(Function_callContext ctx, StoredProcedure storedProcedure) {


        if(storedProcedure != null){
            StringBuilder selectQuery = new StringBuilder();
            selectQuery.append("SELECT ");
            for (int i : storedProcedure.getParameters().keySet()) {
                if (storedProcedure.getParameters().get(i).getOut()) {
                    if (!Objects.equals(i, storedProcedure.getParameters().lastKey()))
                        selectQuery.append(storedProcedure.getParameters().get(i).getName()).append("_OUT, ");
                    else
                        selectQuery.append(storedProcedure.getParameters().get(i).getName()).append("_OUT ");
                }

            }
            selectQuery.append(" FROM ").append(getRewriterText(ctx));
            selectQuery.append(" INTO ");

            for (int i : storedProcedure.getParameters().keySet()) {
                if (storedProcedure.getParameters().get(i).getOut()) {
                    if (!Objects.equals(i, storedProcedure.getParameters().lastKey()))
                        selectQuery.append(ctx.function_argument().argument(i).getText()).append(", ");
                    else
                        selectQuery.append(ctx.function_argument().argument(i).getText());
                }
            }
            replace(ctx, selectQuery.toString());
        }
    }

    @Override
    public void exitVariable_name(Variable_nameContext ctx) {
        if (ctx.id_expression().size() > 1) {
            for (Id_expressionContext id_expr_ctx : ctx.id_expression()) {
                String id = getRewriterText(id_expr_ctx);

                if (id.startsWith(":"))
                    replace(id_expr_ctx, id.substring(1));
            }
            if(StorageInfo.package_constant_names.contains(getRewriterText(ctx.id_expression(1)))){
                replace(ctx.PERIOD(), ":");
            }
        }
    }

    @Override
    public void exitReferences_clause(References_clauseContext ctx) {
        if (ctx.tableview_name().PERIOD() != null) {
            delete(ctx.tableview_name().identifier());
            delete(ctx.tableview_name().PERIOD(0));
        }
    }

    @Override
    public void exitCreate_index(Create_indexContext ctx) {
        String index_name;
        if (ctx.index_name().PERIOD() != null)
            index_name = Ora2rdb.getRealName(getRuleText(ctx.index_name().id_expression()));
        else
            index_name = Ora2rdb.getRealName(getRuleText(ctx.index_name().identifier()));

        if (StorageInfo.index_names.contains(index_name)) {
            delete(ctx);
            return;
        }

        Table_index_clauseContext table_index_clause_ctx = ctx.table_index_clause();

        for (Index_exprContext index_expr_ctx : table_index_clause_ctx.index_expr()) {
            if (index_expr_ctx.expression() != null) {
                delete(ctx);
                return;
            }
        }


        delete(ctx.index_name().identifier());
        delete(ctx.index_name().PERIOD());


        if (table_index_clause_ctx.tableview_name().PERIOD() != null) {
            delete(table_index_clause_ctx.tableview_name().identifier());
            delete(table_index_clause_ctx.tableview_name().PERIOD(0));
        }
        delete(table_index_clause_ctx.index_properties());

        create_indexes.add(ctx);
    }

    @Override
    public void exitCreate_sequence(Create_sequenceContext ctx) {
        Sequence_nameContext sequence_name_ctx = ctx.sequence_name();
        String sequence_name;

        if (sequence_name_ctx.PERIOD(0) != null) {
            delete(sequence_name_ctx.id_expression(0));
            delete(sequence_name_ctx.PERIOD(0));
            sequence_name = getRuleText(sequence_name_ctx.id_expression(1));
        } else
            sequence_name = getRuleText(sequence_name_ctx.id_expression(0));

        for (Sequence_specContext sequence_spec_ctx : ctx.sequence_spec())
            delete(sequence_spec_ctx);

        String set_generator_statements = "";

        for (Sequence_start_clauseContext sequence_start_clause_ctx : ctx.sequence_start_clause()) {
            set_generator_statements += "\nALTER SEQUENCE " + sequence_name +
                    " RESTART WITH " + sequence_start_clause_ctx.UNSIGNED_INTEGER().getText() + ";";

            delete(sequence_start_clause_ctx);
        }

        replace(ctx, getRewriterText(ctx) + set_generator_statements);

        sequences.add(ctx);
    }

    @Override
    public void enterCreate_view(Create_viewContext ctx) {
        current_view = StorageInfo.views.get(Ora2rdb.getRealName(getRuleText(ctx.id_expression(0))));

    }

    @Override
    public void exitCreate_view(Create_viewContext ctx) {
        replace(ctx.REPLACE(), "ALTER");
        delete(ctx.FORCE());

        if (ctx.PERIOD() != null) {
            delete(ctx.schema_name());
            delete(ctx.PERIOD());
        }
        current_view = null;
    }

    @Override
    public void exitEditioning_clause(Editioning_clauseContext ctx) {
        delete(ctx);
        deleteSpacesLeft(ctx);
    }

    @Override
    public void exitDml_table_expression_clause(Dml_table_expression_clauseContext ctx) {
        if (current_view != null && ctx.tableview_name() != null) {
            String dependency_name = Ora2rdb.getRealName(getRuleText(ctx.tableview_name()));

            if (StorageInfo.views.containsKey(dependency_name))
                current_view.dependencies.add(StorageInfo.views.get(dependency_name));
        }
    }

    @Override
    public void exitSubquery_restriction_clause(Subquery_restriction_clauseContext ctx) {
        delete(ctx);
    }

    @Override
    public void exitComment_on_table(Comment_on_tableContext ctx) {
        comments.add(ctx);
    }

    @Override
    public void exitQuery_block(Query_blockContext ctx) {
        if (ctx.into_clause() != null) {
            String indentation = getIndentation(ctx);
            String into_clause = getRewriterText(ctx.into_clause());
            deleteSpacesAbut(ctx.into_clause());
            delete(ctx.into_clause());
            insertAfter(ctx.selected_list(), '\n' + indentation);
            replace(ctx, getRewriterText(ctx) + '\n' + indentation + into_clause);
        }
    }

    @Override
    public void exitRegular_id(Regular_idContext ctx) {
        if (ctx.non_reserved_keywords_pre12c() != null) {
            switch (getRuleText(ctx.non_reserved_keywords_pre12c()).toUpperCase()) {
                case "SYSTIMESTAMP":
                    replace(ctx, "CURRENT_TIMESTAMP");
                    break;
                case "SYSDATE":
                    replace(ctx, "CURRENT_TIMESTAMP");
            }
        }
    }

    @Override
    public void exitFunction_name(Function_nameContext ctx) {
        if (ctx.id_expression() != null) {
            delete(ctx.identifier());
            delete(ctx.PERIOD());
        }
    }

    @Override
    public void enterCreate_function_body(Create_function_bodyContext ctx) {
        pushScope();
        String procedureName;
        if (ctx.function_name().id_expression() != null)
            procedureName = Ora2rdb.getRealName(ctx.function_name().id_expression().getText());
        else
            procedureName = Ora2rdb.getRealName(ctx.function_name().identifier().id_expression().getText());
        if (ctx.function_name().id_expression() != null)
            current_plsql_block.procedure_name = procedureName;
        else
            current_plsql_block.procedure_name = procedureName;

        storedBlocksStack.push(findStorageFunction(ctx));

    }

    @Override
    public void exitCreate_function_body(Create_function_bodyContext ctx) {
        replace(ctx.REPLACE(), "ALTER");
        replace(ctx.IS(), "AS");
        replace(ctx.SEMICOLON(), "^");
        StoredFunction currentFunction = (StoredFunction) storedBlocksStack.peek();
        if (currentFunction.containOutParameters()) {
            replace(ctx.FUNCTION(), "PROCEDURE");
            replace(ctx.RETURN(), "RETURNS (RET_VAL");

            StringBuilder return_parameters = new StringBuilder();
            return_parameters.append(", ");
            for(int i = 0; i < currentFunction.getParameters().keySet().size(); i++){
                Parameter parameter = currentFunction.getParameters().get(i);
                String type = null;
                ParameterContext parameterContext = ctx.parameter().stream()
                        .filter(e -> Ora2rdb.getRealName(e.parameter_name().getText()).equals(parameter.getName()))
                        .findFirst().orElse(null);
                if(parameterContext != null){
                    type = getRewriterText(parameterContext.type_spec());
                }
                if(parameter.getOut()) {
                    if (!currentFunction.getParameters().lastKey().equals(i))
                        return_parameters.append(parameter.getName()).append("_OUT ").append(type).append(", \n");
                    else
                        return_parameters.append(parameter.getName()).append("_OUT ").append(type).append(")\n");
                }
            }
            insertAfter(ctx.type_spec(), return_parameters);

        } else {
            replace(ctx.RETURN(), "RETURNS");
        }

        if(currentFunction.containFunctionCallWithOutParameters()){
            StringBuilder declare_ret_val = new StringBuilder();
            currentFunction.getCalledFunctions().stream()
                    .filter(StoredFunction::containOutParameters)
                    .forEach(e -> declare_ret_val.append("\nDECLARE ")
                                    .append(e.getName())
                                    .append("_RET_VAL ")
                                    .append(e.getConvert_function_return_type())
                                    .append(";")
                    );
            insertBefore(ctx.body(), declare_ret_val.append('\n'));
        }

        StringBuilder declare_loop_index_names = new StringBuilder();
        if (!loop_index_names.isEmpty()) {
            for (String index_name : loop_index_names) {
                declare_loop_index_names.append("\n  DECLARE VARIABLE ").append(index_name).append(" INTEGER;\n");
            }
            insertBefore(ctx.body(), declare_loop_index_names.toString());
        }
        loop_index_names.clear();

        StringBuilder declare_loop_rowtype_names = new StringBuilder();
        if (!loop_rec_name_and_cursor_name.isEmpty()) {
            for (String rec : loop_rec_name_and_cursor_name.keySet()) {
                declare_loop_rowtype_names.append("\n  DECLARE VARIABLE ").append(rec).
                        append(" TYPE OF TABLE ").append(loop_rec_name_and_cursor_name.get(rec)).append(";\n");
            }
            insertBefore(ctx.body(), declare_loop_rowtype_names.toString());
        }
        loop_rec_name_and_cursor_name.clear();

        autonomousTransactionBlockConvert(ctx);

        StringBuilder temp_tables_ddl = new StringBuilder();
        for (String table_ddl : current_plsql_block.temporary_tables_ddl)
            temp_tables_ddl.append(table_ddl).append("\n\n");

        if (!Ora2rdb.reorder)
            replace(ctx, temp_tables_ddl + "SET TERM ^ ;\n\n" + getRewriterText(ctx) + "\n\nSET TERM ; ^");
        else
            create_temporary_tables.add(temp_tables_ddl.toString());

        popScope();
        create_functions.add(ctx);
        storedBlocksStack.pop();
    }

    @Override
    public void enterFunction_body(Function_bodyContext ctx) {
        pushScope();
        current_plsql_block.procedure_name = Ora2rdb.getRealName(ctx.identifier().getText());
        storedBlocksStack.push(findStorageFunction(ctx));
    }

    @Override
    public void exitFunction_body(Function_bodyContext ctx) {
        replace(ctx.IS(), "AS");
        replace(ctx.SEMICOLON(), "^");
        for (ParameterContext parameter : ctx.parameter())
            if (getRewriterText(parameter).startsWith(":"))
                replace(parameter, getRewriterText(parameter).substring(1));

        if(storedBlocksStack.peek() instanceof StoredFunction) {
            StoredFunction currentFunction = (StoredFunction) storedBlocksStack.peek();

            if (currentFunction.containOutParameters()) {
                replace(ctx.FUNCTION(), "PROCEDURE");
                replace(ctx.RETURN(), "RETURNS (RET_VAL");

                StringBuilder return_parameters = new StringBuilder();
                return_parameters.append(", ");
                for (int i = 0; i < currentFunction.getParameters().keySet().size(); i++) {
                    Parameter parameter = currentFunction.getParameters().get(i);
                    String type = null;
                    ParameterContext parameterContext = ctx.parameter().stream()
                            .filter(e -> Ora2rdb.getRealName(e.parameter_name().getText()).equals(parameter.getName()))
                            .findFirst().orElse(null);
                    if (parameterContext != null) {
                        type = getRewriterText(parameterContext.type_spec());
                    }
                    if (parameter.getOut()) {
                        if (!currentFunction.getParameters().lastKey().equals(i))
                            return_parameters.append(parameter.getName()).append("_OUT ").append(type).append(", \n");
                        else
                            return_parameters.append(parameter.getName()).append("_OUT ").append(type).append(")\n");
                    }
                }
                insertAfter(ctx.type_spec(), return_parameters);
            } else {
                replace(ctx.RETURN(), "RETURNS");
            }
            delete(ctx.SEMICOLON());

            if (currentFunction.containFunctionCallWithOutParameters()) {
                StringBuilder declare_ret_val = new StringBuilder();
                currentFunction.getCalledFunctions().stream()
                        .filter(StoredBlock::containOutParameters)
                        .forEach(e -> declare_ret_val.append("\nDECLARE ")
                                .append(e.getName())
                                .append("_RET_VAL ")
                                .append(e.getConvert_function_return_type())
                                .append(";")
                        );
                insertBefore(ctx.body(), declare_ret_val.append('\n'));
            }
        }

        StringBuilder declare_loop_index_names = new StringBuilder();
        if (!loop_index_names.isEmpty()) {
            for (String index_name : loop_index_names) {
                declare_loop_index_names.append("\n  DECLARE VARIABLE ").append(index_name).append(" INTEGER;\n");
            }
            insertBefore(ctx.body(), declare_loop_index_names.toString());
        }
        loop_index_names.clear();

        StringBuilder declare_loop_rowtype_names = new StringBuilder();
        if (!loop_rec_name_and_cursor_name.isEmpty()) {
            for (String rec : loop_rec_name_and_cursor_name.keySet()) {
                declare_loop_rowtype_names.append("\n  DECLARE VARIABLE ").append(rec).
                        append(" TYPE OF TABLE ").append(loop_rec_name_and_cursor_name.get(rec)).append(";\n");
            }
            insertAfter(ctx.seq_of_declare_specs(), declare_loop_rowtype_names.toString());
        }
        loop_rec_name_and_cursor_name.clear();

        autonomousTransactionBlockConvert(ctx);


        popScope();
        storedBlocksStack.pop();
    }

    @Override
    public void exitFunction_spec(Function_specContext ctx) {
        replace(ctx.RETURN(), "RETURNS");
    }

    @Override
    public void exitParameter(ParameterContext ctx) {
        for (TerminalNode in_node : ctx.IN())
            delete(in_node);
        for (TerminalNode out_node : ctx.OUT())
            delete(out_node);
        for (TerminalNode nocopy_node : ctx.NOCOPY())
            delete(nocopy_node);
        for (TerminalNode inout_node : ctx.INOUT())
            delete(inout_node);

        if (current_plsql_block != null)
            current_plsql_block.declareVar(Ora2rdb.getRealName(getRuleText(ctx.parameter_name())));
    }

    @Override
    public void exitExecute_immediate(Execute_immediateContext ctx) {
        replace(ctx.IMMEDIATE(), "STATEMENT");
        insertBefore(ctx.expression(), "(");
        insertAfter(ctx.expression(), ")");
        if (ctx.into_clause() != null) {
            String into_clause = getRewriterText(ctx.into_clause());
            delete(ctx.into_clause());
            replace(ctx, getRewriterText(ctx) + " " + into_clause);

        }
    }

    @Override
    public void exitPragma_declaration(Pragma_declarationContext ctx) {
        delete(ctx);
    }

    @Override
    public void exitVariable_declaration(Variable_declarationContext ctx) {
        if (current_plsql_block != null && ctx.CONSTANT() != null
                && ctx.parent.getClass().equals(PlSqlParser.Package_obj_specContext.class)
                || ctx.parent.getClass().equals(PlSqlParser.Package_obj_bodyContext.class)) {

            current_plsql_block.package_constant_names.add(ctx.identifier().getText());
            if (ctx.default_value_part() != null)
                replace(ctx.default_value_part().ASSIGN_OP(), "=");

            delete(ctx.CONSTANT());
            insertBefore(ctx, "CONSTANT ");
        } else {
            String name = Ora2rdb.getRealName(getRuleText(ctx.identifier()));
            String type = Ora2rdb.getRealName(getRuleText(ctx.type_spec()));

            if (current_plsql_block != null) {
                if (current_plsql_block.array_types.containsKey(type)) {
                    current_plsql_block.declareArray(name, type);
                    commentBlock(ctx.start.getTokenIndex(), ctx.stop.getTokenIndex());
                    return;
                }

                current_plsql_block.declareVar(name);
            }

            if (ctx.type_spec().PERCENT_ROWTYPE() != null) {
                insertBefore(ctx, "VARIABLE ");
            }

            insertBefore(ctx, "DECLARE ");
        }
    }

    @Override
    public void exitDefault_value_part(Default_value_partContext ctx) {
        if(ctx.ASSIGN_OP() != null){
            replace(ctx.ASSIGN_OP(), "=");
        }
    }

    @Override
    public void exitType_declaration(Type_declarationContext ctx) {
        if (ctx.record_type_def() != null) {
            insertBefore(ctx.TYPE(), "DECLARE ");
            delete(ctx.IS());
            delete(ctx.record_type_def().RECORD());
        }else {
            commentBlock(ctx.start.getTokenIndex(), ctx.stop.getTokenIndex());
            if (ctx.table_type_def() != null) {
                if (current_plsql_block != null && ctx.table_type_def().TABLE() != null
                        && ctx.table_type_def().table_indexed_by_part() != null) {
                    current_plsql_block.declareTypeOfArray(Ora2rdb.getRealName(getRuleText(ctx.identifier())),
                            getRewriterText(ctx.table_type_def().type_spec()),
                            getRewriterText(ctx.table_type_def().table_indexed_by_part().type_spec()));
                }
            }
        }

    }

    @Override
    public void exitCursor_declaration(Cursor_declarationContext ctx) {
        replace(ctx.CURSOR(), "DECLARE");
        replace(ctx.IS(), "CURSOR FOR");
        insertBefore(ctx.select_statement(), "(");
        insertAfter(ctx.select_statement(), ")");
    }

    @Override
    public void exitOther_function(Other_functionContext ctx) {
        if (ctx.cursor_name() != null) {
            if (ctx.PERCENT_FOUND() != null) {
                replace(ctx, "ROW_COUNT != 0");
            }
            if (ctx.PERCENT_NOTFOUND() != null) {
                replace(ctx, "ROW_COUNT != 1");
            }
        }
    }

    @Override
    public void exitId_expression(Id_expressionContext ctx) {
        String id_expression = Ora2rdb.getRealName(getRuleText(ctx));
        if (current_plsql_block != null && current_plsql_block.containsInScope(id_expression)) {
            replace(ctx, ":" + getRuleText(ctx));
        }
        if (current_plsql_block != null && !current_plsql_block.record_name_cursor_loop.isEmpty()) {
            PLSQLBlock.ReplaceRecordName replaceRecordName = current_plsql_block.peekReplaceRecordName();
            if (id_expression.equals(replaceRecordName.old_record_name)) {
                replace(ctx, replaceRecordName.new_record_name);
            }
        }
    }

    @Override
    public void exitBind_variable(Bind_variableContext ctx) {
        String var = getRuleText(ctx);
        String upper = var.toUpperCase();

        if (upper.startsWith(":OLD.") || upper.startsWith(":NEW."))
            replace(ctx, var.substring(1));
    }

    @Override
    public void exitColumn_name(Column_nameContext ctx) {
        try {
            String name = getRewriterText(ctx);

            if (name.startsWith(":"))
                replace(ctx, name.substring(1));
        } catch (Exception e) {
            System.err.println(e.fillInStackTrace() + rewriter.getText());
        }

    }

    @Override
    public void exitSql_plus_command_wrapper(PlSqlParser.Sql_plus_command_wrapperContext ctx) {
        delete(ctx);
    }

    @Override
    public void enterCreate_package(Create_packageContext ctx) {
        pushScope();
    }

    @Override
    public void exitCreate_package(Create_packageContext ctx) {
        if (ctx.REPLACE() != null) {
            replace(ctx.REPLACE(), "ALTER");
        }
        if (ctx.schema_object_name() != null) {
            delete(ctx.schema_object_name());
            delete(ctx.PERIOD());
        }
        if (ctx.AS() != null) {
            insertAfter(ctx.AS(), " BEGIN");
        }
        if (ctx.IS() != null) {
            replace(ctx.IS(), "AS");
            insertAfter(ctx.IS(), " BEGIN");
        }
        if (!ctx.package_name().isEmpty()) {
            if (ctx.package_name(ctx.package_name().size() - 1) != null) {
                delete(ctx.package_name(ctx.package_name().size() - 1));
            }
        }
        popScope();
    }

    @Override
    public void enterCreate_package_body(Create_package_bodyContext ctx) {
        pushScope();
        current_package_name = Ora2rdb.getRealName(ctx.package_name(0).getText());
    }

    @Override
    public void exitCreate_package_body(Create_package_bodyContext ctx) {
        current_package_name = null;
        if (ctx.OR() != null) {
            if (ctx.REPLACE() != null) {
                delete(ctx.OR());
                delete(ctx.REPLACE());
                replace(ctx.CREATE(), "RECREATE");
            }
        }
        if (ctx.schema_object_name() != null) {
            delete(ctx.schema_object_name());
            delete(ctx.PERIOD());
        }
        if (ctx.AS() != null) {
            insertAfter(ctx.AS(), " BEGIN");
        }
        if (ctx.IS() != null) {
            replace(ctx.IS(), "AS");
            insertAfter(ctx.IS(), " BEGIN");
        }
        if (!ctx.package_name().isEmpty()) {
            if (ctx.package_name(ctx.package_name().size() - 1) != null) {
                delete(ctx.package_name(ctx.package_name().size() - 1));
            }
        }

        StringBuilder temp_tables_ddl = new StringBuilder();
        for (String table_ddl : current_plsql_block.temporary_tables_ddl)
            temp_tables_ddl.append(table_ddl).append("\n\n");

        if (!Ora2rdb.reorder)
            replace(ctx, temp_tables_ddl + "SET TERM ^ ;\n\n" + getRewriterText(ctx) + "\n\nSET TERM ; ^");
        else
            create_temporary_tables.add(temp_tables_ddl.toString());
        popScope();
    }

    @Override
    public void exitProcedure_name(Procedure_nameContext ctx) {
        if (ctx.id_expression() != null) {
            delete(ctx.identifier());
            delete(ctx.PERIOD());
        }
    }

    //    todo part233
    @Override
    public void enterCreate_procedure_body(Create_procedure_bodyContext ctx) {
        pushScope();
        storedBlocksStack.push(findStorageProcedure(ctx));

    }

    @Override
    public void exitCreate_procedure_body(Create_procedure_bodyContext ctx) {
        replace(ctx.REPLACE(), "ALTER");
        replace(ctx.IS(), "AS");
        replace(ctx.SEMICOLON(), "^");

        String procedure_name = Ora2rdb.getRealName(ctx.procedure_name().identifier().id_expression().getText());

        StoredProcedure currentProcedure = (StoredProcedure) storedBlocksStack.peek();
        if (currentProcedure.containOutParameters()) {
            StringBuilder return_parameters = new StringBuilder();
            StringBuilder equating_parameters = new StringBuilder("\n");
            return_parameters.append("RETURNS( ");

            for (int i = 0; i < currentProcedure.getParameters().size(); i++) {
                Parameter parameter = currentProcedure.getParameters().get(i);
                String type = null;
                ParameterContext parameterContext = ctx.parameter().stream()
                        .filter(e -> Ora2rdb.getRealName(e.parameter_name().getText()).equals(parameter.getName()))
                        .findFirst().orElse(null);

                if (parameterContext != null) {
                    type = getRewriterText(parameterContext.type_spec());
                }

                if (parameter.getOut()) {
                    if (!currentProcedure.getParameters().lastKey().equals(i))
                        return_parameters.append(parameter.getName()).append("_OUT ").append(type).append(", \n");
                    else
                        return_parameters.append(parameter.getName()).append("_OUT ").append(type).append(")\n");
                    equating_parameters.append(parameter.getName()).append("_OUT = ").append(parameter.getName()).append(";\n");

                }
            }
            if (ctx.IS() != null) {
                insertBefore(ctx.IS(), return_parameters.toString() + '\n');
            } else {
                insertBefore(ctx.AS(), return_parameters.toString() + '\n');
            }

            insertBefore(ctx.body().END(), equating_parameters.append("SUSPEND;\n"));
        }


        if(currentProcedure.containFunctionCallWithOutParameters()){
            StringBuilder declare_ret_val = new StringBuilder();
            currentProcedure.getCalledFunctions().stream()
                    .filter(StoredFunction::containOutParameters)
                    .forEach(e ->declare_ret_val.append("\nDECLARE ")
                            .append(e.getName())
                            .append("_RET_VAL ")
                            .append(e.getConvert_function_return_type())
                            .append(";"));
            insertBefore(ctx.body(), declare_ret_val.append('\n'));
        }

        StringBuilder declare_loop_index_names = new StringBuilder();
        if (!loop_index_names.isEmpty()) {
            for (String index_name : loop_index_names) {
                declare_loop_index_names.append("\n  DECLARE VARIABLE ").append(index_name).append(" INTEGER;\n");
            }
            insertBefore(ctx.body(), declare_loop_index_names.toString());
        }
        loop_index_names.clear();

        StringBuilder declare_loop_rowtype_names = new StringBuilder();
        if (!loop_rec_name_and_cursor_name.isEmpty()) {
            for (String rec : loop_rec_name_and_cursor_name.keySet()) {
                declare_loop_rowtype_names.append("\n  DECLARE VARIABLE ").append(rec).
                        append(" TYPE OF TABLE ").append(loop_rec_name_and_cursor_name.get(rec)).append(";\n");
            }
            insertBefore(ctx.body(), declare_loop_rowtype_names.toString());
        }
        loop_rec_name_and_cursor_name.clear();

        autonomousTransactionBlockConvert(ctx);

        StringBuilder temp_tables_ddl = new StringBuilder();

        for (String table_ddl : current_plsql_block.temporary_tables_ddl)
            temp_tables_ddl.append(table_ddl).append("\n\n");

        if (!Ora2rdb.reorder)
            replace(ctx, temp_tables_ddl + "SET TERM ^ ;\n\n" + getRewriterText(ctx) + "\n\nSET TERM ; ^");
        else
            create_temporary_tables.add(temp_tables_ddl.toString());

        popScope();
        create_procedures.add(ctx);
        storedBlocksStack.pop();
    }


    @Override
    public void enterProcedure_body(Procedure_bodyContext ctx) {
        pushScope();
        storedBlocksStack.push(findStorageProcedure(ctx));
    }

    @Override
    public void exitProcedure_body(Procedure_bodyContext ctx) {
        replace(ctx.IS(), "AS");
        delete(ctx.SEMICOLON());

        for (ParameterContext parameter : ctx.parameter())
            if (getRewriterText(parameter).startsWith(":"))
                replace(parameter, getRewriterText(parameter).substring(1));

        StoredProcedure currentProcedure = (StoredProcedure) storedBlocksStack.peek();
        String procedure_name = currentProcedure.getName();//todo
        if(currentProcedure.containOutParameters()){
            StringBuilder return_parameters = new StringBuilder();
            StringBuilder equating_parameters = new StringBuilder('\n');
            return_parameters.append("RETURNS( ");

            for (int i = 0; i < currentProcedure.getParameters().size(); i++) {
                Parameter parameter = currentProcedure.getParameters().get(i);
                String type = null;
                ParameterContext parameterContext = ctx.parameter().stream()
                        .filter(e -> Ora2rdb.getRealName(e.parameter_name().getText()).equals(parameter.getName()))
                        .findFirst().orElse(null);
                if (parameterContext != null)
                    type = getRewriterText(parameterContext.type_spec());

                if (parameter.getOut()) {
                    if (!currentProcedure.getParameters().lastKey().equals(i))
                        return_parameters.append(parameter.getName()).append("_OUT ").append(type).append(", \n");
                    else
                        return_parameters.append(parameter.getName()).append("_OUT ").append(type).append(")\n");
                    equating_parameters.append(parameter.getName()).append("_OUT = ").append(parameter.getName()).append(";\n");
                }
            }
            if (ctx.IS() != null) {
                insertBefore(ctx.IS(), return_parameters.toString() + '\n');
            } else {
                insertBefore(ctx.AS(), return_parameters.toString() + '\n');
            }
            insertBefore(ctx.body().END(), equating_parameters.append("SUSPEND;\n"));
        }


        if(currentProcedure.containFunctionCallWithOutParameters()){
            StringBuilder declare_ret_val = new StringBuilder();
            currentProcedure.getCalledFunctions().stream()
                    .filter(StoredFunction::containOutParameters)
                    .forEach(e ->declare_ret_val.append("\nDECLARE ")
                            .append(e.getName())
                            .append("_RET_VAL ")
                            .append(e.getConvert_function_return_type())
                            .append(";"));
            insertBefore(ctx.body(), declare_ret_val.append('\n'));
        }


        StringBuilder declare_loop_index_names = new StringBuilder();
        if (!loop_index_names.isEmpty()) {
            for (String index_name : loop_index_names) {
                declare_loop_index_names.append("\n  DECLARE VARIABLE ").append(index_name).append(" INTEGER;\n");
            }
            insertBefore(ctx.body(), declare_loop_index_names.toString());
        }
        loop_index_names.clear();

        StringBuilder declare_loop_rowtype_names = new StringBuilder();
        if (!loop_rec_name_and_cursor_name.isEmpty()) {
            for (String rec : loop_rec_name_and_cursor_name.keySet()) {
                declare_loop_rowtype_names.append("\n  DECLARE VARIABLE ").append(rec).
                        append(" TYPE OF TABLE ").append(loop_rec_name_and_cursor_name.get(rec)).append(";\n");
            }
            insertBefore(ctx.body(), declare_loop_rowtype_names.toString());
        }
        loop_rec_name_and_cursor_name.clear();

        autonomousTransactionBlockConvert(ctx);
        popScope();
        storedBlocksStack.pop();
    }


    private void autonomousTransactionBlockConvert(Procedure_bodyContext ctx) {
        if (checkAndDeleteAutonomousTransaction(ctx.seq_of_declare_specs())) {
            insertBefore(ctx.body().seq_of_statements(), "IN AUTONOMOUS TRANSACTION DO BEGIN\n");
            insertAfter(ctx.body().seq_of_statements(), "\n\tEND");
        }
    }

    private void autonomousTransactionBlockConvert(Function_bodyContext ctx) {
        if (checkAndDeleteAutonomousTransaction(ctx.seq_of_declare_specs())) {
            insertBefore(ctx.body().seq_of_statements(), "IN AUTONOMOUS TRANSACTION DO BEGIN\n");
            insertAfter(ctx.body().seq_of_statements(), "\n\tEND");
        }
    }

    private void autonomousTransactionBlockConvert(Create_procedure_bodyContext ctx) {
        if (checkAndDeleteAutonomousTransaction(ctx.seq_of_declare_specs())) {
            insertBefore(ctx.body().seq_of_statements(), "IN AUTONOMOUS TRANSACTION DO BEGIN\n");
            insertAfter(ctx.body().seq_of_statements(), "\n\tEND");
        }
    }

    private void autonomousTransactionBlockConvert(Create_function_bodyContext ctx) {
        if (checkAndDeleteAutonomousTransaction(ctx.seq_of_declare_specs())) {
            insertBefore(ctx.body().seq_of_statements(), "IN AUTONOMOUS TRANSACTION DO BEGIN\n");
            insertAfter(ctx.body().seq_of_statements(), "\n\tEND");
        }
    }

    private boolean checkAndDeleteAutonomousTransaction(Seq_of_declare_specsContext ctx) {
        if (ctx != null) {
            if (!ctx.declare_spec().isEmpty()) {
                for (Declare_specContext declare_spec : ctx.declare_spec()) {
                    if (declare_spec.pragma_declaration() != null &&
                            declare_spec.pragma_declaration().AUTONOMOUS_TRANSACTION() != null) {
                        delete(declare_spec);
                        return true;
                    }
                }
            }
        }
        return false;
    }


    @Override
    public void exitType_spec(Type_specContext ctx) {
        if (ctx.PERCENT_TYPE() != null)
            replace(ctx, "TYPE OF COLUMN " + getRuleText(ctx.type_name()));
        if (ctx.PERCENT_ROWTYPE() != null) {
            delete(ctx.PERCENT_ROWTYPE());
            replace(ctx, "TYPE OF TABLE " + getRuleText(ctx.type_name()));
        }
    }

    @Override
    public void exitTrigger_name(Trigger_nameContext ctx) {
        delete(ctx.identifier());
        delete(ctx.PERIOD());
    }

    @Override
    public void enterCreate_trigger(Create_triggerContext ctx) {
        pushScope();
    }

    @Override
    public void exitCreate_trigger(Create_triggerContext ctx) {
        String indentation = getIndentation(ctx);
        replace(ctx.REPLACE(), "ALTER");
        deleteSpacesLeft(ctx.trigger_body());
        insertBefore(ctx.trigger_body(), indentation + "\nAS\n");
        replace(ctx.SEMICOLON(), "^");

        StringBuilder temp_tables_ddl = new StringBuilder();

        for (String table_ddl : current_plsql_block.temporary_tables_ddl)
            temp_tables_ddl.append(table_ddl).append("\n\n");

        if (!Ora2rdb.reorder)
            replace(ctx, temp_tables_ddl + "SET TERM ^ ;\n\n" + getRewriterText(ctx) + "\n\nSET TERM ; ^");
        else
            create_temporary_tables.add(temp_tables_ddl.toString());

        popScope();
        create_triggers.add(ctx);
    }

    @Override
    public void exitReferencing_clause(Referencing_clauseContext ctx) {
        commentBlock(ctx.start.getTokenIndex(), ctx.stop.getTokenIndex());
    }

    @Override
    public void exitFor_each_row(For_each_rowContext ctx) {
        delete(ctx);
        deleteSpacesLeft(ctx);
    }

    @Override
    public void exitTrigger_when_clause(Trigger_when_clauseContext ctx) {
        if (current_plsql_block != null)
            current_plsql_block.trigger_when_condition = getRewriterText(ctx.condition());

        delete(ctx);
        deleteSpacesLeft(ctx);
    }

    @Override
    public void exitDml_event_element(Dml_event_elementContext ctx) {
        if (current_plsql_block != null) {
            if (ctx.column_list() != null) {
                for (Column_nameContext col_name_ctx : ctx.column_list().column_name())
                    current_plsql_block.trigger_fields.add(getRuleText(col_name_ctx));
            }
        }

        delete(ctx.OF());
        if (ctx.column_list() != null) {
            delete(ctx.column_list().column_name());
        }
    }

    @Override
    public void enterBlock(BlockContext ctx) {
        pushScope();
    }

    @Override
    public void exitBlock(BlockContext ctx) {
        popScope();
    }

    @Override
    public void exitBody(BodyContext ctx) {
        if (current_plsql_block != null &&
                (!current_plsql_block.trigger_fields.isEmpty() || current_plsql_block.trigger_when_condition != null)) {
            String execute_condition = "\nIF (";
            String update_condition = "";

            for (int i = 0; i < current_plsql_block.trigger_fields.size(); i++) {
                if (i != 0)
                    update_condition += " OR ";

                update_condition += "NEW." + current_plsql_block.trigger_fields.get(i) + " <> OLD." + current_plsql_block.trigger_fields.get(i);
            }

            if (!current_plsql_block.trigger_fields.isEmpty() && current_plsql_block.trigger_when_condition != null)
                execute_condition += "(" + update_condition + ") AND (" + current_plsql_block.trigger_when_condition + ")";
            else if (!current_plsql_block.trigger_fields.isEmpty())
                execute_condition += update_condition;
            else
                execute_condition += current_plsql_block.trigger_when_condition;

            execute_condition += ") THEN";

            if (ctx.seq_of_statements().statement().size() > 1)
                execute_condition += "\nBEGIN";

            insertAfter(ctx.BEGIN(), execute_condition);

            if (ctx.seq_of_statements().statement().size() > 1)
                insertBefore(ctx.END(), "END\n");
        }
    }

    @Override
    public void exitTrigger_block(Trigger_blockContext ctx) {
        delete(ctx.DECLARE());
        deleteSpacesLeft(ctx.DECLARE());
        if(ctx.body() != null){
            String indentation = getIndentation(ctx);
            deleteSpacesLeft(ctx.body().BEGIN());
            replace(ctx.body().BEGIN(), "\n " + indentation + "BEGIN");
            deleteSpacesLeft(ctx.body().END());
            replace(ctx.body().END(), "\n " + indentation + "END");
        }
    }

    @Override
    public void exitAlter_trigger(Alter_triggerContext ctx) {
        replace(ctx.ENABLE(), "ACTIVE");
        replace(ctx.DISABLE(), "INACTIVE");

        alter_triggers.add(ctx);
    }

    @Override
    public void exitLabel_name(Label_nameContext ctx) {
        delete(ctx);
    }

    @Override
    public void exitStandard_function(Standard_functionContext ctx) {
        if (ctx.string_function() != null) {
            if (ctx.string_function().NVL() != null)
                replace(ctx.string_function().NVL(), "COALESCE");
            if (ctx.string_function().TO_CHAR() != null) {
                replace(ctx.string_function().TO_CHAR(), "CAST");
                if (ctx.string_function().COMMA(0) != null) {
                    insertBefore(ctx, "UPPER( ");
                    replace(ctx.string_function().COMMA(0), " AS VARCHAR(32000) FORMAT");
                    replace(ctx, getRewriterText(ctx) + ")");
                } else {
                    insertAfter(ctx.string_function().expression(0), " AS VARCHAR(32000)");
                }
            }
            if (ctx.string_function().TO_DATE() != null) {
                replace(ctx.string_function().TO_DATE(), "CAST");
                delete(ctx.string_function().RIGHT_PAREN());
                if(ctx.string_function().expression() != null)
                    insertAfter(ctx.string_function().expression(0), " AS TIMESTAMP)");
                else if(ctx.string_function().table_element() != null)
                    insertAfter(ctx.string_function().table_element(), " AS TIMESTAMP)");
                delete(ctx.string_function().COMMA(0));
                delete(ctx.string_function().quoted_string());


            }
        }
    }

    @Override
    public void enterStatement(StatementContext ctx) {
        current_plsql_block.setStatement(ctx);
    }

    @Override
    public void exitAssignment_statement(Assignment_statementContext ctx) {
        if (ctx.general_element() != null) {
            if (ctx.general_element().general_element_part().size() == 1) {
                General_element_partContext gen_elem_part_ctx = ctx.general_element().general_element_part(0);

                if (gen_elem_part_ctx.id_expression().size() == 1) {
                    String name = Ora2rdb.getRealName(getRuleText(gen_elem_part_ctx.id_expression(0)));

                    if (current_plsql_block != null && current_plsql_block.array_to_table.containsKey(name) &&
                            gen_elem_part_ctx.function_argument() != null) {
                        String insert_stmt = "UPDATE OR INSERT INTO " + current_plsql_block.array_to_table.get(name) + " VALUES (";
                        boolean abort = false;

                        Function_argumentContext func_arg_ctx = gen_elem_part_ctx.function_argument();

                        if (func_arg_ctx.argument().size() == 1)
                            insert_stmt += getRewriterText(func_arg_ctx.argument(0)) + ", ";
                        else {
                            abort = true;
                        }


                        if (!abort) {
                            insert_stmt += getRewriterText(ctx.expression()) + ")";
                            replace(ctx, insert_stmt);
                            return;
                        }
                    }
                }
            }

            String target = getRewriterText(ctx.general_element());

            if (target.startsWith(":"))
                replace(ctx.general_element(), target.substring(1));
        }

        replace(ctx.ASSIGN_OP(), "=");
    }

    @Override
    public void exitIf_statement(If_statementContext ctx) {
        insertBefore(ctx.condition(), "(");
        insertAfter(ctx.condition(), ")");

        if (ctx.seq_of_statements().statement().size() > 1) {
            String indentation = getIndentation(ctx);
            insertAfter(ctx.THEN(), "\n" + indentation + "BEGIN");
            insertAfter(ctx.seq_of_statements(), "\n" + indentation + "END");
        }

        delete(ctx.END());
        deleteSpacesAbut(ctx.END());
        delete(ctx.IF(1));
    }

    @Override
    public void exitElsif_part(Elsif_partContext ctx) {
        replace(ctx.ELSIF(), "ELSE IF");
        insertBefore(ctx.condition(), "(");
        insertAfter(ctx.condition(), ")");

        if (ctx.seq_of_statements().statement().size() > 1) {
            String indentation = getIndentation(ctx);
            insertAfter(ctx.THEN(), "\n" + indentation + "BEGIN");
            insertAfter(ctx.seq_of_statements(), "\n" + indentation + "END");
        }
    }

    @Override
    public void exitElse_part(Else_partContext ctx) {
        if (ctx.seq_of_statements().statement().size() > 1) {
            String indentation = getIndentation(ctx);
            insertAfter(ctx.ELSE(), "\n" + indentation + "BEGIN");
            insertAfter(ctx.seq_of_statements(), "\n" + indentation + "END");
        }
    }

    @Override
    public void enterLoop_statement(Loop_statementContext ctx) {

        if (ctx.FOR() != null) {
            if (ctx.cursor_loop_param().DOUBLE_PERIOD() != null) {
                String index_name = Ora2rdb.getRealName((getRuleText(ctx.cursor_loop_param().index_name())));

                if (current_plsql_block != null)
                    if (!current_plsql_block.containsInScope(Ora2rdb.getRealName(getRuleText(ctx))))
                        current_plsql_block.declareVar(index_name);

            }
            if (ctx.cursor_loop_param().cursor_name() != null && !cursorNameIsFunction(ctx)) {
                String recName = Ora2rdb.getRealName(ctx.cursor_loop_param().record_name().getText());
                String cursorName = Ora2rdb.getRealName(ctx.cursor_loop_param().cursor_name().getText());
                current_plsql_block.pushScope();
                current_plsql_block.pushReplaceRecordName(recName, cursorName + "_" + recName);
            }
        }
    }

    @Override
    public void exitLoop_statement(Loop_statementContext ctx) {

        if (ctx.FOR() != null)
            convertLoopFor(ctx);
        if (ctx.WHILE() != null) {
            convertLoopWhile(ctx);
        }
    }
    private boolean cursorNameIsFunction (Loop_statementContext ctx) {
        if (ctx.cursor_loop_param() != null) {
            Cursor_loop_paramContext cursorLoopParam = ctx.cursor_loop_param();
            if (cursorLoopParam.cursor_name().general_element() != null) {
                General_elementContext generalElement = ctx.cursor_loop_param().cursor_name().general_element();
                if (generalElement.general_element_part() != null) {
                    General_element_partContext generalElementPart = generalElement.general_element_part(0);
                    if (generalElementPart.function_argument() != null)
                        return true;
                }
            }
            
        }
        return false;
    }

    private void convertLoopForRecordInCursor(Loop_statementContext ctx) {
        String cursorName = Ora2rdb.getRealName(ctx.cursor_loop_param().cursor_name().getText());
        String recName = cursorName + "_" + Ora2rdb.getRealName(ctx.cursor_loop_param().record_name().getText());
        loop_rec_name_and_cursor_name.put(recName, cursorName);
        String indentation = getIndentation(ctx);
        String openCursor = '\n' + indentation + "OPEN " + cursorName + ";";
        String fetchCursor = '\n' + indentation + "FETCH " + cursorName + " INTO " + recName + ";\n";

        insertBefore(ctx, openCursor + fetchCursor);
        deleteSpacesLeft(ctx.FOR());
        replace(ctx.FOR(), indentation + "WHILE ( ROW_COUNT != 0 ) DO");
        delete(ctx.cursor_loop_param());
        deleteSpacesAbut(ctx.cursor_loop_param());
        insertAfter(ctx.seq_of_statements(), "\n" + indentation + "\tFETCH " + cursorName + " INTO " + recName + ";\n"
                                                  + indentation + "END");
        insertAfter(ctx, "\n" + indentation + "CLOSE " + cursorName + ";\n");


        insertAfter(ctx.LOOP(0), "\n" + indentation + "BEGIN");


        delete(ctx.END());
        deleteSpacesLeft(ctx.END());
        delete(ctx.LOOP(0));
        deleteSpacesLeft(ctx.LOOP(0));
        delete(ctx.LOOP(1));
        deleteSpacesAbut(ctx.LOOP(1));

    }

    private void convertLoopForInRange(Loop_statementContext ctx) {
        String index_name = ctx.cursor_loop_param().index_name().getText();

        if (!loop_index_names.contains(index_name))
            loop_index_names.add(index_name);

        String indentation = getIndentation(ctx);
        String target = getRewriterText(ctx.cursor_loop_param().index_name());
        if (target.startsWith(":"))
            replace(ctx.cursor_loop_param().index_name(), target.substring(1));

        insertBefore(ctx, index_name + " = " + ctx.cursor_loop_param().lower_bound().getText() + ";\n");

        replace(ctx.FOR(), indentation + "WHILE (");
        insertAfter(ctx.cursor_loop_param(), ") DO" + '\n' + indentation + "BEGIN");
        
        replace(ctx.cursor_loop_param().IN(), " <= ");
        deleteSpacesAbut(ctx.cursor_loop_param().IN());
        delete(ctx.cursor_loop_param().lower_bound());
        deleteSpacesAbut(ctx.cursor_loop_param().lower_bound());
        delete(ctx.cursor_loop_param().DOUBLE_PERIOD());
        deleteSpacesAbut(ctx.cursor_loop_param().DOUBLE_PERIOD());
        insertAfter(ctx.seq_of_statements(), '\n' + indentation + index_name + " = " + index_name + " + 1;\n" + indentation + "END");

        delete(ctx.LOOP(0));
        deleteSpacesLeft(ctx.LOOP(0));
        delete(ctx.LOOP(1));
        deleteSpacesLeft(ctx.LOOP(1));
        delete(ctx.END());
        deleteSpacesLeft(ctx.END());
    }

    private void convertLoopForInRangeReverse(Loop_statementContext ctx) {
        String index_name = ctx.cursor_loop_param().index_name().getText();

        if (!loop_index_names.contains(index_name))
            loop_index_names.add(index_name);

        String target = getRewriterText(ctx.cursor_loop_param().index_name());
        if (target.startsWith(":"))
            replace(ctx.cursor_loop_param().index_name(), target.substring(1));

        insertBefore(ctx, index_name + " = " + ctx.cursor_loop_param().upper_bound().getText() + ";\n");

        String indentation = getIndentation(ctx);
        replace(ctx.FOR(), indentation + "WHILE (");
        insertAfter(ctx.cursor_loop_param(), ") DO" + '\n' + indentation + "BEGIN");
        insertAfter(ctx.seq_of_statements(), "\n" + indentation + "END");
        replace(ctx.cursor_loop_param().IN(), " >= ");
        delete(ctx.cursor_loop_param().REVERSE());
        delete(ctx.cursor_loop_param().upper_bound());
        delete(ctx.cursor_loop_param().DOUBLE_PERIOD());

        insertAfter(ctx.seq_of_statements(), '\n' + index_name + " = " + index_name + " - 1;");


        delete(ctx.LOOP(0));
        deleteSpacesLeft(ctx.LOOP(0));
        delete(ctx.LOOP(1));
        delete(ctx.END());
        deleteSpacesLeft(ctx.END());
    }

    private void convertLoopFor(Loop_statementContext ctx) {
        if (ctx.cursor_loop_param().REVERSE() != null && ctx.cursor_loop_param().DOUBLE_PERIOD() != null) {
            convertLoopForInRangeReverse(ctx);
        } else if (ctx.cursor_loop_param().DOUBLE_PERIOD() != null) {
            convertLoopForInRange(ctx);
        } else if (ctx.cursor_loop_param().record_name() != null && ctx.cursor_loop_param().cursor_name() != null && !cursorNameIsFunction(ctx)) {
            convertLoopForRecordInCursor(ctx);
            current_plsql_block.popReplaceRecordName();
            current_plsql_block.popScope();
        }
        else{

        String indentation = getIndentation(ctx);

        insertAfter(ctx.cursor_loop_param(), "\n" + indentation + "DO" + '\n' + indentation + "BEGIN");
        insertAfter(ctx.seq_of_statements(), "\n" + indentation + "END");



        delete(ctx.LOOP(0));
        deleteSpacesLeft(ctx.LOOP(0));
        delete(ctx.END());
        deleteSpacesLeft(ctx.END());
        delete(ctx.LOOP(1));
        deleteSpacesLeft(ctx.LOOP(1));
        }
    }

    public void convertLoopWhile(Loop_statementContext ctx) {
        insertBefore(ctx.condition(), "(");
        insertAfter(ctx.condition(), ") DO");
        deleteSpacesRight(ctx.condition());
        String indentation = getIndentation(ctx);
        insertAfter(ctx.LOOP(0), "\n" + indentation + "BEGIN");
        insertAfter(ctx.seq_of_statements(), "\n" + indentation + "END");
        delete(ctx.LOOP(0));
        delete(ctx.LOOP(1));
        deleteSpacesAbut(ctx.LOOP(1));
        delete(ctx.END());
        deleteSpacesAbut(ctx.END());


    }

    @Override
    public void exitReturn_statement(Return_statementContext ctx) {
        String returnVal = getRewriterText(ctx.expression());

        if (returnVal.startsWith(":"))
            replace(ctx.expression(), returnVal.substring(1));

        StoredFunction storedFunction;
        if(!storedBlocksStack.isEmpty()) {
            if(storedBlocksStack.peek() instanceof StoredFunction) {
                storedFunction = (StoredFunction) storedBlocksStack.peek();
                if (storedFunction.containOutParameters()) {
                    StringBuilder return_parameters = new StringBuilder();
                    String indentation = getIndentation(ctx);
                    for (Parameter parameter : storedFunction.getParameters().values()) {
                        if (parameter.getOut()) {
                            return_parameters.append(indentation).append(parameter.getName()).append("_OUT = ").append(parameter.getName()).append(";\n");
                        }
                    }
                    if (ctx.expression() != null) {
                        indentation = getIndentation(ctx);
                        replace(ctx, "RET_VAL = " + getRewriterText(ctx.expression()) + ";\n" + return_parameters +
                                indentation + "SUSPEND;\n" +
                                indentation + "EXIT");
                    } else
                        replace(ctx, "EXIT");
                }
            }
        }
    }

    @Override
    public void enterSeq_of_statements(Seq_of_statementsContext ctx) {
        pushScope();
    }

    @Override
    public void exitSeq_of_statements(Seq_of_statementsContext ctx) {
        for (int i = 0; i < ctx.statement().size(); i++) {
            StatementContext stmt_ctx = ctx.statement(i);

            if (stmt_ctx.if_statement() != null ||
                    stmt_ctx.loop_statement() != null ||
                    stmt_ctx.body() != null)
                delete(ctx.SEMICOLON(i));
        }
        popScope();
    }
}
