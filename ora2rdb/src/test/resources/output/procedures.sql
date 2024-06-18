--------------------------------------------------------
--  DDL for Procedure CREATE_FK_INDEXES
--------------------------------------------------------


  SET TERM ^ ;

CREATE OR ALTER PROCEDURE "CREATE_FK_INDEXES" 
AS
begin
  for cur in (
    Select t.table_name, t.constraint_name, t.colum 
    From (Select table_name, constraint_name,
            cname1 || nvl2(cname2,','||cname2, null) ||
            nvl2(cname3,','||cname3,null) || nvl2(cname4,','||cname4,null) ||
            nvl2(cname5,','||cname5,null) || nvl2(cname6,','||cname6,null) ||
            nvl2(cname7,','||cname7,null) || nvl2(cname8,','||cname8,null) colum
          From (Select b.table_name, b.constraint_name,
                  max(decode(position, 1, column_name, null)) cname1,
                  max(decode(position, 2, column_name, null)) cname2,
                  max(decode(position, 3, column_name, null)) cname3,
                  max(decode(position, 4, column_name, null)) cname4,
                  max(decode(position, 5, column_name, null)) cname5,
                  max(decode(position, 6, column_name, null)) cname6,
                  max(decode(position, 7, column_name, null)) cname7,
                  max(decode(position, 8, column_name, null)) cname8,
                  count(*) col_cnt
               From (Select SUBSTRING(table_name FROM 1 FOR 30) table_name,
                        SUBSTRING(constraint_name FROM 1 FOR 30) constraint_name,
                        SUBSTRING(column_name FROM 1 FOR 30) column_name, position
                     From user_cons_columns ) a,
                 user_constraints b
               Where a.constraint_name = b.constraint_name and b.constraint_type = 'R'  
               Group by b.table_name, b.constraint_name) cons
          Where col_cnt > All
           (Select count(*)
            From user_ind_columns i
            Where i.table_name = cons.table_name
              and i.column_name in (cname1, cname2, cname3, cname4,
                                    cname5, cname6, cname7, cname8)
              and i.column_position <= cons.col_cnt
            Group by i.index_name) 
            Order by table_name, constraint_name, colum) t )
  DO
  BEGIN
    execute STATEMENT ('create index j_' || SUBSTRING(cur.constraint_name FROM 1 FOR 28) || ' on ' || cur.table_name || ' (' || cur.colum || ')');
  END
end^

SET TERM ; ^


--------------------------------------------------------
--  DDL for Procedure GOODSGROUP_TREE_FILL
--------------------------------------------------------


  SET TERM ^ ;

CREATE OR ALTER PROCEDURE "GOODSGROUP_TREE_FILL" AS
begin
  delete from GoodsGroup_Tree
  where Group_Id in
    ( select Group_Id
      from (
        select Group_Id, Tree
        from GoodsGroup_Tree
        minus
        select Id as Group_Id, Sys_Connect_By_Path(Code,'/') || '/' as Tree
        from GoodsGroup
        start with Parent_Id is null
        connect by Parent_Id = prior Id
      )
    );
  insert into GoodsGroup_Tree (Group_Id, Tree)
  select Id as Group_Id, Sys_Connect_By_Path(Code,'/') || '/' as Tree
  from GoodsGroup
  start with Parent_Id is null
  connect by Parent_Id = prior Id
  minus
  select Group_Id, Tree
  from GoodsGroup_Tree;
end^

SET TERM ; ^


--------------------------------------------------------
--  DDL for Procedure ORGCHILD_FILL
--------------------------------------------------------


  SET TERM ^ ;

CREATE OR ALTER PROCEDURE "ORGCHILD_FILL" 
AS
BEGIN
  DELETE FROM orgchild;
  FOR cur IN
    (SELECT id FROM org
      START WITH parent_id = id
      CONNECT BY parent_id = prior id AND parent_id <> id)
  DO
  BEGIN
    INSERT INTO orgchild(org_id, child_id)
      SELECT parent_id, id FROM org WHERE parent_id = cur.id AND parent_id <> id;
    INSERT INTO orgchild(org_id, child_id)
      SELECT org_id, id FROM orgchild, org
        WHERE child_id = parent_id AND child_id = cur.id;
  END
END^

SET TERM ; ^


--------------------------------------------------------
--  DDL for Procedure RPL$ACTIVATE_RPL
--------------------------------------------------------


  SET TERM ^ ;

CREATE OR ALTER PROCEDURE "RPL$ACTIVATE_RPL" 
AS
  DECLARE stmt varchar(2000);
  DECLARE s CURSOR FOR (SELECT TRIGGER_NAME from USER_TRIGGERS where (TRIGGER_NAME like 'RPL$%'));
  DECLARE r CURSOR FOR (SELECT id, name FROM rpltable) ;
  DECLARE VARIABLE R_R_REC TYPE OF TABLE R;
  DECLARE VARIABLE S_S_REC TYPE OF TABLE S;
BEGIN
  OPEN S;
  FETCH S INTO S_S_REC;
  WHILE ( ROW_COUNT != 0 ) DO
  BEGIN
    stmt = 'DROP TRIGGER ' || S_S_REC.trigger_name;
    execute STATEMENT (:stmt);
  	FETCH S INTO S_S_REC;
  END
  CLOSE S;

  OPEN R;
  FETCH R INTO R_R_REC;
  WHILE ( ROW_COUNT != 0 ) DO
  BEGIN
    EXECUTE PROCEDURE RPL$REENABLE_RPL_TABLE(R_R_REC.name);
  	FETCH R INTO R_R_REC;
  END
  CLOSE R;

END^

SET TERM ; ^


--------------------------------------------------------
--  DDL for Procedure RPL$ASSIGN_GENERATION
--------------------------------------------------------


  SET TERM ^ ;

CREATE OR ALTER PROCEDURE "RPL$ASSIGN_GENERATION" 
    AS
    DECLARE GNRTN NUMERIC(15,0);
    DECLARE OLD_GEN NUMERIC(15,0);
    DECLARE OLD_GEN1 NUMERIC(15,0);
    DECLARE OLD_GEN2 NUMERIC(15,0);
    DECLARE ldaydate date;
begin
  -- THIS PROCEDURE MUST BE EXECUTED AT SNAPSHOT ISOLATION LEVEL
  -- lock some table for a singleton execution of this procedure
  lock table rpltable in exclusive mode;
  select generation_seq.nextval
  from dual
  into :gnrtn;
  select max(day_date)
  from dayversion
  into :ldaydate;
  update rpllog set generation = :GNRTN, transaction_id = current_transaction_id where
    generation=999999999999999;
  old_gen = null;
  if (((CURRENT_TIMESTAMP - :ldaydate) * 24 > 1)) then
  BEGIN
    insert into dayversion(day_date, day_version) values (CURRENT_TIMESTAMP, :GNRTN);
    select min(sent_version)
    from rpl where master_id = (select site_id from systemsite) and sent_version > 0
    into :old_gen;
    if ((:old_gen is null)) then
      old_gen = 999999999999999;
  -- We have three differen ranges of 'living time' for records in log, depending on rpltable generation_group
  -- 10 days
    select max(day_version)
    from dayversion where day_date < cast(CURRENT_TIMESTAMP as date) - 10
    into :old_gen1;
    if ((:old_gen1 is null)) then
      old_gen1 = 0;
    if ((:old_gen1 < :old_gen)) then
      old_gen2 = :old_gen1;
    else
      old_gen2 = :old_gen;
    if ((:old_gen2 > 0)) then
      begin
        update systemsite set clean_generation_1 = :old_gen2 ;
      end
  -- 1 day
    select max(day_version)
    from dayversion where day_date < cast(CURRENT_TIMESTAMP as date) - 1
    into :old_gen1;
    if ((:old_gen1 is null)) then
      old_gen1 = 0;
    if ((:old_gen1 < :old_gen)) then
      old_gen2 = :old_gen1;
    else
      old_gen2 = :old_gen;
    if ((:old_gen2 > 0)) then
      begin
        update systemsite set clean_generation_2 = :old_gen2 ;
      end
  -- 1 hour
    select max(day_version)
    from dayversion where day_date < cast(CURRENT_TIMESTAMP as date) - 1/24
    into :old_gen1;
    if ((:old_gen1 is null)) then
      old_gen1 = 0;
    if ((:old_gen1 < :old_gen)) then
      old_gen2 = :old_gen1;
    else
      old_gen2 = :old_gen;
    if ((:old_gen2 > 0)) then
      begin
        update systemsite set clean_generation_3 = :old_gen2 ;
      end
  END
  update systemsite set last_generation = :gnrtn;
  commit;
end^

SET TERM ; ^


--------------------------------------------------------
--  DDL for Procedure RPL$CREATE_TRIGGER
--------------------------------------------------------


  SET TERM ^ ;

CREATE OR ALTER PROCEDURE "RPL$CREATE_TRIGGER" (constr_name varchar(250))
AS
  DECLARE CHILD_WHERE VARCHAR(250);
  DECLARE CHILD_CONDITION VARCHAR(250);
  DECLARE CHILD_IF VARCHAR(250);
  DECLARE CHILD_STATEMENT VARCHAR(2000);
  DECLARE PARENT_CONDITION VARCHAR(250);
  DECLARE PARENT_WHERE VARCHAR(250);
  DECLARE PARENT_SET VARCHAR(250);
  DECLARE FCOUNT INTEGER;
  DECLARE BODY VARCHAR(4000);
  DECLARE VARIABLE rc TYPE OF TABLE rpl$constraints;
  DECLARE getFields(constr_id TYPE OF COLUMN rpl$constraintfields.rpl$constraints_id) CURSOR FOR
    (select fieldname, target_fieldname from rpl$constraintfields where rpl$constraints_id = constr_id);
BEGIN
  select *
  from rpl$constraints where name = :constr_name
  into :rc;
  child_where = ''; child_condition = ''; child_if = 'numrows = 0 and ';
  parent_where = ''; parent_condition = ''; parent_set = '';
  select count(*)
  from rpl$constraintfields where rpl$constraints_id = rc.id
  into :fcount;
  for getFields_Rec in getFields(rc.id)
  DO
  BEGIN
    child_where = :child_where || ':NEW.'||getFields_Rec.fieldname||' = '||rc.target_tablename||'.'||getFields_Rec.target_fieldname;
    child_if = :child_if || ':NEW.'||getFields_Rec.fieldname||' is not null';
    child_condition = :child_condition || ':OLD.'||getFields_Rec.fieldname||' <> :NEW.'||getFields_Rec.fieldname;
    parent_where = :parent_where || rc.tablename||'.'||getFields_Rec.fieldname||' = :OLD.'||getFields_Rec.target_fieldname;
    parent_condition = :parent_condition || ':OLD.'||getFields_Rec.target_fieldname||' <> :NEW.'||getFields_Rec.target_fieldname;
    parent_set = :parent_set || rc.tablename||'.'||getFields_Rec.fieldname||' = NULL';
    fcount = :fcount - 1;
    if ((:fcount <> 0)) then
    BEGIN
      child_condition = :child_condition || ' or ';
      child_where = :child_where || ' and ';
      child_if = :child_if || ' and ';
      parent_where = :parent_where || ' and ';
      parent_condition = :parent_condition || ' or ';
      parent_set = :parent_set || ', ';
    END
  END
  body =
    'CREATE or REPLACE TRIGGER RPL$TRIG_' || rc.triggername ||
    ' BEFORE INSERT OR UPDATE ON ' || rc.tablename || ' FOR EACH ROW' ||
    ' DECLARE numrows INTEGER; RplMode NUMBER; ' ||
    'BEGIN ' ||
    ' RplMode := 0; ' ||
    ' select rpl_mode into RplMode from RplTransactMode where num_transaction = current_transaction_id; ' ||
    ' if RplMode <> 1 then ';
  child_statement = 'select count(*) into numrows from ' || rc.target_tablename || ' where ' || :child_where || '; '
      || ' if(' || :child_if || ') then '
      ||'raise_application_error(-20001, ''violation of FOREIGN KEY constraint "'||rc.name
      ||'" on table "'||rc.tablename||'". Foreign key reference target does not exist.''); end if;';
  body = :body || 'if (inserting) then ' || :child_statement || ' ';
  body = :body || 'elsif (' || :child_condition || ') then ' || :child_statement || ' end if;';
  body = :body || ' end if; END;';
  execute STATEMENT (:body);
  body =
    'CREATE or REPLACE TRIGGER RPL$TRIGT_' || rc.triggername ||
    ' BEFORE UPDATE OR DELETE ON ' || rc.target_tablename || ' FOR EACH ROW' ||
    ' DECLARE numrows INTEGER; RplMode NUMBER; ' ||
    'BEGIN ' ||
    ' RplMode := 0; ' ||
    ' select rpl_mode into RplMode from RplTransactMode where num_transaction = current_transaction_id; ' ||
    ' if RplMode <> 1 then ';
  body = :body || 'if (deleting) then '; /* delete_rule ��������� ��������: RESTRICT, CASCADE, SET NULL */
  if ((rc.delete_rule = 'CASCADE')) then /* DELETE CASCADE */
    body = :body ||' delete from '||rc.tablename||' where '||:parent_where||';';
  ELSE IF ((rc.delete_rule = 'SET NULL')) then /* DELETE SET NULL */
    body = :body ||' update '||rc.tablename||' set '||:parent_set||' where '||:parent_where||';';
  else /* DELETE RESTRICT */
    body = :body ||' select count(*) into numrows from '||rc.tablename||' where '||:parent_where||'; '
        ||'if(numrows > 0) then '
        ||'raise_application_error(-20001, ''violation of FOREIGN KEY constraint "'||rc.name
        ||'" on table "'||rc.target_tablename||'". Foreign key references are present for the record.''); end if;';
  body = :body || ' elsif(' || :parent_condition || ') then '; /* update_rule ��������� ��������: RESTRICT, SET NULL */
  if ((rc.update_rule = 'SET NULL')) then /* UPDATE SET NULL */
    body = :body ||' update '||rc.tablename||' set '||:parent_set||' where '||:parent_where||';';
  else /* UPDATE RESTRICT */
    body = :body ||' select count(*) into numrows from '||rc.tablename||' where '||:parent_where||'; '
        ||'if(numrows > 0) then '
        ||'raise_application_error(-20001, ''violation of FOREIGN KEY constraint "'||rc.name
        ||'" on table "'||rc.target_tablename||'". Foreign key references are present for the record.''); end if;';
  body = :body || ' end if;';
  body = :body || '  end if; END;';
  execute STATEMENT (:body);
END^

SET TERM ; ^


--------------------------------------------------------
--  DDL for Procedure RPL$CREATE_TRIGGERS
--------------------------------------------------------


  SET TERM ^ ;

CREATE OR ALTER PROCEDURE "RPL$CREATE_TRIGGERS" 
AS
  DECLARE getConstraints CURSOR FOR
    (select name from rpl$constraints);
  DECLARE VARIABLE GETCONSTRAINTS_GETCONSTRAINTS_REC TYPE OF TABLE GETCONSTRAINTS;
BEGIN
  OPEN GETCONSTRAINTS;
  FETCH GETCONSTRAINTS INTO GETCONSTRAINTS_GETCONSTRAINTS_REC;
  WHILE ( ROW_COUNT != 0 ) DO
  BEGIN
    EXECUTE PROCEDURE RPL$CREATE_TRIGGER(GETCONSTRAINTS_GETCONSTRAINTS_REC.name);
  	FETCH GETCONSTRAINTS INTO GETCONSTRAINTS_GETCONSTRAINTS_REC;
  END
  CLOSE GETCONSTRAINTS;

END^

SET TERM ; ^


--------------------------------------------------------
--  DDL for Procedure RPL$DEACTIVATE_RPL
--------------------------------------------------------


  SET TERM ^ ;

CREATE OR ALTER PROCEDURE "RPL$DEACTIVATE_RPL" 
AS
  DECLARE stmt varchar(2000);
  DECLARE s CURSOR FOR (SELECT TRIGGER_NAME from USER_TRIGGERS where (TRIGGER_NAME like 'RPL$%'));
  DECLARE VARIABLE S_S_REC TYPE OF TABLE S;
BEGIN
  OPEN S;
  FETCH S INTO S_S_REC;
  WHILE ( ROW_COUNT != 0 ) DO
  BEGIN
    stmt = 'DROP TRIGGER ' || S_S_REC.trigger_name;
    execute STATEMENT (:stmt);
  	FETCH S INTO S_S_REC;
  END
  CLOSE S;

END^

SET TERM ; ^


--------------------------------------------------------
--  DDL for Procedure RPL$DISABLE_RPL_TABLE
--------------------------------------------------------


  SET TERM ^ ;

CREATE OR ALTER PROCEDURE "RPL$DISABLE_RPL_TABLE" (tablename varchar(250))
AS
   DECLARE s CURSOR FOR (select trigger_name name from user_triggers where (trigger_name like 'RPL$'||:tablename)) ;
   DECLARE stmt VARCHAR(2000);
  DECLARE VARIABLE S_S_REC TYPE OF TABLE S;
BEGIN
  OPEN S;
  FETCH S INTO S_S_REC;
  WHILE ( ROW_COUNT != 0 ) DO
  BEGIN
    stmt =
      'drop trigger '||S_S_REC.NAME;
    EXECUTE STATEMENT (:stmt);
  	FETCH S INTO S_S_REC;
  END
  CLOSE S;

END^

SET TERM ; ^


--------------------------------------------------------
--  DDL for Procedure RPL$ENABLE_RPL_TABLE
--------------------------------------------------------


  SET TERM ^ ;

CREATE OR ALTER PROCEDURE "RPL$ENABLE_RPL_TABLE" (tablename varchar(250))
AS
   DECLARE stmt            VARCHAR (20000);
   DECLARE fieldlist       VARCHAR (500);
   DECLARE fieldvalue      VARCHAR (500);
   DECLARE oldfieldvalue   VARCHAR (500);
   DECLARE condition       VARCHAR (500);
   DECLARE mut_fieldvalue      VARCHAR (500);
   DECLARE mut_oldfieldvalue   VARCHAR (500);
   DECLARE mut_condition       VARCHAR (500);
   DECLARE table_id        NUMERIC (15);
   DECLARE plugin_count    NUMERIC (15);
   DECLARE s
   CURSOR FOR
      (SELECT ID, rplfield1, rplfield2, rplfield3, rplfield4, rplfield5
        FROM rpltable
       WHERE UPPER (NAME) = UPPER (:tablename) AND isplugin = 0);
   DECLARE c_plugin
   CURSOR FOR
      (SELECT plugin_rpltable_id, join_fragment
        FROM rpltableplugin rtp JOIN rpltable rt
             ON rt.ID = rtp.rpltable_id
           AND UPPER (rt.NAME) = UPPER (:tablename)
           AND rt.isplugin = 0)
             ;
  DECLARE VARIABLE C_PLUGIN_PLUGIN_REC TYPE OF TABLE C_PLUGIN;
  DECLARE VARIABLE S_S_REC TYPE OF TABLE S;
BEGIN
   select count(rtp.ID)
   from rpltableplugin rtp 
            JOIN rpltable rt ON rt.ID = rtp.rpltable_id
                             AND UPPER (rt.NAME) = UPPER (:tablename)
                             AND rt.isplugin = 0
   into :plugin_count;
   OPEN S;
   FETCH S INTO S_S_REC;
   WHILE ( ROW_COUNT != 0 ) DO
   BEGIN
      fieldlist = 'generation';
      fieldvalue = '999999999999999';
      oldfieldvalue = :fieldvalue;
      mut_fieldvalue = :fieldvalue;
      mut_oldfieldvalue = :fieldvalue;
      condition = '(updating and not(1=1 ';
      mut_condition = '1=1 ';      
      fieldlist = :fieldlist || ', FIELD1_VALUE';
      table_id = S_S_REC.ID;
      IF ((S_S_REC.rplfield1 IS NOT NULL))
      THEN
         BEGIN
           fieldvalue = :fieldvalue || ', :new.' || S_S_REC.rplfield1;
           oldfieldvalue = :oldfieldvalue || ', :old.' || S_S_REC.rplfield1;
           condition = :condition
            || 'and (:new.'
            || S_S_REC.rplfield1
            || '='
            || ':old.'
            || S_S_REC.rplfield1
            || ')';
           if ((:plugin_count > 0)) then
           BEGIN   
                mut_fieldvalue = :mut_fieldvalue || ', mutating.new_slave_rpls(i).field_value1';
                mut_oldfieldvalue = :mut_oldfieldvalue || ', mutating.old_slave_rpls(i).field_value1';
                mut_condition = :mut_condition || 'and (mutating.new_slave_rpls(i).field_value1 = mutating.old_slave_rpls(i).field_value1';
           END
         END
      ELSE
         BEGIN
            fieldvalue = :fieldvalue || ', 0';
            oldfieldvalue = :oldfieldvalue || ', 0';
            mut_fieldvalue = :mut_fieldvalue || ', 0';
            mut_oldfieldvalue = :mut_oldfieldvalue || ', 0';
         END
      fieldlist = :fieldlist || ', FIELD2_VALUE';
      IF ((S_S_REC.rplfield2 IS NOT NULL))
      THEN
         BEGIN
            fieldvalue = :fieldvalue || ', :new.' || S_S_REC.rplfield2;
            oldfieldvalue = :oldfieldvalue || ', :old.' || S_S_REC.rplfield2;
            condition =
                  :condition
               || 'and (:new.'
               || S_S_REC.rplfield2
               || '='
               || ':old.'
               || S_S_REC.rplfield2
               || ')';
           if ((:plugin_count > 0)) then
           BEGIN   
                mut_fieldvalue = :mut_fieldvalue || ', mutating.new_slave_rpls(i).field_value2';
                mut_oldfieldvalue = :mut_oldfieldvalue || ', mutating.old_slave_rpls(i).field_value2';
                mut_condition = :mut_condition || 'and (mutating.new_slave_rpls(i).field_value2 = mutating.old_slave_rpls(i).field_value2';
           END
         END
      ELSE
         BEGIN
            fieldvalue = :fieldvalue || ', 0';
            oldfieldvalue = :oldfieldvalue || ', 0';
            mut_fieldvalue = :mut_fieldvalue || ', 0';
            mut_oldfieldvalue = :mut_oldfieldvalue || ', 0';
         END
      fieldlist = :fieldlist || ', FIELD3_VALUE';
      IF ((S_S_REC.rplfield3 IS NOT NULL))
      THEN
         BEGIN
            fieldvalue = :fieldvalue || ', :new.' || S_S_REC.rplfield3;
            oldfieldvalue = :oldfieldvalue || ', :old.' || S_S_REC.rplfield3;
            condition =
                  :condition
               || 'and (:new.'
               || S_S_REC.rplfield3
               || '='
               || ':old.'
               || S_S_REC.rplfield3
               || ')';
           if ((:plugin_count > 0)) then
           BEGIN   
                mut_fieldvalue = :mut_fieldvalue || ', mutating.new_slave_rpls(i).field_value3';
                mut_oldfieldvalue = :mut_oldfieldvalue || ', mutating.old_slave_rpls(i).field_value3';
                mut_condition = :mut_condition || 'and (mutating.new_slave_rpls(i).field_value3 = mutating.old_slave_rpls(i).field_value3';
           END
         END
      ELSE
         BEGIN
            fieldvalue = :fieldvalue || ', 0';
            oldfieldvalue = :oldfieldvalue || ', 0';
            mut_fieldvalue = :mut_fieldvalue || ', 0';
            mut_oldfieldvalue = :mut_oldfieldvalue || ', 0';
         END
      fieldlist = :fieldlist || ', FIELD4_VALUE';
      IF ((S_S_REC.rplfield4 IS NOT NULL))
      THEN
         BEGIN
            fieldvalue = :fieldvalue || ', :new.' || S_S_REC.rplfield4;
            oldfieldvalue = :oldfieldvalue || ', :old.' || S_S_REC.rplfield4;
            condition =
                  :condition
               || 'and (:new.'
               || S_S_REC.rplfield4
               || '='
               || ':old.'
               || S_S_REC.rplfield4
               || ')';
           if ((:plugin_count > 0)) then
           BEGIN   
                mut_fieldvalue = :mut_fieldvalue || ', mutating.new_slave_rpls(i).field_value4';
                mut_oldfieldvalue = :mut_oldfieldvalue || ', mutating.old_slave_rpls(i).field_value4';
                mut_condition = :mut_condition || 'and (mutating.new_slave_rpls(i).field_value4 = mutating.old_slave_rpls(i).field_value4';
           END
         END
      ELSE
         BEGIN
            fieldvalue = :fieldvalue || ', 0';
            oldfieldvalue = :oldfieldvalue || ', 0';
            mut_fieldvalue = :mut_fieldvalue || ', 0';
            mut_oldfieldvalue = :mut_oldfieldvalue || ', 0';
         END
      fieldlist = :fieldlist || ', FIELD5_VALUE';
      IF ((S_S_REC.rplfield5 IS NOT NULL))
      THEN
         BEGIN
            fieldvalue = :fieldvalue || ', :new.' || S_S_REC.rplfield5;
            oldfieldvalue = :oldfieldvalue || ', :old.' || S_S_REC.rplfield5;
            condition =
                  :condition
               || 'and (:new.'
               || S_S_REC.rplfield5
               || '='
               || ':old.'
               || S_S_REC.rplfield5
               || ')';
           if ((:plugin_count > 0)) then
           BEGIN   
                mut_fieldvalue = :mut_fieldvalue || ', mutating.new_slave_rpls(i).field_value5';
                mut_oldfieldvalue = :mut_oldfieldvalue || ', mutating.old_slave_rpls(i).field_value5';
                mut_condition = :mut_condition || 'and (mutating.new_slave_rpls(i).field_value5 = mutating.old_slave_rpls(i).field_value5';
           END
         END
      ELSE
         BEGIN
            fieldvalue = :fieldvalue || ', 0';
            oldfieldvalue = :oldfieldvalue || ', 0';
            mut_fieldvalue = :mut_fieldvalue || ', 0';
            mut_oldfieldvalue = :mut_oldfieldvalue || ', 0';
         END
      -- create trigger for each row
      stmt =
             'CREATE or REPLACE TRIGGER RPL$'
          || UPPER (:tablename)
          || ' AFTER INSERT OR UPDATE OR DELETE ON '
          || UPPER (:tablename)
          || ' REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW ' 
          || 'declare ' --|| utl_tcp.CRLF
          || 'ltable_id numeric(15); ' 
          || 'mutation_index numeric; ' 
          || 'begin ' 
          || '  ltable_id := ' || :table_id || ';' 
          ;
     if ((:plugin_count > 0)) then
     BEGIN
       -- use it in statement trigger
       stmt = :stmt 
          || '  mutation_index := mutating.new_slave_rpls.count+1;'
          || '  mutating.new_slave_rpls(mutation_index).id := :new.id;' 
          || '  mutating.old_slave_rpls(mutation_index).id := :old.id;' 
          ;
       if ((S_S_REC.rplfield1 IS NOT NULL)) then
       stmt = :stmt 
          || '  mutating.new_slave_rpls(mutation_index).field_value1 := :new.' || S_S_REC.rplfield1 || ';' 
          || '  mutating.old_slave_rpls(mutation_index).field_value1 := :old.' || S_S_REC.rplfield1 || ';' 
          ;
       if ((S_S_REC.rplfield2 IS NOT NULL)) then
       stmt = :stmt 
          || '  mutating.new_slave_rpls(mutation_index).field_value2 := :new.' || S_S_REC.rplfield2 || ';' 
          || '  mutating.old_slave_rpls(mutation_index).field_value2 := :old.' || S_S_REC.rplfield2 || ';' 
          ;
       if ((S_S_REC.rplfield3 IS NOT NULL)) then
       stmt = :stmt 
          || '  mutating.new_slave_rpls(mutation_index).field_value3 := :new.' || S_S_REC.rplfield3 || ';' 
          || '  mutating.old_slave_rpls(mutation_index).field_value3 := :old.' || S_S_REC.rplfield3 || ';' 
          ;
       if ((S_S_REC.rplfield4 IS NOT NULL)) then
       stmt = :stmt 
          || '  mutating.new_slave_rpls(mutation_index).field_value4 := :new.' || S_S_REC.rplfield4 || ';' 
          || '  mutating.old_slave_rpls(mutation_index).field_value4 := :old.' || S_S_REC.rplfield4 || ';' 
          ;
       if ((S_S_REC.rplfield5 IS NOT NULL)) then
       stmt = :stmt 
          || '  mutating.new_slave_rpls(mutation_index).field_value5 := :new.' || S_S_REC.rplfield5 || ';' 
          || '  mutating.old_slave_rpls(mutation_index).field_value5 := :old.' || S_S_REC.rplfield5 || ';' 
          ;
     END
     stmt = :stmt 
          || '  if (deleting) then ' 
          || '    insert into RPLLOG (rpltable_id, record_id, transaction_id,'
          || :fieldlist
          || ' ) ' 
          || '      values (ltable_id, :old.ID, current_transaction_id,'
          || :oldfieldvalue
          || ');' 
          ;
     stmt = :stmt
          || '  else ' 
          || '  begin ' 
          || '    insert into RPLLOG (rpltable_id, record_id, transaction_id,'
          || :fieldlist
          || ' ) ' 
          || '      values (ltable_id, :new.ID, current_transaction_id,'
          || :fieldvalue
          || ');' 
          ;
     stmt = :stmt
          || '    if '
          || :condition
          || ')) then ' 
          || '      insert into RPLLOG (rpltable_id, record_id, transaction_id,'
          || :fieldlist
          || ' ) ' 
          || '        values (ltable_id, :old.ID, current_transaction_id, '
          || :oldfieldvalue
          || ');';
     stmt = :stmt || '    end if; ' 
       || '  end; ' 
       || ' end if;' 
       || 'end;';
     EXECUTE STATEMENT (:stmt);
     if ((:plugin_count > 0)) then
     BEGIN
       -- create statement trigger
       stmt =
             'CREATE or REPLACE TRIGGER VRPL$' || UPPER (:tablename)
          || ' AFTER INSERT OR UPDATE OR DELETE ON ' || UPPER (:tablename)
          || ' declare lplugin_table_id numeric(15);'
          || ' begin '
          || '   if (deleting) then '
          || '     if mutating.old_slave_rpls.FIRST is not null then'
          || '       for i in mutating.old_slave_rpls.FIRST..mutating.old_slave_rpls.LAST'
          || '         loop';
       OPEN C_PLUGIN;
       FETCH C_PLUGIN INTO C_PLUGIN_PLUGIN_REC;
       WHILE ( ROW_COUNT != 0 ) DO
       BEGIN
         stmt = :stmt
          || '           lplugin_table_id := ' || C_PLUGIN_PLUGIN_REC.plugin_rpltable_id || ';'
          || '           insert into RPLLOG (rpltable_id, record_id, transaction_id,' || :fieldlist || ') '
          || '             select lplugin_table_id, master.id, current_transaction_id,' || :mut_oldfieldvalue
          || '               from ' || C_PLUGIN_PLUGIN_REC.join_fragment 
          || '               where slave.id=mutating.old_slave_rpls(i).id;';
       	FETCH C_PLUGIN INTO C_PLUGIN_PLUGIN_REC;
       END
       CLOSE C_PLUGIN;

       stmt = :stmt 
          || '         end loop;' 
          || '     end if;';-- end if mutation
       stmt = :stmt 
          || '   else ' 
          || '     begin '
          || '       if mutating.new_slave_rpls.FIRST is not null then'
          || '         for i in mutating.new_slave_rpls.FIRST..mutating.new_slave_rpls.LAST'
          || '           loop';
       OPEN C_PLUGIN;
       FETCH C_PLUGIN INTO C_PLUGIN_PLUGIN_REC;
       WHILE ( ROW_COUNT != 0 ) DO
       BEGIN
         stmt = :stmt
          || '             lplugin_table_id := ' || C_PLUGIN_PLUGIN_REC.plugin_rpltable_id || ';'
          || '             insert into RPLLOG (rpltable_id, record_id, transaction_id,' || :fieldlist || ') '
          || '               select lplugin_table_id, master.id, current_transaction_id,' || :mut_fieldvalue 
          || '                 from ' || C_PLUGIN_PLUGIN_REC.join_fragment
          || '                 where slave.id = mutating.new_slave_rpls(i).id;';
       	FETCH C_PLUGIN INTO C_PLUGIN_PLUGIN_REC;
       END
       CLOSE C_PLUGIN;

       stmt = :stmt 
          || '           end loop;' 
          || '       end if;';-- end if mutation
       stmt = :stmt 
          || '       if (updating) then '
          || '         if mutating.old_slave_rpls.FIRST is not null then'
          || '           for i in mutating.old_slave_rpls.FIRST..mutating.old_slave_rpls.LAST'
          || '             loop';
       OPEN C_PLUGIN;
       FETCH C_PLUGIN INTO C_PLUGIN_PLUGIN_REC;
       WHILE ( ROW_COUNT != 0 ) DO
       BEGIN
           stmt = :stmt
          || '               if (' || :mut_condition ||')) then '
          || '                 lplugin_table_id := ' || C_PLUGIN_PLUGIN_REC.plugin_rpltable_id || ';'
          || '                 insert into RPLLOG (rpltable_id, record_id, transaction_id,' || :fieldlist || ') '
          || '                   select lplugin_table_id, master.id, current_transaction_id,' || :mut_oldfieldvalue 
          || '                     from ' || C_PLUGIN_PLUGIN_REC.join_fragment
          || '                     where slave.id = mutating.old_slave_rpls(i).id;'
          || '               end if;';
       	FETCH C_PLUGIN INTO C_PLUGIN_PLUGIN_REC;
       END
       CLOSE C_PLUGIN;

       stmt = :stmt 
          || '             end loop;' 
          || '         end if;'-- end if mutation
          || '       end if; '--end if updating
          || '     end; '--end of _else begin_
          || '  end if; ' --end of large if
          || '  mutating.new_slave_rpls.delete;' 
          || '  mutating.old_slave_rpls.delete;' 
          || 'end;';--end of trigger
       EXECUTE STATEMENT (:stmt);
     END
   	FETCH S INTO S_S_REC;
   END
   CLOSE S;

END^

SET TERM ; ^


--------------------------------------------------------
--  DDL for Procedure RPL$REENABLE_RPL_TABLE
--------------------------------------------------------


  SET TERM ^ ;

CREATE OR ALTER PROCEDURE "RPL$REENABLE_RPL_TABLE" (tablename varchar(250))
AS
BEGIN
  EXECUTE PROCEDURE RPL$DISABLE_RPL_TABLE(:tablename);
  EXECUTE PROCEDURE RPL$ENABLE_RPL_TABLE(:tablename);
END^

SET TERM ; ^


--------------------------------------------------------
--  DDL for Procedure SEQUENCE_ADJ
--------------------------------------------------------


  SET TERM ^ ;

CREATE OR ALTER PROCEDURE "SEQUENCE_ADJ" (tablename VARCHAR(250))
AS
   DECLARE maxval     NUMERIC (15);
   DECLARE sitemult   NUMERIC (15);
   DECLARE curval     NUMERIC (15);
   DECLARE i          NUMERIC (15);
  DECLARE VARIABLE i INTEGER;
BEGIN
   SELECT MAX (site_id * 1000000000)
   FROM systemsite
   INTO :sitemult;
   EXECUTE STATEMENT    ('select coalesce(max(id),'
                     || :sitemult
                     || '+1)-'
                     || :sitemult
                     || ' from '
                     || :tablename
                     || ' where id-'
                     || :sitemult
                     || '<999999999')
                 INTO :maxval;
   EXECUTE STATEMENT ('select ' || :tablename || '_seq.nextval from dual')
                 INTO :curval;
   -- ������� ������, � �� �������������. ��� ��������
   i = curval;
   WHILE ( i < :maxval - 1) DO
   BEGIN
      EXECUTE STATEMENT ('select ' || :tablename || '_seq.nextval from dual')
                    INTO :sitemult;
   i = i + 1;
   END
END^

SET TERM ; ^


--------------------------------------------------------
--  DDL for Procedure TER_TREE_FILL
--------------------------------------------------------


  SET TERM ^ ;

CREATE OR ALTER PROCEDURE "TER_TREE_FILL" AS
begin
  delete from Ter_Tree
  where Ter_Id in
    ( select Ter_Id
      from (
        select Ter_Id, Tree, Path
        from Ter_Tree
        minus
        select Id as Ter_Id, Sys_Connect_By_Path(Code,'/') || '/' as Tree, SUBSTRING(Sys_Connect_By_Path(Caption,', ') FROM 3) as Path
        from Territory
        start with Parent_Id is null
        connect by Parent_Id = prior Id
      )
    );
  insert into Ter_Tree (Ter_Id, Tree, Path)
  select Id as Ter_Id, Sys_Connect_By_Path(Code,'/') || '/' as Tree, SUBSTRING(Sys_Connect_By_Path(Caption,', ') FROM 3) as Path
  from Territory
  start with Parent_Id is null
  connect by Parent_Id = prior Id
  minus
  select Ter_Id, Tree, Path
  from Ter_Tree;
end^

SET TERM ; ^
