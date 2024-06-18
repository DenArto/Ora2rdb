--------------------------------------------------------
--  DDL for Procedure CREATE_FK_INDEXES
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "GZVLG"."CREATE_FK_INDEXES" 
is
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
               From (Select substr(table_name,1,30) table_name,
                        substr(constraint_name,1,30) constraint_name,
                        substr(column_name,1,30) column_name, position
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
  loop
    execute immediate 'create index j_' || substr(cur.constraint_name,1,28) || ' on ' || cur.table_name || ' (' || cur.colum || ')';
  end loop;
end;

/
--------------------------------------------------------
--  DDL for Procedure GOODSGROUP_TREE_FILL
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "GZVLG"."GOODSGROUP_TREE_FILL" is
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
end;

/
--------------------------------------------------------
--  DDL for Procedure ORGCHILD_FILL
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "GZVLG"."ORGCHILD_FILL" 
AS
BEGIN
  DELETE FROM orgchild;
  FOR cur IN
    (SELECT id FROM org
      START WITH parent_id = id
      CONNECT BY parent_id = prior id AND parent_id <> id)
  LOOP
    INSERT INTO orgchild(org_id, child_id)
      SELECT parent_id, id FROM org WHERE parent_id = cur.id AND parent_id <> id;
    INSERT INTO orgchild(org_id, child_id)
      SELECT org_id, id FROM orgchild, org
        WHERE child_id = parent_id AND child_id = cur.id;
  END LOOP;
END;

/
--------------------------------------------------------
--  DDL for Procedure RPL$ACTIVATE_RPL
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "GZVLG"."RPL$ACTIVATE_RPL" 
AS
  stmt varchar(2000);
  cursor s is SELECT TRIGGER_NAME from USER_TRIGGERS where (TRIGGER_NAME like 'RPL$%');
  cursor r is SELECT id, name FROM rpltable ;
BEGIN
  FOR s_rec in s loop
    stmt := 'DROP TRIGGER ' || s_rec.trigger_name;
    execute immediate stmt;
  end loop;
  FOR r_rec in r loop
    RPL$REENABLE_RPL_TABLE(r_rec.name);
  END loop;
END;

/
--------------------------------------------------------
--  DDL for Procedure RPL$ASSIGN_GENERATION
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "GZVLG"."RPL$ASSIGN_GENERATION" 
    AS
    GNRTN NUMERIC(15,0);
    OLD_GEN NUMERIC(15,0);
    OLD_GEN1 NUMERIC(15,0);
    OLD_GEN2 NUMERIC(15,0);
    ldaydate date;
begin
  -- THIS PROCEDURE MUST BE EXECUTED AT SNAPSHOT ISOLATION LEVEL
  -- lock some table for a singleton execution of this procedure
  lock table rpltable in exclusive mode;
  select generation_seq.nextval into gnrtn from dual;
  select max(day_date) into ldaydate from dayversion;
  update rpllog set generation = GNRTN, transaction_id = current_transaction_id where
    generation=999999999999999;
  old_gen := null;
  if ((sysdate - ldaydate) * 24 > 1) then
    insert into dayversion(day_date, day_version) values (sysdate, GNRTN);
    select min(sent_version) into old_gen from rpl where master_id = (select site_id from systemsite) and sent_version > 0;
    if (old_gen is null) then
      old_gen := 999999999999999;
    end if;
  -- We have three differen ranges of 'living time' for records in log, depending on rpltable generation_group
  -- 10 days
    select max(day_version) into old_gen1 from dayversion where day_date < cast(sysdate as date) - 10;
    if (old_gen1 is null) then
      old_gen1 := 0;
    end if;
    if (old_gen1 < old_gen) then
      old_gen2 := old_gen1;
    else
      old_gen2 := old_gen;
    end if;
    if (old_gen2 > 0) then
      begin
        update systemsite set clean_generation_1 = old_gen2 ;
      end;
    end if;
  -- 1 day
    select max(day_version) into old_gen1 from dayversion where day_date < cast(sysdate as date) - 1;
    if (old_gen1 is null) then
      old_gen1 := 0;
    end if;
    if (old_gen1 < old_gen) then
      old_gen2 := old_gen1;
    else
      old_gen2 := old_gen;
    end if;
    if (old_gen2 > 0) then
      begin
        update systemsite set clean_generation_2 = old_gen2 ;
      end;
    end if;
  -- 1 hour
    select max(day_version) into old_gen1 from dayversion where day_date < cast(sysdate as date) - 1/24;
    if (old_gen1 is null) then
      old_gen1 := 0;
    end if;
    if (old_gen1 < old_gen) then
      old_gen2 := old_gen1;
    else
      old_gen2 := old_gen;
    end if;
    if (old_gen2 > 0) then
      begin
        update systemsite set clean_generation_3 = old_gen2 ;
      end;
    end if;
  end if;
  update systemsite set last_generation = gnrtn;
  commit;
end;

/
--------------------------------------------------------
--  DDL for Procedure RPL$CREATE_TRIGGER
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "GZVLG"."RPL$CREATE_TRIGGER" (constr_name varchar)
AS
  CHILD_WHERE VARCHAR(250);
  CHILD_CONDITION VARCHAR(250);
  CHILD_IF VARCHAR(250);
  CHILD_STATEMENT VARCHAR(2000);
  PARENT_CONDITION VARCHAR(250);
  PARENT_WHERE VARCHAR(250);
  PARENT_SET VARCHAR(250);
  FCOUNT INTEGER;
  BODY VARCHAR(4000);
  rc rpl$constraints%ROWTYPE;
  cursor getFields(constr_id rpl$constraintfields.rpl$constraints_id%type) is
    select fieldname, target_fieldname from rpl$constraintfields where rpl$constraints_id = constr_id;
BEGIN
  select * into rc from rpl$constraints where name = constr_name;
  child_where := ''; child_condition := ''; child_if := 'numrows = 0 and ';
  parent_where := ''; parent_condition := ''; parent_set := '';
  select count(*) into fcount from rpl$constraintfields where rpl$constraints_id = rc.id;
  for getFields_Rec in getFields(rc.id) loop
    child_where := child_where || ':NEW.'||getFields_Rec.fieldname||' = '||rc.target_tablename||'.'||getFields_Rec.target_fieldname;
    child_if := child_if || ':NEW.'||getFields_Rec.fieldname||' is not null';
    child_condition := child_condition || ':OLD.'||getFields_Rec.fieldname||' <> :NEW.'||getFields_Rec.fieldname;
    parent_where := parent_where || rc.tablename||'.'||getFields_Rec.fieldname||' = :OLD.'||getFields_Rec.target_fieldname;
    parent_condition := parent_condition || ':OLD.'||getFields_Rec.target_fieldname||' <> :NEW.'||getFields_Rec.target_fieldname;
    parent_set := parent_set || rc.tablename||'.'||getFields_Rec.fieldname||' = NULL';
    fcount := fcount - 1;
    if (fcount <> 0) then
      child_condition := child_condition || ' or ';
      child_where := child_where || ' and ';
      child_if := child_if || ' and ';
      parent_where := parent_where || ' and ';
      parent_condition := parent_condition || ' or ';
      parent_set := parent_set || ', ';
    end if;
  end loop;
  body :=
    'CREATE or REPLACE TRIGGER RPL$TRIG_' || rc.triggername ||
    ' BEFORE INSERT OR UPDATE ON ' || rc.tablename || ' FOR EACH ROW' ||
    ' DECLARE numrows INTEGER; RplMode NUMBER; ' ||
    'BEGIN ' ||
    ' RplMode := 0; ' ||
    ' select rpl_mode into RplMode from RplTransactMode where num_transaction = current_transaction_id; ' ||
    ' if RplMode <> 1 then ';
  child_statement := 'select count(*) into numrows from ' || rc.target_tablename || ' where ' || child_where || '; '
      || ' if(' || child_if || ') then '
      ||'raise_application_error(-20001, ''violation of FOREIGN KEY constraint "'||rc.name
      ||'" on table "'||rc.tablename||'". Foreign key reference target does not exist.''); end if;';
  body := body || 'if (inserting) then ' || child_statement || ' ';
  body := body || 'elsif (' || child_condition || ') then ' || child_statement || ' end if;';
  body := body || ' end if; END;';
  execute immediate body;
  body :=
    'CREATE or REPLACE TRIGGER RPL$TRIGT_' || rc.triggername ||
    ' BEFORE UPDATE OR DELETE ON ' || rc.target_tablename || ' FOR EACH ROW' ||
    ' DECLARE numrows INTEGER; RplMode NUMBER; ' ||
    'BEGIN ' ||
    ' RplMode := 0; ' ||
    ' select rpl_mode into RplMode from RplTransactMode where num_transaction = current_transaction_id; ' ||
    ' if RplMode <> 1 then ';
  body := body || 'if (deleting) then '; /* delete_rule возможные значения: RESTRICT, CASCADE, SET NULL */
  if (rc.delete_rule = 'CASCADE') then /* DELETE CASCADE */
    body := body ||' delete from '||rc.tablename||' where '||parent_where||';';
  elsif (rc.delete_rule = 'SET NULL') then /* DELETE SET NULL */
    body := body ||' update '||rc.tablename||' set '||parent_set||' where '||parent_where||';';
  else /* DELETE RESTRICT */
    body := body ||' select count(*) into numrows from '||rc.tablename||' where '||parent_where||'; '
        ||'if(numrows > 0) then '
        ||'raise_application_error(-20001, ''violation of FOREIGN KEY constraint "'||rc.name
        ||'" on table "'||rc.target_tablename||'". Foreign key references are present for the record.''); end if;';
  end if;
  body := body || ' elsif(' || parent_condition || ') then '; /* update_rule возможные значения: RESTRICT, SET NULL */
  if (rc.update_rule = 'SET NULL') then /* UPDATE SET NULL */
    body := body ||' update '||rc.tablename||' set '||parent_set||' where '||parent_where||';';
  else /* UPDATE RESTRICT */
    body := body ||' select count(*) into numrows from '||rc.tablename||' where '||parent_where||'; '
        ||'if(numrows > 0) then '
        ||'raise_application_error(-20001, ''violation of FOREIGN KEY constraint "'||rc.name
        ||'" on table "'||rc.target_tablename||'". Foreign key references are present for the record.''); end if;';
  end if;
  body := body || ' end if;';
  body := body || '  end if; END;';
  execute immediate body;
END;

/
--------------------------------------------------------
--  DDL for Procedure RPL$CREATE_TRIGGERS
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "GZVLG"."RPL$CREATE_TRIGGERS" 
IS
  cursor getConstraints is
    select name from rpl$constraints;
BEGIN
  FOR getConstraints_Rec in getConstraints LOOP
    RPL$CREATE_TRIGGER(getConstraints_Rec.name);
  END LOOP;
END;

/
--------------------------------------------------------
--  DDL for Procedure RPL$DEACTIVATE_RPL
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "GZVLG"."RPL$DEACTIVATE_RPL" 
AS
  stmt varchar(2000);
  cursor s is SELECT TRIGGER_NAME from USER_TRIGGERS where (TRIGGER_NAME like 'RPL$%');
BEGIN
  FOR s_rec in s loop
    stmt := 'DROP TRIGGER ' || s_rec.trigger_name;
    execute immediate stmt;
  end loop;
END;

/
--------------------------------------------------------
--  DDL for Procedure RPL$DISABLE_RPL_TABLE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "GZVLG"."RPL$DISABLE_RPL_TABLE" (tablename varchar)
AS
   CURSOR s is select trigger_name name from user_triggers where (trigger_name like 'RPL$'||tablename) ;
   stmt VARCHAR(2000);
BEGIN
  FOR s_rec in s LOOP
    stmt :=
      'drop trigger '||s_rec.NAME;
    EXECUTE IMMEDIATE stmt;
  end loop;
END;

/
--------------------------------------------------------
--  DDL for Procedure RPL$ENABLE_RPL_TABLE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "GZVLG"."RPL$ENABLE_RPL_TABLE" (tablename varchar)
AS
   stmt            VARCHAR (20000);
   fieldlist       VARCHAR (500);
   fieldvalue      VARCHAR (500);
   oldfieldvalue   VARCHAR (500);
   condition       VARCHAR (500);
   mut_fieldvalue      VARCHAR (500);
   mut_oldfieldvalue   VARCHAR (500);
   mut_condition       VARCHAR (500);
   table_id        NUMERIC (15);
   plugin_count    NUMERIC (15);
   CURSOR s
   IS
      SELECT ID, rplfield1, rplfield2, rplfield3, rplfield4, rplfield5
        FROM rpltable
       WHERE UPPER (NAME) = UPPER (tablename) AND isplugin = 0;
   CURSOR c_plugin
   IS
      SELECT plugin_rpltable_id, join_fragment
        FROM rpltableplugin rtp JOIN rpltable rt
             ON rt.ID = rtp.rpltable_id
           AND UPPER (rt.NAME) = UPPER (tablename)
           AND rt.isplugin = 0
             ;
BEGIN
   select count(rtp.ID) into plugin_count 
       from rpltableplugin rtp 
            JOIN rpltable rt ON rt.ID = rtp.rpltable_id
                             AND UPPER (rt.NAME) = UPPER (tablename)
                             AND rt.isplugin = 0;
   FOR s_rec IN s
   LOOP
      fieldlist := 'generation';
      fieldvalue := '999999999999999';
      oldfieldvalue := fieldvalue;
      mut_fieldvalue := fieldvalue;
      mut_oldfieldvalue := fieldvalue;
      condition := '(updating and not(1=1 ';
      mut_condition := '1=1 ';      
      fieldlist := fieldlist || ', FIELD1_VALUE';
      table_id := s_rec.ID;
      IF (s_rec.rplfield1 IS NOT NULL)
      THEN
         BEGIN
           fieldvalue := fieldvalue || ', :new.' || s_rec.rplfield1;
           oldfieldvalue := oldfieldvalue || ', :old.' || s_rec.rplfield1;
           condition := condition
            || 'and (:new.'
            || s_rec.rplfield1
            || '='
            || ':old.'
            || s_rec.rplfield1
            || ')';
           if (plugin_count > 0) then   
                mut_fieldvalue := mut_fieldvalue || ', mutating.new_slave_rpls(i).field_value1';
                mut_oldfieldvalue := mut_oldfieldvalue || ', mutating.old_slave_rpls(i).field_value1';
                mut_condition := mut_condition || 'and (mutating.new_slave_rpls(i).field_value1 = mutating.old_slave_rpls(i).field_value1';
           end if;
         END;
      ELSE
         BEGIN
            fieldvalue := fieldvalue || ', 0';
            oldfieldvalue := oldfieldvalue || ', 0';
            mut_fieldvalue := mut_fieldvalue || ', 0';
            mut_oldfieldvalue := mut_oldfieldvalue || ', 0';
         END;
      END IF;
      fieldlist := fieldlist || ', FIELD2_VALUE';
      IF (s_rec.rplfield2 IS NOT NULL)
      THEN
         BEGIN
            fieldvalue := fieldvalue || ', :new.' || s_rec.rplfield2;
            oldfieldvalue := oldfieldvalue || ', :old.' || s_rec.rplfield2;
            condition :=
                  condition
               || 'and (:new.'
               || s_rec.rplfield2
               || '='
               || ':old.'
               || s_rec.rplfield2
               || ')';
           if (plugin_count > 0) then   
                mut_fieldvalue := mut_fieldvalue || ', mutating.new_slave_rpls(i).field_value2';
                mut_oldfieldvalue := mut_oldfieldvalue || ', mutating.old_slave_rpls(i).field_value2';
                mut_condition := mut_condition || 'and (mutating.new_slave_rpls(i).field_value2 = mutating.old_slave_rpls(i).field_value2';
           end if;
         END;
      ELSE
         BEGIN
            fieldvalue := fieldvalue || ', 0';
            oldfieldvalue := oldfieldvalue || ', 0';
            mut_fieldvalue := mut_fieldvalue || ', 0';
            mut_oldfieldvalue := mut_oldfieldvalue || ', 0';
         END;
      END IF;
      fieldlist := fieldlist || ', FIELD3_VALUE';
      IF (s_rec.rplfield3 IS NOT NULL)
      THEN
         BEGIN
            fieldvalue := fieldvalue || ', :new.' || s_rec.rplfield3;
            oldfieldvalue := oldfieldvalue || ', :old.' || s_rec.rplfield3;
            condition :=
                  condition
               || 'and (:new.'
               || s_rec.rplfield3
               || '='
               || ':old.'
               || s_rec.rplfield3
               || ')';
           if (plugin_count > 0) then   
                mut_fieldvalue := mut_fieldvalue || ', mutating.new_slave_rpls(i).field_value3';
                mut_oldfieldvalue := mut_oldfieldvalue || ', mutating.old_slave_rpls(i).field_value3';
                mut_condition := mut_condition || 'and (mutating.new_slave_rpls(i).field_value3 = mutating.old_slave_rpls(i).field_value3';
           end if;
         END;
      ELSE
         BEGIN
            fieldvalue := fieldvalue || ', 0';
            oldfieldvalue := oldfieldvalue || ', 0';
            mut_fieldvalue := mut_fieldvalue || ', 0';
            mut_oldfieldvalue := mut_oldfieldvalue || ', 0';
         END;
      END IF;
      fieldlist := fieldlist || ', FIELD4_VALUE';
      IF (s_rec.rplfield4 IS NOT NULL)
      THEN
         BEGIN
            fieldvalue := fieldvalue || ', :new.' || s_rec.rplfield4;
            oldfieldvalue := oldfieldvalue || ', :old.' || s_rec.rplfield4;
            condition :=
                  condition
               || 'and (:new.'
               || s_rec.rplfield4
               || '='
               || ':old.'
               || s_rec.rplfield4
               || ')';
           if (plugin_count > 0) then   
                mut_fieldvalue := mut_fieldvalue || ', mutating.new_slave_rpls(i).field_value4';
                mut_oldfieldvalue := mut_oldfieldvalue || ', mutating.old_slave_rpls(i).field_value4';
                mut_condition := mut_condition || 'and (mutating.new_slave_rpls(i).field_value4 = mutating.old_slave_rpls(i).field_value4';
           end if;
         END;
      ELSE
         BEGIN
            fieldvalue := fieldvalue || ', 0';
            oldfieldvalue := oldfieldvalue || ', 0';
            mut_fieldvalue := mut_fieldvalue || ', 0';
            mut_oldfieldvalue := mut_oldfieldvalue || ', 0';
         END;
      END IF;
      fieldlist := fieldlist || ', FIELD5_VALUE';
      IF (s_rec.rplfield5 IS NOT NULL)
      THEN
         BEGIN
            fieldvalue := fieldvalue || ', :new.' || s_rec.rplfield5;
            oldfieldvalue := oldfieldvalue || ', :old.' || s_rec.rplfield5;
            condition :=
                  condition
               || 'and (:new.'
               || s_rec.rplfield5
               || '='
               || ':old.'
               || s_rec.rplfield5
               || ')';
           if (plugin_count > 0) then   
                mut_fieldvalue := mut_fieldvalue || ', mutating.new_slave_rpls(i).field_value5';
                mut_oldfieldvalue := mut_oldfieldvalue || ', mutating.old_slave_rpls(i).field_value5';
                mut_condition := mut_condition || 'and (mutating.new_slave_rpls(i).field_value5 = mutating.old_slave_rpls(i).field_value5';
           end if;
         END;
      ELSE
         BEGIN
            fieldvalue := fieldvalue || ', 0';
            oldfieldvalue := oldfieldvalue || ', 0';
            mut_fieldvalue := mut_fieldvalue || ', 0';
            mut_oldfieldvalue := mut_oldfieldvalue || ', 0';
         END;
      END IF;
      -- create trigger for each row
      stmt :=
             'CREATE or REPLACE TRIGGER RPL$'
          || UPPER (tablename)
          || ' AFTER INSERT OR UPDATE OR DELETE ON '
          || UPPER (tablename)
          || ' REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW ' 
          || 'declare ' --|| utl_tcp.CRLF
          || 'ltable_id numeric(15); ' 
          || 'mutation_index numeric; ' 
          || 'begin ' 
          || '  ltable_id := ' || table_id || ';' 
          ;
     if (plugin_count > 0) then
       -- use it in statement trigger
       stmt := stmt 
          || '  mutation_index := mutating.new_slave_rpls.count+1;'
          || '  mutating.new_slave_rpls(mutation_index).id := :new.id;' 
          || '  mutating.old_slave_rpls(mutation_index).id := :old.id;' 
          ;
       if (s_rec.rplfield1 IS NOT NULL) then
       stmt := stmt 
          || '  mutating.new_slave_rpls(mutation_index).field_value1 := :new.' || s_rec.rplfield1 || ';' 
          || '  mutating.old_slave_rpls(mutation_index).field_value1 := :old.' || s_rec.rplfield1 || ';' 
          ;
       end if;
       if (s_rec.rplfield2 IS NOT NULL) then
       stmt := stmt 
          || '  mutating.new_slave_rpls(mutation_index).field_value2 := :new.' || s_rec.rplfield2 || ';' 
          || '  mutating.old_slave_rpls(mutation_index).field_value2 := :old.' || s_rec.rplfield2 || ';' 
          ;
       end if;
       if (s_rec.rplfield3 IS NOT NULL) then
       stmt := stmt 
          || '  mutating.new_slave_rpls(mutation_index).field_value3 := :new.' || s_rec.rplfield3 || ';' 
          || '  mutating.old_slave_rpls(mutation_index).field_value3 := :old.' || s_rec.rplfield3 || ';' 
          ;
       end if;
       if (s_rec.rplfield4 IS NOT NULL) then
       stmt := stmt 
          || '  mutating.new_slave_rpls(mutation_index).field_value4 := :new.' || s_rec.rplfield4 || ';' 
          || '  mutating.old_slave_rpls(mutation_index).field_value4 := :old.' || s_rec.rplfield4 || ';' 
          ;
       end if;
       if (s_rec.rplfield5 IS NOT NULL) then
       stmt := stmt 
          || '  mutating.new_slave_rpls(mutation_index).field_value5 := :new.' || s_rec.rplfield5 || ';' 
          || '  mutating.old_slave_rpls(mutation_index).field_value5 := :old.' || s_rec.rplfield5 || ';' 
          ;
       end if;
     end if;
     stmt := stmt 
          || '  if (deleting) then ' 
          || '    insert into RPLLOG (rpltable_id, record_id, transaction_id,'
          || fieldlist
          || ' ) ' 
          || '      values (ltable_id, :old.ID, current_transaction_id,'
          || oldfieldvalue
          || ');' 
          ;
     stmt := stmt
          || '  else ' 
          || '  begin ' 
          || '    insert into RPLLOG (rpltable_id, record_id, transaction_id,'
          || fieldlist
          || ' ) ' 
          || '      values (ltable_id, :new.ID, current_transaction_id,'
          || fieldvalue
          || ');' 
          ;
     stmt := stmt
          || '    if '
          || condition
          || ')) then ' 
          || '      insert into RPLLOG (rpltable_id, record_id, transaction_id,'
          || fieldlist
          || ' ) ' 
          || '        values (ltable_id, :old.ID, current_transaction_id, '
          || oldfieldvalue
          || ');';
     stmt := stmt || '    end if; ' 
       || '  end; ' 
       || ' end if;' 
       || 'end;';
     EXECUTE IMMEDIATE stmt;
     if (plugin_count > 0) then
       -- create statement trigger
       stmt :=
             'CREATE or REPLACE TRIGGER VRPL$' || UPPER (tablename)
          || ' AFTER INSERT OR UPDATE OR DELETE ON ' || UPPER (tablename)
          || ' declare lplugin_table_id numeric(15);'
          || ' begin '
          || '   if (deleting) then '
          || '     if mutating.old_slave_rpls.FIRST is not null then'
          || '       for i in mutating.old_slave_rpls.FIRST..mutating.old_slave_rpls.LAST'
          || '         loop';
       FOR plugin_rec IN c_plugin
       LOOP
         stmt := stmt
          || '           lplugin_table_id := ' || plugin_rec.plugin_rpltable_id || ';'
          || '           insert into RPLLOG (rpltable_id, record_id, transaction_id,' || fieldlist || ') '
          || '             select lplugin_table_id, master.id, current_transaction_id,' || mut_oldfieldvalue
          || '               from ' || plugin_rec.join_fragment 
          || '               where slave.id=mutating.old_slave_rpls(i).id;';
       END LOOP;
       stmt := stmt 
          || '         end loop;' 
          || '     end if;';-- end if mutation
       stmt := stmt 
          || '   else ' 
          || '     begin '
          || '       if mutating.new_slave_rpls.FIRST is not null then'
          || '         for i in mutating.new_slave_rpls.FIRST..mutating.new_slave_rpls.LAST'
          || '           loop';
       FOR plugin_rec IN c_plugin
       LOOP
         stmt := stmt
          || '             lplugin_table_id := ' || plugin_rec.plugin_rpltable_id || ';'
          || '             insert into RPLLOG (rpltable_id, record_id, transaction_id,' || fieldlist || ') '
          || '               select lplugin_table_id, master.id, current_transaction_id,' || mut_fieldvalue 
          || '                 from ' || plugin_rec.join_fragment
          || '                 where slave.id = mutating.new_slave_rpls(i).id;';
       END LOOP;
       stmt := stmt 
          || '           end loop;' 
          || '       end if;';-- end if mutation
       stmt := stmt 
          || '       if (updating) then '
          || '         if mutating.old_slave_rpls.FIRST is not null then'
          || '           for i in mutating.old_slave_rpls.FIRST..mutating.old_slave_rpls.LAST'
          || '             loop';
       FOR plugin_rec IN c_plugin
       LOOP
           stmt := stmt
          || '               if (' || mut_condition ||')) then '
          || '                 lplugin_table_id := ' || plugin_rec.plugin_rpltable_id || ';'
          || '                 insert into RPLLOG (rpltable_id, record_id, transaction_id,' || fieldlist || ') '
          || '                   select lplugin_table_id, master.id, current_transaction_id,' || mut_oldfieldvalue 
          || '                     from ' || plugin_rec.join_fragment
          || '                     where slave.id = mutating.old_slave_rpls(i).id;'
          || '               end if;';          
       END LOOP;
       stmt := stmt 
          || '             end loop;' 
          || '         end if;'-- end if mutation
          || '       end if; '--end if updating
          || '     end; '--end of _else begin_
          || '  end if; ' --end of large if
          || '  mutating.new_slave_rpls.delete;' 
          || '  mutating.old_slave_rpls.delete;' 
          || 'end;';--end of trigger
       EXECUTE IMMEDIATE stmt;
     end if;
   END LOOP;
END;

/
--------------------------------------------------------
--  DDL for Procedure RPL$REENABLE_RPL_TABLE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "GZVLG"."RPL$REENABLE_RPL_TABLE" (tablename varchar)
IS
BEGIN
  RPL$DISABLE_RPL_TABLE(tablename);
  RPL$ENABLE_RPL_TABLE(tablename);
END;

/
--------------------------------------------------------
--  DDL for Procedure SEQUENCE_ADJ
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "GZVLG"."SEQUENCE_ADJ" (tablename VARCHAR2)
AS
   maxval     NUMERIC (15);
   sitemult   NUMERIC (15);
   curval     NUMERIC (15);
   i          NUMERIC (15);
BEGIN
   SELECT MAX (site_id * 1000000000)
     INTO sitemult
     FROM systemsite;
   EXECUTE IMMEDIATE    'select coalesce(max(id),'
                     || sitemult
                     || '+1)-'
                     || sitemult
                     || ' from '
                     || tablename
                     || ' where id-'
                     || sitemult
                     || '<999999999'
                INTO maxval;
   EXECUTE IMMEDIATE 'select ' || tablename || '_seq.nextval from dual'
                INTO curval;
   -- сделаем циклом, а не пересозданием. так надежнее
   FOR i IN curval .. maxval - 1
   LOOP
      EXECUTE IMMEDIATE 'select ' || tablename || '_seq.nextval from dual'
                   INTO sitemult;
   END LOOP;
END;

/
--------------------------------------------------------
--  DDL for Procedure TER_TREE_FILL
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "GZVLG"."TER_TREE_FILL" is
begin
  delete from Ter_Tree
  where Ter_Id in
    ( select Ter_Id
      from (
        select Ter_Id, Tree, Path
        from Ter_Tree
        minus
        select Id as Ter_Id, Sys_Connect_By_Path(Code,'/') || '/' as Tree, SUBSTR(Sys_Connect_By_Path(Caption,', '),3) as Path
        from Territory
        start with Parent_Id is null
        connect by Parent_Id = prior Id
      )
    );
  insert into Ter_Tree (Ter_Id, Tree, Path)
  select Id as Ter_Id, Sys_Connect_By_Path(Code,'/') || '/' as Tree, SUBSTR(Sys_Connect_By_Path(Caption,', '),3) as Path
  from Territory
  start with Parent_Id is null
  connect by Parent_Id = prior Id
  minus
  select Ter_Id, Tree, Path
  from Ter_Tree;
end;

/
