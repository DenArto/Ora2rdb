--------------------------------------------------------
--  DDL for Trigger CHK_UQ_DOCREQ
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."CHK_UQ_DOCREQ" AFTER INSERT OR UPDATE
 ON DocReq FOR EACH ROW
DECLARE
  NumRows INTEGER;
  idList NUMERIC(15);
PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN
  SELECT COUNT(*) INTO NumRows FROM DocReq WHERE Name = :NEW.Name and PurchaseMode_Id = :NEW.PurchaseMode_Id;
  IF (NumRows > 0) THEN
    SELECT Id INTO idList FROM DocReq WHERE Name = :NEW.Name and PurchaseMode_Id = :NEW.PurchaseMode_Id;
    IF (:NEW.Id NOT IN (idList)) THEN
      raise_application_error(-20001, 'violation of PRIMARY or UNIQUE KEY constraint "UQ_DOCREQ"');
    END IF;
  END IF;
COMMIT;
END;

/
ALTER TRIGGER "GZVLG"."CHK_UQ_DOCREQ" ENABLE;
--------------------------------------------------------
--  DDL for Trigger CHK_UQ_ESTIMATE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."CHK_UQ_ESTIMATE" after insert or update
 on ESTIMATE for each row
DECLARE numrows INTEGER;
 idList numeric(15);
PRAGMA AUTONOMOUS_TRANSACTION; 
begin
  SELECT count(*) into numrows from ESTIMATE where CAPTION = :NEW.CAPTION and FINYEAR = :NEW.FINYEAR and BUDGET_ID = :NEW.BUDGET_ID;
  if (numrows > 0) then
    SELECT ID into idList from ESTIMATE where CAPTION = :NEW.CAPTION and FINYEAR = :NEW.FINYEAR and BUDGET_ID = :NEW.BUDGET_ID;
    if (:NEW.ID not in (idList)) then
      raise_application_error(-20001, 'violation of PRIMARY or UNIQUE KEY constraint "UQ_ESTIMATE"'); 
    end if;
  end if;
COMMIT;
end;

/
ALTER TRIGGER "GZVLG"."CHK_UQ_ESTIMATE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger CHK_UQ_FINSRC
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."CHK_UQ_FINSRC" after insert or update
 on FINSRC for each row
DECLARE numrows INTEGER;
 idList numeric(15);
PRAGMA AUTONOMOUS_TRANSACTION; 
begin
  SELECT count(*) into numrows from FINSRC where NAME = :NEW.NAME and FINYEAR = :NEW.FINYEAR;
  if (numrows > 0) then
    SELECT ID into idList from FINSRC where NAME = :NEW.NAME and FINYEAR = :NEW.FINYEAR;
    if (:NEW.ID not in (idList)) then
      raise_application_error(-20001, 'violation of PRIMARY or UNIQUE KEY constraint "UQ_FINSRC"'); 
    end if;
  end if;
COMMIT;
end;

/
ALTER TRIGGER "GZVLG"."CHK_UQ_FINSRC" ENABLE;
--------------------------------------------------------
--  DDL for Trigger CHK_UQ_GROUPPROP_CAPTION
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."CHK_UQ_GROUPPROP_CAPTION" after insert or update
 on GROUPPROP for each row
DECLARE numrows INTEGER;
 idList numeric(15);
PRAGMA AUTONOMOUS_TRANSACTION; 
begin
  SELECT count(*) into numrows from GROUPPROP where CAPTION = :NEW.CAPTION and GROUP_ID = :NEW.GROUP_ID;
  if (numrows > 0) then
    SELECT ID into idList from GROUPPROP where CAPTION = :NEW.CAPTION and GROUP_ID = :NEW.GROUP_ID;
    if (:NEW.ID not in (idList)) then
      raise_application_error(-20001, 'violation of PRIMARY or UNIQUE KEY constraint "UQ_GROUPPROP_CAPTION"'); 
    end if;
  end if;
COMMIT;
end;

/
ALTER TRIGGER "GZVLG"."CHK_UQ_GROUPPROP_CAPTION" ENABLE;
--------------------------------------------------------
--  DDL for Trigger CHK_UQ_OFRGROUPPROP_CAPTION
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."CHK_UQ_OFRGROUPPROP_CAPTION" after insert or update
 on OFRGROUPPROP for each row
DECLARE numrows INTEGER;
PRAGMA AUTONOMOUS_TRANSACTION; 
begin
  SELECT count(*) into numrows from OFRGROUPPROP where CAPTION = :NEW.CAPTION and OFFER_ID = :NEW.OFFER_ID and GROUPCODE = :NEW.GROUPCODE;
  if (numrows > 0) then
  raise_application_error(-20001, 'violation of PRIMARY or UNIQUE KEY constraint "UQ_OFRGROUPPROP_CAPTION"'); end if;
COMMIT;
end;

/
ALTER TRIGGER "GZVLG"."CHK_UQ_OFRGROUPPROP_CAPTION" ENABLE;
--------------------------------------------------------
--  DDL for Trigger CHK_UQ_PAYCONDITION_NAME
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."CHK_UQ_PAYCONDITION_NAME" after insert or update
 on PAYCONDITION for each row
DECLARE numrows INTEGER;
 idList numeric(15);
PRAGMA AUTONOMOUS_TRANSACTION; 
begin
  SELECT count(*) into numrows from PAYCONDITION where NAME = :NEW.NAME;
  if (numrows > 0) then
    SELECT ID into idList from PAYCONDITION where NAME = :NEW.NAME;
    if (:NEW.ID not in (idList)) then
      raise_application_error(-20001, 'violation of PRIMARY or UNIQUE KEY constraint "UQ_PAYCONDITION_NAME"'); 
    end if;
  end if;
COMMIT;
end;

/
ALTER TRIGGER "GZVLG"."CHK_UQ_PAYCONDITION_NAME" ENABLE;
--------------------------------------------------------
--  DDL for Trigger CHK_UQ_PLGOODS
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."CHK_UQ_PLGOODS" after insert or update
 on PLGOODS for each row
DECLARE numrows INTEGER;
 idList numeric(15);
PRAGMA AUTONOMOUS_TRANSACTION; 
begin
  SELECT count(*) into numrows from PLGOODS where NAME = :NEW.NAME and UNIT = :NEW.UNIT and PRICE = :NEW.PRICE and GROUPCODE = :NEW.GROUPCODE and ORGID = :NEW.ORGID;
  if (numrows > 0) then
    SELECT ID into idList from PLGOODS where NAME = :NEW.NAME and UNIT = :NEW.UNIT and PRICE = :NEW.PRICE and GROUPCODE = :NEW.GROUPCODE and ORGID = :NEW.ORGID;
    if (:NEW.ID not in (idList)) then
      raise_application_error(-20001, 'violation of PRIMARY or UNIQUE KEY constraint "UQ_PLGOODS"'); 
    end if;
  end if;
COMMIT;
end;

/
ALTER TRIGGER "GZVLG"."CHK_UQ_PLGOODS" ENABLE;
--------------------------------------------------------
--  DDL for Trigger CHK_UQ_PROPTYPE_CAPTION
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."CHK_UQ_PROPTYPE_CAPTION" after insert or update
 on PROPTYPE for each row
DECLARE numrows INTEGER;
 idList numeric(15);
PRAGMA AUTONOMOUS_TRANSACTION; 
begin
  SELECT count(*) into numrows from PROPTYPE where CAPTION = :NEW.CAPTION;
  if (numrows > 0) then
    SELECT ID into idList from PROPTYPE where CAPTION = :NEW.CAPTION;
    if (:NEW.ID not in (idList)) then
      raise_application_error(-20001, 'violation of PRIMARY or UNIQUE KEY constraint "UQ_PROPTYPE_CAPTION"'); 
    end if;
  end if;
COMMIT;
end;

/
ALTER TRIGGER "GZVLG"."CHK_UQ_PROPTYPE_CAPTION" ENABLE;
--------------------------------------------------------
--  DDL for Trigger CHK_UQ_QUALREQ
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."CHK_UQ_QUALREQ" AFTER INSERT OR UPDATE
 ON QualReq FOR EACH ROW
DECLARE
  NumRows INTEGER;
  idList NUMERIC(15);
PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN
  SELECT COUNT(*) INTO NumRows FROM QualReq WHERE Name = :NEW.Name and PurchaseMode_Id = :NEW.PurchaseMode_Id;
  IF (NumRows > 0) THEN
    SELECT Id INTO idList FROM QualReq WHERE Name = :NEW.Name and PurchaseMode_Id = :NEW.PurchaseMode_Id;
    IF (:NEW.Id NOT IN (idList)) THEN
      raise_application_error(-20001, 'violation of PRIMARY or UNIQUE KEY constraint "UQ_QUALREQ"');
    END IF;
  END IF;
COMMIT;
END;

/
ALTER TRIGGER "GZVLG"."CHK_UQ_QUALREQ" ENABLE;
--------------------------------------------------------
--  DDL for Trigger CHK_UQ_TYPEREQCRIT_NAME
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."CHK_UQ_TYPEREQCRIT_NAME" after insert or update
 on TYPEREQCRIT for each row
DECLARE numrows INTEGER;
 idList numeric(15);
PRAGMA AUTONOMOUS_TRANSACTION; 
begin
  SELECT count(*) into numrows from TYPEREQCRIT where NAME = :NEW.NAME and PurchaseMode_Id = :NEW.PurchaseMode_Id;
  if (numrows > 0) then
    SELECT ID into idList from TYPEREQCRIT where NAME = :NEW.NAME and PurchaseMode_Id = :NEW.PurchaseMode_Id;
    if (:NEW.ID not in (idList)) then
      raise_application_error(-20001, 'violation of PRIMARY or UNIQUE KEY constraint "UQ_TYPEREQCRIT_NAME"'); 
    end if;
  end if;
COMMIT;
end;

/
ALTER TRIGGER "GZVLG"."CHK_UQ_TYPEREQCRIT_NAME" ENABLE;
--------------------------------------------------------
--  DDL for Trigger COUNT_SIGN
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."COUNT_SIGN" 
after insert or update or delete on DigestSign for each row
declare
  DocId number(18,0);
  OldDocId number(18,0);
begin
  if (inserting or updating) then
    if (:new.SignType = 0) then
      select dg.Document_id into DocId from Digest dg where dg.Id = :new.Digest_id;
    else
      select da.Document_id into DocId from DocAttachEx da where da.Id = :new.DocAttachEx_id;
    end if;
  end if;
  if (updating or deleting) then
    if (:old.SignType = 0) then
      select dg.Document_id into OldDocId from Digest dg where dg.Id = :old.Digest_id;
    else
      OldDocId := GetDocIDForAttachID(:old.DocAttachEx_id);
    end if;
  end if;
  if inserting then
    update Document d set d.Sign_cnt = d.Sign_cnt + 1 where d.Id = DocId;
  elsif updating then
    if (DocId <> OldDocId) then
      update Document d set d.Sign_cnt = d.Sign_cnt + 1 where d.Id = DocId;
      update Document d set d.Sign_cnt = d.Sign_cnt - 1 where d.Id = OldDocId;
    end if;
  else
    update Document d set d.Sign_cnt = d.Sign_cnt - 1 where d.Id = OldDocId;
  end if;
end;

/
ALTER TRIGGER "GZVLG"."COUNT_SIGN" ENABLE;
--------------------------------------------------------
--  DDL for Trigger DEL_DOCATTACHEX
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."DEL_DOCATTACHEX" AFTER DELETE ON DOCATTACHEX FOR EACH ROW
BEGIN
  update document d set d.attach_cnt = d.attach_cnt - 1 
    where d.id=:old.document_id;
END;

/
ALTER TRIGGER "GZVLG"."DEL_DOCATTACHEX" ENABLE;
--------------------------------------------------------
--  DDL for Trigger DELETE_DOCATTACH
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."DELETE_DOCATTACH" before delete on DOCATTACH
for each row
declare
  result numeric;
  TaskJournalId numeric(15,0);
begin
    result := :old.version + 1;
  TaskJournalId := RPLTRANSACTION.get_task_journal_id; 
  if (TaskJournalId is not null) then
    insert into RplVersionLog (Ver, Num_Transaction, RplTable_Id, TaskJournal_Id, Record_Id, Record_Action)
    values (result, dbms_transaction.local_transaction_id, 49, TaskJournalId, :old.id, 2);
  end if;
end;
/
ALTER TRIGGER "GZVLG"."DELETE_DOCATTACH" ENABLE;
--------------------------------------------------------
--  DDL for Trigger DELETE_DOCATTACHEX
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."DELETE_DOCATTACHEX" before delete on DOCATTACHEX
for each row
declare
  result numeric;
  TaskJournalId numeric(15,0);
begin
    result := :old.version + 1;
  TaskJournalId := RPLTRANSACTION.get_task_journal_id; 
  if (TaskJournalId is not null) then
    insert into RplVersionLog (Ver, Num_Transaction, RplTable_Id, TaskJournal_Id, Record_Id, Record_Action)
    values (result, dbms_transaction.local_transaction_id, 2, TaskJournalId, :old.id, 2);
  end if;
end;
/
ALTER TRIGGER "GZVLG"."DELETE_DOCATTACHEX" ENABLE;
--------------------------------------------------------
--  DDL for Trigger DELETE_MAILATTACH
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."DELETE_MAILATTACH" before delete on MAILATTACH
for each row
declare
  result numeric;
  TaskJournalId numeric(15,0);
begin
    result := :old.version + 1;
  TaskJournalId := RPLTRANSACTION.get_task_journal_id; 
  if (TaskJournalId is not null) then
    insert into RplVersionLog (Ver, Num_Transaction, RplTable_Id, TaskJournal_Id, Record_Id, Record_Action)
    values (result, dbms_transaction.local_transaction_id, 66, TaskJournalId, :old.id, 2);
  end if;
end;
/
ALTER TRIGGER "GZVLG"."DELETE_MAILATTACH" ENABLE;
--------------------------------------------------------
--  DDL for Trigger DELETE_REFATTACH
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."DELETE_REFATTACH" before delete on REFATTACH
for each row
declare
  result numeric;
  TaskJournalId numeric(15,0);
begin
    result := :old.version + 1;
  TaskJournalId := RPLTRANSACTION.get_task_journal_id; 
  if (TaskJournalId is not null) then
    insert into RplVersionLog (Ver, Num_Transaction, RplTable_Id, TaskJournal_Id, Record_Id, Record_Action)
    values (result, dbms_transaction.local_transaction_id, 253, TaskJournalId, :old.id, 2);
  end if;
end;
/
ALTER TRIGGER "GZVLG"."DELETE_REFATTACH" ENABLE;
--------------------------------------------------------
--  DDL for Trigger DLT_PLAN3PURCHASELINE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."DLT_PLAN3PURCHASELINE" before delete
 on PLAN3PURCHASELINE for each row
begin
  update plan3purchasegoods g set g.plan3purchaselinepos=null
    where g.plan3purchasedoc_id=:old.plan3purchasedoc_id and g.plan3purchaselinepos=:old.pos;
end;

/
ALTER TRIGGER "GZVLG"."DLT_PLAN3PURCHASELINE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger INS_DOCATTACHEX
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."INS_DOCATTACHEX" AFTER INSERT ON DOCATTACHEX FOR EACH ROW
BEGIN
  update document d set d.attach_cnt = d.attach_cnt + 1 
    where d.id=:new.document_id;
END;

/
ALTER TRIGGER "GZVLG"."INS_DOCATTACHEX" ENABLE;
--------------------------------------------------------
--  DDL for Trigger INS_GOODSGROUP_TREE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."INS_GOODSGROUP_TREE" after insert
 on goodsgroup referencing old as old new as new
 for each row
declare
 vtree varchar(255);
begin
  begin
    select tree into vtree
      from goodsgroup_tree where group_id=:new.parent_id;
  exception
    when no_data_found then
      vtree := '/';
  end;
  insert into goodsgroup_tree (group_id, tree)
    values(:new.id, vtree||:new.code||'/');
end;

/
ALTER TRIGGER "GZVLG"."INS_GOODSGROUP_TREE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger INS_ISCONTRACTOR_ORGACCOUNT
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."INS_ISCONTRACTOR_ORGACCOUNT" 
 before insert or update on OrgAccount for each row
begin
  if (:old.ORG_ID is null) or (:old.ORG_ID<>:new.ORG_ID) then
    select o.IsContractor into :new.IsContractor from Org o where o.ID=:new.ORG_ID;
  end if;
end;

/
ALTER TRIGGER "GZVLG"."INS_ISCONTRACTOR_ORGACCOUNT" ENABLE;
--------------------------------------------------------
--  DDL for Trigger INS_ORGCHILD
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."INS_ORGCHILD" AFTER INSERT
 ON org FOR EACH ROW 
BEGIN
  IF (:NEW.parent_id IS NOT NULL AND :NEW.parent_id <> :NEW.id) THEN
    INSERT INTO orgchild(org_id, child_id)
      VALUES(:NEW.parent_id, :NEW.id);
    FOR cur IN (SELECT org_id FROM orgchild
                WHERE child_id = :NEW.parent_id)
    LOOP
      INSERT INTO orgchild(org_id, child_id)
         VALUES (cur.org_id, :NEW.id);
    END LOOP;
  END IF;
END;

/
ALTER TRIGGER "GZVLG"."INS_ORGCHILD" ENABLE;
--------------------------------------------------------
--  DDL for Trigger INS_TER_TREE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."INS_TER_TREE" after insert
 on territory referencing old as old new as new
 for each row
declare
 vtree varchar(255);
 vpath varchar(512);
begin
  begin
    select tree, path into vtree, vpath
      from ter_tree where ter_id=:new.parent_id;
    vpath := vpath||', '||:new.caption;
  exception
    when no_data_found then
      vtree := '/';
      vpath := :new.caption;
  end;
  insert into ter_tree (ter_id, tree, path)
    values (:new.id, vtree||:new.code||'/', vpath);
end;

/
ALTER TRIGGER "GZVLG"."INS_TER_TREE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$ABANDONEDREASON
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$ABANDONEDREASON" AFTER INSERT OR UPDATE OR DELETE ON ABANDONEDREASON REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 174;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$ABANDONEDREASON" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$ALTGOODSGROUP
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$ALTGOODSGROUP" AFTER INSERT OR UPDATE OR DELETE ON ALTGOODSGROUP REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 142;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$ALTGOODSGROUP" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$ALTGOODSGROUPTYPE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$ALTGOODSGROUPTYPE" AFTER INSERT OR UPDATE OR DELETE ON ALTGOODSGROUPTYPE REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 141;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$ALTGOODSGROUPTYPE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$ANYDATA
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$ANYDATA" AFTER INSERT OR UPDATE OR DELETE ON ANYDATA REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 43;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$ANYDATA" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$APPMODULE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$APPMODULE" AFTER INSERT OR UPDATE OR DELETE ON APPMODULE REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 98;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$APPMODULE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$APPOBJ
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$APPOBJ" AFTER INSERT OR UPDATE OR DELETE ON APPOBJ REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 99;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$APPOBJ" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$APPOBJPROP
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$APPOBJPROP" AFTER INSERT OR UPDATE OR DELETE ON APPOBJPROP REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 100;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$APPOBJPROP" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$APPOINTMENT
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$APPOINTMENT" AFTER INSERT OR UPDATE OR DELETE ON APPOINTMENT REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 256;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$APPOINTMENT" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$AUCTIONBID
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$AUCTIONBID" AFTER INSERT OR UPDATE OR DELETE ON AUCTIONBID REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 255;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$AUCTIONBID" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$AUCTIONLOG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$AUCTIONLOG" AFTER INSERT OR UPDATE OR DELETE ON AUCTIONLOG REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 254;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$AUCTIONLOG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$BANK
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$BANK" AFTER INSERT OR UPDATE OR DELETE ON BANK REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 36;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$BANK" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$BANKGUARANTEEDOC
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$BANKGUARANTEEDOC" AFTER INSERT OR UPDATE OR DELETE ON BANKGUARANTEEDOC REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 221;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$BANKGUARANTEEDOC" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$BANKGUARANTEEREFDOC
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$BANKGUARANTEEREFDOC" AFTER INSERT OR UPDATE OR DELETE ON BANKGUARANTEEREFDOC REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 222;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$BANKGUARANTEEREFDOC" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$BANKGUARANTEEREFREASON
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$BANKGUARANTEEREFREASON" AFTER INSERT OR UPDATE OR DELETE ON BANKGUARANTEEREFREASON REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 220;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$BANKGUARANTEEREFREASON" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$BUDGCODE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$BUDGCODE" AFTER INSERT OR UPDATE OR DELETE ON BUDGCODE REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 114;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, :old.BUDGET_ID, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, :new.BUDGET_ID, 0, 0, 0, 0);    if (updating and not(1=1 and (:new.BUDGET_ID=:old.BUDGET_ID))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, :old.BUDGET_ID, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$BUDGCODE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$BUDGET
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$BUDGET" AFTER INSERT OR UPDATE OR DELETE ON BUDGET REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 80;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$BUDGET" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$BUDGETLINE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$BUDGETLINE" AFTER INSERT OR UPDATE OR DELETE ON BUDGETLINE REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 116;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, :old.BUDGET_ID, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, :new.BUDGET_ID, 0, 0, 0, 0);    if (updating and not(1=1 and (:new.BUDGET_ID=:old.BUDGET_ID))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, :old.BUDGET_ID, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$BUDGETLINE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$BUDGETSTAGE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$BUDGETSTAGE" AFTER INSERT OR UPDATE OR DELETE ON BUDGETSTAGE REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 121;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$BUDGETSTAGE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$CACHELIST
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$CACHELIST" AFTER INSERT OR UPDATE OR DELETE ON CACHELIST REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 94;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$CACHELIST" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$CAVILDOC
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$CAVILDOC" AFTER INSERT OR UPDATE OR DELETE ON CAVILDOC REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 305;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$CAVILDOC" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$CAVILTYPE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$CAVILTYPE" AFTER INSERT OR UPDATE OR DELETE ON CAVILTYPE REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 304;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$CAVILTYPE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$CERTINTERCHANGEREQUEST
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$CERTINTERCHANGEREQUEST" AFTER INSERT OR UPDATE OR DELETE ON CERTINTERCHANGEREQUEST REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 258;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$CERTINTERCHANGEREQUEST" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$CERTREQUEST
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$CERTREQUEST" AFTER INSERT OR UPDATE OR DELETE ON CERTREQUEST REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 257;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$CERTREQUEST" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$CERTREVOKEREQUEST
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$CERTREVOKEREQUEST" AFTER INSERT OR UPDATE OR DELETE ON CERTREVOKEREQUEST REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 259;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$CERTREVOKEREQUEST" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$CLAIMDOC
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$CLAIMDOC" AFTER INSERT OR UPDATE OR DELETE ON CLAIMDOC REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 213;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, :old.BUDGET_ID, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, :new.BUDGET_ID, 0, 0, 0, 0);    if (updating and not(1=1 and (:new.BUDGET_ID=:old.BUDGET_ID))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, :old.BUDGET_ID, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$CLAIMDOC" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$CLAIMPAYFACT
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$CLAIMPAYFACT" AFTER INSERT OR UPDATE OR DELETE ON CLAIMPAYFACT REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 214;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$CLAIMPAYFACT" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$CLAIMPENALTYCHANGEDOCINFO
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$CLAIMPENALTYCHANGEDOCINFO" AFTER INSERT OR UPDATE OR DELETE ON CLAIMPENALTYCHANGEDOCINFO REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 215;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$CLAIMPENALTYCHANGEDOCINFO" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$CLASSOPER
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$CLASSOPER" AFTER INSERT OR UPDATE OR DELETE ON CLASSOPER REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 21;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$CLASSOPER" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$CLIENTOBJECT
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$CLIENTOBJECT" AFTER INSERT OR UPDATE OR DELETE ON CLIENTOBJECT REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 39;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$CLIENTOBJECT" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$CLIENTOBJECTCOMMENTS
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$CLIENTOBJECTCOMMENTS" AFTER INSERT OR UPDATE OR DELETE ON CLIENTOBJECTCOMMENTS REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 83;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$CLIENTOBJECTCOMMENTS" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$CLNDDAY
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$CLNDDAY" AFTER INSERT OR UPDATE OR DELETE ON CLNDDAY REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 97;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$CLNDDAY" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$CLNDDAYTYPE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$CLNDDAYTYPE" AFTER INSERT OR UPDATE OR DELETE ON CLNDDAYTYPE REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 95;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$CLNDDAYTYPE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$CLNDTYPE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$CLNDTYPE" AFTER INSERT OR UPDATE OR DELETE ON CLNDTYPE REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 96;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$CLNDTYPE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$CODETYPE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$CODETYPE" AFTER INSERT OR UPDATE OR DELETE ON CODETYPE REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 113;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, :old.BUDGET_ID, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, :new.BUDGET_ID, 0, 0, 0, 0);    if (updating and not(1=1 and (:new.BUDGET_ID=:old.BUDGET_ID))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, :old.BUDGET_ID, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$CODETYPE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$COMMEMBER
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$COMMEMBER" AFTER INSERT OR UPDATE OR DELETE ON COMMEMBER REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 244;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$COMMEMBER" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$COMMISSION
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$COMMISSION" AFTER INSERT OR UPDATE OR DELETE ON COMMISSION REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 243;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$COMMISSION" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$COMPLAINTDOC
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$COMPLAINTDOC" AFTER INSERT OR UPDATE OR DELETE ON COMPLAINTDOC REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 241;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, :old.BUDGET_ID, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, :new.BUDGET_ID, 0, 0, 0, 0);    if (updating and not(1=1 and (:new.BUDGET_ID=:old.BUDGET_ID))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, :old.BUDGET_ID, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$COMPLAINTDOC" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$CONFCONCLUSIONCONTRACT
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$CONFCONCLUSIONCONTRACT" AFTER INSERT OR UPDATE OR DELETE ON CONFCONCLUSIONCONTRACT REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 281;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$CONFCONCLUSIONCONTRACT" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$CONPAYFACT
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$CONPAYFACT" AFTER INSERT OR UPDATE OR DELETE ON CONPAYFACT REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 179;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$CONPAYFACT" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$CONSOLIDDOC
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$CONSOLIDDOC" AFTER INSERT OR UPDATE OR DELETE ON CONSOLIDDOC REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 250;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, :old.BUDGET_ID, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, :new.BUDGET_ID, 0, 0, 0, 0);    if (updating and not(1=1 and (:new.BUDGET_ID=:old.BUDGET_ID))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, :old.BUDGET_ID, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$CONSOLIDDOC" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$CONSTRUCTION
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$CONSTRUCTION" AFTER INSERT OR UPDATE OR DELETE ON CONSTRUCTION REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 177;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$CONSTRUCTION" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$CONTRACTCARDDOC
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$CONTRACTCARDDOC" AFTER INSERT OR UPDATE OR DELETE ON CONTRACTCARDDOC REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 198;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, :old.BUDGET_ID, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, :new.BUDGET_ID, 0, 0, 0, 0);    if (updating and not(1=1 and (:new.BUDGET_ID=:old.BUDGET_ID))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, :old.BUDGET_ID, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$CONTRACTCARDDOC" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$CONTRACTDOC
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$CONTRACTDOC" AFTER INSERT OR UPDATE OR DELETE ON CONTRACTDOC REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 178;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, :old.BUDGET_ID, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, :new.BUDGET_ID, 0, 0, 0, 0);    if (updating and not(1=1 and (:new.BUDGET_ID=:old.BUDGET_ID))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, :old.BUDGET_ID, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$CONTRACTDOC" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$CONTRACTEXECDOC
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$CONTRACTEXECDOC" AFTER INSERT OR UPDATE OR DELETE ON CONTRACTEXECDOC REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 180;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, :old.BUDGET_ID, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, :new.BUDGET_ID, 0, 0, 0, 0);    if (updating and not(1=1 and (:new.BUDGET_ID=:old.BUDGET_ID))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, :old.BUDGET_ID, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$CONTRACTEXECDOC" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$CONTRACTREASON
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$CONTRACTREASON" AFTER INSERT OR UPDATE OR DELETE ON CONTRACTREASON REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 155;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$CONTRACTREASON" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$CONTRACTREASON_DOCLINES
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$CONTRACTREASON_DOCLINES" AFTER INSERT OR UPDATE OR DELETE ON CONTRACTREASON_DOCLINES REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 156;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$CONTRACTREASON_DOCLINES" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$CONTRACTTEMPLATEDOC
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$CONTRACTTEMPLATEDOC" AFTER INSERT OR UPDATE OR DELETE ON CONTRACTTEMPLATEDOC REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 203;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, :old.BUDGET_ID, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, :new.BUDGET_ID, 0, 0, 0, 0);    if (updating and not(1=1 and (:new.BUDGET_ID=:old.BUDGET_ID))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, :old.BUDGET_ID, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$CONTRACTTEMPLATEDOC" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$CONTYPE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$CONTYPE" AFTER INSERT OR UPDATE OR DELETE ON CONTYPE REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 175;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$CONTYPE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$CONTYPEATTACH
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$CONTYPEATTACH" AFTER INSERT OR UPDATE OR DELETE ON CONTYPEATTACH REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 176;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$CONTYPEATTACH" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$COUNTRY
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$COUNTRY" AFTER INSERT OR UPDATE OR DELETE ON COUNTRY REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 145;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$COUNTRY" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$CRLFILE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$CRLFILE" AFTER INSERT OR UPDATE OR DELETE ON CRLFILE REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 268;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$CRLFILE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$CRLPOINT
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$CRLPOINT" AFTER INSERT OR UPDATE OR DELETE ON CRLPOINT REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 267;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$CRLPOINT" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$CURHISTORY
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$CURHISTORY" AFTER INSERT OR UPDATE OR DELETE ON CURHISTORY REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 149;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$CURHISTORY" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$CURRENCY
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$CURRENCY" AFTER INSERT OR UPDATE OR DELETE ON CURRENCY REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 148;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$CURRENCY" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$DATAOBJECTCHANGELOG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$DATAOBJECTCHANGELOG" AFTER INSERT OR UPDATE OR DELETE ON DATAOBJECTCHANGELOG REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 381;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$DATAOBJECTCHANGELOG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$DATASOURCE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$DATASOURCE" AFTER INSERT OR UPDATE OR DELETE ON DATASOURCE REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 87;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$DATASOURCE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$DBCONNECT
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$DBCONNECT" AFTER INSERT OR UPDATE OR DELETE ON DBCONNECT REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 52;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$DBCONNECT" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$DBCONSTRAINT
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$DBCONSTRAINT" AFTER INSERT OR UPDATE OR DELETE ON DBCONSTRAINT REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 13;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$DBCONSTRAINT" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$DECREASON
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$DECREASON" AFTER INSERT OR UPDATE OR DELETE ON DECREASON REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 82;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, :old.BUDGET_ID, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, :new.BUDGET_ID, 0, 0, 0, 0);    if (updating and not(1=1 and (:new.BUDGET_ID=:old.BUDGET_ID))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, :old.BUDGET_ID, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$DECREASON" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$DELIVERYBASIS
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$DELIVERYBASIS" AFTER INSERT OR UPDATE OR DELETE ON DELIVERYBASIS REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 158;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$DELIVERYBASIS" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$DESCGROUP
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$DESCGROUP" AFTER INSERT OR UPDATE OR DELETE ON DESCGROUP REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 59;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$DESCGROUP" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$DESCRIPTION
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$DESCRIPTION" AFTER INSERT OR UPDATE OR DELETE ON DESCRIPTION REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 60;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, :old.BUDGET_ID, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, :new.BUDGET_ID, 0, 0, 0, 0);    if (updating and not(1=1 and (:new.BUDGET_ID=:old.BUDGET_ID))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, :old.BUDGET_ID, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$DESCRIPTION" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$DESCRIPTIONCACHE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$DESCRIPTIONCACHE" AFTER INSERT OR UPDATE OR DELETE ON DESCRIPTIONCACHE REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 154;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$DESCRIPTIONCACHE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$DEVIATIONFACTFOUNDATION
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$DEVIATIONFACTFOUNDATION" AFTER INSERT OR UPDATE OR DELETE ON DEVIATIONFACTFOUNDATION REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 342;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$DEVIATIONFACTFOUNDATION" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$DIGEST
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$DIGEST" AFTER INSERT OR UPDATE OR DELETE ON DIGEST REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 72;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$DIGEST" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$DIGESTSIGN
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$DIGESTSIGN" AFTER INSERT OR UPDATE OR DELETE ON DIGESTSIGN REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 73;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$DIGESTSIGN" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$DISPSTATUS
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$DISPSTATUS" AFTER INSERT OR UPDATE OR DELETE ON DISPSTATUS REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 17;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$DISPSTATUS" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$DOCACTION
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$DOCACTION" AFTER INSERT OR UPDATE OR DELETE ON DOCACTION REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 22;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$DOCACTION" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$DOCATTACH
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$DOCATTACH" AFTER INSERT OR UPDATE OR DELETE ON DOCATTACH REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 49;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$DOCATTACH" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$DOCATTACHEX
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$DOCATTACHEX" AFTER INSERT OR UPDATE OR DELETE ON DOCATTACHEX REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 2;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$DOCATTACHEX" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$DOCCATEGORY
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$DOCCATEGORY" AFTER INSERT OR UPDATE OR DELETE ON DOCCATEGORY REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 67;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$DOCCATEGORY" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$DOCCLASS_DISPSTATUS
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$DOCCLASS_DISPSTATUS" AFTER INSERT OR UPDATE OR DELETE ON DOCCLASS_DISPSTATUS REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 55;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$DOCCLASS_DISPSTATUS" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$DOCCOMMENT
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$DOCCOMMENT" AFTER INSERT OR UPDATE OR DELETE ON DOCCOMMENT REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 53;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$DOCCOMMENT" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$DOCCUSTOMFIELDS
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$DOCCUSTOMFIELDS" AFTER INSERT OR UPDATE OR DELETE ON DOCCUSTOMFIELDS REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 54;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$DOCCUSTOMFIELDS" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$DOCDIGESTRULE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$DOCDIGESTRULE" AFTER INSERT OR UPDATE OR DELETE ON DOCDIGESTRULE REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 78;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$DOCDIGESTRULE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$DOCEVENT
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$DOCEVENT" AFTER INSERT OR UPDATE OR DELETE ON DOCEVENT REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 20;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$DOCEVENT" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$DOCEVERRLOG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$DOCEVERRLOG" AFTER INSERT OR UPDATE OR DELETE ON DOCEVERRLOG REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 101;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$DOCEVERRLOG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$DOCEXCHANGESCHEME
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$DOCEXCHANGESCHEME" AFTER INSERT OR UPDATE OR DELETE ON DOCEXCHANGESCHEME REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 63;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$DOCEXCHANGESCHEME" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$DOCFLAGCATEGORY
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$DOCFLAGCATEGORY" AFTER INSERT OR UPDATE OR DELETE ON DOCFLAGCATEGORY REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 119;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$DOCFLAGCATEGORY" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$DOCFLAGTYPE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$DOCFLAGTYPE" AFTER INSERT OR UPDATE OR DELETE ON DOCFLAGTYPE REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 120;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$DOCFLAGTYPE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$DOCGROUP
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$DOCGROUP" AFTER INSERT OR UPDATE OR DELETE ON DOCGROUP REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 24;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$DOCGROUP" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$DOCREQ
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$DOCREQ" AFTER INSERT OR UPDATE OR DELETE ON DOCREQ REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 247;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$DOCREQ" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$DOCRETENTION
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$DOCRETENTION" AFTER INSERT OR UPDATE OR DELETE ON DOCRETENTION REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 68;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$DOCRETENTION" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$DOCRETENTIONSTATITEMS
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$DOCRETENTIONSTATITEMS" AFTER INSERT OR UPDATE OR DELETE ON DOCRETENTIONSTATITEMS REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 91;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$DOCRETENTIONSTATITEMS" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$DOCRETENTIONSTATUS
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$DOCRETENTIONSTATUS" AFTER INSERT OR UPDATE OR DELETE ON DOCRETENTIONSTATUS REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 90;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$DOCRETENTIONSTATUS" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$DOCSTATUS
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$DOCSTATUS" AFTER INSERT OR UPDATE OR DELETE ON DOCSTATUS REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 19;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$DOCSTATUS" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$DOCUMENT
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$DOCUMENT" AFTER INSERT OR UPDATE OR DELETE ON DOCUMENT REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 23;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, :old.BUDGET_ID, :old.DOCUMENTCLASS_ID, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, :new.BUDGET_ID, :new.DOCUMENTCLASS_ID, 0, 0, 0);    if (updating and not(1=1 and (:new.BUDGET_ID=:old.BUDGET_ID)and (:new.DOCUMENTCLASS_ID=:old.DOCUMENTCLASS_ID))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, :old.BUDGET_ID, :old.DOCUMENTCLASS_ID, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$DOCUMENT" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$DOCUMENTCLASS
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$DOCUMENTCLASS" AFTER INSERT OR UPDATE OR DELETE ON DOCUMENTCLASS REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 18;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$DOCUMENTCLASS" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$DOCUMENTREPORTS
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$DOCUMENTREPORTS" AFTER INSERT OR UPDATE OR DELETE ON DOCUMENTREPORTS REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 58;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$DOCUMENTREPORTS" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$DOMEN
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$DOMEN" AFTER INSERT OR UPDATE OR DELETE ON DOMEN REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 108;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$DOMEN" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$EQUALITY
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$EQUALITY" AFTER INSERT OR UPDATE OR DELETE ON EQUALITY REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 218;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$EQUALITY" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$EQUALITYCODES
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$EQUALITYCODES" AFTER INSERT OR UPDATE OR DELETE ON EQUALITYCODES REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 219;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$EQUALITYCODES" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$ESCHECKRULE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$ESCHECKRULE" AFTER INSERT OR UPDATE OR DELETE ON ESCHECKRULE REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 79;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$ESCHECKRULE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$ESTIMATE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$ESTIMATE" AFTER INSERT OR UPDATE OR DELETE ON ESTIMATE REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 115;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, :old.BUDGET_ID, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, :new.BUDGET_ID, 0, 0, 0, 0);    if (updating and not(1=1 and (:new.BUDGET_ID=:old.BUDGET_ID))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, :old.BUDGET_ID, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$ESTIMATE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$ETP
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$ETP" AFTER INSERT OR UPDATE OR DELETE ON ETP REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 194;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$ETP" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$ETPATTACH
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$ETPATTACH" AFTER INSERT OR UPDATE OR DELETE ON ETPATTACH REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 197;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$ETPATTACH" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$ETPTYPE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$ETPTYPE" AFTER INSERT OR UPDATE OR DELETE ON ETPTYPE REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 193;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$ETPTYPE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$FACTDOC
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$FACTDOC" AFTER INSERT OR UPDATE OR DELETE ON FACTDOC REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 226;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, :old.BUDGET_ID, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, :new.BUDGET_ID, 0, 0, 0, 0);    if (updating and not(1=1 and (:new.BUDGET_ID=:old.BUDGET_ID))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, :old.BUDGET_ID, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$FACTDOC" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$FACTDOCTYPE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$FACTDOCTYPE" AFTER INSERT OR UPDATE OR DELETE ON FACTDOCTYPE REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 225;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$FACTDOCTYPE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$FETCHMODE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$FETCHMODE" AFTER INSERT OR UPDATE OR DELETE ON FETCHMODE REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 303;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$FETCHMODE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$FGROUP
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$FGROUP" AFTER INSERT OR UPDATE OR DELETE ON FGROUP REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 70;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$FGROUP" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$FGROUPATTACH
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$FGROUPATTACH" AFTER INSERT OR UPDATE OR DELETE ON FGROUPATTACH REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 71;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$FGROUPATTACH" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$FGROUPHEADER
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$FGROUPHEADER" AFTER INSERT OR UPDATE OR DELETE ON FGROUPHEADER REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 69;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$FGROUPHEADER" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$FINSRC
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$FINSRC" AFTER INSERT OR UPDATE OR DELETE ON FINSRC REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 117;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$FINSRC" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$FINSRCSATISFY
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$FINSRCSATISFY" AFTER INSERT OR UPDATE OR DELETE ON FINSRCSATISFY REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 341;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$FINSRCSATISFY" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$FORMATCONVERTER
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$FORMATCONVERTER" AFTER INSERT OR UPDATE OR DELETE ON FORMATCONVERTER REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 382;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$FORMATCONVERTER" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$FUNCAT
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$FUNCAT" AFTER INSERT OR UPDATE OR DELETE ON FUNCAT REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 47;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$FUNCAT" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$FUNUNIT
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$FUNUNIT" AFTER INSERT OR UPDATE OR DELETE ON FUNUNIT REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 5;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$FUNUNIT" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$GCREGISTER
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$GCREGISTER" AFTER INSERT OR UPDATE OR DELETE ON GCREGISTER REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 118;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$GCREGISTER" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$GOODS
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$GOODS" AFTER INSERT OR UPDATE OR DELETE ON GOODS REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 137;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$GOODS" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$GOODSBAN
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$GOODSBAN" AFTER INSERT OR UPDATE OR DELETE ON GOODSBAN REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 384;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$GOODSBAN" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$GOODSBANGOODSOKPD
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$GOODSBANGOODSOKPD" AFTER INSERT OR UPDATE OR DELETE ON GOODSBANGOODSOKPD REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 386;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$GOODSBANGOODSOKPD" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$GOODSBANPURCHASEMODE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$GOODSBANPURCHASEMODE" AFTER INSERT OR UPDATE OR DELETE ON GOODSBANPURCHASEMODE REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 385;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$GOODSBANPURCHASEMODE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$GOODSBRANCH
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$GOODSBRANCH" AFTER INSERT OR UPDATE OR DELETE ON GOODSBRANCH REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 195;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$GOODSBRANCH" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$GOODSGROUP
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$GOODSGROUP" AFTER INSERT OR UPDATE OR DELETE ON GOODSGROUP REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 135;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$GOODSGROUP" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$GOODSGROUPDOCDETAIL
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$GOODSGROUPDOCDETAIL" AFTER INSERT OR UPDATE OR DELETE ON GOODSGROUPDOCDETAIL REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 140;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$GOODSGROUPDOCDETAIL" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$GOODSGROUPPURCHASEMODE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$GOODSGROUPPURCHASEMODE" AFTER INSERT OR UPDATE OR DELETE ON GOODSGROUPPURCHASEMODE REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 162;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$GOODSGROUPPURCHASEMODE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$GOODSOKDP
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$GOODSOKDP" AFTER INSERT OR UPDATE OR DELETE ON GOODSOKDP REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 133;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$GOODSOKDP" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$GOODSOKDPCOUNTRYPREF
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$GOODSOKDPCOUNTRYPREF" AFTER INSERT OR UPDATE OR DELETE ON GOODSOKDPCOUNTRYPREF REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 168;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$GOODSOKDPCOUNTRYPREF" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$GOODSOKDPPURCHASEMODE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$GOODSOKDPPURCHASEMODE" AFTER INSERT OR UPDATE OR DELETE ON GOODSOKDPPURCHASEMODE REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 167;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$GOODSOKDPPURCHASEMODE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$GOODSOKPD
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$GOODSOKPD" AFTER INSERT OR UPDATE OR DELETE ON GOODSOKPD REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 134;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$GOODSOKPD" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$GOODSOKPDCOUNTRYPREF
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$GOODSOKPDCOUNTRYPREF" AFTER INSERT OR UPDATE OR DELETE ON GOODSOKPDCOUNTRYPREF REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 170;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$GOODSOKPDCOUNTRYPREF" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$GOODSOKPDPURCHASEMODE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$GOODSOKPDPURCHASEMODE" AFTER INSERT OR UPDATE OR DELETE ON GOODSOKPDPURCHASEMODE REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 169;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$GOODSOKPDPURCHASEMODE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$GOODSOKVED
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$GOODSOKVED" AFTER INSERT OR UPDATE OR DELETE ON GOODSOKVED REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 132;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$GOODSOKVED" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$GOODSPRICE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$GOODSPRICE" AFTER INSERT OR UPDATE OR DELETE ON GOODSPRICE REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 138;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$GOODSPRICE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$GRANTINVESTMENT
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$GRANTINVESTMENT" AFTER INSERT OR UPDATE OR DELETE ON GRANTINVESTMENT REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 128;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$GRANTINVESTMENT" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$GROUPPROP
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$GROUPPROP" AFTER INSERT OR UPDATE OR DELETE ON GROUPPROP REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 136;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$GROUPPROP" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$HISTORYMODIFY
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$HISTORYMODIFY" AFTER INSERT OR UPDATE OR DELETE ON HISTORYMODIFY REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 102;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$HISTORYMODIFY" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$INDUSTRYCODE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$INDUSTRYCODE" AFTER INSERT OR UPDATE OR DELETE ON INDUSTRYCODE REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 127;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$INDUSTRYCODE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$INSTITUTIONLINE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$INSTITUTIONLINE" AFTER INSERT OR UPDATE OR DELETE ON INSTITUTIONLINE REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 129;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, :old.BUDGET_ID, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, :new.BUDGET_ID, 0, 0, 0, 0);    if (updating and not(1=1 and (:new.BUDGET_ID=:old.BUDGET_ID))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, :old.BUDGET_ID, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$INSTITUTIONLINE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$INTERBUDGET
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$INTERBUDGET" AFTER INSERT OR UPDATE OR DELETE ON INTERBUDGET REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 112;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$INTERBUDGET" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$INVOICEDOC
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$INVOICEDOC" AFTER INSERT OR UPDATE OR DELETE ON INVOICEDOC REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 184;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, :old.BUDGET_ID, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, :new.BUDGET_ID, 0, 0, 0, 0);    if (updating and not(1=1 and (:new.BUDGET_ID=:old.BUDGET_ID))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, :old.BUDGET_ID, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$INVOICEDOC" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$JAVACLASS
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$JAVACLASS" AFTER INSERT OR UPDATE OR DELETE ON JAVACLASS REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 25;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$JAVACLASS" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$KBKLINEFIT
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$KBKLINEFIT" AFTER INSERT OR UPDATE OR DELETE ON KBKLINEFIT REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 126;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$KBKLINEFIT" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$KLADR
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$KLADR" AFTER INSERT OR UPDATE OR DELETE ON KLADR REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 387;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$KLADR" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$KLADRSTREET
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$KLADRSTREET" AFTER INSERT OR UPDATE OR DELETE ON KLADRSTREET REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 388;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$KLADRSTREET" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$LEDGER
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$LEDGER" AFTER INSERT OR UPDATE OR DELETE ON LEDGER REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 217;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, :old.BUDGET_ID, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, :new.BUDGET_ID, 0, 0, 0, 0);    if (updating and not(1=1 and (:new.BUDGET_ID=:old.BUDGET_ID))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, :old.BUDGET_ID, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$LEDGER" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$LIABILITYCREDENTIAL
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$LIABILITYCREDENTIAL" AFTER INSERT OR UPDATE OR DELETE ON LIABILITYCREDENTIAL REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 123;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$LIABILITYCREDENTIAL" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$LIABILITYEXPENSE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$LIABILITYEXPENSE" AFTER INSERT OR UPDATE OR DELETE ON LIABILITYEXPENSE REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 124;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$LIABILITYEXPENSE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$LIABILITYEXPENSE_DOCLINES
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$LIABILITYEXPENSE_DOCLINES" AFTER INSERT OR UPDATE OR DELETE ON LIABILITYEXPENSE_DOCLINES REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 125;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$LIABILITYEXPENSE_DOCLINES" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$LIABILITYGROUP
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$LIABILITYGROUP" AFTER INSERT OR UPDATE OR DELETE ON LIABILITYGROUP REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 122;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$LIABILITYGROUP" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$LICTYPE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$LICTYPE" AFTER INSERT OR UPDATE OR DELETE ON LICTYPE REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 34;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$LICTYPE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$MAIL
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$MAIL" AFTER INSERT OR UPDATE OR DELETE ON MAIL REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 65;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$MAIL" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$MAILATTACH
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$MAILATTACH" AFTER INSERT OR UPDATE OR DELETE ON MAILATTACH REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 66;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$MAILATTACH" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$MAILRECEIVERGROUP
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$MAILRECEIVERGROUP" AFTER INSERT OR UPDATE OR DELETE ON MAILRECEIVERGROUP REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 309;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$MAILRECEIVERGROUP" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$MAILRECEIVERGROUP_RECEIVER
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$MAILRECEIVERGROUP_RECEIVER" AFTER INSERT OR UPDATE OR DELETE ON MAILRECEIVERGROUP_RECEIVER REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 310;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$MAILRECEIVERGROUP_RECEIVER" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$MENU
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$MENU" AFTER INSERT OR UPDATE OR DELETE ON MENU REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 40;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$MENU" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$MENUITEM
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$MENUITEM" AFTER INSERT OR UPDATE OR DELETE ON MENUITEM REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 41;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, :old.MENU_ID, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, :new.MENU_ID, 0, 0, 0, 0);    if (updating and not(1=1 and (:new.MENU_ID=:old.MENU_ID))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, :old.MENU_ID, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$MENUITEM" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$MENUITEMWEB
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$MENUITEMWEB" AFTER INSERT OR UPDATE OR DELETE ON MENUITEMWEB REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 110;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, :old.MENU_ID, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, :new.MENU_ID, 0, 0, 0, 0);    if (updating and not(1=1 and (:new.MENU_ID=:old.MENU_ID))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, :old.MENU_ID, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$MENUITEMWEB" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$METACONSTRAINT
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$METACONSTRAINT" AFTER INSERT OR UPDATE OR DELETE ON METACONSTRAINT REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 92;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$METACONSTRAINT" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$METAOBJECT
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$METAOBJECT" AFTER INSERT OR UPDATE OR DELETE ON METAOBJECT REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 93;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$METAOBJECT" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$MSG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$MSG" AFTER INSERT OR UPDATE OR DELETE ON MSG REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 29;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$MSG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$MSGLINKTYPE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$MSGLINKTYPE" AFTER INSERT OR UPDATE OR DELETE ON MSGLINKTYPE REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 27;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$MSGLINKTYPE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$MSGQUEUE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$MSGQUEUE" AFTER INSERT OR UPDATE OR DELETE ON MSGQUEUE REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 30;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$MSGQUEUE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$MSGSITE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$MSGSITE" AFTER INSERT OR UPDATE OR DELETE ON MSGSITE REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 28;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$MSGSITE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$NECESSITY
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$NECESSITY" AFTER INSERT OR UPDATE OR DELETE ON NECESSITY REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 183;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$NECESSITY" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$NOTICEDOC
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$NOTICEDOC" AFTER INSERT OR UPDATE OR DELETE ON NOTICEDOC REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 239;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, :old.BUDGET_ID, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, :new.BUDGET_ID, 0, 0, 0, 0);    if (updating and not(1=1 and (:new.BUDGET_ID=:old.BUDGET_ID))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, :old.BUDGET_ID, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$NOTICEDOC" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$NOTICEEMAILORG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$NOTICEEMAILORG" AFTER INSERT OR UPDATE OR DELETE ON NOTICEEMAILORG REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 240;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$NOTICEEMAILORG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$NOTIFYMSG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$NOTIFYMSG" AFTER INSERT OR UPDATE OR DELETE ON NOTIFYMSG REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 106;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$NOTIFYMSG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$NOTIFYMSGEVENT
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$NOTIFYMSGEVENT" AFTER INSERT OR UPDATE OR DELETE ON NOTIFYMSGEVENT REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 105;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$NOTIFYMSGEVENT" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$NOTIFYMSGGROUP
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$NOTIFYMSGGROUP" AFTER INSERT OR UPDATE OR DELETE ON NOTIFYMSGGROUP REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 104;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$NOTIFYMSGGROUP" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$NOTIFYMSGRULE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$NOTIFYMSGRULE" AFTER INSERT OR UPDATE OR DELETE ON NOTIFYMSGRULE REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 107;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$NOTIFYMSGRULE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$NUMGENERATOR
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$NUMGENERATOR" AFTER INSERT OR UPDATE OR DELETE ON NUMGENERATOR REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 15;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$NUMGENERATOR" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$NUMPREFIX
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$NUMPREFIX" AFTER INSERT OR UPDATE OR DELETE ON NUMPREFIX REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 88;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$NUMPREFIX" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$NUMSEQUENCE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$NUMSEQUENCE" AFTER INSERT OR UPDATE OR DELETE ON NUMSEQUENCE REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 14;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$NUMSEQUENCE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$OFFERDOC
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$OFFERDOC" AFTER INSERT OR UPDATE OR DELETE ON OFFERDOC REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 224;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, :old.BUDGET_ID, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, :new.BUDGET_ID, 0, 0, 0, 0);    if (updating and not(1=1 and (:new.BUDGET_ID=:old.BUDGET_ID))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, :old.BUDGET_ID, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$OFFERDOC" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$OFRREQREASON
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$OFRREQREASON" AFTER INSERT OR UPDATE OR DELETE ON OFRREQREASON REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 157;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$OFRREQREASON" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$OFRRETREASON
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$OFRRETREASON" AFTER INSERT OR UPDATE OR DELETE ON OFRRETREASON REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 223;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$OFRRETREASON" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$OIDREF
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$OIDREF" AFTER INSERT OR UPDATE OR DELETE ON OIDREF REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 77;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$OIDREF" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$OKTMO
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$OKTMO" AFTER INSERT OR UPDATE OR DELETE ON OKTMO REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 383;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$OKTMO" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$OLAPQUERY
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$OLAPQUERY" AFTER INSERT OR UPDATE OR DELETE ON OLAPQUERY REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 269;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$OLAPQUERY" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$OOSORGROLE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$OOSORGROLE" AFTER INSERT OR UPDATE OR DELETE ON OOSORGROLE REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 151;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$OOSORGROLE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$OOS223PURCHASENOTICEINFO
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$OOS223PURCHASENOTICEINFO" AFTER INSERT OR UPDATE OR DELETE ON OOS223PURCHASENOTICEINFO REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 389;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$OOS223PURCHASENOTICEINFO" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$OOS223PURCHNOTICELOTINFO
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$OOS223PURCHNOTICELOTINFO" AFTER INSERT OR UPDATE OR DELETE ON OOS223PURCHNOTICELOTINFO REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 390;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$OOS223PURCHNOTICELOTINFO" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$OPERTYPE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$OPERTYPE" AFTER INSERT OR UPDATE OR DELETE ON OPERTYPE REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 16;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$OPERTYPE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$ORDERDOC
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$ORDERDOC" AFTER INSERT OR UPDATE OR DELETE ON ORDERDOC REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 171;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, :old.BUDGET_ID, :old.DOCUMENTCLASS_ID, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, :new.BUDGET_ID, :new.DOCUMENTCLASS_ID, 0, 0, 0);    if (updating and not(1=1 and (:new.BUDGET_ID=:old.BUDGET_ID)and (:new.DOCUMENTCLASS_ID=:old.DOCUMENTCLASS_ID))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, :old.BUDGET_ID, :old.DOCUMENTCLASS_ID, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$ORDERDOC" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$ORDERSUMMARY
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$ORDERSUMMARY" AFTER INSERT OR UPDATE OR DELETE ON ORDERSUMMARY REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 173;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$ORDERSUMMARY" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$ORG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$ORG" AFTER INSERT OR UPDATE OR DELETE ON ORG REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 33;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, :old.ISCONTRACTOR, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, :new.ISCONTRACTOR, 0, 0, 0, 0);    if (updating and not(1=1 and (:new.ISCONTRACTOR=:old.ISCONTRACTOR))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, :old.ISCONTRACTOR, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$ORG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$ORGACCOUNT
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$ORGACCOUNT" AFTER INSERT OR UPDATE OR DELETE ON ORGACCOUNT REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 38;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, :old.ISCONTRACTOR, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, :new.ISCONTRACTOR, 0, 0, 0, 0);    if (updating and not(1=1 and (:new.ISCONTRACTOR=:old.ISCONTRACTOR))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, :old.ISCONTRACTOR, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$ORGACCOUNT" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$ORGACCTYPE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$ORGACCTYPE" AFTER INSERT OR UPDATE OR DELETE ON ORGACCTYPE REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 37;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$ORGACCTYPE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$ORGADDKPP
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$ORGADDKPP" AFTER INSERT OR UPDATE OR DELETE ON ORGADDKPP REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 391;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$ORGADDKPP" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$ORGCONCCONT
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$ORGCONCCONT" AFTER INSERT OR UPDATE OR DELETE ON ORGCONCCONT REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 152;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$ORGCONCCONT" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$ORGETP
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$ORGETP" AFTER INSERT OR UPDATE OR DELETE ON ORGETP REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 196;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$ORGETP" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$ORGFORM
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$ORGFORM" AFTER INSERT OR UPDATE OR DELETE ON ORGFORM REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 150;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$ORGFORM" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$ORGOOS223FZUSER
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$ORGOOS223FZUSER" AFTER INSERT OR UPDATE OR DELETE ON ORGOOS223FZUSER REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 321;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$ORGOOS223FZUSER" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$ORGROLE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$ORGROLE" AFTER INSERT OR UPDATE OR DELETE ON ORGROLE REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 35;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$ORGROLE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$ORGSTATUS
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$ORGSTATUS" AFTER INSERT OR UPDATE OR DELETE ON ORGSTATUS REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 143;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$ORGSTATUS" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$ORGUNFAIR
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$ORGUNFAIR" AFTER INSERT OR UPDATE OR DELETE ON ORGUNFAIR REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 144;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$ORGUNFAIR" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$PACKTYPE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$PACKTYPE" AFTER INSERT OR UPDATE OR DELETE ON PACKTYPE REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 139;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$PACKTYPE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$PANEL
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$PANEL" AFTER INSERT OR UPDATE OR DELETE ON PANEL REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 61;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$PANEL" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$PANELITEM
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$PANELITEM" AFTER INSERT OR UPDATE OR DELETE ON PANELITEM REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 62;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, :old.PANEL_ID, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, :new.PANEL_ID, 0, 0, 0, 0);    if (updating and not(1=1 and (:new.PANEL_ID=:old.PANEL_ID))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, :old.PANEL_ID, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$PANELITEM" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$PAYCONDITION
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$PAYCONDITION" AFTER INSERT OR UPDATE OR DELETE ON PAYCONDITION REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 182;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$PAYCONDITION" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$PERSON
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$PERSON" AFTER INSERT OR UPDATE OR DELETE ON PERSON REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 103;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$PERSON" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$PERSONAL
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$PERSONAL" AFTER INSERT OR UPDATE OR DELETE ON PERSONAL REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 242;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$PERSONAL" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$PLACEMENTFEATURE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$PLACEMENTFEATURE" AFTER INSERT OR UPDATE OR DELETE ON PLACEMENTFEATURE REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 163;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$PLACEMENTFEATURE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$PLACEMENTFEATUREPM
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$PLACEMENTFEATUREPM" AFTER INSERT OR UPDATE OR DELETE ON PLACEMENTFEATUREPM REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 164;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$PLACEMENTFEATUREPM" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$PLACINGWAY
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$PLACINGWAY" AFTER INSERT OR UPDATE OR DELETE ON PLACINGWAY REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 160;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$PLACINGWAY" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$PLANDOC
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$PLANDOC" AFTER INSERT OR UPDATE OR DELETE ON PLANDOC REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 235;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, :old.BUDGET_ID, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, :new.BUDGET_ID, 0, 0, 0, 0);    if (updating and not(1=1 and (:new.BUDGET_ID=:old.BUDGET_ID))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, :old.BUDGET_ID, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$PLANDOC" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$PLANPOSITIONCHANGEREASON
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$PLANPOSITIONCHANGEREASON" AFTER INSERT OR UPDATE OR DELETE ON PLANPOSITIONCHANGEREASON REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 199;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$PLANPOSITIONCHANGEREASON" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$PLAN2ARRANGEMENT
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$PLAN2ARRANGEMENT" AFTER INSERT OR UPDATE OR DELETE ON PLAN2ARRANGEMENT REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 202;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$PLAN2ARRANGEMENT" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$PLAN2CHANGEREASON
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$PLAN2CHANGEREASON" AFTER INSERT OR UPDATE OR DELETE ON PLAN2CHANGEREASON REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 212;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$PLAN2CHANGEREASON" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$PLAN2DOC
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$PLAN2DOC" AFTER INSERT OR UPDATE OR DELETE ON PLAN2DOC REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 200;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, :old.BUDGET_ID, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, :new.BUDGET_ID, 0, 0, 0, 0);    if (updating and not(1=1 and (:new.BUDGET_ID=:old.BUDGET_ID))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, :old.BUDGET_ID, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$PLAN2DOC" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$PLAN2GOODS
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$PLAN2GOODS" AFTER INSERT OR UPDATE OR DELETE ON PLAN2GOODS REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 201;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$PLAN2GOODS" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$PLAN2LEDGER
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$PLAN2LEDGER" AFTER INSERT OR UPDATE OR DELETE ON PLAN2LEDGER REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 204;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$PLAN2LEDGER" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$PLAN2OOSEXTNUMBER
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$PLAN2OOSEXTNUMBER" AFTER INSERT OR UPDATE OR DELETE ON PLAN2OOSEXTNUMBER REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 211;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$PLAN2OOSEXTNUMBER" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$PLAN2OOSFEATURE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$PLAN2OOSFEATURE" AFTER INSERT OR UPDATE OR DELETE ON PLAN2OOSFEATURE REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 210;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$PLAN2OOSFEATURE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$PLAN2OOSKBK
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$PLAN2OOSKBK" AFTER INSERT OR UPDATE OR DELETE ON PLAN2OOSKBK REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 207;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$PLAN2OOSKBK" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$PLAN2OOSKBKYEAR
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$PLAN2OOSKBKYEAR" AFTER INSERT OR UPDATE OR DELETE ON PLAN2OOSKBKYEAR REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 208;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$PLAN2OOSKBKYEAR" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$PLAN2OOSOKVED
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$PLAN2OOSOKVED" AFTER INSERT OR UPDATE OR DELETE ON PLAN2OOSOKVED REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 206;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$PLAN2OOSOKVED" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$PLAN2OOSPOSITION
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$PLAN2OOSPOSITION" AFTER INSERT OR UPDATE OR DELETE ON PLAN2OOSPOSITION REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 205;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$PLAN2OOSPOSITION" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$PLAN2OOSPRODUCT
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$PLAN2OOSPRODUCT" AFTER INSERT OR UPDATE OR DELETE ON PLAN2OOSPRODUCT REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 209;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$PLAN2OOSPRODUCT" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$PLAN3DOC
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$PLAN3DOC" AFTER INSERT OR UPDATE OR DELETE ON PLAN3DOC REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 252;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, :old.BUDGET_ID, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, :new.BUDGET_ID, 0, 0, 0, 0);    if (updating and not(1=1 and (:new.BUDGET_ID=:old.BUDGET_ID))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, :old.BUDGET_ID, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$PLAN3DOC" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$PLAN3PURCHASEDOC
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$PLAN3PURCHASEDOC" AFTER INSERT OR UPDATE OR DELETE ON PLAN3PURCHASEDOC REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 251;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, :old.BUDGET_ID, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, :new.BUDGET_ID, 0, 0, 0, 0);    if (updating and not(1=1 and (:new.BUDGET_ID=:old.BUDGET_ID))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, :old.BUDGET_ID, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$PLAN3PURCHASEDOC" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$PREFERENCEGROUP
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$PREFERENCEGROUP" AFTER INSERT OR UPDATE OR DELETE ON PREFERENCEGROUP REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 165;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$PREFERENCEGROUP" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$PREFERENCEGROUPFEATURE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$PREFERENCEGROUPFEATURE" AFTER INSERT OR UPDATE OR DELETE ON PREFERENCEGROUPFEATURE REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 166;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$PREFERENCEGROUPFEATURE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$PROCTREE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$PROCTREE" AFTER INSERT OR UPDATE OR DELETE ON PROCTREE REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 26;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$PROCTREE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$PROCUREMENT
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$PROCUREMENT" AFTER INSERT OR UPDATE OR DELETE ON PROCUREMENT REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 401;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$PROCUREMENT" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$PROPTYPE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$PROPTYPE" AFTER INSERT OR UPDATE OR DELETE ON PROPTYPE REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 131;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$PROPTYPE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$PURCHASECARRY
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$PURCHASECARRY" AFTER INSERT OR UPDATE OR DELETE ON PURCHASECARRY REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 237;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$PURCHASECARRY" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$PURCHASEMETHOD
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$PURCHASEMETHOD" AFTER INSERT OR UPDATE OR DELETE ON PURCHASEMETHOD REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 361;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$PURCHASEMETHOD" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$PURCHASEMODE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$PURCHASEMODE" AFTER INSERT OR UPDATE OR DELETE ON PURCHASEMODE REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 159;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$PURCHASEMODE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$PURCHASEPLAN
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$PURCHASEPLAN" AFTER INSERT OR UPDATE OR DELETE ON PURCHASEPLAN REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 236;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$PURCHASEPLAN" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$PURCHASEPLANDOC
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$PURCHASEPLANDOC" AFTER INSERT OR UPDATE OR DELETE ON PURCHASEPLANDOC REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 234;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, :old.BUDGET_ID, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, :new.BUDGET_ID, 0, 0, 0, 0);    if (updating and not(1=1 and (:new.BUDGET_ID=:old.BUDGET_ID))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, :old.BUDGET_ID, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$PURCHASEPLANDOC" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$QUALREQ
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$QUALREQ" AFTER INSERT OR UPDATE OR DELETE ON QUALREQ REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 246;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$QUALREQ" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$RECOILDOC
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$RECOILDOC" AFTER INSERT OR UPDATE OR DELETE ON RECOILDOC REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 238;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, :old.BUDGET_ID, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, :new.BUDGET_ID, 0, 0, 0, 0);    if (updating and not(1=1 and (:new.BUDGET_ID=:old.BUDGET_ID))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, :old.BUDGET_ID, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$RECOILDOC" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$REFATTACH
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$REFATTACH" AFTER INSERT OR UPDATE OR DELETE ON REFATTACH REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 253;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$REFATTACH" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$REFERENCECLASS
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$REFERENCECLASS" AFTER INSERT OR UPDATE OR DELETE ON REFERENCECLASS REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 48;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$REFERENCECLASS" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$REFINANCINGRATE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$REFINANCINGRATE" AFTER INSERT OR UPDATE OR DELETE ON REFINANCINGRATE REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 216;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$REFINANCINGRATE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$REFUSALFACTFOUNDATION
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$REFUSALFACTFOUNDATION" AFTER INSERT OR UPDATE OR DELETE ON REFUSALFACTFOUNDATION REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 181;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$REFUSALFACTFOUNDATION" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$REPDOCUMENT
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$REPDOCUMENT" AFTER INSERT OR UPDATE OR DELETE ON REPDOCUMENT REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 187;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$REPDOCUMENT" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$REPFIELD
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$REPFIELD" AFTER INSERT OR UPDATE OR DELETE ON REPFIELD REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 57;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$REPFIELD" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$REPFORM
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$REPFORM" AFTER INSERT OR UPDATE OR DELETE ON REPFORM REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 56;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$REPFORM" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$REPFRAGMENT
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$REPFRAGMENT" AFTER INSERT OR UPDATE OR DELETE ON REPFRAGMENT REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 186;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$REPFRAGMENT" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$REPFRAGMENTCHILD
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$REPFRAGMENTCHILD" AFTER INSERT OR UPDATE OR DELETE ON REPFRAGMENTCHILD REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 188;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$REPFRAGMENTCHILD" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$REPORT
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$REPORT" AFTER INSERT OR UPDATE OR DELETE ON REPORT REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 86;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$REPORT" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$REPPROFILE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$REPPROFILE" AFTER INSERT OR UPDATE OR DELETE ON REPPROFILE REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 64;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$REPPROFILE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$REPSOURCE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$REPSOURCE" AFTER INSERT OR UPDATE OR DELETE ON REPSOURCE REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 185;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$REPSOURCE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$REPTEMPLATEATTACH
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$REPTEMPLATEATTACH" AFTER INSERT OR UPDATE OR DELETE ON REPTEMPLATEATTACH REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 189;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$REPTEMPLATEATTACH" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$REQUESTDOC
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$REQUESTDOC" AFTER INSERT OR UPDATE OR DELETE ON REQUESTDOC REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 161;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, :old.BUDGET_ID, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, :new.BUDGET_ID, 0, 0, 0, 0);    if (updating and not(1=1 and (:new.BUDGET_ID=:old.BUDGET_ID))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, :old.BUDGET_ID, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$REQUESTDOC" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$REQUIREMENTTYPE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$REQUIREMENTTYPE" AFTER INSERT OR UPDATE OR DELETE ON REQUIREMENTTYPE REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 306;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$REQUIREMENTTYPE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$REQUIREMENTTYPEPM
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$REQUIREMENTTYPEPM" AFTER INSERT OR UPDATE OR DELETE ON REQUIREMENTTYPEPM REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 307;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$REQUIREMENTTYPEPM" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$RESERVEDBUDGETLINE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$RESERVEDBUDGETLINE" AFTER INSERT OR UPDATE OR DELETE ON RESERVEDBUDGETLINE REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 172;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$RESERVEDBUDGETLINE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$RESPONSIBILITY
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$RESPONSIBILITY" AFTER INSERT OR UPDATE OR DELETE ON RESPONSIBILITY REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 245;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$RESPONSIBILITY" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$RNP
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$RNP" AFTER INSERT OR UPDATE OR DELETE ON RNP REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 153;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$RNP" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$ROLEREGISTER
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$ROLEREGISTER" AFTER INSERT OR UPDATE OR DELETE ON ROLEREGISTER REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 89;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$ROLEREGISTER" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$RPL
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$RPL" AFTER INSERT OR UPDATE OR DELETE ON RPL REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 308;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$RPL" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$RPLOBJECT
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$RPLOBJECT" AFTER INSERT OR UPDATE OR DELETE ON RPLOBJECT REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 32;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$RPLOBJECT" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$RPLRULE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$RPLRULE" AFTER INSERT OR UPDATE OR DELETE ON RPLRULE REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 3;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$RPLRULE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$RPLSITE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$RPLSITE" AFTER INSERT OR UPDATE OR DELETE ON RPLSITE REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 4;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$RPLSITE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$RPLTABLE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$RPLTABLE" AFTER INSERT OR UPDATE OR DELETE ON RPLTABLE REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 31;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$RPLTABLE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$RPLTABLEPLUGIN
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$RPLTABLEPLUGIN" AFTER INSERT OR UPDATE OR DELETE ON RPLTABLEPLUGIN REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 1;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$RPLTABLEPLUGIN" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$RULEREQUISITE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$RULEREQUISITE" AFTER INSERT OR UPDATE OR DELETE ON RULEREQUISITE REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 109;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$RULEREQUISITE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$RULESCRIPT
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$RULESCRIPT" AFTER INSERT OR UPDATE OR DELETE ON RULESCRIPT REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 111;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$RULESCRIPT" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$SCHEXPDOCS
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$SCHEXPDOCS" AFTER INSERT OR UPDATE OR DELETE ON SCHEXPDOCS REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 76;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$SCHEXPDOCS" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$SCHPLAN
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$SCHPLAN" AFTER INSERT OR UPDATE OR DELETE ON SCHPLAN REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 51;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$SCHPLAN" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$SCHTASK
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$SCHTASK" AFTER INSERT OR UPDATE OR DELETE ON SCHTASK REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 50;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$SCHTASK" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$SERVERACTION
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$SERVERACTION" AFTER INSERT OR UPDATE OR DELETE ON SERVERACTION REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 11;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$SERVERACTION" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$SERVERERROR
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$SERVERERROR" AFTER INSERT OR UPDATE OR DELETE ON SERVERERROR REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 12;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$SERVERERROR" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$SERVERPROCESSOR
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$SERVERPROCESSOR" AFTER INSERT OR UPDATE OR DELETE ON SERVERPROCESSOR REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 10;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$SERVERPROCESSOR" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$SERVERPROVIDER
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$SERVERPROVIDER" AFTER INSERT OR UPDATE OR DELETE ON SERVERPROVIDER REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 9;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$SERVERPROVIDER" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$SIGNEXPORTLOG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$SIGNEXPORTLOG" AFTER INSERT OR UPDATE OR DELETE ON SIGNEXPORTLOG REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 75;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$SIGNEXPORTLOG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$SIGNFORMAT
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$SIGNFORMAT" AFTER INSERT OR UPDATE OR DELETE ON SIGNFORMAT REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 260;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$SIGNFORMAT" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$SIGNTYPE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$SIGNTYPE" AFTER INSERT OR UPDATE OR DELETE ON SIGNTYPE REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 261;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$SIGNTYPE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$STATISTICSSOURCE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$STATISTICSSOURCE" AFTER INSERT OR UPDATE OR DELETE ON STATISTICSSOURCE REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 190;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$STATISTICSSOURCE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$STOREDDOCUMENTS
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$STOREDDOCUMENTS" AFTER INSERT OR UPDATE OR DELETE ON STOREDDOCUMENTS REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 227;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$STOREDDOCUMENTS" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$SUPPORTCRYPTOLIB
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$SUPPORTCRYPTOLIB" AFTER INSERT OR UPDATE OR DELETE ON SUPPORTCRYPTOLIB REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 262;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$SUPPORTCRYPTOLIB" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$SUPPORTCRYPTOLIBFORMAT
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$SUPPORTCRYPTOLIBFORMAT" AFTER INSERT OR UPDATE OR DELETE ON SUPPORTCRYPTOLIBFORMAT REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 264;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$SUPPORTCRYPTOLIBFORMAT" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$SUPPORTCRYPTOLIBPARAM
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$SUPPORTCRYPTOLIBPARAM" AFTER INSERT OR UPDATE OR DELETE ON SUPPORTCRYPTOLIBPARAM REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 263;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$SUPPORTCRYPTOLIBPARAM" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$SYSEVENT
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$SYSEVENT" AFTER INSERT OR UPDATE OR DELETE ON SYSEVENT REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 84;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$SYSEVENT" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$SYSPARAM
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$SYSPARAM" AFTER INSERT OR UPDATE OR DELETE ON SYSPARAM REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 8;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$SYSPARAM" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$SYSRIGHT
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$SYSRIGHT" AFTER INSERT OR UPDATE OR DELETE ON SYSRIGHT REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 46;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$SYSRIGHT" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$SYSUSER
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$SYSUSER" AFTER INSERT OR UPDATE OR DELETE ON SYSUSER REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 7;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$SYSUSER" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$TASKJOURNAL
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$TASKJOURNAL" AFTER INSERT OR UPDATE OR DELETE ON TASKJOURNAL REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 44;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$TASKJOURNAL" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$TENDER
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$TENDER" AFTER INSERT OR UPDATE OR DELETE ON TENDER REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 231;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$TENDER" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$TENDERCRITERION
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$TENDERCRITERION" AFTER INSERT OR UPDATE OR DELETE ON TENDERCRITERION REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 228;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$TENDERCRITERION" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$TENDERCRITERIONCHILD
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$TENDERCRITERIONCHILD" AFTER INSERT OR UPDATE OR DELETE ON TENDERCRITERIONCHILD REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 230;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$TENDERCRITERIONCHILD" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$TENDERCRITERIONPM
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$TENDERCRITERIONPM" AFTER INSERT OR UPDATE OR DELETE ON TENDERCRITERIONPM REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 229;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$TENDERCRITERIONPM" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$TENDERLINE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$TENDERLINE" AFTER INSERT OR UPDATE OR DELETE ON TENDERLINE REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 232;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$TENDERLINE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$TENDERLINECOMM
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$TENDERLINECOMM" AFTER INSERT OR UPDATE OR DELETE ON TENDERLINECOMM REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 233;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$TENDERLINECOMM" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$TERRITORY
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$TERRITORY" AFTER INSERT OR UPDATE OR DELETE ON TERRITORY REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 147;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$TERRITORY" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$TERTYPE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$TERTYPE" AFTER INSERT OR UPDATE OR DELETE ON TERTYPE REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 146;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$TERTYPE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$TYPEDOCREQGROUP
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$TYPEDOCREQGROUP" AFTER INSERT OR UPDATE OR DELETE ON TYPEDOCREQGROUP REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 248;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$TYPEDOCREQGROUP" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$TYPEREQCRIT
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$TYPEREQCRIT" AFTER INSERT OR UPDATE OR DELETE ON TYPEREQCRIT REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 249;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$TYPEREQCRIT" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$UNIT
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$UNIT" AFTER INSERT OR UPDATE OR DELETE ON UNIT REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 130;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$UNIT" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$UPDPACKAGE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$UPDPACKAGE" AFTER INSERT OR UPDATE OR DELETE ON UPDPACKAGE REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 85;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$UPDPACKAGE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$USERBUDGET
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$USERBUDGET" AFTER INSERT OR UPDATE OR DELETE ON USERBUDGET REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 81;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$USERBUDGET" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$USERCERT
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$USERCERT" AFTER INSERT OR UPDATE OR DELETE ON USERCERT REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 74;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, :old.SYSUSER_ID, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, :new.SYSUSER_ID, 0, 0, 0, 0);    if (updating and not(1=1 and (:new.SYSUSER_ID=:old.SYSUSER_ID))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, :old.SYSUSER_ID, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$USERCERT" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$USERORG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$USERORG" AFTER INSERT OR UPDATE OR DELETE ON USERORG REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 6;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$USERORG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$USERROLE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$USERROLE" AFTER INSERT OR UPDATE OR DELETE ON USERROLE REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 45;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$USERROLE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$USERSESSION
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$USERSESSION" AFTER INSERT OR UPDATE OR DELETE ON USERSESSION REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 42;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$USERSESSION" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$USESCRYPTOLIB
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$USESCRYPTOLIB" AFTER INSERT OR UPDATE OR DELETE ON USESCRYPTOLIB REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 265;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$USESCRYPTOLIB" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$USESCRYPTOLIBPARAM
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$USESCRYPTOLIBPARAM" AFTER INSERT OR UPDATE OR DELETE ON USESCRYPTOLIBPARAM REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 266;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$USESCRYPTOLIBPARAM" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$WEBSTATCACHE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$WEBSTATCACHE" AFTER INSERT OR UPDATE OR DELETE ON WEBSTATCACHE REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 191;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$WEBSTATCACHE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger RPL$WEBSTATCACHEVAL
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."RPL$WEBSTATCACHEVAL" AFTER INSERT OR UPDATE OR DELETE ON WEBSTATCACHEVAL REFERENCING NEW AS NEW OLD AS OLD FOR EACH ROW declare ltable_id numeric(15); mutation_index numeric; begin   ltable_id := 192;  if (deleting) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (ltable_id, :new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if (updating and not(1=1 )) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (ltable_id, :old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);    end if;   end;  end if;end;
/
ALTER TRIGGER "GZVLG"."RPL$WEBSTATCACHEVAL" ENABLE;
--------------------------------------------------------
--  DDL for Trigger UPD_CASC_GOODSPROP_SEQORDER
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."UPD_CASC_GOODSPROP_SEQORDER" 
  after update on groupprop
  for each row
  WHEN (new.seqorder<>old.seqorder or new.group_id<>old.group_id) begin
  execute immediate 'update goodsprop set group_id=' || :new.group_id 
    || ', seqorder=' || :new.seqorder
    || ' where group_id=' || :old.group_id 
    || ' and seqorder=' || :old.seqorder;
end;

/
ALTER TRIGGER "GZVLG"."UPD_CASC_GOODSPROP_SEQORDER" ENABLE;
--------------------------------------------------------
--  DDL for Trigger UPD_DOCATTACHEX
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."UPD_DOCATTACHEX" AFTER UPDATE ON DOCATTACHEX FOR EACH ROW
BEGIN
  update document d set d.attach_cnt = d.attach_cnt + 1 
    where d.id=:new.document_id;
  update document d set d.attach_cnt = d.attach_cnt - 1 
    where d.id=:old.document_id;
END;

/
ALTER TRIGGER "GZVLG"."UPD_DOCATTACHEX" ENABLE;
--------------------------------------------------------
--  DDL for Trigger UPD_GOODSGROUP_TREE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."UPD_GOODSGROUP_TREE" after update
 on goodsgroup referencing old as old new as new
 for each row
declare
 vtree varchar(255);
 otree varchar(255);
begin
  vtree := '/';
  begin
    select tree into vtree
      from goodsgroup_tree where group_id=:new.parent_id;
  exception
    when no_data_found then
      vtree := '/';
  end;
  vtree := vtree||:new.code||'/';
  otree := '/';
  begin
    select tree into otree
      from goodsgroup_tree where group_id=:old.parent_id;
  exception
    when no_data_found then
      otree := '/';
  end;
  otree := otree||:old.code||'/';
  FOR vr IN ( select group_id, substr(tree,length(otree)+1) as tree
   from goodsgroup_tree where tree like otree||'%')
  LOOP
    update goodsgroup_tree set tree = vtree||vr.tree where group_id = vr.group_id;
  END LOOP;
end;

/
ALTER TRIGGER "GZVLG"."UPD_GOODSGROUP_TREE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger UPD_ISCONTRACTOR_ORG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."UPD_ISCONTRACTOR_ORG" 
 after update on Org for each row
begin
  update OrgAccount oa set oa.IsContractor=:new.IsContractor
    where oa.ORG_ID=:new.ID and oa.IsContractor<>:new.IsContractor;
end;

/
ALTER TRIGGER "GZVLG"."UPD_ISCONTRACTOR_ORG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger UPD_ORGCHILD
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."UPD_ORGCHILD" AFTER UPDATE
 ON org FOR EACH ROW 
DECLARE 
  topid numeric;
BEGIN
  IF (:new.parent_id IS NOT NULL) THEN
    IF (:old.parent_id IS NOT NULL) THEN
      IF (:new.parent_id <> :old.parent_id) THEN
        SELECT DISTINCT org_id INTO topid FROM orgchild 
          WHERE org_id NOT IN (SELECT child_id FROM orgchild);  
        DELETE FROM orgchild 
          WHERE org_id IN (SELECT org_id FROM orgchild WHERE child_id = :old.parent_id AND org_id <> topid)
            AND ((child_id = :new.id) OR child_id IN (SELECT child_id FROM orgchild WHERE org_id = :new.id));
        IF (:new.parent_id = topid) THEN
          DELETE FROM orgchild WHERE 
            org_id = :old.parent_id AND (child_id = :new.id OR child_id IN
              (SELECT child_id FROM orgchild WHERE org_id = :new.id));
        ELSE
          IF (:old.parent_id = topid) THEN
            INSERT INTO orgchild(org_id, child_id)
              SELECT (SELECT :new.parent_id FROM dual), child_id FROM orgchild
              WHERE org_id = :old.parent_id AND (child_id = :new.id OR child_id IN
                (SELECT child_id FROM orgchild WHERE org_id = :new.id));
          ELSE
            UPDATE orgchild SET org_id = :new.parent_id WHERE 
              org_id = :old.parent_id AND (child_id = :new.id OR child_id IN
                (SELECT child_id FROM orgchild WHERE org_id = :new.id));
          END IF;
        END IF;
        INSERT INTO orgchild(org_id, child_id)
          SELECT par.org_id, ch.child_id FROM 
           (SELECT org_id FROM orgchild WHERE child_id = :new.parent_id AND org_id <> topid) par,
           (SELECT child_id FROM orgchild WHERE org_id = :new.id UNION SELECT :new.id FROM dual) ch;
      END IF;
    ELSE
      IF (:new.parent_id <> :new.id) THEN
        INSERT INTO orgchild(org_id, child_id)
          VALUES(:new.parent_id, :new.id);
        FOR cur IN (SELECT child_id FROM orgchild
          WHERE org_id = :new.id)
        LOOP
          INSERT INTO orgchild(org_id, child_id)
            VALUES (:new.parent_id, cur.child_id);
        END LOOP;
        FOR cur IN (SELECT org_id FROM orgchild
                    WHERE child_id = :new.parent_id)
        LOOP
          INSERT INTO orgchild(org_id, child_id)
            VALUES (cur.org_id, :new.id);
          FOR cur1 IN (SELECT child_id FROM orgchild
            WHERE org_id = :new.id)
          LOOP
            INSERT INTO orgchild(org_id, child_id)
              VALUES (cur.org_id, cur1.child_id);
          END LOOP;
        END LOOP;
      END IF;
    END IF;
  ELSE
    IF (:old.parent_id IS NOT NULL) THEN
      DELETE FROM orgchild WHERE org_id = :new.id OR child_id = :new.id;
    END IF;
  END IF;
END;

/
ALTER TRIGGER "GZVLG"."UPD_ORGCHILD" ENABLE;
--------------------------------------------------------
--  DDL for Trigger UPD_TER_TREE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."UPD_TER_TREE" after update
 on territory referencing old as old new as new
 for each row
declare
 vtree varchar(255);
 vpath varchar(512);
 otree varchar(255);
 opath varchar(512);
begin
  vtree := '/';
  begin
    select tree, path into vtree, vpath
      from ter_tree where ter_id=:new.parent_id;
    vpath := vpath||', '||:new.caption;
  exception
    when no_data_found then
      vtree := '/';
      vpath := :new.caption;
  end;
  vtree := vtree||:new.code||'/';
  otree := '/';
  begin
    select tree, path into otree, opath
      from ter_tree where ter_id=:old.parent_id;
    opath := opath||', '||:old.caption;
  exception
    when no_data_found then
      otree := '/';
      opath := :old.caption;
  end;
  otree := otree||:old.code||'/';
  FOR vr IN ( select ter_id, substr(tree,length(otree)+1) as tree, substr(path,length(opath)+1) as path
   from ter_tree where tree like otree||'%')
  LOOP
    update ter_tree set tree = vtree||vr.tree, path = vpath||vr.path where ter_id = vr.ter_id;
  END LOOP;
end;

/
ALTER TRIGGER "GZVLG"."UPD_TER_TREE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_ABANDONEDREASON
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_ABANDONEDREASON" before insert or update on ABANDONEDREASON
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_ABANDONEDREASON" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_ALTGOODSGROUP
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_ALTGOODSGROUP" before insert or update on ALTGOODSGROUP
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_ALTGOODSGROUP" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_ALTGOODSGROUPTYPE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_ALTGOODSGROUPTYPE" before insert or update on ALTGOODSGROUPTYPE
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_ALTGOODSGROUPTYPE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_ANYDATA
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_ANYDATA" before insert or update on ANYDATA
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_ANYDATA" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_APPMODULE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_APPMODULE" before insert or update on APPMODULE
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_APPMODULE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_APPOBJ
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_APPOBJ" before insert or update on APPOBJ
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_APPOBJ" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_APPOBJPROP
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_APPOBJPROP" before insert or update on APPOBJPROP
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_APPOBJPROP" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_APPOINTMENT
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_APPOINTMENT" before insert or update on APPOINTMENT
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_APPOINTMENT" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_AUCTIONBID
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_AUCTIONBID" before insert or update on AUCTIONBID
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_AUCTIONBID" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_AUCTIONLOG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_AUCTIONLOG" before insert or update on AUCTIONLOG
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_AUCTIONLOG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_BANK
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_BANK" before insert or update on BANK
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_BANK" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_BANKGUARANTEEDOC
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_BANKGUARANTEEDOC" before insert or update on BANKGUARANTEEDOC
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_BANKGUARANTEEDOC" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_BANKGUARANTEEREFDOC
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_BANKGUARANTEEREFDOC" before insert or update on BANKGUARANTEEREFDOC
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_BANKGUARANTEEREFDOC" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_BANKGUARANTEEREFREASON
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_BANKGUARANTEEREFREASON" before insert or update on BANKGUARANTEEREFREASON
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_BANKGUARANTEEREFREASON" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_BUDGCODE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_BUDGCODE" before insert or update on BUDGCODE
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_BUDGCODE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_BUDGET
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_BUDGET" before insert or update on BUDGET
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_BUDGET" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_BUDGETLINE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_BUDGETLINE" before insert or update on BUDGETLINE
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_BUDGETLINE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_BUDGETSTAGE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_BUDGETSTAGE" before insert or update on BUDGETSTAGE
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_BUDGETSTAGE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_CACHELIST
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_CACHELIST" before insert or update on CACHELIST
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_CACHELIST" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_CAVILDOC
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_CAVILDOC" before insert or update on CAVILDOC
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_CAVILDOC" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_CAVILTYPE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_CAVILTYPE" before insert or update on CAVILTYPE
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_CAVILTYPE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_CERTINTERCHANGEREQUEST
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_CERTINTERCHANGEREQUEST" before insert or update on CERTINTERCHANGEREQUEST
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_CERTINTERCHANGEREQUEST" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_CERTREQUEST
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_CERTREQUEST" before insert or update on CERTREQUEST
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_CERTREQUEST" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_CERTREVOKEREQUEST
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_CERTREVOKEREQUEST" before insert or update on CERTREVOKEREQUEST
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_CERTREVOKEREQUEST" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_CLAIMDOC
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_CLAIMDOC" before insert or update on CLAIMDOC
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_CLAIMDOC" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_CLAIMPAYFACT
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_CLAIMPAYFACT" before insert or update on CLAIMPAYFACT
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_CLAIMPAYFACT" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_CLAIMPENALTYCHANGEDOCINFO
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_CLAIMPENALTYCHANGEDOCINFO" before insert or update on CLAIMPENALTYCHANGEDOCINFO
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_CLAIMPENALTYCHANGEDOCINFO" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_CLASSOPER
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_CLASSOPER" before insert or update on CLASSOPER
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_CLASSOPER" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_CLIENTOBJECT
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_CLIENTOBJECT" before insert or update on CLIENTOBJECT
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_CLIENTOBJECT" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_CLIENTOBJECTCOMMENTS
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_CLIENTOBJECTCOMMENTS" before insert or update on CLIENTOBJECTCOMMENTS
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_CLIENTOBJECTCOMMENTS" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_CLNDDAY
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_CLNDDAY" before insert or update on CLNDDAY
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_CLNDDAY" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_CLNDDAYTYPE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_CLNDDAYTYPE" before insert or update on CLNDDAYTYPE
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_CLNDDAYTYPE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_CLNDTYPE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_CLNDTYPE" before insert or update on CLNDTYPE
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_CLNDTYPE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_CODETYPE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_CODETYPE" before insert or update on CODETYPE
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_CODETYPE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_COMMEMBER
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_COMMEMBER" before insert or update on COMMEMBER
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_COMMEMBER" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_COMMISSION
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_COMMISSION" before insert or update on COMMISSION
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_COMMISSION" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_COMPLAINTDOC
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_COMPLAINTDOC" before insert or update on COMPLAINTDOC
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_COMPLAINTDOC" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_CONFCONCLUSIONCONTRACT
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_CONFCONCLUSIONCONTRACT" before insert or update on CONFCONCLUSIONCONTRACT
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_CONFCONCLUSIONCONTRACT" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_CONPAYFACT
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_CONPAYFACT" before insert or update on CONPAYFACT
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_CONPAYFACT" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_CONSOLIDDOC
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_CONSOLIDDOC" before insert or update on CONSOLIDDOC
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_CONSOLIDDOC" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_CONSTRUCTION
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_CONSTRUCTION" before insert or update on CONSTRUCTION
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_CONSTRUCTION" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_CONTRACTCARDDOC
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_CONTRACTCARDDOC" before insert or update on CONTRACTCARDDOC
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_CONTRACTCARDDOC" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_CONTRACTDOC
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_CONTRACTDOC" before insert or update on CONTRACTDOC
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_CONTRACTDOC" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_CONTRACTEXECDOC
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_CONTRACTEXECDOC" before insert or update on CONTRACTEXECDOC
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_CONTRACTEXECDOC" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_CONTRACTREASON
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_CONTRACTREASON" before insert or update on CONTRACTREASON
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_CONTRACTREASON" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_CONTRACTREASON_DOCLINES
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_CONTRACTREASON_DOCLINES" before insert or update on CONTRACTREASON_DOCLINES
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_CONTRACTREASON_DOCLINES" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_CONTRACTTEMPLATEDOC
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_CONTRACTTEMPLATEDOC" before insert or update on CONTRACTTEMPLATEDOC
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_CONTRACTTEMPLATEDOC" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_CONTYPE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_CONTYPE" before insert or update on CONTYPE
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_CONTYPE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_CONTYPEATTACH
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_CONTYPEATTACH" before insert or update on CONTYPEATTACH
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_CONTYPEATTACH" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_COUNTRY
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_COUNTRY" before insert or update on COUNTRY
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_COUNTRY" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_CRLFILE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_CRLFILE" before insert or update on CRLFILE
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_CRLFILE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_CRLPOINT
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_CRLPOINT" before insert or update on CRLPOINT
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_CRLPOINT" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_CURHISTORY
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_CURHISTORY" before insert or update on CURHISTORY
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_CURHISTORY" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_CURRENCY
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_CURRENCY" before insert or update on CURRENCY
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_CURRENCY" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_DATAOBJECTCHANGELOG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_DATAOBJECTCHANGELOG" before insert or update on DATAOBJECTCHANGELOG
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_DATAOBJECTCHANGELOG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_DATASOURCE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_DATASOURCE" before insert or update on DATASOURCE
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_DATASOURCE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_DBCONNECT
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_DBCONNECT" before insert or update on DBCONNECT
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_DBCONNECT" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_DBCONSTRAINT
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_DBCONSTRAINT" before insert or update on DBCONSTRAINT
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_DBCONSTRAINT" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_DECREASON
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_DECREASON" before insert or update on DECREASON
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_DECREASON" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_DELIVERYBASIS
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_DELIVERYBASIS" before insert or update on DELIVERYBASIS
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_DELIVERYBASIS" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_DESCGROUP
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_DESCGROUP" before insert or update on DESCGROUP
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_DESCGROUP" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_DESCRIPTION
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_DESCRIPTION" before insert or update on DESCRIPTION
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_DESCRIPTION" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_DESCRIPTIONCACHE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_DESCRIPTIONCACHE" before insert or update on DESCRIPTIONCACHE
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_DESCRIPTIONCACHE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_DEVIATIONFACTFOUNDATION
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_DEVIATIONFACTFOUNDATION" before insert or update on DEVIATIONFACTFOUNDATION
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_DEVIATIONFACTFOUNDATION" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_DIGEST
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_DIGEST" before insert or update on DIGEST
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_DIGEST" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_DIGESTSIGN
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_DIGESTSIGN" before insert or update on DIGESTSIGN
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_DIGESTSIGN" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_DISPSTATUS
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_DISPSTATUS" before insert or update on DISPSTATUS
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_DISPSTATUS" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_DOCACTION
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_DOCACTION" before insert or update on DOCACTION
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_DOCACTION" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_DOCATTACH
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_DOCATTACH" before insert or update on DOCATTACH
FOR EACH ROW 
declare
  TaskJournalId number(15,0);
  RecordAction number(1,0);
begin
 if inserting then 
 begin 
   if (:new.version is null or (:new.version < 1)) then 
     :new.version := 1; 
 end if; 
end; 
else 
  if (:new.version IS NULL or (:new.version <= :old.version)) then 
    :new.version := coalesce(:old.version, 0) + 1;
  end if;
 end if; 
  if inserting then 
    RecordAction := 0; 
  else 
    RecordAction := 1; 
  end if;
  TaskJournalId := RPLTRANSACTION.get_task_journal_id; 
  if TaskJournalId is not null then 
    insert into RplVersionLog (Ver, Num_Transaction, RplTable_Id, TaskJournal_Id, Record_Id, Record_Action) 
    values (:new.version, dbms_transaction.local_transaction_id, 49, TaskJournalId, :new.id, RecordAction); 
  end if;
end;
/
ALTER TRIGGER "GZVLG"."VER_DOCATTACH" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_DOCATTACHEX
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_DOCATTACHEX" before insert or update on DOCATTACHEX
FOR EACH ROW 
declare
  TaskJournalId number(15,0);
  RecordAction number(1,0);
begin
 if inserting then 
 begin 
   if (:new.version is null or (:new.version < 1)) then 
     :new.version := 1; 
 end if; 
end; 
else 
  if (:new.version IS NULL or (:new.version <= :old.version)) then 
    :new.version := coalesce(:old.version, 0) + 1;
  end if;
 end if; 
  if inserting then 
    RecordAction := 0; 
  else 
    RecordAction := 1; 
  end if;
  TaskJournalId := RPLTRANSACTION.get_task_journal_id; 
  if TaskJournalId is not null then 
    insert into RplVersionLog (Ver, Num_Transaction, RplTable_Id, TaskJournal_Id, Record_Id, Record_Action) 
    values (:new.version, dbms_transaction.local_transaction_id, 2, TaskJournalId, :new.id, RecordAction); 
  end if;
end;
/
ALTER TRIGGER "GZVLG"."VER_DOCATTACHEX" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_DOCCATEGORY
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_DOCCATEGORY" before insert or update on DOCCATEGORY
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_DOCCATEGORY" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_DOCCLASS_DISPSTATUS
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_DOCCLASS_DISPSTATUS" before insert or update on DOCCLASS_DISPSTATUS
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_DOCCLASS_DISPSTATUS" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_DOCCOMMENT
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_DOCCOMMENT" before insert or update on DOCCOMMENT
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_DOCCOMMENT" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_DOCCUSTOMFIELDS
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_DOCCUSTOMFIELDS" before insert or update on DOCCUSTOMFIELDS
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_DOCCUSTOMFIELDS" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_DOCDIGESTRULE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_DOCDIGESTRULE" before insert or update on DOCDIGESTRULE
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_DOCDIGESTRULE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_DOCEVENT
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_DOCEVENT" before insert or update on DOCEVENT
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_DOCEVENT" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_DOCEVERRLOG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_DOCEVERRLOG" before insert or update on DOCEVERRLOG
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_DOCEVERRLOG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_DOCEXCHANGESCHEME
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_DOCEXCHANGESCHEME" before insert or update on DOCEXCHANGESCHEME
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_DOCEXCHANGESCHEME" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_DOCFLAGCATEGORY
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_DOCFLAGCATEGORY" before insert or update on DOCFLAGCATEGORY
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_DOCFLAGCATEGORY" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_DOCFLAGTYPE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_DOCFLAGTYPE" before insert or update on DOCFLAGTYPE
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_DOCFLAGTYPE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_DOCGROUP
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_DOCGROUP" before insert or update on DOCGROUP
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_DOCGROUP" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_DOCREQ
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_DOCREQ" before insert or update on DOCREQ
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_DOCREQ" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_DOCRETENTION
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_DOCRETENTION" before insert or update on DOCRETENTION
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_DOCRETENTION" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_DOCRETENTIONSTATITEMS
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_DOCRETENTIONSTATITEMS" before insert or update on DOCRETENTIONSTATITEMS
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_DOCRETENTIONSTATITEMS" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_DOCRETENTIONSTATUS
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_DOCRETENTIONSTATUS" before insert or update on DOCRETENTIONSTATUS
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_DOCRETENTIONSTATUS" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_DOCSTATUS
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_DOCSTATUS" before insert or update on DOCSTATUS
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_DOCSTATUS" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_DOCUMENT
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_DOCUMENT" before insert or update on DOCUMENT
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_DOCUMENT" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_DOCUMENTCLASS
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_DOCUMENTCLASS" before insert or update on DOCUMENTCLASS
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_DOCUMENTCLASS" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_DOCUMENTREPORTS
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_DOCUMENTREPORTS" before insert or update on DOCUMENTREPORTS
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_DOCUMENTREPORTS" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_DOMEN
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_DOMEN" before insert or update on DOMEN
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_DOMEN" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_EQUALITY
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_EQUALITY" before insert or update on EQUALITY
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_EQUALITY" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_EQUALITYCODES
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_EQUALITYCODES" before insert or update on EQUALITYCODES
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_EQUALITYCODES" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_ESCHECKRULE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_ESCHECKRULE" before insert or update on ESCHECKRULE
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_ESCHECKRULE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_ESTIMATE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_ESTIMATE" before insert or update on ESTIMATE
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_ESTIMATE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_ETP
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_ETP" before insert or update on ETP
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_ETP" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_ETPATTACH
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_ETPATTACH" before insert or update on ETPATTACH
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_ETPATTACH" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_ETPTYPE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_ETPTYPE" before insert or update on ETPTYPE
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_ETPTYPE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_FACTDOC
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_FACTDOC" before insert or update on FACTDOC
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_FACTDOC" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_FACTDOCTYPE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_FACTDOCTYPE" before insert or update on FACTDOCTYPE
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_FACTDOCTYPE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_FETCHMODE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_FETCHMODE" before insert or update on FETCHMODE
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_FETCHMODE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_FGROUP
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_FGROUP" before insert or update on FGROUP
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_FGROUP" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_FGROUPATTACH
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_FGROUPATTACH" before insert or update on FGROUPATTACH
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_FGROUPATTACH" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_FGROUPHEADER
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_FGROUPHEADER" before insert or update on FGROUPHEADER
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_FGROUPHEADER" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_FINSRC
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_FINSRC" before insert or update on FINSRC
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_FINSRC" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_FINSRCSATISFY
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_FINSRCSATISFY" before insert or update on FINSRCSATISFY
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_FINSRCSATISFY" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_FORMATCONVERTER
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_FORMATCONVERTER" before insert or update on FORMATCONVERTER
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_FORMATCONVERTER" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_FUNCAT
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_FUNCAT" before insert or update on FUNCAT
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_FUNCAT" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_FUNUNIT
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_FUNUNIT" before insert or update on FUNUNIT
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_FUNUNIT" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_GCREGISTER
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_GCREGISTER" before insert or update on GCREGISTER
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_GCREGISTER" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_GOODS
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_GOODS" before insert or update on GOODS
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_GOODS" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_GOODSBAN
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_GOODSBAN" before insert or update on GOODSBAN
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_GOODSBAN" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_GOODSBANGOODSOKPD
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_GOODSBANGOODSOKPD" before insert or update on GOODSBANGOODSOKPD
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_GOODSBANGOODSOKPD" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_GOODSBANPURCHASEMODE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_GOODSBANPURCHASEMODE" before insert or update on GOODSBANPURCHASEMODE
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_GOODSBANPURCHASEMODE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_GOODSBRANCH
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_GOODSBRANCH" before insert or update on GOODSBRANCH
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_GOODSBRANCH" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_GOODSGROUP
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_GOODSGROUP" before insert or update on GOODSGROUP
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_GOODSGROUP" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_GOODSGROUPDOCDETAIL
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_GOODSGROUPDOCDETAIL" before insert or update on GOODSGROUPDOCDETAIL
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_GOODSGROUPDOCDETAIL" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_GOODSGROUPPURCHASEMODE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_GOODSGROUPPURCHASEMODE" before insert or update on GOODSGROUPPURCHASEMODE
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_GOODSGROUPPURCHASEMODE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_GOODSOKDP
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_GOODSOKDP" before insert or update on GOODSOKDP
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_GOODSOKDP" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_GOODSOKDPCOUNTRYPREF
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_GOODSOKDPCOUNTRYPREF" before insert or update on GOODSOKDPCOUNTRYPREF
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_GOODSOKDPCOUNTRYPREF" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_GOODSOKDPPURCHASEMODE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_GOODSOKDPPURCHASEMODE" before insert or update on GOODSOKDPPURCHASEMODE
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_GOODSOKDPPURCHASEMODE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_GOODSOKPD
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_GOODSOKPD" before insert or update on GOODSOKPD
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_GOODSOKPD" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_GOODSOKPDCOUNTRYPREF
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_GOODSOKPDCOUNTRYPREF" before insert or update on GOODSOKPDCOUNTRYPREF
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_GOODSOKPDCOUNTRYPREF" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_GOODSOKPDPURCHASEMODE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_GOODSOKPDPURCHASEMODE" before insert or update on GOODSOKPDPURCHASEMODE
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_GOODSOKPDPURCHASEMODE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_GOODSOKVED
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_GOODSOKVED" before insert or update on GOODSOKVED
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_GOODSOKVED" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_GOODSPRICE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_GOODSPRICE" before insert or update on GOODSPRICE
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_GOODSPRICE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_GRANTINVESTMENT
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_GRANTINVESTMENT" before insert or update on GRANTINVESTMENT
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_GRANTINVESTMENT" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_GROUPPROP
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_GROUPPROP" before insert or update on GROUPPROP
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_GROUPPROP" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_HISTORYMODIFY
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_HISTORYMODIFY" before insert or update on HISTORYMODIFY
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_HISTORYMODIFY" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_INDUSTRYCODE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_INDUSTRYCODE" before insert or update on INDUSTRYCODE
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_INDUSTRYCODE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_INSTITUTIONLINE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_INSTITUTIONLINE" before insert or update on INSTITUTIONLINE
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_INSTITUTIONLINE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_INTERBUDGET
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_INTERBUDGET" before insert or update on INTERBUDGET
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_INTERBUDGET" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_INVOICEDOC
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_INVOICEDOC" before insert or update on INVOICEDOC
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_INVOICEDOC" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_JAVACLASS
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_JAVACLASS" before insert or update on JAVACLASS
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_JAVACLASS" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_KBKLINEFIT
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_KBKLINEFIT" before insert or update on KBKLINEFIT
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_KBKLINEFIT" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_KLADR
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_KLADR" before insert or update on KLADR
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_KLADR" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_KLADRSTREET
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_KLADRSTREET" before insert or update on KLADRSTREET
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_KLADRSTREET" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_LEDGER
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_LEDGER" before insert or update on LEDGER
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_LEDGER" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_LIABILITYCREDENTIAL
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_LIABILITYCREDENTIAL" before insert or update on LIABILITYCREDENTIAL
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_LIABILITYCREDENTIAL" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_LIABILITYEXPENSE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_LIABILITYEXPENSE" before insert or update on LIABILITYEXPENSE
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_LIABILITYEXPENSE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_LIABILITYEXPENSE_DOCLINES
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_LIABILITYEXPENSE_DOCLINES" before insert or update on LIABILITYEXPENSE_DOCLINES
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_LIABILITYEXPENSE_DOCLINES" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_LIABILITYGROUP
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_LIABILITYGROUP" before insert or update on LIABILITYGROUP
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_LIABILITYGROUP" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_LICTYPE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_LICTYPE" before insert or update on LICTYPE
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_LICTYPE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_MAIL
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_MAIL" before insert or update on MAIL
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_MAIL" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_MAILATTACH
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_MAILATTACH" before insert or update on MAILATTACH
FOR EACH ROW 
declare
  TaskJournalId number(15,0);
  RecordAction number(1,0);
begin
 if inserting then 
 begin 
   if (:new.version is null or (:new.version < 1)) then 
     :new.version := 1; 
 end if; 
end; 
else 
  if (:new.version IS NULL or (:new.version <= :old.version)) then 
    :new.version := coalesce(:old.version, 0) + 1;
  end if;
 end if; 
  if inserting then 
    RecordAction := 0; 
  else 
    RecordAction := 1; 
  end if;
  TaskJournalId := RPLTRANSACTION.get_task_journal_id; 
  if TaskJournalId is not null then 
    insert into RplVersionLog (Ver, Num_Transaction, RplTable_Id, TaskJournal_Id, Record_Id, Record_Action) 
    values (:new.version, dbms_transaction.local_transaction_id, 66, TaskJournalId, :new.id, RecordAction); 
  end if;
end;
/
ALTER TRIGGER "GZVLG"."VER_MAILATTACH" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_MAILRECEIVERGROUP
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_MAILRECEIVERGROUP" before insert or update on MAILRECEIVERGROUP
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_MAILRECEIVERGROUP" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_MAILRECEIVERGROUP_RECEIVER
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_MAILRECEIVERGROUP_RECEIVER" before insert or update on MAILRECEIVERGROUP_RECEIVER
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_MAILRECEIVERGROUP_RECEIVER" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_MENU
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_MENU" before insert or update on MENU
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_MENU" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_MENUITEM
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_MENUITEM" before insert or update on MENUITEM
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_MENUITEM" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_MENUITEMWEB
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_MENUITEMWEB" before insert or update on MENUITEMWEB
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_MENUITEMWEB" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_METACONSTRAINT
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_METACONSTRAINT" before insert or update on METACONSTRAINT
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_METACONSTRAINT" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_METAOBJECT
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_METAOBJECT" before insert or update on METAOBJECT
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_METAOBJECT" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_MSG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_MSG" before insert or update on MSG
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_MSG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_MSGLINKTYPE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_MSGLINKTYPE" before insert or update on MSGLINKTYPE
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_MSGLINKTYPE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_MSGQUEUE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_MSGQUEUE" before insert or update on MSGQUEUE
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_MSGQUEUE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_MSGSITE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_MSGSITE" before insert or update on MSGSITE
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_MSGSITE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_NECESSITY
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_NECESSITY" before insert or update on NECESSITY
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_NECESSITY" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_NOTICEDOC
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_NOTICEDOC" before insert or update on NOTICEDOC
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_NOTICEDOC" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_NOTICEEMAILORG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_NOTICEEMAILORG" before insert or update on NOTICEEMAILORG
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_NOTICEEMAILORG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_NOTIFYMSG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_NOTIFYMSG" before insert or update on NOTIFYMSG
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_NOTIFYMSG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_NOTIFYMSGEVENT
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_NOTIFYMSGEVENT" before insert or update on NOTIFYMSGEVENT
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_NOTIFYMSGEVENT" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_NOTIFYMSGGROUP
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_NOTIFYMSGGROUP" before insert or update on NOTIFYMSGGROUP
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_NOTIFYMSGGROUP" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_NOTIFYMSGRULE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_NOTIFYMSGRULE" before insert or update on NOTIFYMSGRULE
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_NOTIFYMSGRULE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_NUMGENERATOR
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_NUMGENERATOR" before insert or update on NUMGENERATOR
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_NUMGENERATOR" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_NUMPREFIX
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_NUMPREFIX" before insert or update on NUMPREFIX
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_NUMPREFIX" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_NUMSEQUENCE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_NUMSEQUENCE" before insert or update on NUMSEQUENCE
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_NUMSEQUENCE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_OFFERDOC
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_OFFERDOC" before insert or update on OFFERDOC
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_OFFERDOC" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_OFRREQREASON
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_OFRREQREASON" before insert or update on OFRREQREASON
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_OFRREQREASON" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_OFRRETREASON
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_OFRRETREASON" before insert or update on OFRRETREASON
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_OFRRETREASON" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_OIDREF
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_OIDREF" before insert or update on OIDREF
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_OIDREF" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_OKTMO
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_OKTMO" before insert or update on OKTMO
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_OKTMO" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_OLAPQUERY
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_OLAPQUERY" before insert or update on OLAPQUERY
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_OLAPQUERY" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_OOSORGROLE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_OOSORGROLE" before insert or update on OOSORGROLE
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_OOSORGROLE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_OOS223PURCHASENOTICEINFO
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_OOS223PURCHASENOTICEINFO" before insert or update on OOS223PURCHASENOTICEINFO
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_OOS223PURCHASENOTICEINFO" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_OOS223PURCHNOTICELOTINFO
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_OOS223PURCHNOTICELOTINFO" before insert or update on OOS223PURCHNOTICELOTINFO
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_OOS223PURCHNOTICELOTINFO" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_OPERTYPE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_OPERTYPE" before insert or update on OPERTYPE
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_OPERTYPE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_ORDERDOC
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_ORDERDOC" before insert or update on ORDERDOC
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_ORDERDOC" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_ORDERSUMMARY
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_ORDERSUMMARY" before insert or update on ORDERSUMMARY
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_ORDERSUMMARY" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_ORG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_ORG" before insert or update on ORG
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_ORG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_ORGACCOUNT
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_ORGACCOUNT" before insert or update on ORGACCOUNT
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_ORGACCOUNT" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_ORGACCTYPE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_ORGACCTYPE" before insert or update on ORGACCTYPE
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_ORGACCTYPE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_ORGADDKPP
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_ORGADDKPP" before insert or update on ORGADDKPP
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_ORGADDKPP" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_ORGCONCCONT
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_ORGCONCCONT" before insert or update on ORGCONCCONT
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_ORGCONCCONT" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_ORGETP
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_ORGETP" before insert or update on ORGETP
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_ORGETP" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_ORGFORM
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_ORGFORM" before insert or update on ORGFORM
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_ORGFORM" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_ORGOOS223FZUSER
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_ORGOOS223FZUSER" before insert or update on ORGOOS223FZUSER
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_ORGOOS223FZUSER" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_ORGROLE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_ORGROLE" before insert or update on ORGROLE
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_ORGROLE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_ORGSTATUS
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_ORGSTATUS" before insert or update on ORGSTATUS
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_ORGSTATUS" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_ORGUNFAIR
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_ORGUNFAIR" before insert or update on ORGUNFAIR
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_ORGUNFAIR" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_PACKTYPE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_PACKTYPE" before insert or update on PACKTYPE
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_PACKTYPE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_PANEL
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_PANEL" before insert or update on PANEL
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_PANEL" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_PANELITEM
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_PANELITEM" before insert or update on PANELITEM
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_PANELITEM" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_PAYCONDITION
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_PAYCONDITION" before insert or update on PAYCONDITION
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_PAYCONDITION" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_PERSON
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_PERSON" before insert or update on PERSON
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_PERSON" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_PERSONAL
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_PERSONAL" before insert or update on PERSONAL
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_PERSONAL" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_PLACEMENTFEATURE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_PLACEMENTFEATURE" before insert or update on PLACEMENTFEATURE
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_PLACEMENTFEATURE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_PLACEMENTFEATUREPM
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_PLACEMENTFEATUREPM" before insert or update on PLACEMENTFEATUREPM
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_PLACEMENTFEATUREPM" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_PLACINGWAY
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_PLACINGWAY" before insert or update on PLACINGWAY
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_PLACINGWAY" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_PLANDOC
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_PLANDOC" before insert or update on PLANDOC
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_PLANDOC" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_PLANPOSITIONCHANGEREASON
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_PLANPOSITIONCHANGEREASON" before insert or update on PLANPOSITIONCHANGEREASON
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_PLANPOSITIONCHANGEREASON" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_PLAN2ARRANGEMENT
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_PLAN2ARRANGEMENT" before insert or update on PLAN2ARRANGEMENT
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_PLAN2ARRANGEMENT" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_PLAN2CHANGEREASON
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_PLAN2CHANGEREASON" before insert or update on PLAN2CHANGEREASON
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_PLAN2CHANGEREASON" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_PLAN2DOC
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_PLAN2DOC" before insert or update on PLAN2DOC
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_PLAN2DOC" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_PLAN2GOODS
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_PLAN2GOODS" before insert or update on PLAN2GOODS
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_PLAN2GOODS" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_PLAN2LEDGER
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_PLAN2LEDGER" before insert or update on PLAN2LEDGER
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_PLAN2LEDGER" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_PLAN2OOSEXTNUMBER
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_PLAN2OOSEXTNUMBER" before insert or update on PLAN2OOSEXTNUMBER
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_PLAN2OOSEXTNUMBER" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_PLAN2OOSFEATURE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_PLAN2OOSFEATURE" before insert or update on PLAN2OOSFEATURE
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_PLAN2OOSFEATURE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_PLAN2OOSKBK
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_PLAN2OOSKBK" before insert or update on PLAN2OOSKBK
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_PLAN2OOSKBK" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_PLAN2OOSKBKYEAR
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_PLAN2OOSKBKYEAR" before insert or update on PLAN2OOSKBKYEAR
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_PLAN2OOSKBKYEAR" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_PLAN2OOSOKVED
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_PLAN2OOSOKVED" before insert or update on PLAN2OOSOKVED
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_PLAN2OOSOKVED" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_PLAN2OOSPOSITION
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_PLAN2OOSPOSITION" before insert or update on PLAN2OOSPOSITION
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_PLAN2OOSPOSITION" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_PLAN2OOSPRODUCT
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_PLAN2OOSPRODUCT" before insert or update on PLAN2OOSPRODUCT
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_PLAN2OOSPRODUCT" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_PLAN3DOC
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_PLAN3DOC" before insert or update on PLAN3DOC
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_PLAN3DOC" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_PLAN3PURCHASEDOC
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_PLAN3PURCHASEDOC" before insert or update on PLAN3PURCHASEDOC
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_PLAN3PURCHASEDOC" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_PREFERENCEGROUP
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_PREFERENCEGROUP" before insert or update on PREFERENCEGROUP
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_PREFERENCEGROUP" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_PREFERENCEGROUPFEATURE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_PREFERENCEGROUPFEATURE" before insert or update on PREFERENCEGROUPFEATURE
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_PREFERENCEGROUPFEATURE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_PROCTREE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_PROCTREE" before insert or update on PROCTREE
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_PROCTREE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_PROCUREMENT
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_PROCUREMENT" before insert or update on PROCUREMENT
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_PROCUREMENT" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_PROPTYPE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_PROPTYPE" before insert or update on PROPTYPE
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_PROPTYPE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_PURCHASECARRY
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_PURCHASECARRY" before insert or update on PURCHASECARRY
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_PURCHASECARRY" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_PURCHASEMETHOD
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_PURCHASEMETHOD" before insert or update on PURCHASEMETHOD
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_PURCHASEMETHOD" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_PURCHASEMODE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_PURCHASEMODE" before insert or update on PURCHASEMODE
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_PURCHASEMODE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_PURCHASEPLAN
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_PURCHASEPLAN" before insert or update on PURCHASEPLAN
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_PURCHASEPLAN" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_PURCHASEPLANDOC
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_PURCHASEPLANDOC" before insert or update on PURCHASEPLANDOC
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_PURCHASEPLANDOC" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_QUALREQ
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_QUALREQ" before insert or update on QUALREQ
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_QUALREQ" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_RECOILDOC
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_RECOILDOC" before insert or update on RECOILDOC
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_RECOILDOC" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_REFATTACH
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_REFATTACH" before insert or update on REFATTACH
FOR EACH ROW 
declare
  TaskJournalId number(15,0);
  RecordAction number(1,0);
begin
 if inserting then 
 begin 
   if (:new.version is null or (:new.version < 1)) then 
     :new.version := 1; 
 end if; 
end; 
else 
  if (:new.version IS NULL or (:new.version <= :old.version)) then 
    :new.version := coalesce(:old.version, 0) + 1;
  end if;
 end if; 
  if inserting then 
    RecordAction := 0; 
  else 
    RecordAction := 1; 
  end if;
  TaskJournalId := RPLTRANSACTION.get_task_journal_id; 
  if TaskJournalId is not null then 
    insert into RplVersionLog (Ver, Num_Transaction, RplTable_Id, TaskJournal_Id, Record_Id, Record_Action) 
    values (:new.version, dbms_transaction.local_transaction_id, 253, TaskJournalId, :new.id, RecordAction); 
  end if;
end;
/
ALTER TRIGGER "GZVLG"."VER_REFATTACH" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_REFERENCECLASS
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_REFERENCECLASS" before insert or update on REFERENCECLASS
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_REFERENCECLASS" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_REFINANCINGRATE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_REFINANCINGRATE" before insert or update on REFINANCINGRATE
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_REFINANCINGRATE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_REFUSALFACTFOUNDATION
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_REFUSALFACTFOUNDATION" before insert or update on REFUSALFACTFOUNDATION
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_REFUSALFACTFOUNDATION" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_REPDOCUMENT
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_REPDOCUMENT" before insert or update on REPDOCUMENT
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_REPDOCUMENT" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_REPFIELD
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_REPFIELD" before insert or update on REPFIELD
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_REPFIELD" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_REPFORM
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_REPFORM" before insert or update on REPFORM
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_REPFORM" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_REPFRAGMENT
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_REPFRAGMENT" before insert or update on REPFRAGMENT
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_REPFRAGMENT" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_REPFRAGMENTCHILD
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_REPFRAGMENTCHILD" before insert or update on REPFRAGMENTCHILD
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_REPFRAGMENTCHILD" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_REPORT
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_REPORT" before insert or update on REPORT
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_REPORT" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_REPPROFILE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_REPPROFILE" before insert or update on REPPROFILE
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_REPPROFILE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_REPSOURCE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_REPSOURCE" before insert or update on REPSOURCE
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_REPSOURCE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_REPTEMPLATEATTACH
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_REPTEMPLATEATTACH" before insert or update on REPTEMPLATEATTACH
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_REPTEMPLATEATTACH" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_REQUESTDOC
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_REQUESTDOC" before insert or update on REQUESTDOC
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_REQUESTDOC" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_REQUIREMENTTYPE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_REQUIREMENTTYPE" before insert or update on REQUIREMENTTYPE
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_REQUIREMENTTYPE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_REQUIREMENTTYPEPM
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_REQUIREMENTTYPEPM" before insert or update on REQUIREMENTTYPEPM
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_REQUIREMENTTYPEPM" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_RESERVEDBUDGETLINE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_RESERVEDBUDGETLINE" before insert or update on RESERVEDBUDGETLINE
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_RESERVEDBUDGETLINE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_RESPONSIBILITY
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_RESPONSIBILITY" before insert or update on RESPONSIBILITY
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_RESPONSIBILITY" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_RNP
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_RNP" before insert or update on RNP
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_RNP" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_ROLEREGISTER
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_ROLEREGISTER" before insert or update on ROLEREGISTER
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_ROLEREGISTER" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_RPL
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_RPL" before insert or update on RPL
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_RPL" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_RPLOBJECT
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_RPLOBJECT" before insert or update on RPLOBJECT
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_RPLOBJECT" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_RPLRULE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_RPLRULE" before insert or update on RPLRULE
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_RPLRULE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_RPLSITE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_RPLSITE" before insert or update on RPLSITE
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_RPLSITE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_RPLTABLE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_RPLTABLE" before insert or update on RPLTABLE
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_RPLTABLE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_RPLTABLEPLUGIN
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_RPLTABLEPLUGIN" before insert or update on RPLTABLEPLUGIN
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_RPLTABLEPLUGIN" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_RULEREQUISITE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_RULEREQUISITE" before insert or update on RULEREQUISITE
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_RULEREQUISITE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_RULESCRIPT
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_RULESCRIPT" before insert or update on RULESCRIPT
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_RULESCRIPT" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_SCHEXPDOCS
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_SCHEXPDOCS" before insert or update on SCHEXPDOCS
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_SCHEXPDOCS" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_SCHPLAN
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_SCHPLAN" before insert or update on SCHPLAN
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_SCHPLAN" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_SCHTASK
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_SCHTASK" before insert or update on SCHTASK
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_SCHTASK" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_SERVERACTION
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_SERVERACTION" before insert or update on SERVERACTION
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_SERVERACTION" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_SERVERERROR
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_SERVERERROR" before insert or update on SERVERERROR
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_SERVERERROR" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_SERVERPROCESSOR
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_SERVERPROCESSOR" before insert or update on SERVERPROCESSOR
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_SERVERPROCESSOR" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_SERVERPROVIDER
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_SERVERPROVIDER" before insert or update on SERVERPROVIDER
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_SERVERPROVIDER" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_SIGNEXPORTLOG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_SIGNEXPORTLOG" before insert or update on SIGNEXPORTLOG
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_SIGNEXPORTLOG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_SIGNFORMAT
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_SIGNFORMAT" before insert or update on SIGNFORMAT
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_SIGNFORMAT" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_SIGNTYPE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_SIGNTYPE" before insert or update on SIGNTYPE
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_SIGNTYPE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_STATISTICSSOURCE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_STATISTICSSOURCE" before insert or update on STATISTICSSOURCE
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_STATISTICSSOURCE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_STOREDDOCUMENTS
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_STOREDDOCUMENTS" before insert or update on STOREDDOCUMENTS
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_STOREDDOCUMENTS" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_SUPPORTCRYPTOLIB
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_SUPPORTCRYPTOLIB" before insert or update on SUPPORTCRYPTOLIB
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_SUPPORTCRYPTOLIB" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_SUPPORTCRYPTOLIBFORMAT
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_SUPPORTCRYPTOLIBFORMAT" before insert or update on SUPPORTCRYPTOLIBFORMAT
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_SUPPORTCRYPTOLIBFORMAT" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_SUPPORTCRYPTOLIBPARAM
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_SUPPORTCRYPTOLIBPARAM" before insert or update on SUPPORTCRYPTOLIBPARAM
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_SUPPORTCRYPTOLIBPARAM" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_SYSEVENT
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_SYSEVENT" before insert or update on SYSEVENT
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_SYSEVENT" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_SYSPARAM
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_SYSPARAM" before insert or update on SYSPARAM
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_SYSPARAM" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_SYSRIGHT
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_SYSRIGHT" before insert or update on SYSRIGHT
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_SYSRIGHT" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_SYSUSER
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_SYSUSER" before insert or update on SYSUSER
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_SYSUSER" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_TASKJOURNAL
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_TASKJOURNAL" before insert or update on TASKJOURNAL
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_TASKJOURNAL" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_TENDER
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_TENDER" before insert or update on TENDER
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_TENDER" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_TENDERCRITERION
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_TENDERCRITERION" before insert or update on TENDERCRITERION
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_TENDERCRITERION" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_TENDERCRITERIONCHILD
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_TENDERCRITERIONCHILD" before insert or update on TENDERCRITERIONCHILD
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_TENDERCRITERIONCHILD" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_TENDERCRITERIONPM
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_TENDERCRITERIONPM" before insert or update on TENDERCRITERIONPM
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_TENDERCRITERIONPM" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_TENDERLINE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_TENDERLINE" before insert or update on TENDERLINE
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_TENDERLINE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_TENDERLINECOMM
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_TENDERLINECOMM" before insert or update on TENDERLINECOMM
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_TENDERLINECOMM" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_TERRITORY
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_TERRITORY" before insert or update on TERRITORY
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_TERRITORY" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_TERTYPE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_TERTYPE" before insert or update on TERTYPE
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_TERTYPE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_TYPEDOCREQGROUP
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_TYPEDOCREQGROUP" before insert or update on TYPEDOCREQGROUP
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_TYPEDOCREQGROUP" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_TYPEREQCRIT
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_TYPEREQCRIT" before insert or update on TYPEREQCRIT
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_TYPEREQCRIT" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_UNIT
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_UNIT" before insert or update on UNIT
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_UNIT" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_UPDPACKAGE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_UPDPACKAGE" before insert or update on UPDPACKAGE
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_UPDPACKAGE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_USERBUDGET
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_USERBUDGET" before insert or update on USERBUDGET
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_USERBUDGET" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_USERCERT
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_USERCERT" before insert or update on USERCERT
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_USERCERT" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_USERORG
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_USERORG" before insert or update on USERORG
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_USERORG" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_USERROLE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_USERROLE" before insert or update on USERROLE
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_USERROLE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_USERSESSION
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_USERSESSION" before insert or update on USERSESSION
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_USERSESSION" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_USESCRYPTOLIB
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_USESCRYPTOLIB" before insert or update on USESCRYPTOLIB
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_USESCRYPTOLIB" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_USESCRYPTOLIBPARAM
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_USESCRYPTOLIBPARAM" before insert or update on USESCRYPTOLIBPARAM
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_USESCRYPTOLIBPARAM" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_WEBSTATCACHE
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_WEBSTATCACHE" before insert or update on WEBSTATCACHE
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_WEBSTATCACHE" ENABLE;
--------------------------------------------------------
--  DDL for Trigger VER_WEBSTATCACHEVAL
--------------------------------------------------------

  CREATE OR REPLACE TRIGGER "GZVLG"."VER_WEBSTATCACHEVAL" before insert or update on WEBSTATCACHEVAL
FOR EACH ROW  WHEN (new.version IS NULL or (new.version <= old.version)) begin
    :new.version := coalesce(:old.version, 0) + 1;
end;
/
ALTER TRIGGER "GZVLG"."VER_WEBSTATCACHEVAL" ENABLE;
