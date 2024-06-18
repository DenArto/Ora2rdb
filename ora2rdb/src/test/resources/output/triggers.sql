--------------------------------------------------------
--  DDL for Trigger CHK_UQ_DOCREQ
--------------------------------------------------------

  CREATE EXCEPTION CUSTOM_EXCEPTION 'error';

SET TERM ^ ;

CREATE OR ALTER TRIGGER "CHK_UQ_DOCREQ" AFTER INSERT OR UPDATE
 ON DocReq  
AS

  DECLARE NumRows INTEGER;
  DECLARE idList NUMERIC(15);

 BEGIN
  SELECT COUNT(*)
  FROM DocReq WHERE Name = NEW.Name and PurchaseMode_Id = NEW.PurchaseMode_Id
  INTO :NumRows;
  IF ((:NumRows > 0)) THEN
  BEGIN
    SELECT Id
    FROM DocReq WHERE Name = NEW.Name and PurchaseMode_Id = NEW.PurchaseMode_Id
    INTO :idList;
    IF ((NEW.Id NOT IN (:idList))) THEN
      EXCEPTION CUSTOM_EXCEPTION( 'violation of PRIMARY or UNIQUE KEY constraint "UQ_DOCREQ"');
  END
COMMIT;
 END^

SET TERM ; ^


ALTER TRIGGER "CHK_UQ_DOCREQ" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger CHK_UQ_ESTIMATE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "CHK_UQ_ESTIMATE" after insert or update
 on ESTIMATE  
AS
 DECLARE numrows INTEGER;
 DECLARE idList numeric(15);

 BEGIN
  SELECT count(*)
  from ESTIMATE where CAPTION = NEW.CAPTION and FINYEAR = NEW.FINYEAR and BUDGET_ID = NEW.BUDGET_ID
  into :numrows;
  if ((:numrows > 0)) then
  BEGIN
    SELECT ID
    from ESTIMATE where CAPTION = NEW.CAPTION and FINYEAR = NEW.FINYEAR and BUDGET_ID = NEW.BUDGET_ID
    into :idList;
    if ((NEW.ID not in (:idList))) then
      EXCEPTION CUSTOM_EXCEPTION( 'violation of PRIMARY or UNIQUE KEY constraint "UQ_ESTIMATE"');
  END
COMMIT;
 END^

SET TERM ; ^


ALTER TRIGGER "CHK_UQ_ESTIMATE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger CHK_UQ_FINSRC
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "CHK_UQ_FINSRC" after insert or update
 on FINSRC  
AS
 DECLARE numrows INTEGER;
 DECLARE idList numeric(15);

 BEGIN
  SELECT count(*)
  from FINSRC where NAME = NEW.NAME and FINYEAR = NEW.FINYEAR
  into :numrows;
  if ((:numrows > 0)) then
  BEGIN
    SELECT ID
    from FINSRC where NAME = NEW.NAME and FINYEAR = NEW.FINYEAR
    into :idList;
    if ((NEW.ID not in (:idList))) then
      EXCEPTION CUSTOM_EXCEPTION( 'violation of PRIMARY or UNIQUE KEY constraint "UQ_FINSRC"');
  END
COMMIT;
 END^

SET TERM ; ^


ALTER TRIGGER "CHK_UQ_FINSRC" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger CHK_UQ_GROUPPROP_CAPTION
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "CHK_UQ_GROUPPROP_CAPTION" after insert or update
 on GROUPPROP  
AS
 DECLARE numrows INTEGER;
 DECLARE idList numeric(15);

 BEGIN
  SELECT count(*)
  from GROUPPROP where CAPTION = NEW.CAPTION and GROUP_ID = NEW.GROUP_ID
  into :numrows;
  if ((:numrows > 0)) then
  BEGIN
    SELECT ID
    from GROUPPROP where CAPTION = NEW.CAPTION and GROUP_ID = NEW.GROUP_ID
    into :idList;
    if ((NEW.ID not in (:idList))) then
      EXCEPTION CUSTOM_EXCEPTION( 'violation of PRIMARY or UNIQUE KEY constraint "UQ_GROUPPROP_CAPTION"');
  END
COMMIT;
 END^

SET TERM ; ^


ALTER TRIGGER "CHK_UQ_GROUPPROP_CAPTION" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger CHK_UQ_OFRGROUPPROP_CAPTION
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "CHK_UQ_OFRGROUPPROP_CAPTION" after insert or update
 on OFRGROUPPROP  
AS
 DECLARE numrows INTEGER;

 BEGIN
  SELECT count(*)
  from OFRGROUPPROP where CAPTION = NEW.CAPTION and OFFER_ID = NEW.OFFER_ID and GROUPCODE = NEW.GROUPCODE
  into :numrows;
  if ((:numrows > 0)) then
  EXCEPTION CUSTOM_EXCEPTION( 'violation of PRIMARY or UNIQUE KEY constraint "UQ_OFRGROUPPROP_CAPTION"');
COMMIT;
 END^

SET TERM ; ^


ALTER TRIGGER "CHK_UQ_OFRGROUPPROP_CAPTION" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger CHK_UQ_PAYCONDITION_NAME
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "CHK_UQ_PAYCONDITION_NAME" after insert or update
 on PAYCONDITION  
AS
 DECLARE numrows INTEGER;
 DECLARE idList numeric(15);

 BEGIN
  SELECT count(*)
  from PAYCONDITION where NAME = NEW.NAME
  into :numrows;
  if ((:numrows > 0)) then
  BEGIN
    SELECT ID
    from PAYCONDITION where NAME = NEW.NAME
    into :idList;
    if ((NEW.ID not in (:idList))) then
      EXCEPTION CUSTOM_EXCEPTION( 'violation of PRIMARY or UNIQUE KEY constraint "UQ_PAYCONDITION_NAME"');
  END
COMMIT;
 END^

SET TERM ; ^


ALTER TRIGGER "CHK_UQ_PAYCONDITION_NAME" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger CHK_UQ_PLGOODS
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "CHK_UQ_PLGOODS" after insert or update
 on PLGOODS  
AS
 DECLARE numrows INTEGER;
 DECLARE idList numeric(15);

 BEGIN
  SELECT count(*)
  from PLGOODS where NAME = NEW.NAME and UNIT = NEW.UNIT and PRICE = NEW.PRICE and GROUPCODE = NEW.GROUPCODE and ORGID = NEW.ORGID
  into :numrows;
  if ((:numrows > 0)) then
  BEGIN
    SELECT ID
    from PLGOODS where NAME = NEW.NAME and UNIT = NEW.UNIT and PRICE = NEW.PRICE and GROUPCODE = NEW.GROUPCODE and ORGID = NEW.ORGID
    into :idList;
    if ((NEW.ID not in (:idList))) then
      EXCEPTION CUSTOM_EXCEPTION( 'violation of PRIMARY or UNIQUE KEY constraint "UQ_PLGOODS"');
  END
COMMIT;
 END^

SET TERM ; ^


ALTER TRIGGER "CHK_UQ_PLGOODS" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger CHK_UQ_PROPTYPE_CAPTION
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "CHK_UQ_PROPTYPE_CAPTION" after insert or update
 on PROPTYPE  
AS
 DECLARE numrows INTEGER;
 DECLARE idList numeric(15);

 BEGIN
  SELECT count(*)
  from PROPTYPE where CAPTION = NEW.CAPTION
  into :numrows;
  if ((:numrows > 0)) then
  BEGIN
    SELECT ID
    from PROPTYPE where CAPTION = NEW.CAPTION
    into :idList;
    if ((NEW.ID not in (:idList))) then
      EXCEPTION CUSTOM_EXCEPTION( 'violation of PRIMARY or UNIQUE KEY constraint "UQ_PROPTYPE_CAPTION"');
  END
COMMIT;
 END^

SET TERM ; ^


ALTER TRIGGER "CHK_UQ_PROPTYPE_CAPTION" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger CHK_UQ_QUALREQ
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "CHK_UQ_QUALREQ" AFTER INSERT OR UPDATE
 ON QualReq  
AS

  DECLARE NumRows INTEGER;
  DECLARE idList NUMERIC(15);

 BEGIN
  SELECT COUNT(*)
  FROM QualReq WHERE Name = NEW.Name and PurchaseMode_Id = NEW.PurchaseMode_Id
  INTO :NumRows;
  IF ((:NumRows > 0)) THEN
  BEGIN
    SELECT Id
    FROM QualReq WHERE Name = NEW.Name and PurchaseMode_Id = NEW.PurchaseMode_Id
    INTO :idList;
    IF ((NEW.Id NOT IN (:idList))) THEN
      EXCEPTION CUSTOM_EXCEPTION( 'violation of PRIMARY or UNIQUE KEY constraint "UQ_QUALREQ"');
  END
COMMIT;
 END^

SET TERM ; ^


ALTER TRIGGER "CHK_UQ_QUALREQ" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger CHK_UQ_TYPEREQCRIT_NAME
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "CHK_UQ_TYPEREQCRIT_NAME" after insert or update
 on TYPEREQCRIT  
AS
 DECLARE numrows INTEGER;
 DECLARE idList numeric(15);

 BEGIN
  SELECT count(*)
  from TYPEREQCRIT where NAME = NEW.NAME and PurchaseMode_Id = NEW.PurchaseMode_Id
  into :numrows;
  if ((:numrows > 0)) then
  BEGIN
    SELECT ID
    from TYPEREQCRIT where NAME = NEW.NAME and PurchaseMode_Id = NEW.PurchaseMode_Id
    into :idList;
    if ((NEW.ID not in (:idList))) then
      EXCEPTION CUSTOM_EXCEPTION( 'violation of PRIMARY or UNIQUE KEY constraint "UQ_TYPEREQCRIT_NAME"');
  END
COMMIT;
 END^

SET TERM ; ^


ALTER TRIGGER "CHK_UQ_TYPEREQCRIT_NAME" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger COUNT_SIGN
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "COUNT_SIGN" 
after insert or update or delete on DigestSign  
AS

  DECLARE DocId NUMERIC(18,0);
  DECLARE OldDocId NUMERIC(18,0);
 BEGIN
  if ((inserting or updating)) then
    if ((new.SignType = 0)) then
      select dg.Document_id
      from Digest dg where dg.Id = new.Digest_id
      into :DocId;
    else
      select da.Document_id
      from DocAttachEx da where da.Id = new.DocAttachEx_id
      into :DocId;
  if ((updating or deleting)) then
    if ((old.SignType = 0)) then
      select dg.Document_id
      from Digest dg where dg.Id = old.Digest_id
      into :OldDocId;
    else
      OldDocId = GetDocIDForAttachID(old.DocAttachEx_id);
  if (inserting) then
    update Document d set d.Sign_cnt = d.Sign_cnt + 1 where d.Id = :DocId;
  ELSE IF (updating) then
    if ((:DocId <> :OldDocId)) then
    BEGIN
      update Document d set d.Sign_cnt = d.Sign_cnt + 1 where d.Id = :DocId;
      update Document d set d.Sign_cnt = d.Sign_cnt - 1 where d.Id = :OldDocId;
    END
  else
    update Document d set d.Sign_cnt = d.Sign_cnt - 1 where d.Id = :OldDocId;
 END^

SET TERM ; ^


ALTER TRIGGER "COUNT_SIGN" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger DEL_DOCATTACHEX
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "DEL_DOCATTACHEX" AFTER DELETE ON DOCATTACHEX  
AS

 BEGIN
  update document d set d.attach_cnt = d.attach_cnt - 1 
    where d.id=old.document_id;
 END^

SET TERM ; ^


ALTER TRIGGER "DEL_DOCATTACHEX" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger DELETE_DOCATTACH
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "DELETE_DOCATTACH" before delete on DOCATTACH  
AS

  DECLARE result numeric(18, 4);
  DECLARE TaskJournalId numeric(15,0);
 BEGIN
    result = old.version + 1;
  TaskJournalId = RPLTRANSACTION.get_task_journal_id; 
  if ((:TaskJournalId is not null)) then
    insert into RplVersionLog (Ver, Num_Transaction, RplTable_Id, TaskJournal_Id, Record_Id, Record_Action)
    values (:result, dbms_transaction.local_transaction_id, 49, :TaskJournalId, old.id, 2);
 END^

SET TERM ; ^

ALTER TRIGGER "DELETE_DOCATTACH" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger DELETE_DOCATTACHEX
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "DELETE_DOCATTACHEX" before delete on DOCATTACHEX  
AS

  DECLARE result numeric(18, 4);
  DECLARE TaskJournalId numeric(15,0);
 BEGIN
    result = old.version + 1;
  TaskJournalId = RPLTRANSACTION.get_task_journal_id; 
  if ((:TaskJournalId is not null)) then
    insert into RplVersionLog (Ver, Num_Transaction, RplTable_Id, TaskJournal_Id, Record_Id, Record_Action)
    values (:result, dbms_transaction.local_transaction_id, 2, :TaskJournalId, old.id, 2);
 END^

SET TERM ; ^

ALTER TRIGGER "DELETE_DOCATTACHEX" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger DELETE_MAILATTACH
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "DELETE_MAILATTACH" before delete on MAILATTACH  
AS

  DECLARE result numeric(18, 4);
  DECLARE TaskJournalId numeric(15,0);
 BEGIN
    result = old.version + 1;
  TaskJournalId = RPLTRANSACTION.get_task_journal_id; 
  if ((:TaskJournalId is not null)) then
    insert into RplVersionLog (Ver, Num_Transaction, RplTable_Id, TaskJournal_Id, Record_Id, Record_Action)
    values (:result, dbms_transaction.local_transaction_id, 66, :TaskJournalId, old.id, 2);
 END^

SET TERM ; ^

ALTER TRIGGER "DELETE_MAILATTACH" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger DELETE_REFATTACH
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "DELETE_REFATTACH" before delete on REFATTACH  
AS

  DECLARE result numeric(18, 4);
  DECLARE TaskJournalId numeric(15,0);
 BEGIN
    result = old.version + 1;
  TaskJournalId = RPLTRANSACTION.get_task_journal_id; 
  if ((:TaskJournalId is not null)) then
    insert into RplVersionLog (Ver, Num_Transaction, RplTable_Id, TaskJournal_Id, Record_Id, Record_Action)
    values (:result, dbms_transaction.local_transaction_id, 253, :TaskJournalId, old.id, 2);
 END^

SET TERM ; ^

ALTER TRIGGER "DELETE_REFATTACH" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger DLT_PLAN3PURCHASELINE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "DLT_PLAN3PURCHASELINE" before delete
 on PLAN3PURCHASELINE  
AS

 BEGIN
  update plan3purchasegoods g set g.plan3purchaselinepos=null
    where g.plan3purchasedoc_id=old.plan3purchasedoc_id and g.plan3purchaselinepos=old.pos;
 END^

SET TERM ; ^


ALTER TRIGGER "DLT_PLAN3PURCHASELINE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger INS_DOCATTACHEX
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "INS_DOCATTACHEX" AFTER INSERT ON DOCATTACHEX  
AS

 BEGIN
  update document d set d.attach_cnt = d.attach_cnt + 1 
    where d.id=new.document_id;
 END^

SET TERM ; ^


ALTER TRIGGER "INS_DOCATTACHEX" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger INS_GOODSGROUP_TREE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "INS_GOODSGROUP_TREE" after insert
 on goodsgroup /*referencing old as old new as new*/  
AS

 DECLARE vtree varchar(255);
 BEGIN
  begin
    select tree
    from goodsgroup_tree where group_id=new.parent_id
    into :vtree;
  exception
    when no_data_found then
      vtree = '/';
  end
  insert into goodsgroup_tree (group_id, tree)
    values(new.id, :vtree||new.code||'/');
 END^

SET TERM ; ^


ALTER TRIGGER "INS_GOODSGROUP_TREE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger INS_ISCONTRACTOR_ORGACCOUNT
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "INS_ISCONTRACTOR_ORGACCOUNT" 
 before insert or update on OrgAccount  
AS

 BEGIN
  if ((old.ORG_ID is null) or (old.ORG_ID<>new.ORG_ID)) then
    select o.IsContractor
    from Org o where o.ID=new.ORG_ID
    into new.IsContractor;
 END^

SET TERM ; ^


ALTER TRIGGER "INS_ISCONTRACTOR_ORGACCOUNT" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger INS_ORGCHILD
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "INS_ORGCHILD" AFTER INSERT
 ON org  
AS

 BEGIN
  IF ((NEW.parent_id IS NOT NULL AND NEW.parent_id <> NEW.id)) THEN
  BEGIN
    INSERT INTO orgchild(org_id, child_id)
      VALUES(NEW.parent_id, NEW.id);
    FOR cur IN (SELECT org_id FROM orgchild
                WHERE child_id = NEW.parent_id)
    DO
    BEGIN
      INSERT INTO orgchild(org_id, child_id)
         VALUES (cur.org_id, NEW.id);
    END
  END
 END^

SET TERM ; ^


ALTER TRIGGER "INS_ORGCHILD" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger INS_TER_TREE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "INS_TER_TREE" after insert
 on territory /*referencing old as old new as new*/  
AS

 DECLARE vtree varchar(255);
 DECLARE vpath varchar(512);
 BEGIN
  begin
    select tree, path
    from ter_tree where ter_id=new.parent_id
    into :vtree, :vpath;
    vpath = :vpath||', '||new.caption;
  exception
    when no_data_found then
      vtree = '/';
      vpath = new.caption;
  end
  insert into ter_tree (ter_id, tree, path)
    values (new.id, :vtree||new.code||'/', :vpath);
 END^

SET TERM ; ^


ALTER TRIGGER "INS_TER_TREE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$ABANDONEDREASON
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$ABANDONEDREASON" AFTER INSERT OR UPDATE OR DELETE ON ABANDONEDREASON /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 174;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$ABANDONEDREASON" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$ALTGOODSGROUP
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$ALTGOODSGROUP" AFTER INSERT OR UPDATE OR DELETE ON ALTGOODSGROUP /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 142;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$ALTGOODSGROUP" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$ALTGOODSGROUPTYPE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$ALTGOODSGROUPTYPE" AFTER INSERT OR UPDATE OR DELETE ON ALTGOODSGROUPTYPE /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 141;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$ALTGOODSGROUPTYPE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$ANYDATA
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$ANYDATA" AFTER INSERT OR UPDATE OR DELETE ON ANYDATA /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 43;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$ANYDATA" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$APPMODULE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$APPMODULE" AFTER INSERT OR UPDATE OR DELETE ON APPMODULE /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 98;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$APPMODULE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$APPOBJ
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$APPOBJ" AFTER INSERT OR UPDATE OR DELETE ON APPOBJ /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 99;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$APPOBJ" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$APPOBJPROP
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$APPOBJPROP" AFTER INSERT OR UPDATE OR DELETE ON APPOBJPROP /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 100;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$APPOBJPROP" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$APPOINTMENT
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$APPOINTMENT" AFTER INSERT OR UPDATE OR DELETE ON APPOINTMENT /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 256;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$APPOINTMENT" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$AUCTIONBID
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$AUCTIONBID" AFTER INSERT OR UPDATE OR DELETE ON AUCTIONBID /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 255;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$AUCTIONBID" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$AUCTIONLOG
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$AUCTIONLOG" AFTER INSERT OR UPDATE OR DELETE ON AUCTIONLOG /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 254;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$AUCTIONLOG" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$BANK
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$BANK" AFTER INSERT OR UPDATE OR DELETE ON BANK /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 36;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$BANK" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$BANKGUARANTEEDOC
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$BANKGUARANTEEDOC" AFTER INSERT OR UPDATE OR DELETE ON BANKGUARANTEEDOC /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 221;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$BANKGUARANTEEDOC" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$BANKGUARANTEEREFDOC
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$BANKGUARANTEEREFDOC" AFTER INSERT OR UPDATE OR DELETE ON BANKGUARANTEEREFDOC /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 222;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$BANKGUARANTEEREFDOC" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$BANKGUARANTEEREFREASON
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$BANKGUARANTEEREFREASON" AFTER INSERT OR UPDATE OR DELETE ON BANKGUARANTEEREFREASON /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 220;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$BANKGUARANTEEREFREASON" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$BUDGCODE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$BUDGCODE" AFTER INSERT OR UPDATE OR DELETE ON BUDGCODE /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 114;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, old.BUDGET_ID, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, new.BUDGET_ID, 0, 0, 0, 0);    if ((updating and not(1=1 and (new.BUDGET_ID=old.BUDGET_ID)))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, old.BUDGET_ID, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$BUDGCODE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$BUDGET
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$BUDGET" AFTER INSERT OR UPDATE OR DELETE ON BUDGET /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 80;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$BUDGET" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$BUDGETLINE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$BUDGETLINE" AFTER INSERT OR UPDATE OR DELETE ON BUDGETLINE /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 116;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, old.BUDGET_ID, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, new.BUDGET_ID, 0, 0, 0, 0);    if ((updating and not(1=1 and (new.BUDGET_ID=old.BUDGET_ID)))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, old.BUDGET_ID, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$BUDGETLINE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$BUDGETSTAGE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$BUDGETSTAGE" AFTER INSERT OR UPDATE OR DELETE ON BUDGETSTAGE /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 121;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$BUDGETSTAGE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$CACHELIST
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$CACHELIST" AFTER INSERT OR UPDATE OR DELETE ON CACHELIST /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 94;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$CACHELIST" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$CAVILDOC
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$CAVILDOC" AFTER INSERT OR UPDATE OR DELETE ON CAVILDOC /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 305;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$CAVILDOC" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$CAVILTYPE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$CAVILTYPE" AFTER INSERT OR UPDATE OR DELETE ON CAVILTYPE /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 304;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$CAVILTYPE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$CERTINTERCHANGEREQUEST
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$CERTINTERCHANGEREQUEST" AFTER INSERT OR UPDATE OR DELETE ON CERTINTERCHANGEREQUEST /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 258;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$CERTINTERCHANGEREQUEST" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$CERTREQUEST
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$CERTREQUEST" AFTER INSERT OR UPDATE OR DELETE ON CERTREQUEST /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 257;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$CERTREQUEST" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$CERTREVOKEREQUEST
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$CERTREVOKEREQUEST" AFTER INSERT OR UPDATE OR DELETE ON CERTREVOKEREQUEST /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 259;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$CERTREVOKEREQUEST" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$CLAIMDOC
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$CLAIMDOC" AFTER INSERT OR UPDATE OR DELETE ON CLAIMDOC /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 213;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, old.BUDGET_ID, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, new.BUDGET_ID, 0, 0, 0, 0);    if ((updating and not(1=1 and (new.BUDGET_ID=old.BUDGET_ID)))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, old.BUDGET_ID, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$CLAIMDOC" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$CLAIMPAYFACT
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$CLAIMPAYFACT" AFTER INSERT OR UPDATE OR DELETE ON CLAIMPAYFACT /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 214;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$CLAIMPAYFACT" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$CLAIMPENALTYCHANGEDOCINFO
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$CLAIMPENALTYCHANGEDOCINFO" AFTER INSERT OR UPDATE OR DELETE ON CLAIMPENALTYCHANGEDOCINFO /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 215;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$CLAIMPENALTYCHANGEDOCINFO" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$CLASSOPER
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$CLASSOPER" AFTER INSERT OR UPDATE OR DELETE ON CLASSOPER /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 21;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$CLASSOPER" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$CLIENTOBJECT
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$CLIENTOBJECT" AFTER INSERT OR UPDATE OR DELETE ON CLIENTOBJECT /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 39;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$CLIENTOBJECT" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$CLIENTOBJECTCOMMENTS
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$CLIENTOBJECTCOMMENTS" AFTER INSERT OR UPDATE OR DELETE ON CLIENTOBJECTCOMMENTS /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 83;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$CLIENTOBJECTCOMMENTS" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$CLNDDAY
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$CLNDDAY" AFTER INSERT OR UPDATE OR DELETE ON CLNDDAY /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 97;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$CLNDDAY" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$CLNDDAYTYPE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$CLNDDAYTYPE" AFTER INSERT OR UPDATE OR DELETE ON CLNDDAYTYPE /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 95;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$CLNDDAYTYPE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$CLNDTYPE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$CLNDTYPE" AFTER INSERT OR UPDATE OR DELETE ON CLNDTYPE /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 96;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$CLNDTYPE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$CODETYPE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$CODETYPE" AFTER INSERT OR UPDATE OR DELETE ON CODETYPE /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 113;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, old.BUDGET_ID, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, new.BUDGET_ID, 0, 0, 0, 0);    if ((updating and not(1=1 and (new.BUDGET_ID=old.BUDGET_ID)))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, old.BUDGET_ID, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$CODETYPE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$COMMEMBER
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$COMMEMBER" AFTER INSERT OR UPDATE OR DELETE ON COMMEMBER /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 244;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$COMMEMBER" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$COMMISSION
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$COMMISSION" AFTER INSERT OR UPDATE OR DELETE ON COMMISSION /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 243;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$COMMISSION" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$COMPLAINTDOC
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$COMPLAINTDOC" AFTER INSERT OR UPDATE OR DELETE ON COMPLAINTDOC /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 241;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, old.BUDGET_ID, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, new.BUDGET_ID, 0, 0, 0, 0);    if ((updating and not(1=1 and (new.BUDGET_ID=old.BUDGET_ID)))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, old.BUDGET_ID, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$COMPLAINTDOC" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$CONFCONCLUSIONCONTRACT
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$CONFCONCLUSIONCONTRACT" AFTER INSERT OR UPDATE OR DELETE ON CONFCONCLUSIONCONTRACT /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 281;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$CONFCONCLUSIONCONTRACT" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$CONPAYFACT
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$CONPAYFACT" AFTER INSERT OR UPDATE OR DELETE ON CONPAYFACT /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 179;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$CONPAYFACT" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$CONSOLIDDOC
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$CONSOLIDDOC" AFTER INSERT OR UPDATE OR DELETE ON CONSOLIDDOC /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 250;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, old.BUDGET_ID, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, new.BUDGET_ID, 0, 0, 0, 0);    if ((updating and not(1=1 and (new.BUDGET_ID=old.BUDGET_ID)))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, old.BUDGET_ID, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$CONSOLIDDOC" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$CONSTRUCTION
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$CONSTRUCTION" AFTER INSERT OR UPDATE OR DELETE ON CONSTRUCTION /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 177;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$CONSTRUCTION" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$CONTRACTCARDDOC
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$CONTRACTCARDDOC" AFTER INSERT OR UPDATE OR DELETE ON CONTRACTCARDDOC /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 198;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, old.BUDGET_ID, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, new.BUDGET_ID, 0, 0, 0, 0);    if ((updating and not(1=1 and (new.BUDGET_ID=old.BUDGET_ID)))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, old.BUDGET_ID, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$CONTRACTCARDDOC" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$CONTRACTDOC
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$CONTRACTDOC" AFTER INSERT OR UPDATE OR DELETE ON CONTRACTDOC /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 178;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, old.BUDGET_ID, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, new.BUDGET_ID, 0, 0, 0, 0);    if ((updating and not(1=1 and (new.BUDGET_ID=old.BUDGET_ID)))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, old.BUDGET_ID, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$CONTRACTDOC" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$CONTRACTEXECDOC
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$CONTRACTEXECDOC" AFTER INSERT OR UPDATE OR DELETE ON CONTRACTEXECDOC /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 180;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, old.BUDGET_ID, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, new.BUDGET_ID, 0, 0, 0, 0);    if ((updating and not(1=1 and (new.BUDGET_ID=old.BUDGET_ID)))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, old.BUDGET_ID, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$CONTRACTEXECDOC" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$CONTRACTREASON
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$CONTRACTREASON" AFTER INSERT OR UPDATE OR DELETE ON CONTRACTREASON /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 155;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$CONTRACTREASON" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$CONTRACTREASON_DOCLINES
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$CONTRACTREASON_DOCLINES" AFTER INSERT OR UPDATE OR DELETE ON CONTRACTREASON_DOCLINES /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 156;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$CONTRACTREASON_DOCLINES" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$CONTRACTTEMPLATEDOC
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$CONTRACTTEMPLATEDOC" AFTER INSERT OR UPDATE OR DELETE ON CONTRACTTEMPLATEDOC /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 203;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, old.BUDGET_ID, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, new.BUDGET_ID, 0, 0, 0, 0);    if ((updating and not(1=1 and (new.BUDGET_ID=old.BUDGET_ID)))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, old.BUDGET_ID, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$CONTRACTTEMPLATEDOC" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$CONTYPE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$CONTYPE" AFTER INSERT OR UPDATE OR DELETE ON CONTYPE /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 175;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$CONTYPE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$CONTYPEATTACH
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$CONTYPEATTACH" AFTER INSERT OR UPDATE OR DELETE ON CONTYPEATTACH /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 176;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$CONTYPEATTACH" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$COUNTRY
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$COUNTRY" AFTER INSERT OR UPDATE OR DELETE ON COUNTRY /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 145;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$COUNTRY" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$CRLFILE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$CRLFILE" AFTER INSERT OR UPDATE OR DELETE ON CRLFILE /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 268;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$CRLFILE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$CRLPOINT
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$CRLPOINT" AFTER INSERT OR UPDATE OR DELETE ON CRLPOINT /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 267;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$CRLPOINT" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$CURHISTORY
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$CURHISTORY" AFTER INSERT OR UPDATE OR DELETE ON CURHISTORY /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 149;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$CURHISTORY" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$CURRENCY
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$CURRENCY" AFTER INSERT OR UPDATE OR DELETE ON CURRENCY /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 148;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$CURRENCY" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$DATAOBJECTCHANGELOG
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$DATAOBJECTCHANGELOG" AFTER INSERT OR UPDATE OR DELETE ON DATAOBJECTCHANGELOG /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 381;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$DATAOBJECTCHANGELOG" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$DATASOURCE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$DATASOURCE" AFTER INSERT OR UPDATE OR DELETE ON DATASOURCE /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 87;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$DATASOURCE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$DBCONNECT
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$DBCONNECT" AFTER INSERT OR UPDATE OR DELETE ON DBCONNECT /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 52;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$DBCONNECT" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$DBCONSTRAINT
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$DBCONSTRAINT" AFTER INSERT OR UPDATE OR DELETE ON DBCONSTRAINT /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 13;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$DBCONSTRAINT" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$DECREASON
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$DECREASON" AFTER INSERT OR UPDATE OR DELETE ON DECREASON /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 82;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, old.BUDGET_ID, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, new.BUDGET_ID, 0, 0, 0, 0);    if ((updating and not(1=1 and (new.BUDGET_ID=old.BUDGET_ID)))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, old.BUDGET_ID, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$DECREASON" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$DELIVERYBASIS
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$DELIVERYBASIS" AFTER INSERT OR UPDATE OR DELETE ON DELIVERYBASIS /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 158;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$DELIVERYBASIS" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$DESCGROUP
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$DESCGROUP" AFTER INSERT OR UPDATE OR DELETE ON DESCGROUP /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 59;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$DESCGROUP" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$DESCRIPTION
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$DESCRIPTION" AFTER INSERT OR UPDATE OR DELETE ON DESCRIPTION /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 60;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, old.BUDGET_ID, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, new.BUDGET_ID, 0, 0, 0, 0);    if ((updating and not(1=1 and (new.BUDGET_ID=old.BUDGET_ID)))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, old.BUDGET_ID, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$DESCRIPTION" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$DESCRIPTIONCACHE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$DESCRIPTIONCACHE" AFTER INSERT OR UPDATE OR DELETE ON DESCRIPTIONCACHE /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 154;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$DESCRIPTIONCACHE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$DEVIATIONFACTFOUNDATION
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$DEVIATIONFACTFOUNDATION" AFTER INSERT OR UPDATE OR DELETE ON DEVIATIONFACTFOUNDATION /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 342;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$DEVIATIONFACTFOUNDATION" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$DIGEST
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$DIGEST" AFTER INSERT OR UPDATE OR DELETE ON DIGEST /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 72;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$DIGEST" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$DIGESTSIGN
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$DIGESTSIGN" AFTER INSERT OR UPDATE OR DELETE ON DIGESTSIGN /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 73;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$DIGESTSIGN" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$DISPSTATUS
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$DISPSTATUS" AFTER INSERT OR UPDATE OR DELETE ON DISPSTATUS /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 17;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$DISPSTATUS" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$DOCACTION
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$DOCACTION" AFTER INSERT OR UPDATE OR DELETE ON DOCACTION /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 22;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$DOCACTION" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$DOCATTACH
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$DOCATTACH" AFTER INSERT OR UPDATE OR DELETE ON DOCATTACH /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 49;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$DOCATTACH" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$DOCATTACHEX
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$DOCATTACHEX" AFTER INSERT OR UPDATE OR DELETE ON DOCATTACHEX /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 2;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$DOCATTACHEX" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$DOCCATEGORY
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$DOCCATEGORY" AFTER INSERT OR UPDATE OR DELETE ON DOCCATEGORY /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 67;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$DOCCATEGORY" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$DOCCLASS_DISPSTATUS
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$DOCCLASS_DISPSTATUS" AFTER INSERT OR UPDATE OR DELETE ON DOCCLASS_DISPSTATUS /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 55;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$DOCCLASS_DISPSTATUS" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$DOCCOMMENT
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$DOCCOMMENT" AFTER INSERT OR UPDATE OR DELETE ON DOCCOMMENT /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 53;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$DOCCOMMENT" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$DOCCUSTOMFIELDS
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$DOCCUSTOMFIELDS" AFTER INSERT OR UPDATE OR DELETE ON DOCCUSTOMFIELDS /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 54;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$DOCCUSTOMFIELDS" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$DOCDIGESTRULE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$DOCDIGESTRULE" AFTER INSERT OR UPDATE OR DELETE ON DOCDIGESTRULE /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 78;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$DOCDIGESTRULE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$DOCEVENT
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$DOCEVENT" AFTER INSERT OR UPDATE OR DELETE ON DOCEVENT /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 20;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$DOCEVENT" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$DOCEVERRLOG
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$DOCEVERRLOG" AFTER INSERT OR UPDATE OR DELETE ON DOCEVERRLOG /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 101;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$DOCEVERRLOG" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$DOCEXCHANGESCHEME
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$DOCEXCHANGESCHEME" AFTER INSERT OR UPDATE OR DELETE ON DOCEXCHANGESCHEME /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 63;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$DOCEXCHANGESCHEME" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$DOCFLAGCATEGORY
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$DOCFLAGCATEGORY" AFTER INSERT OR UPDATE OR DELETE ON DOCFLAGCATEGORY /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 119;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$DOCFLAGCATEGORY" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$DOCFLAGTYPE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$DOCFLAGTYPE" AFTER INSERT OR UPDATE OR DELETE ON DOCFLAGTYPE /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 120;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$DOCFLAGTYPE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$DOCGROUP
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$DOCGROUP" AFTER INSERT OR UPDATE OR DELETE ON DOCGROUP /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 24;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$DOCGROUP" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$DOCREQ
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$DOCREQ" AFTER INSERT OR UPDATE OR DELETE ON DOCREQ /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 247;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$DOCREQ" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$DOCRETENTION
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$DOCRETENTION" AFTER INSERT OR UPDATE OR DELETE ON DOCRETENTION /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 68;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$DOCRETENTION" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$DOCRETENTIONSTATITEMS
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$DOCRETENTIONSTATITEMS" AFTER INSERT OR UPDATE OR DELETE ON DOCRETENTIONSTATITEMS /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 91;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$DOCRETENTIONSTATITEMS" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$DOCRETENTIONSTATUS
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$DOCRETENTIONSTATUS" AFTER INSERT OR UPDATE OR DELETE ON DOCRETENTIONSTATUS /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 90;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$DOCRETENTIONSTATUS" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$DOCSTATUS
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$DOCSTATUS" AFTER INSERT OR UPDATE OR DELETE ON DOCSTATUS /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 19;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$DOCSTATUS" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$DOCUMENT
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$DOCUMENT" AFTER INSERT OR UPDATE OR DELETE ON DOCUMENT /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 23;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, old.BUDGET_ID, old.DOCUMENTCLASS_ID, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, new.BUDGET_ID, new.DOCUMENTCLASS_ID, 0, 0, 0);    if ((updating and not(1=1 and (new.BUDGET_ID=old.BUDGET_ID)and (new.DOCUMENTCLASS_ID=old.DOCUMENTCLASS_ID)))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, old.BUDGET_ID, old.DOCUMENTCLASS_ID, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$DOCUMENT" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$DOCUMENTCLASS
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$DOCUMENTCLASS" AFTER INSERT OR UPDATE OR DELETE ON DOCUMENTCLASS /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 18;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$DOCUMENTCLASS" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$DOCUMENTREPORTS
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$DOCUMENTREPORTS" AFTER INSERT OR UPDATE OR DELETE ON DOCUMENTREPORTS /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 58;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$DOCUMENTREPORTS" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$DOMEN
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$DOMEN" AFTER INSERT OR UPDATE OR DELETE ON DOMEN /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 108;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$DOMEN" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$EQUALITY
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$EQUALITY" AFTER INSERT OR UPDATE OR DELETE ON EQUALITY /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 218;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$EQUALITY" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$EQUALITYCODES
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$EQUALITYCODES" AFTER INSERT OR UPDATE OR DELETE ON EQUALITYCODES /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 219;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$EQUALITYCODES" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$ESCHECKRULE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$ESCHECKRULE" AFTER INSERT OR UPDATE OR DELETE ON ESCHECKRULE /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 79;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$ESCHECKRULE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$ESTIMATE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$ESTIMATE" AFTER INSERT OR UPDATE OR DELETE ON ESTIMATE /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 115;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, old.BUDGET_ID, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, new.BUDGET_ID, 0, 0, 0, 0);    if ((updating and not(1=1 and (new.BUDGET_ID=old.BUDGET_ID)))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, old.BUDGET_ID, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$ESTIMATE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$ETP
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$ETP" AFTER INSERT OR UPDATE OR DELETE ON ETP /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 194;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$ETP" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$ETPATTACH
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$ETPATTACH" AFTER INSERT OR UPDATE OR DELETE ON ETPATTACH /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 197;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$ETPATTACH" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$ETPTYPE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$ETPTYPE" AFTER INSERT OR UPDATE OR DELETE ON ETPTYPE /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 193;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$ETPTYPE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$FACTDOC
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$FACTDOC" AFTER INSERT OR UPDATE OR DELETE ON FACTDOC /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 226;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, old.BUDGET_ID, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, new.BUDGET_ID, 0, 0, 0, 0);    if ((updating and not(1=1 and (new.BUDGET_ID=old.BUDGET_ID)))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, old.BUDGET_ID, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$FACTDOC" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$FACTDOCTYPE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$FACTDOCTYPE" AFTER INSERT OR UPDATE OR DELETE ON FACTDOCTYPE /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 225;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$FACTDOCTYPE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$FETCHMODE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$FETCHMODE" AFTER INSERT OR UPDATE OR DELETE ON FETCHMODE /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 303;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$FETCHMODE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$FGROUP
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$FGROUP" AFTER INSERT OR UPDATE OR DELETE ON FGROUP /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 70;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$FGROUP" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$FGROUPATTACH
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$FGROUPATTACH" AFTER INSERT OR UPDATE OR DELETE ON FGROUPATTACH /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 71;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$FGROUPATTACH" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$FGROUPHEADER
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$FGROUPHEADER" AFTER INSERT OR UPDATE OR DELETE ON FGROUPHEADER /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 69;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$FGROUPHEADER" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$FINSRC
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$FINSRC" AFTER INSERT OR UPDATE OR DELETE ON FINSRC /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 117;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$FINSRC" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$FINSRCSATISFY
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$FINSRCSATISFY" AFTER INSERT OR UPDATE OR DELETE ON FINSRCSATISFY /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 341;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$FINSRCSATISFY" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$FORMATCONVERTER
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$FORMATCONVERTER" AFTER INSERT OR UPDATE OR DELETE ON FORMATCONVERTER /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 382;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$FORMATCONVERTER" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$FUNCAT
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$FUNCAT" AFTER INSERT OR UPDATE OR DELETE ON FUNCAT /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 47;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$FUNCAT" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$FUNUNIT
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$FUNUNIT" AFTER INSERT OR UPDATE OR DELETE ON FUNUNIT /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 5;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$FUNUNIT" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$GCREGISTER
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$GCREGISTER" AFTER INSERT OR UPDATE OR DELETE ON GCREGISTER /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 118;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$GCREGISTER" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$GOODS
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$GOODS" AFTER INSERT OR UPDATE OR DELETE ON GOODS /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 137;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$GOODS" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$GOODSBAN
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$GOODSBAN" AFTER INSERT OR UPDATE OR DELETE ON GOODSBAN /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 384;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$GOODSBAN" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$GOODSBANGOODSOKPD
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$GOODSBANGOODSOKPD" AFTER INSERT OR UPDATE OR DELETE ON GOODSBANGOODSOKPD /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 386;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$GOODSBANGOODSOKPD" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$GOODSBANPURCHASEMODE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$GOODSBANPURCHASEMODE" AFTER INSERT OR UPDATE OR DELETE ON GOODSBANPURCHASEMODE /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 385;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$GOODSBANPURCHASEMODE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$GOODSBRANCH
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$GOODSBRANCH" AFTER INSERT OR UPDATE OR DELETE ON GOODSBRANCH /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 195;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$GOODSBRANCH" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$GOODSGROUP
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$GOODSGROUP" AFTER INSERT OR UPDATE OR DELETE ON GOODSGROUP /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 135;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$GOODSGROUP" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$GOODSGROUPDOCDETAIL
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$GOODSGROUPDOCDETAIL" AFTER INSERT OR UPDATE OR DELETE ON GOODSGROUPDOCDETAIL /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 140;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$GOODSGROUPDOCDETAIL" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$GOODSGROUPPURCHASEMODE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$GOODSGROUPPURCHASEMODE" AFTER INSERT OR UPDATE OR DELETE ON GOODSGROUPPURCHASEMODE /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 162;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$GOODSGROUPPURCHASEMODE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$GOODSOKDP
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$GOODSOKDP" AFTER INSERT OR UPDATE OR DELETE ON GOODSOKDP /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 133;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$GOODSOKDP" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$GOODSOKDPCOUNTRYPREF
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$GOODSOKDPCOUNTRYPREF" AFTER INSERT OR UPDATE OR DELETE ON GOODSOKDPCOUNTRYPREF /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 168;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$GOODSOKDPCOUNTRYPREF" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$GOODSOKDPPURCHASEMODE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$GOODSOKDPPURCHASEMODE" AFTER INSERT OR UPDATE OR DELETE ON GOODSOKDPPURCHASEMODE /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 167;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$GOODSOKDPPURCHASEMODE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$GOODSOKPD
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$GOODSOKPD" AFTER INSERT OR UPDATE OR DELETE ON GOODSOKPD /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 134;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$GOODSOKPD" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$GOODSOKPDCOUNTRYPREF
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$GOODSOKPDCOUNTRYPREF" AFTER INSERT OR UPDATE OR DELETE ON GOODSOKPDCOUNTRYPREF /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 170;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$GOODSOKPDCOUNTRYPREF" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$GOODSOKPDPURCHASEMODE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$GOODSOKPDPURCHASEMODE" AFTER INSERT OR UPDATE OR DELETE ON GOODSOKPDPURCHASEMODE /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 169;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$GOODSOKPDPURCHASEMODE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$GOODSOKVED
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$GOODSOKVED" AFTER INSERT OR UPDATE OR DELETE ON GOODSOKVED /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 132;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$GOODSOKVED" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$GOODSPRICE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$GOODSPRICE" AFTER INSERT OR UPDATE OR DELETE ON GOODSPRICE /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 138;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$GOODSPRICE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$GRANTINVESTMENT
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$GRANTINVESTMENT" AFTER INSERT OR UPDATE OR DELETE ON GRANTINVESTMENT /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 128;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$GRANTINVESTMENT" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$GROUPPROP
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$GROUPPROP" AFTER INSERT OR UPDATE OR DELETE ON GROUPPROP /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 136;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$GROUPPROP" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$HISTORYMODIFY
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$HISTORYMODIFY" AFTER INSERT OR UPDATE OR DELETE ON HISTORYMODIFY /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 102;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$HISTORYMODIFY" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$INDUSTRYCODE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$INDUSTRYCODE" AFTER INSERT OR UPDATE OR DELETE ON INDUSTRYCODE /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 127;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$INDUSTRYCODE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$INSTITUTIONLINE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$INSTITUTIONLINE" AFTER INSERT OR UPDATE OR DELETE ON INSTITUTIONLINE /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 129;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, old.BUDGET_ID, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, new.BUDGET_ID, 0, 0, 0, 0);    if ((updating and not(1=1 and (new.BUDGET_ID=old.BUDGET_ID)))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, old.BUDGET_ID, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$INSTITUTIONLINE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$INTERBUDGET
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$INTERBUDGET" AFTER INSERT OR UPDATE OR DELETE ON INTERBUDGET /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 112;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$INTERBUDGET" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$INVOICEDOC
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$INVOICEDOC" AFTER INSERT OR UPDATE OR DELETE ON INVOICEDOC /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 184;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, old.BUDGET_ID, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, new.BUDGET_ID, 0, 0, 0, 0);    if ((updating and not(1=1 and (new.BUDGET_ID=old.BUDGET_ID)))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, old.BUDGET_ID, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$INVOICEDOC" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$JAVACLASS
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$JAVACLASS" AFTER INSERT OR UPDATE OR DELETE ON JAVACLASS /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 25;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$JAVACLASS" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$KBKLINEFIT
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$KBKLINEFIT" AFTER INSERT OR UPDATE OR DELETE ON KBKLINEFIT /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 126;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$KBKLINEFIT" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$KLADR
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$KLADR" AFTER INSERT OR UPDATE OR DELETE ON KLADR /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 387;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$KLADR" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$KLADRSTREET
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$KLADRSTREET" AFTER INSERT OR UPDATE OR DELETE ON KLADRSTREET /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 388;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$KLADRSTREET" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$LEDGER
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$LEDGER" AFTER INSERT OR UPDATE OR DELETE ON LEDGER /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 217;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, old.BUDGET_ID, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, new.BUDGET_ID, 0, 0, 0, 0);    if ((updating and not(1=1 and (new.BUDGET_ID=old.BUDGET_ID)))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, old.BUDGET_ID, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$LEDGER" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$LIABILITYCREDENTIAL
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$LIABILITYCREDENTIAL" AFTER INSERT OR UPDATE OR DELETE ON LIABILITYCREDENTIAL /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 123;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$LIABILITYCREDENTIAL" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$LIABILITYEXPENSE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$LIABILITYEXPENSE" AFTER INSERT OR UPDATE OR DELETE ON LIABILITYEXPENSE /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 124;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$LIABILITYEXPENSE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$LIABILITYEXPENSE_DOCLINES
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$LIABILITYEXPENSE_DOCLINES" AFTER INSERT OR UPDATE OR DELETE ON LIABILITYEXPENSE_DOCLINES /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 125;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$LIABILITYEXPENSE_DOCLINES" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$LIABILITYGROUP
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$LIABILITYGROUP" AFTER INSERT OR UPDATE OR DELETE ON LIABILITYGROUP /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 122;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$LIABILITYGROUP" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$LICTYPE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$LICTYPE" AFTER INSERT OR UPDATE OR DELETE ON LICTYPE /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 34;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$LICTYPE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$MAIL
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$MAIL" AFTER INSERT OR UPDATE OR DELETE ON MAIL /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 65;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$MAIL" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$MAILATTACH
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$MAILATTACH" AFTER INSERT OR UPDATE OR DELETE ON MAILATTACH /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 66;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$MAILATTACH" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$MAILRECEIVERGROUP
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$MAILRECEIVERGROUP" AFTER INSERT OR UPDATE OR DELETE ON MAILRECEIVERGROUP /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 309;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$MAILRECEIVERGROUP" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$MAILRECEIVERGROUP_RECEIVER
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$MAILRECEIVERGROUP_RECEIVER" AFTER INSERT OR UPDATE OR DELETE ON MAILRECEIVERGROUP_RECEIVER /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 310;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$MAILRECEIVERGROUP_RECEIVER" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$MENU
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$MENU" AFTER INSERT OR UPDATE OR DELETE ON MENU /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 40;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$MENU" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$MENUITEM
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$MENUITEM" AFTER INSERT OR UPDATE OR DELETE ON MENUITEM /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 41;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, old.MENU_ID, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, new.MENU_ID, 0, 0, 0, 0);    if ((updating and not(1=1 and (new.MENU_ID=old.MENU_ID)))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, old.MENU_ID, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$MENUITEM" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$MENUITEMWEB
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$MENUITEMWEB" AFTER INSERT OR UPDATE OR DELETE ON MENUITEMWEB /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 110;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, old.MENU_ID, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, new.MENU_ID, 0, 0, 0, 0);    if ((updating and not(1=1 and (new.MENU_ID=old.MENU_ID)))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, old.MENU_ID, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$MENUITEMWEB" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$METACONSTRAINT
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$METACONSTRAINT" AFTER INSERT OR UPDATE OR DELETE ON METACONSTRAINT /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 92;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$METACONSTRAINT" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$METAOBJECT
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$METAOBJECT" AFTER INSERT OR UPDATE OR DELETE ON METAOBJECT /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 93;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$METAOBJECT" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$MSG
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$MSG" AFTER INSERT OR UPDATE OR DELETE ON MSG /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 29;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$MSG" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$MSGLINKTYPE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$MSGLINKTYPE" AFTER INSERT OR UPDATE OR DELETE ON MSGLINKTYPE /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 27;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$MSGLINKTYPE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$MSGQUEUE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$MSGQUEUE" AFTER INSERT OR UPDATE OR DELETE ON MSGQUEUE /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 30;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$MSGQUEUE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$MSGSITE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$MSGSITE" AFTER INSERT OR UPDATE OR DELETE ON MSGSITE /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 28;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$MSGSITE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$NECESSITY
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$NECESSITY" AFTER INSERT OR UPDATE OR DELETE ON NECESSITY /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 183;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$NECESSITY" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$NOTICEDOC
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$NOTICEDOC" AFTER INSERT OR UPDATE OR DELETE ON NOTICEDOC /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 239;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, old.BUDGET_ID, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, new.BUDGET_ID, 0, 0, 0, 0);    if ((updating and not(1=1 and (new.BUDGET_ID=old.BUDGET_ID)))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, old.BUDGET_ID, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$NOTICEDOC" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$NOTICEEMAILORG
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$NOTICEEMAILORG" AFTER INSERT OR UPDATE OR DELETE ON NOTICEEMAILORG /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 240;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$NOTICEEMAILORG" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$NOTIFYMSG
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$NOTIFYMSG" AFTER INSERT OR UPDATE OR DELETE ON NOTIFYMSG /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 106;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$NOTIFYMSG" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$NOTIFYMSGEVENT
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$NOTIFYMSGEVENT" AFTER INSERT OR UPDATE OR DELETE ON NOTIFYMSGEVENT /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 105;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$NOTIFYMSGEVENT" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$NOTIFYMSGGROUP
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$NOTIFYMSGGROUP" AFTER INSERT OR UPDATE OR DELETE ON NOTIFYMSGGROUP /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 104;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$NOTIFYMSGGROUP" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$NOTIFYMSGRULE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$NOTIFYMSGRULE" AFTER INSERT OR UPDATE OR DELETE ON NOTIFYMSGRULE /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 107;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$NOTIFYMSGRULE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$NUMGENERATOR
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$NUMGENERATOR" AFTER INSERT OR UPDATE OR DELETE ON NUMGENERATOR /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 15;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$NUMGENERATOR" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$NUMPREFIX
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$NUMPREFIX" AFTER INSERT OR UPDATE OR DELETE ON NUMPREFIX /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 88;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$NUMPREFIX" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$NUMSEQUENCE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$NUMSEQUENCE" AFTER INSERT OR UPDATE OR DELETE ON NUMSEQUENCE /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 14;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$NUMSEQUENCE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$OFFERDOC
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$OFFERDOC" AFTER INSERT OR UPDATE OR DELETE ON OFFERDOC /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 224;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, old.BUDGET_ID, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, new.BUDGET_ID, 0, 0, 0, 0);    if ((updating and not(1=1 and (new.BUDGET_ID=old.BUDGET_ID)))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, old.BUDGET_ID, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$OFFERDOC" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$OFRREQREASON
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$OFRREQREASON" AFTER INSERT OR UPDATE OR DELETE ON OFRREQREASON /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 157;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$OFRREQREASON" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$OFRRETREASON
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$OFRRETREASON" AFTER INSERT OR UPDATE OR DELETE ON OFRRETREASON /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 223;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$OFRRETREASON" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$OIDREF
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$OIDREF" AFTER INSERT OR UPDATE OR DELETE ON OIDREF /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 77;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$OIDREF" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$OKTMO
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$OKTMO" AFTER INSERT OR UPDATE OR DELETE ON OKTMO /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 383;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$OKTMO" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$OLAPQUERY
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$OLAPQUERY" AFTER INSERT OR UPDATE OR DELETE ON OLAPQUERY /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 269;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$OLAPQUERY" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$OOSORGROLE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$OOSORGROLE" AFTER INSERT OR UPDATE OR DELETE ON OOSORGROLE /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 151;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$OOSORGROLE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$OOS223PURCHASENOTICEINFO
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$OOS223PURCHASENOTICEINFO" AFTER INSERT OR UPDATE OR DELETE ON OOS223PURCHASENOTICEINFO /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 389;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$OOS223PURCHASENOTICEINFO" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$OOS223PURCHNOTICELOTINFO
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$OOS223PURCHNOTICELOTINFO" AFTER INSERT OR UPDATE OR DELETE ON OOS223PURCHNOTICELOTINFO /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 390;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$OOS223PURCHNOTICELOTINFO" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$OPERTYPE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$OPERTYPE" AFTER INSERT OR UPDATE OR DELETE ON OPERTYPE /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 16;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$OPERTYPE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$ORDERDOC
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$ORDERDOC" AFTER INSERT OR UPDATE OR DELETE ON ORDERDOC /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 171;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, old.BUDGET_ID, old.DOCUMENTCLASS_ID, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, new.BUDGET_ID, new.DOCUMENTCLASS_ID, 0, 0, 0);    if ((updating and not(1=1 and (new.BUDGET_ID=old.BUDGET_ID)and (new.DOCUMENTCLASS_ID=old.DOCUMENTCLASS_ID)))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, old.BUDGET_ID, old.DOCUMENTCLASS_ID, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$ORDERDOC" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$ORDERSUMMARY
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$ORDERSUMMARY" AFTER INSERT OR UPDATE OR DELETE ON ORDERSUMMARY /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 173;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$ORDERSUMMARY" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$ORG
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$ORG" AFTER INSERT OR UPDATE OR DELETE ON ORG /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 33;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, old.ISCONTRACTOR, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, new.ISCONTRACTOR, 0, 0, 0, 0);    if ((updating and not(1=1 and (new.ISCONTRACTOR=old.ISCONTRACTOR)))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, old.ISCONTRACTOR, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$ORG" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$ORGACCOUNT
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$ORGACCOUNT" AFTER INSERT OR UPDATE OR DELETE ON ORGACCOUNT /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 38;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, old.ISCONTRACTOR, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, new.ISCONTRACTOR, 0, 0, 0, 0);    if ((updating and not(1=1 and (new.ISCONTRACTOR=old.ISCONTRACTOR)))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, old.ISCONTRACTOR, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$ORGACCOUNT" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$ORGACCTYPE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$ORGACCTYPE" AFTER INSERT OR UPDATE OR DELETE ON ORGACCTYPE /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 37;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$ORGACCTYPE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$ORGADDKPP
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$ORGADDKPP" AFTER INSERT OR UPDATE OR DELETE ON ORGADDKPP /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 391;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$ORGADDKPP" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$ORGCONCCONT
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$ORGCONCCONT" AFTER INSERT OR UPDATE OR DELETE ON ORGCONCCONT /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 152;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$ORGCONCCONT" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$ORGETP
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$ORGETP" AFTER INSERT OR UPDATE OR DELETE ON ORGETP /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 196;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$ORGETP" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$ORGFORM
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$ORGFORM" AFTER INSERT OR UPDATE OR DELETE ON ORGFORM /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 150;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$ORGFORM" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$ORGOOS223FZUSER
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$ORGOOS223FZUSER" AFTER INSERT OR UPDATE OR DELETE ON ORGOOS223FZUSER /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 321;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$ORGOOS223FZUSER" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$ORGROLE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$ORGROLE" AFTER INSERT OR UPDATE OR DELETE ON ORGROLE /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 35;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$ORGROLE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$ORGSTATUS
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$ORGSTATUS" AFTER INSERT OR UPDATE OR DELETE ON ORGSTATUS /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 143;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$ORGSTATUS" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$ORGUNFAIR
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$ORGUNFAIR" AFTER INSERT OR UPDATE OR DELETE ON ORGUNFAIR /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 144;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$ORGUNFAIR" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$PACKTYPE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$PACKTYPE" AFTER INSERT OR UPDATE OR DELETE ON PACKTYPE /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 139;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$PACKTYPE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$PANEL
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$PANEL" AFTER INSERT OR UPDATE OR DELETE ON PANEL /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 61;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$PANEL" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$PANELITEM
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$PANELITEM" AFTER INSERT OR UPDATE OR DELETE ON PANELITEM /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 62;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, old.PANEL_ID, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, new.PANEL_ID, 0, 0, 0, 0);    if ((updating and not(1=1 and (new.PANEL_ID=old.PANEL_ID)))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, old.PANEL_ID, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$PANELITEM" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$PAYCONDITION
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$PAYCONDITION" AFTER INSERT OR UPDATE OR DELETE ON PAYCONDITION /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 182;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$PAYCONDITION" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$PERSON
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$PERSON" AFTER INSERT OR UPDATE OR DELETE ON PERSON /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 103;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$PERSON" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$PERSONAL
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$PERSONAL" AFTER INSERT OR UPDATE OR DELETE ON PERSONAL /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 242;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$PERSONAL" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$PLACEMENTFEATURE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$PLACEMENTFEATURE" AFTER INSERT OR UPDATE OR DELETE ON PLACEMENTFEATURE /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 163;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$PLACEMENTFEATURE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$PLACEMENTFEATUREPM
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$PLACEMENTFEATUREPM" AFTER INSERT OR UPDATE OR DELETE ON PLACEMENTFEATUREPM /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 164;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$PLACEMENTFEATUREPM" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$PLACINGWAY
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$PLACINGWAY" AFTER INSERT OR UPDATE OR DELETE ON PLACINGWAY /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 160;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$PLACINGWAY" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$PLANDOC
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$PLANDOC" AFTER INSERT OR UPDATE OR DELETE ON PLANDOC /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 235;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, old.BUDGET_ID, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, new.BUDGET_ID, 0, 0, 0, 0);    if ((updating and not(1=1 and (new.BUDGET_ID=old.BUDGET_ID)))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, old.BUDGET_ID, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$PLANDOC" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$PLANPOSITIONCHANGEREASON
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$PLANPOSITIONCHANGEREASON" AFTER INSERT OR UPDATE OR DELETE ON PLANPOSITIONCHANGEREASON /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 199;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$PLANPOSITIONCHANGEREASON" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$PLAN2ARRANGEMENT
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$PLAN2ARRANGEMENT" AFTER INSERT OR UPDATE OR DELETE ON PLAN2ARRANGEMENT /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 202;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$PLAN2ARRANGEMENT" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$PLAN2CHANGEREASON
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$PLAN2CHANGEREASON" AFTER INSERT OR UPDATE OR DELETE ON PLAN2CHANGEREASON /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 212;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$PLAN2CHANGEREASON" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$PLAN2DOC
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$PLAN2DOC" AFTER INSERT OR UPDATE OR DELETE ON PLAN2DOC /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 200;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, old.BUDGET_ID, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, new.BUDGET_ID, 0, 0, 0, 0);    if ((updating and not(1=1 and (new.BUDGET_ID=old.BUDGET_ID)))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, old.BUDGET_ID, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$PLAN2DOC" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$PLAN2GOODS
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$PLAN2GOODS" AFTER INSERT OR UPDATE OR DELETE ON PLAN2GOODS /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 201;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$PLAN2GOODS" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$PLAN2LEDGER
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$PLAN2LEDGER" AFTER INSERT OR UPDATE OR DELETE ON PLAN2LEDGER /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 204;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$PLAN2LEDGER" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$PLAN2OOSEXTNUMBER
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$PLAN2OOSEXTNUMBER" AFTER INSERT OR UPDATE OR DELETE ON PLAN2OOSEXTNUMBER /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 211;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$PLAN2OOSEXTNUMBER" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$PLAN2OOSFEATURE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$PLAN2OOSFEATURE" AFTER INSERT OR UPDATE OR DELETE ON PLAN2OOSFEATURE /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 210;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$PLAN2OOSFEATURE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$PLAN2OOSKBK
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$PLAN2OOSKBK" AFTER INSERT OR UPDATE OR DELETE ON PLAN2OOSKBK /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 207;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$PLAN2OOSKBK" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$PLAN2OOSKBKYEAR
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$PLAN2OOSKBKYEAR" AFTER INSERT OR UPDATE OR DELETE ON PLAN2OOSKBKYEAR /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 208;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$PLAN2OOSKBKYEAR" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$PLAN2OOSOKVED
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$PLAN2OOSOKVED" AFTER INSERT OR UPDATE OR DELETE ON PLAN2OOSOKVED /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 206;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$PLAN2OOSOKVED" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$PLAN2OOSPOSITION
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$PLAN2OOSPOSITION" AFTER INSERT OR UPDATE OR DELETE ON PLAN2OOSPOSITION /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 205;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$PLAN2OOSPOSITION" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$PLAN2OOSPRODUCT
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$PLAN2OOSPRODUCT" AFTER INSERT OR UPDATE OR DELETE ON PLAN2OOSPRODUCT /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 209;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$PLAN2OOSPRODUCT" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$PLAN3DOC
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$PLAN3DOC" AFTER INSERT OR UPDATE OR DELETE ON PLAN3DOC /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 252;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, old.BUDGET_ID, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, new.BUDGET_ID, 0, 0, 0, 0);    if ((updating and not(1=1 and (new.BUDGET_ID=old.BUDGET_ID)))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, old.BUDGET_ID, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$PLAN3DOC" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$PLAN3PURCHASEDOC
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$PLAN3PURCHASEDOC" AFTER INSERT OR UPDATE OR DELETE ON PLAN3PURCHASEDOC /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 251;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, old.BUDGET_ID, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, new.BUDGET_ID, 0, 0, 0, 0);    if ((updating and not(1=1 and (new.BUDGET_ID=old.BUDGET_ID)))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, old.BUDGET_ID, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$PLAN3PURCHASEDOC" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$PREFERENCEGROUP
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$PREFERENCEGROUP" AFTER INSERT OR UPDATE OR DELETE ON PREFERENCEGROUP /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 165;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$PREFERENCEGROUP" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$PREFERENCEGROUPFEATURE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$PREFERENCEGROUPFEATURE" AFTER INSERT OR UPDATE OR DELETE ON PREFERENCEGROUPFEATURE /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 166;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$PREFERENCEGROUPFEATURE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$PROCTREE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$PROCTREE" AFTER INSERT OR UPDATE OR DELETE ON PROCTREE /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 26;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$PROCTREE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$PROCUREMENT
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$PROCUREMENT" AFTER INSERT OR UPDATE OR DELETE ON PROCUREMENT /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 401;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$PROCUREMENT" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$PROPTYPE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$PROPTYPE" AFTER INSERT OR UPDATE OR DELETE ON PROPTYPE /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 131;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$PROPTYPE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$PURCHASECARRY
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$PURCHASECARRY" AFTER INSERT OR UPDATE OR DELETE ON PURCHASECARRY /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 237;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$PURCHASECARRY" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$PURCHASEMETHOD
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$PURCHASEMETHOD" AFTER INSERT OR UPDATE OR DELETE ON PURCHASEMETHOD /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 361;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$PURCHASEMETHOD" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$PURCHASEMODE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$PURCHASEMODE" AFTER INSERT OR UPDATE OR DELETE ON PURCHASEMODE /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 159;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$PURCHASEMODE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$PURCHASEPLAN
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$PURCHASEPLAN" AFTER INSERT OR UPDATE OR DELETE ON PURCHASEPLAN /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 236;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$PURCHASEPLAN" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$PURCHASEPLANDOC
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$PURCHASEPLANDOC" AFTER INSERT OR UPDATE OR DELETE ON PURCHASEPLANDOC /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 234;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, old.BUDGET_ID, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, new.BUDGET_ID, 0, 0, 0, 0);    if ((updating and not(1=1 and (new.BUDGET_ID=old.BUDGET_ID)))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, old.BUDGET_ID, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$PURCHASEPLANDOC" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$QUALREQ
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$QUALREQ" AFTER INSERT OR UPDATE OR DELETE ON QUALREQ /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 246;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$QUALREQ" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$RECOILDOC
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$RECOILDOC" AFTER INSERT OR UPDATE OR DELETE ON RECOILDOC /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 238;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, old.BUDGET_ID, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, new.BUDGET_ID, 0, 0, 0, 0);    if ((updating and not(1=1 and (new.BUDGET_ID=old.BUDGET_ID)))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, old.BUDGET_ID, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$RECOILDOC" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$REFATTACH
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$REFATTACH" AFTER INSERT OR UPDATE OR DELETE ON REFATTACH /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 253;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$REFATTACH" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$REFERENCECLASS
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$REFERENCECLASS" AFTER INSERT OR UPDATE OR DELETE ON REFERENCECLASS /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 48;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$REFERENCECLASS" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$REFINANCINGRATE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$REFINANCINGRATE" AFTER INSERT OR UPDATE OR DELETE ON REFINANCINGRATE /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 216;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$REFINANCINGRATE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$REFUSALFACTFOUNDATION
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$REFUSALFACTFOUNDATION" AFTER INSERT OR UPDATE OR DELETE ON REFUSALFACTFOUNDATION /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 181;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$REFUSALFACTFOUNDATION" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$REPDOCUMENT
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$REPDOCUMENT" AFTER INSERT OR UPDATE OR DELETE ON REPDOCUMENT /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 187;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$REPDOCUMENT" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$REPFIELD
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$REPFIELD" AFTER INSERT OR UPDATE OR DELETE ON REPFIELD /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 57;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$REPFIELD" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$REPFORM
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$REPFORM" AFTER INSERT OR UPDATE OR DELETE ON REPFORM /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 56;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$REPFORM" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$REPFRAGMENT
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$REPFRAGMENT" AFTER INSERT OR UPDATE OR DELETE ON REPFRAGMENT /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 186;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$REPFRAGMENT" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$REPFRAGMENTCHILD
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$REPFRAGMENTCHILD" AFTER INSERT OR UPDATE OR DELETE ON REPFRAGMENTCHILD /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 188;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$REPFRAGMENTCHILD" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$REPORT
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$REPORT" AFTER INSERT OR UPDATE OR DELETE ON REPORT /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 86;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$REPORT" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$REPPROFILE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$REPPROFILE" AFTER INSERT OR UPDATE OR DELETE ON REPPROFILE /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 64;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$REPPROFILE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$REPSOURCE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$REPSOURCE" AFTER INSERT OR UPDATE OR DELETE ON REPSOURCE /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 185;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$REPSOURCE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$REPTEMPLATEATTACH
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$REPTEMPLATEATTACH" AFTER INSERT OR UPDATE OR DELETE ON REPTEMPLATEATTACH /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 189;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$REPTEMPLATEATTACH" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$REQUESTDOC
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$REQUESTDOC" AFTER INSERT OR UPDATE OR DELETE ON REQUESTDOC /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 161;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, old.BUDGET_ID, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, new.BUDGET_ID, 0, 0, 0, 0);    if ((updating and not(1=1 and (new.BUDGET_ID=old.BUDGET_ID)))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, old.BUDGET_ID, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$REQUESTDOC" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$REQUIREMENTTYPE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$REQUIREMENTTYPE" AFTER INSERT OR UPDATE OR DELETE ON REQUIREMENTTYPE /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 306;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$REQUIREMENTTYPE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$REQUIREMENTTYPEPM
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$REQUIREMENTTYPEPM" AFTER INSERT OR UPDATE OR DELETE ON REQUIREMENTTYPEPM /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 307;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$REQUIREMENTTYPEPM" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$RESERVEDBUDGETLINE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$RESERVEDBUDGETLINE" AFTER INSERT OR UPDATE OR DELETE ON RESERVEDBUDGETLINE /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 172;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$RESERVEDBUDGETLINE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$RESPONSIBILITY
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$RESPONSIBILITY" AFTER INSERT OR UPDATE OR DELETE ON RESPONSIBILITY /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 245;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$RESPONSIBILITY" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$RNP
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$RNP" AFTER INSERT OR UPDATE OR DELETE ON RNP /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 153;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$RNP" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$ROLEREGISTER
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$ROLEREGISTER" AFTER INSERT OR UPDATE OR DELETE ON ROLEREGISTER /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 89;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$ROLEREGISTER" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$RPL
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$RPL" AFTER INSERT OR UPDATE OR DELETE ON RPL /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 308;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$RPL" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$RPLOBJECT
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$RPLOBJECT" AFTER INSERT OR UPDATE OR DELETE ON RPLOBJECT /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 32;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$RPLOBJECT" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$RPLRULE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$RPLRULE" AFTER INSERT OR UPDATE OR DELETE ON RPLRULE /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 3;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$RPLRULE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$RPLSITE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$RPLSITE" AFTER INSERT OR UPDATE OR DELETE ON RPLSITE /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 4;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$RPLSITE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$RPLTABLE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$RPLTABLE" AFTER INSERT OR UPDATE OR DELETE ON RPLTABLE /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 31;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$RPLTABLE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$RPLTABLEPLUGIN
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$RPLTABLEPLUGIN" AFTER INSERT OR UPDATE OR DELETE ON RPLTABLEPLUGIN /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 1;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$RPLTABLEPLUGIN" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$RULEREQUISITE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$RULEREQUISITE" AFTER INSERT OR UPDATE OR DELETE ON RULEREQUISITE /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 109;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$RULEREQUISITE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$RULESCRIPT
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$RULESCRIPT" AFTER INSERT OR UPDATE OR DELETE ON RULESCRIPT /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 111;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$RULESCRIPT" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$SCHEXPDOCS
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$SCHEXPDOCS" AFTER INSERT OR UPDATE OR DELETE ON SCHEXPDOCS /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 76;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$SCHEXPDOCS" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$SCHPLAN
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$SCHPLAN" AFTER INSERT OR UPDATE OR DELETE ON SCHPLAN /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 51;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$SCHPLAN" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$SCHTASK
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$SCHTASK" AFTER INSERT OR UPDATE OR DELETE ON SCHTASK /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 50;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$SCHTASK" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$SERVERACTION
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$SERVERACTION" AFTER INSERT OR UPDATE OR DELETE ON SERVERACTION /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 11;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$SERVERACTION" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$SERVERERROR
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$SERVERERROR" AFTER INSERT OR UPDATE OR DELETE ON SERVERERROR /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 12;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$SERVERERROR" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$SERVERPROCESSOR
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$SERVERPROCESSOR" AFTER INSERT OR UPDATE OR DELETE ON SERVERPROCESSOR /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 10;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$SERVERPROCESSOR" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$SERVERPROVIDER
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$SERVERPROVIDER" AFTER INSERT OR UPDATE OR DELETE ON SERVERPROVIDER /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 9;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$SERVERPROVIDER" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$SIGNEXPORTLOG
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$SIGNEXPORTLOG" AFTER INSERT OR UPDATE OR DELETE ON SIGNEXPORTLOG /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 75;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$SIGNEXPORTLOG" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$SIGNFORMAT
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$SIGNFORMAT" AFTER INSERT OR UPDATE OR DELETE ON SIGNFORMAT /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 260;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$SIGNFORMAT" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$SIGNTYPE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$SIGNTYPE" AFTER INSERT OR UPDATE OR DELETE ON SIGNTYPE /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 261;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$SIGNTYPE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$STATISTICSSOURCE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$STATISTICSSOURCE" AFTER INSERT OR UPDATE OR DELETE ON STATISTICSSOURCE /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 190;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$STATISTICSSOURCE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$STOREDDOCUMENTS
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$STOREDDOCUMENTS" AFTER INSERT OR UPDATE OR DELETE ON STOREDDOCUMENTS /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 227;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$STOREDDOCUMENTS" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$SUPPORTCRYPTOLIB
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$SUPPORTCRYPTOLIB" AFTER INSERT OR UPDATE OR DELETE ON SUPPORTCRYPTOLIB /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 262;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$SUPPORTCRYPTOLIB" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$SUPPORTCRYPTOLIBFORMAT
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$SUPPORTCRYPTOLIBFORMAT" AFTER INSERT OR UPDATE OR DELETE ON SUPPORTCRYPTOLIBFORMAT /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 264;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$SUPPORTCRYPTOLIBFORMAT" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$SUPPORTCRYPTOLIBPARAM
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$SUPPORTCRYPTOLIBPARAM" AFTER INSERT OR UPDATE OR DELETE ON SUPPORTCRYPTOLIBPARAM /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 263;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$SUPPORTCRYPTOLIBPARAM" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$SYSEVENT
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$SYSEVENT" AFTER INSERT OR UPDATE OR DELETE ON SYSEVENT /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 84;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$SYSEVENT" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$SYSPARAM
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$SYSPARAM" AFTER INSERT OR UPDATE OR DELETE ON SYSPARAM /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 8;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$SYSPARAM" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$SYSRIGHT
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$SYSRIGHT" AFTER INSERT OR UPDATE OR DELETE ON SYSRIGHT /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 46;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$SYSRIGHT" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$SYSUSER
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$SYSUSER" AFTER INSERT OR UPDATE OR DELETE ON SYSUSER /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 7;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$SYSUSER" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$TASKJOURNAL
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$TASKJOURNAL" AFTER INSERT OR UPDATE OR DELETE ON TASKJOURNAL /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 44;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$TASKJOURNAL" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$TENDER
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$TENDER" AFTER INSERT OR UPDATE OR DELETE ON TENDER /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 231;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$TENDER" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$TENDERCRITERION
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$TENDERCRITERION" AFTER INSERT OR UPDATE OR DELETE ON TENDERCRITERION /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 228;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$TENDERCRITERION" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$TENDERCRITERIONCHILD
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$TENDERCRITERIONCHILD" AFTER INSERT OR UPDATE OR DELETE ON TENDERCRITERIONCHILD /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 230;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$TENDERCRITERIONCHILD" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$TENDERCRITERIONPM
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$TENDERCRITERIONPM" AFTER INSERT OR UPDATE OR DELETE ON TENDERCRITERIONPM /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 229;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$TENDERCRITERIONPM" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$TENDERLINE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$TENDERLINE" AFTER INSERT OR UPDATE OR DELETE ON TENDERLINE /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 232;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$TENDERLINE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$TENDERLINECOMM
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$TENDERLINECOMM" AFTER INSERT OR UPDATE OR DELETE ON TENDERLINECOMM /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 233;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$TENDERLINECOMM" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$TERRITORY
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$TERRITORY" AFTER INSERT OR UPDATE OR DELETE ON TERRITORY /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 147;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$TERRITORY" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$TERTYPE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$TERTYPE" AFTER INSERT OR UPDATE OR DELETE ON TERTYPE /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 146;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$TERTYPE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$TYPEDOCREQGROUP
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$TYPEDOCREQGROUP" AFTER INSERT OR UPDATE OR DELETE ON TYPEDOCREQGROUP /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 248;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$TYPEDOCREQGROUP" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$TYPEREQCRIT
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$TYPEREQCRIT" AFTER INSERT OR UPDATE OR DELETE ON TYPEREQCRIT /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 249;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$TYPEREQCRIT" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$UNIT
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$UNIT" AFTER INSERT OR UPDATE OR DELETE ON UNIT /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 130;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$UNIT" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$UPDPACKAGE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$UPDPACKAGE" AFTER INSERT OR UPDATE OR DELETE ON UPDPACKAGE /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 85;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$UPDPACKAGE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$USERBUDGET
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$USERBUDGET" AFTER INSERT OR UPDATE OR DELETE ON USERBUDGET /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 81;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$USERBUDGET" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$USERCERT
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$USERCERT" AFTER INSERT OR UPDATE OR DELETE ON USERCERT /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 74;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, old.SYSUSER_ID, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, new.SYSUSER_ID, 0, 0, 0, 0);    if ((updating and not(1=1 and (new.SYSUSER_ID=old.SYSUSER_ID)))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, old.SYSUSER_ID, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$USERCERT" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$USERORG
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$USERORG" AFTER INSERT OR UPDATE OR DELETE ON USERORG /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 6;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$USERORG" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$USERROLE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$USERROLE" AFTER INSERT OR UPDATE OR DELETE ON USERROLE /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 45;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$USERROLE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$USERSESSION
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$USERSESSION" AFTER INSERT OR UPDATE OR DELETE ON USERSESSION /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 42;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$USERSESSION" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$USESCRYPTOLIB
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$USESCRYPTOLIB" AFTER INSERT OR UPDATE OR DELETE ON USESCRYPTOLIB /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 265;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$USESCRYPTOLIB" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$USESCRYPTOLIBPARAM
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$USESCRYPTOLIBPARAM" AFTER INSERT OR UPDATE OR DELETE ON USESCRYPTOLIBPARAM /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 266;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$USESCRYPTOLIBPARAM" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$WEBSTATCACHE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$WEBSTATCACHE" AFTER INSERT OR UPDATE OR DELETE ON WEBSTATCACHE /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 191;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$WEBSTATCACHE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger RPL$WEBSTATCACHEVAL
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "RPL$WEBSTATCACHEVAL" AFTER INSERT OR UPDATE OR DELETE ON WEBSTATCACHEVAL /*REFERENCING NEW AS NEW OLD AS OLD*/  
AS
 DECLARE ltable_id numeric(15); DECLARE mutation_index numeric(18, 4);
  BEGIN   ltable_id = 192;  if ((deleting)) then     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, old.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);  else   begin     insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )       values (:ltable_id, new.ID, current_transaction_id,999999999999999, 0, 0, 0, 0, 0);    if ((updating and not(1=1 ))) then       insert into RPLLOG (rpltable_id, record_id, transaction_id,generation, FIELD1_VALUE, FIELD2_VALUE, FIELD3_VALUE, FIELD4_VALUE, FIELD5_VALUE )         values (:ltable_id, old.ID, current_transaction_id, 999999999999999, 0, 0, 0, 0, 0);   end
  END^

SET TERM ; ^

ALTER TRIGGER "RPL$WEBSTATCACHEVAL" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger UPD_CASC_GOODSPROP_SEQORDER
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "UPD_CASC_GOODSPROP_SEQORDER" 
  after update on groupprop  
AS

  BEGIN
IF (new.seqorder<>old.seqorder or new.group_id<>old.group_id) THEN
  execute STATEMENT ('update goodsprop set group_id=' || new.group_id 
    || ', seqorder=' || new.seqorder
    || ' where group_id=' || old.group_id 
    || ' and seqorder=' || old.seqorder);
  END^

SET TERM ; ^


ALTER TRIGGER "UPD_CASC_GOODSPROP_SEQORDER" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger UPD_DOCATTACHEX
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "UPD_DOCATTACHEX" AFTER UPDATE ON DOCATTACHEX  
AS

 BEGIN
  update document d set d.attach_cnt = d.attach_cnt + 1 
    where d.id=new.document_id;
  update document d set d.attach_cnt = d.attach_cnt - 1 
    where d.id=old.document_id;
 END^

SET TERM ; ^


ALTER TRIGGER "UPD_DOCATTACHEX" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger UPD_GOODSGROUP_TREE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "UPD_GOODSGROUP_TREE" after update
 on goodsgroup /*referencing old as old new as new*/  
AS

 DECLARE vtree varchar(255);
 DECLARE otree varchar(255);
 BEGIN
  vtree = '/';
  begin
    select tree
    from goodsgroup_tree where group_id=new.parent_id
    into :vtree;
  exception
    when no_data_found then
      vtree = '/';
  end
  vtree = :vtree||new.code||'/';
  otree = '/';
  begin
    select tree
    from goodsgroup_tree where group_id=old.parent_id
    into :otree;
  exception
    when no_data_found then
      otree = '/';
  end
  otree = :otree||old.code||'/';
  FOR vr IN ( select group_id, SUBSTRING(tree FROM CHAR_LENGTH(:otree)+1) as tree
   from goodsgroup_tree where tree like :otree||'%')
  DO
  BEGIN
    update goodsgroup_tree set tree = :vtree||vr.tree where group_id = vr.group_id;
  END
 END^

SET TERM ; ^


ALTER TRIGGER "UPD_GOODSGROUP_TREE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger UPD_ISCONTRACTOR_ORG
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "UPD_ISCONTRACTOR_ORG" 
 after update on Org  
AS

 BEGIN
  update OrgAccount oa set oa.IsContractor=new.IsContractor
    where oa.ORG_ID=new.ID and oa.IsContractor<>new.IsContractor;
 END^

SET TERM ; ^


ALTER TRIGGER "UPD_ISCONTRACTOR_ORG" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger UPD_ORGCHILD
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "UPD_ORGCHILD" AFTER UPDATE
 ON org  
AS
 
  DECLARE topid numeric(18, 4);
 BEGIN
  IF ((new.parent_id IS NOT NULL)) THEN
    IF ((old.parent_id IS NOT NULL)) THEN
      IF ((new.parent_id <> old.parent_id)) THEN
      BEGIN
        SELECT DISTINCT org_id
        FROM orgchild 
          WHERE org_id NOT IN (SELECT child_id FROM orgchild)
        INTO :topid;  
        DELETE FROM orgchild 
          WHERE org_id IN (SELECT org_id FROM orgchild WHERE child_id = old.parent_id AND org_id <> :topid)
            AND ((child_id = new.id) OR child_id IN (SELECT child_id FROM orgchild WHERE org_id = new.id));
        IF ((new.parent_id = :topid)) THEN
          DELETE FROM orgchild WHERE 
            org_id = old.parent_id AND (child_id = new.id OR child_id IN
              (SELECT child_id FROM orgchild WHERE org_id = new.id));
        ELSE
          IF ((old.parent_id = :topid)) THEN
            INSERT INTO orgchild(org_id, child_id)
              SELECT (SELECT new.parent_id FROM dual), child_id FROM orgchild
              WHERE org_id = old.parent_id AND (child_id = new.id OR child_id IN
                (SELECT child_id FROM orgchild WHERE org_id = new.id));
          ELSE
            UPDATE orgchild SET org_id = new.parent_id WHERE 
              org_id = old.parent_id AND (child_id = new.id OR child_id IN
                (SELECT child_id FROM orgchild WHERE org_id = new.id));
        INSERT INTO orgchild(org_id, child_id)
          SELECT par.org_id, ch.child_id FROM 
           (SELECT org_id FROM orgchild WHERE child_id = new.parent_id AND org_id <> :topid) par,
           (SELECT child_id FROM orgchild WHERE org_id = new.id UNION SELECT new.id FROM dual) ch;
      END
    ELSE
      IF ((new.parent_id <> new.id)) THEN
      BEGIN
        INSERT INTO orgchild(org_id, child_id)
          VALUES(new.parent_id, new.id);
        FOR cur IN (SELECT child_id FROM orgchild
          WHERE org_id = new.id)
        DO
        BEGIN
          INSERT INTO orgchild(org_id, child_id)
            VALUES (new.parent_id, cur.child_id);
        END
        FOR cur IN (SELECT org_id FROM orgchild
                    WHERE child_id = new.parent_id)
        DO
        BEGIN
          INSERT INTO orgchild(org_id, child_id)
            VALUES (cur.org_id, new.id);
          FOR cur1 IN (SELECT child_id FROM orgchild
            WHERE org_id = new.id)
          DO
          BEGIN
            INSERT INTO orgchild(org_id, child_id)
              VALUES (cur.org_id, cur1.child_id);
          END
        END
      END
  ELSE
    IF ((old.parent_id IS NOT NULL)) THEN
      DELETE FROM orgchild WHERE org_id = new.id OR child_id = new.id;
 END^

SET TERM ; ^


ALTER TRIGGER "UPD_ORGCHILD" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger UPD_TER_TREE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "UPD_TER_TREE" after update
 on territory /*referencing old as old new as new*/  
AS

 DECLARE vtree varchar(255);
 DECLARE vpath varchar(512);
 DECLARE otree varchar(255);
 DECLARE opath varchar(512);
 BEGIN
  vtree = '/';
  begin
    select tree, path
    from ter_tree where ter_id=new.parent_id
    into :vtree, :vpath;
    vpath = :vpath||', '||new.caption;
  exception
    when no_data_found then
      vtree = '/';
      vpath = new.caption;
  end
  vtree = :vtree||new.code||'/';
  otree = '/';
  begin
    select tree, path
    from ter_tree where ter_id=old.parent_id
    into :otree, :opath;
    opath = :opath||', '||old.caption;
  exception
    when no_data_found then
      otree = '/';
      opath = old.caption;
  end
  otree = :otree||old.code||'/';
  FOR vr IN ( select ter_id, SUBSTRING(tree FROM CHAR_LENGTH(:otree)+1) as tree, SUBSTRING(path FROM CHAR_LENGTH(:opath)+1) as path
   from ter_tree where tree like :otree||'%')
  DO
  BEGIN
    update ter_tree set tree = :vtree||vr.tree, path = :vpath||vr.path where ter_id = vr.ter_id;
  END
 END^

SET TERM ; ^


ALTER TRIGGER "UPD_TER_TREE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_ABANDONEDREASON
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_ABANDONEDREASON" before insert or update on ABANDONEDREASON  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_ABANDONEDREASON" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_ALTGOODSGROUP
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_ALTGOODSGROUP" before insert or update on ALTGOODSGROUP  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_ALTGOODSGROUP" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_ALTGOODSGROUPTYPE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_ALTGOODSGROUPTYPE" before insert or update on ALTGOODSGROUPTYPE  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_ALTGOODSGROUPTYPE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_ANYDATA
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_ANYDATA" before insert or update on ANYDATA  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_ANYDATA" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_APPMODULE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_APPMODULE" before insert or update on APPMODULE  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_APPMODULE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_APPOBJ
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_APPOBJ" before insert or update on APPOBJ  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_APPOBJ" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_APPOBJPROP
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_APPOBJPROP" before insert or update on APPOBJPROP  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_APPOBJPROP" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_APPOINTMENT
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_APPOINTMENT" before insert or update on APPOINTMENT  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_APPOINTMENT" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_AUCTIONBID
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_AUCTIONBID" before insert or update on AUCTIONBID  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_AUCTIONBID" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_AUCTIONLOG
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_AUCTIONLOG" before insert or update on AUCTIONLOG  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_AUCTIONLOG" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_BANK
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_BANK" before insert or update on BANK  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_BANK" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_BANKGUARANTEEDOC
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_BANKGUARANTEEDOC" before insert or update on BANKGUARANTEEDOC  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_BANKGUARANTEEDOC" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_BANKGUARANTEEREFDOC
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_BANKGUARANTEEREFDOC" before insert or update on BANKGUARANTEEREFDOC  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_BANKGUARANTEEREFDOC" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_BANKGUARANTEEREFREASON
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_BANKGUARANTEEREFREASON" before insert or update on BANKGUARANTEEREFREASON  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_BANKGUARANTEEREFREASON" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_BUDGCODE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_BUDGCODE" before insert or update on BUDGCODE  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_BUDGCODE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_BUDGET
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_BUDGET" before insert or update on BUDGET  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_BUDGET" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_BUDGETLINE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_BUDGETLINE" before insert or update on BUDGETLINE  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_BUDGETLINE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_BUDGETSTAGE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_BUDGETSTAGE" before insert or update on BUDGETSTAGE  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_BUDGETSTAGE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_CACHELIST
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_CACHELIST" before insert or update on CACHELIST  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_CACHELIST" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_CAVILDOC
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_CAVILDOC" before insert or update on CAVILDOC  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_CAVILDOC" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_CAVILTYPE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_CAVILTYPE" before insert or update on CAVILTYPE  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_CAVILTYPE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_CERTINTERCHANGEREQUEST
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_CERTINTERCHANGEREQUEST" before insert or update on CERTINTERCHANGEREQUEST  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_CERTINTERCHANGEREQUEST" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_CERTREQUEST
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_CERTREQUEST" before insert or update on CERTREQUEST  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_CERTREQUEST" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_CERTREVOKEREQUEST
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_CERTREVOKEREQUEST" before insert or update on CERTREVOKEREQUEST  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_CERTREVOKEREQUEST" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_CLAIMDOC
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_CLAIMDOC" before insert or update on CLAIMDOC  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_CLAIMDOC" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_CLAIMPAYFACT
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_CLAIMPAYFACT" before insert or update on CLAIMPAYFACT  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_CLAIMPAYFACT" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_CLAIMPENALTYCHANGEDOCINFO
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_CLAIMPENALTYCHANGEDOCINFO" before insert or update on CLAIMPENALTYCHANGEDOCINFO  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_CLAIMPENALTYCHANGEDOCINFO" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_CLASSOPER
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_CLASSOPER" before insert or update on CLASSOPER  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_CLASSOPER" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_CLIENTOBJECT
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_CLIENTOBJECT" before insert or update on CLIENTOBJECT  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_CLIENTOBJECT" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_CLIENTOBJECTCOMMENTS
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_CLIENTOBJECTCOMMENTS" before insert or update on CLIENTOBJECTCOMMENTS  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_CLIENTOBJECTCOMMENTS" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_CLNDDAY
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_CLNDDAY" before insert or update on CLNDDAY  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_CLNDDAY" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_CLNDDAYTYPE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_CLNDDAYTYPE" before insert or update on CLNDDAYTYPE  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_CLNDDAYTYPE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_CLNDTYPE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_CLNDTYPE" before insert or update on CLNDTYPE  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_CLNDTYPE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_CODETYPE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_CODETYPE" before insert or update on CODETYPE  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_CODETYPE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_COMMEMBER
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_COMMEMBER" before insert or update on COMMEMBER  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_COMMEMBER" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_COMMISSION
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_COMMISSION" before insert or update on COMMISSION  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_COMMISSION" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_COMPLAINTDOC
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_COMPLAINTDOC" before insert or update on COMPLAINTDOC  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_COMPLAINTDOC" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_CONFCONCLUSIONCONTRACT
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_CONFCONCLUSIONCONTRACT" before insert or update on CONFCONCLUSIONCONTRACT  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_CONFCONCLUSIONCONTRACT" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_CONPAYFACT
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_CONPAYFACT" before insert or update on CONPAYFACT  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_CONPAYFACT" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_CONSOLIDDOC
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_CONSOLIDDOC" before insert or update on CONSOLIDDOC  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_CONSOLIDDOC" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_CONSTRUCTION
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_CONSTRUCTION" before insert or update on CONSTRUCTION  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_CONSTRUCTION" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_CONTRACTCARDDOC
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_CONTRACTCARDDOC" before insert or update on CONTRACTCARDDOC  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_CONTRACTCARDDOC" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_CONTRACTDOC
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_CONTRACTDOC" before insert or update on CONTRACTDOC  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_CONTRACTDOC" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_CONTRACTEXECDOC
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_CONTRACTEXECDOC" before insert or update on CONTRACTEXECDOC  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_CONTRACTEXECDOC" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_CONTRACTREASON
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_CONTRACTREASON" before insert or update on CONTRACTREASON  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_CONTRACTREASON" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_CONTRACTREASON_DOCLINES
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_CONTRACTREASON_DOCLINES" before insert or update on CONTRACTREASON_DOCLINES  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_CONTRACTREASON_DOCLINES" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_CONTRACTTEMPLATEDOC
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_CONTRACTTEMPLATEDOC" before insert or update on CONTRACTTEMPLATEDOC  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_CONTRACTTEMPLATEDOC" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_CONTYPE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_CONTYPE" before insert or update on CONTYPE  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_CONTYPE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_CONTYPEATTACH
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_CONTYPEATTACH" before insert or update on CONTYPEATTACH  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_CONTYPEATTACH" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_COUNTRY
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_COUNTRY" before insert or update on COUNTRY  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_COUNTRY" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_CRLFILE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_CRLFILE" before insert or update on CRLFILE  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_CRLFILE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_CRLPOINT
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_CRLPOINT" before insert or update on CRLPOINT  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_CRLPOINT" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_CURHISTORY
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_CURHISTORY" before insert or update on CURHISTORY  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_CURHISTORY" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_CURRENCY
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_CURRENCY" before insert or update on CURRENCY  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_CURRENCY" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_DATAOBJECTCHANGELOG
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_DATAOBJECTCHANGELOG" before insert or update on DATAOBJECTCHANGELOG  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_DATAOBJECTCHANGELOG" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_DATASOURCE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_DATASOURCE" before insert or update on DATASOURCE  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_DATASOURCE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_DBCONNECT
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_DBCONNECT" before insert or update on DBCONNECT  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_DBCONNECT" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_DBCONSTRAINT
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_DBCONSTRAINT" before insert or update on DBCONSTRAINT  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_DBCONSTRAINT" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_DECREASON
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_DECREASON" before insert or update on DECREASON  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_DECREASON" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_DELIVERYBASIS
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_DELIVERYBASIS" before insert or update on DELIVERYBASIS  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_DELIVERYBASIS" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_DESCGROUP
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_DESCGROUP" before insert or update on DESCGROUP  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_DESCGROUP" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_DESCRIPTION
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_DESCRIPTION" before insert or update on DESCRIPTION  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_DESCRIPTION" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_DESCRIPTIONCACHE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_DESCRIPTIONCACHE" before insert or update on DESCRIPTIONCACHE  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_DESCRIPTIONCACHE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_DEVIATIONFACTFOUNDATION
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_DEVIATIONFACTFOUNDATION" before insert or update on DEVIATIONFACTFOUNDATION  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_DEVIATIONFACTFOUNDATION" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_DIGEST
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_DIGEST" before insert or update on DIGEST  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_DIGEST" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_DIGESTSIGN
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_DIGESTSIGN" before insert or update on DIGESTSIGN  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_DIGESTSIGN" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_DISPSTATUS
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_DISPSTATUS" before insert or update on DISPSTATUS  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_DISPSTATUS" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_DOCACTION
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_DOCACTION" before insert or update on DOCACTION  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_DOCACTION" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_DOCATTACH
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_DOCATTACH" before insert or update on DOCATTACH  
AS

  DECLARE TaskJournalId NUMERIC(15,0);
  DECLARE RecordAction NUMERIC(1,0);
 BEGIN
 if (inserting) then 
 begin 
   if ((new.version is null or (new.version < 1))) then 
     new.version = 1; 
end 
else 
  if ((new.version IS NULL or (new.version <= old.version))) then 
    new.version = coalesce(old.version, 0) + 1; 
  if (inserting) then 
    RecordAction = 0; 
  else 
    RecordAction = 1;
  TaskJournalId = RPLTRANSACTION.get_task_journal_id; 
  if (:TaskJournalId is not null) then 
    insert into RplVersionLog (Ver, Num_Transaction, RplTable_Id, TaskJournal_Id, Record_Id, Record_Action) 
    values (new.version, dbms_transaction.local_transaction_id, 49, :TaskJournalId, new.id, :RecordAction);
 END^

SET TERM ; ^

ALTER TRIGGER "VER_DOCATTACH" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_DOCATTACHEX
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_DOCATTACHEX" before insert or update on DOCATTACHEX  
AS

  DECLARE TaskJournalId NUMERIC(15,0);
  DECLARE RecordAction NUMERIC(1,0);
 BEGIN
 if (inserting) then 
 begin 
   if ((new.version is null or (new.version < 1))) then 
     new.version = 1; 
end 
else 
  if ((new.version IS NULL or (new.version <= old.version))) then 
    new.version = coalesce(old.version, 0) + 1; 
  if (inserting) then 
    RecordAction = 0; 
  else 
    RecordAction = 1;
  TaskJournalId = RPLTRANSACTION.get_task_journal_id; 
  if (:TaskJournalId is not null) then 
    insert into RplVersionLog (Ver, Num_Transaction, RplTable_Id, TaskJournal_Id, Record_Id, Record_Action) 
    values (new.version, dbms_transaction.local_transaction_id, 2, :TaskJournalId, new.id, :RecordAction);
 END^

SET TERM ; ^

ALTER TRIGGER "VER_DOCATTACHEX" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_DOCCATEGORY
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_DOCCATEGORY" before insert or update on DOCCATEGORY  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_DOCCATEGORY" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_DOCCLASS_DISPSTATUS
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_DOCCLASS_DISPSTATUS" before insert or update on DOCCLASS_DISPSTATUS  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_DOCCLASS_DISPSTATUS" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_DOCCOMMENT
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_DOCCOMMENT" before insert or update on DOCCOMMENT  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_DOCCOMMENT" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_DOCCUSTOMFIELDS
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_DOCCUSTOMFIELDS" before insert or update on DOCCUSTOMFIELDS  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_DOCCUSTOMFIELDS" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_DOCDIGESTRULE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_DOCDIGESTRULE" before insert or update on DOCDIGESTRULE  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_DOCDIGESTRULE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_DOCEVENT
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_DOCEVENT" before insert or update on DOCEVENT  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_DOCEVENT" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_DOCEVERRLOG
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_DOCEVERRLOG" before insert or update on DOCEVERRLOG  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_DOCEVERRLOG" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_DOCEXCHANGESCHEME
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_DOCEXCHANGESCHEME" before insert or update on DOCEXCHANGESCHEME  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_DOCEXCHANGESCHEME" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_DOCFLAGCATEGORY
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_DOCFLAGCATEGORY" before insert or update on DOCFLAGCATEGORY  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_DOCFLAGCATEGORY" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_DOCFLAGTYPE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_DOCFLAGTYPE" before insert or update on DOCFLAGTYPE  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_DOCFLAGTYPE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_DOCGROUP
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_DOCGROUP" before insert or update on DOCGROUP  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_DOCGROUP" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_DOCREQ
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_DOCREQ" before insert or update on DOCREQ  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_DOCREQ" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_DOCRETENTION
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_DOCRETENTION" before insert or update on DOCRETENTION  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_DOCRETENTION" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_DOCRETENTIONSTATITEMS
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_DOCRETENTIONSTATITEMS" before insert or update on DOCRETENTIONSTATITEMS  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_DOCRETENTIONSTATITEMS" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_DOCRETENTIONSTATUS
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_DOCRETENTIONSTATUS" before insert or update on DOCRETENTIONSTATUS  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_DOCRETENTIONSTATUS" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_DOCSTATUS
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_DOCSTATUS" before insert or update on DOCSTATUS  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_DOCSTATUS" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_DOCUMENT
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_DOCUMENT" before insert or update on DOCUMENT  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_DOCUMENT" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_DOCUMENTCLASS
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_DOCUMENTCLASS" before insert or update on DOCUMENTCLASS  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_DOCUMENTCLASS" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_DOCUMENTREPORTS
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_DOCUMENTREPORTS" before insert or update on DOCUMENTREPORTS  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_DOCUMENTREPORTS" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_DOMEN
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_DOMEN" before insert or update on DOMEN  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_DOMEN" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_EQUALITY
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_EQUALITY" before insert or update on EQUALITY  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_EQUALITY" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_EQUALITYCODES
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_EQUALITYCODES" before insert or update on EQUALITYCODES  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_EQUALITYCODES" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_ESCHECKRULE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_ESCHECKRULE" before insert or update on ESCHECKRULE  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_ESCHECKRULE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_ESTIMATE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_ESTIMATE" before insert or update on ESTIMATE  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_ESTIMATE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_ETP
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_ETP" before insert or update on ETP  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_ETP" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_ETPATTACH
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_ETPATTACH" before insert or update on ETPATTACH  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_ETPATTACH" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_ETPTYPE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_ETPTYPE" before insert or update on ETPTYPE  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_ETPTYPE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_FACTDOC
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_FACTDOC" before insert or update on FACTDOC  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_FACTDOC" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_FACTDOCTYPE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_FACTDOCTYPE" before insert or update on FACTDOCTYPE  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_FACTDOCTYPE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_FETCHMODE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_FETCHMODE" before insert or update on FETCHMODE  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_FETCHMODE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_FGROUP
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_FGROUP" before insert or update on FGROUP  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_FGROUP" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_FGROUPATTACH
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_FGROUPATTACH" before insert or update on FGROUPATTACH  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_FGROUPATTACH" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_FGROUPHEADER
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_FGROUPHEADER" before insert or update on FGROUPHEADER  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_FGROUPHEADER" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_FINSRC
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_FINSRC" before insert or update on FINSRC  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_FINSRC" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_FINSRCSATISFY
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_FINSRCSATISFY" before insert or update on FINSRCSATISFY  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_FINSRCSATISFY" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_FORMATCONVERTER
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_FORMATCONVERTER" before insert or update on FORMATCONVERTER  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_FORMATCONVERTER" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_FUNCAT
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_FUNCAT" before insert or update on FUNCAT  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_FUNCAT" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_FUNUNIT
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_FUNUNIT" before insert or update on FUNUNIT  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_FUNUNIT" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_GCREGISTER
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_GCREGISTER" before insert or update on GCREGISTER  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_GCREGISTER" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_GOODS
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_GOODS" before insert or update on GOODS  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_GOODS" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_GOODSBAN
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_GOODSBAN" before insert or update on GOODSBAN  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_GOODSBAN" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_GOODSBANGOODSOKPD
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_GOODSBANGOODSOKPD" before insert or update on GOODSBANGOODSOKPD  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_GOODSBANGOODSOKPD" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_GOODSBANPURCHASEMODE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_GOODSBANPURCHASEMODE" before insert or update on GOODSBANPURCHASEMODE  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_GOODSBANPURCHASEMODE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_GOODSBRANCH
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_GOODSBRANCH" before insert or update on GOODSBRANCH  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_GOODSBRANCH" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_GOODSGROUP
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_GOODSGROUP" before insert or update on GOODSGROUP  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_GOODSGROUP" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_GOODSGROUPDOCDETAIL
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_GOODSGROUPDOCDETAIL" before insert or update on GOODSGROUPDOCDETAIL  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_GOODSGROUPDOCDETAIL" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_GOODSGROUPPURCHASEMODE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_GOODSGROUPPURCHASEMODE" before insert or update on GOODSGROUPPURCHASEMODE  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_GOODSGROUPPURCHASEMODE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_GOODSOKDP
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_GOODSOKDP" before insert or update on GOODSOKDP  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_GOODSOKDP" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_GOODSOKDPCOUNTRYPREF
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_GOODSOKDPCOUNTRYPREF" before insert or update on GOODSOKDPCOUNTRYPREF  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_GOODSOKDPCOUNTRYPREF" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_GOODSOKDPPURCHASEMODE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_GOODSOKDPPURCHASEMODE" before insert or update on GOODSOKDPPURCHASEMODE  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_GOODSOKDPPURCHASEMODE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_GOODSOKPD
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_GOODSOKPD" before insert or update on GOODSOKPD  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_GOODSOKPD" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_GOODSOKPDCOUNTRYPREF
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_GOODSOKPDCOUNTRYPREF" before insert or update on GOODSOKPDCOUNTRYPREF  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_GOODSOKPDCOUNTRYPREF" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_GOODSOKPDPURCHASEMODE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_GOODSOKPDPURCHASEMODE" before insert or update on GOODSOKPDPURCHASEMODE  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_GOODSOKPDPURCHASEMODE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_GOODSOKVED
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_GOODSOKVED" before insert or update on GOODSOKVED  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_GOODSOKVED" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_GOODSPRICE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_GOODSPRICE" before insert or update on GOODSPRICE  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_GOODSPRICE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_GRANTINVESTMENT
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_GRANTINVESTMENT" before insert or update on GRANTINVESTMENT  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_GRANTINVESTMENT" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_GROUPPROP
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_GROUPPROP" before insert or update on GROUPPROP  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_GROUPPROP" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_HISTORYMODIFY
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_HISTORYMODIFY" before insert or update on HISTORYMODIFY  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_HISTORYMODIFY" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_INDUSTRYCODE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_INDUSTRYCODE" before insert or update on INDUSTRYCODE  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_INDUSTRYCODE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_INSTITUTIONLINE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_INSTITUTIONLINE" before insert or update on INSTITUTIONLINE  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_INSTITUTIONLINE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_INTERBUDGET
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_INTERBUDGET" before insert or update on INTERBUDGET  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_INTERBUDGET" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_INVOICEDOC
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_INVOICEDOC" before insert or update on INVOICEDOC  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_INVOICEDOC" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_JAVACLASS
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_JAVACLASS" before insert or update on JAVACLASS  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_JAVACLASS" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_KBKLINEFIT
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_KBKLINEFIT" before insert or update on KBKLINEFIT  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_KBKLINEFIT" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_KLADR
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_KLADR" before insert or update on KLADR  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_KLADR" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_KLADRSTREET
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_KLADRSTREET" before insert or update on KLADRSTREET  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_KLADRSTREET" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_LEDGER
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_LEDGER" before insert or update on LEDGER  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_LEDGER" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_LIABILITYCREDENTIAL
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_LIABILITYCREDENTIAL" before insert or update on LIABILITYCREDENTIAL  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_LIABILITYCREDENTIAL" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_LIABILITYEXPENSE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_LIABILITYEXPENSE" before insert or update on LIABILITYEXPENSE  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_LIABILITYEXPENSE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_LIABILITYEXPENSE_DOCLINES
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_LIABILITYEXPENSE_DOCLINES" before insert or update on LIABILITYEXPENSE_DOCLINES  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_LIABILITYEXPENSE_DOCLINES" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_LIABILITYGROUP
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_LIABILITYGROUP" before insert or update on LIABILITYGROUP  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_LIABILITYGROUP" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_LICTYPE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_LICTYPE" before insert or update on LICTYPE  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_LICTYPE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_MAIL
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_MAIL" before insert or update on MAIL  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_MAIL" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_MAILATTACH
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_MAILATTACH" before insert or update on MAILATTACH  
AS

  DECLARE TaskJournalId NUMERIC(15,0);
  DECLARE RecordAction NUMERIC(1,0);
 BEGIN
 if (inserting) then 
 begin 
   if ((new.version is null or (new.version < 1))) then 
     new.version = 1; 
end 
else 
  if ((new.version IS NULL or (new.version <= old.version))) then 
    new.version = coalesce(old.version, 0) + 1; 
  if (inserting) then 
    RecordAction = 0; 
  else 
    RecordAction = 1;
  TaskJournalId = RPLTRANSACTION.get_task_journal_id; 
  if (:TaskJournalId is not null) then 
    insert into RplVersionLog (Ver, Num_Transaction, RplTable_Id, TaskJournal_Id, Record_Id, Record_Action) 
    values (new.version, dbms_transaction.local_transaction_id, 66, :TaskJournalId, new.id, :RecordAction);
 END^

SET TERM ; ^

ALTER TRIGGER "VER_MAILATTACH" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_MAILRECEIVERGROUP
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_MAILRECEIVERGROUP" before insert or update on MAILRECEIVERGROUP  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_MAILRECEIVERGROUP" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_MAILRECEIVERGROUP_RECEIVER
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_MAILRECEIVERGROUP_RECEIVER" before insert or update on MAILRECEIVERGROUP_RECEIVER  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_MAILRECEIVERGROUP_RECEIVER" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_MENU
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_MENU" before insert or update on MENU  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_MENU" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_MENUITEM
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_MENUITEM" before insert or update on MENUITEM  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_MENUITEM" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_MENUITEMWEB
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_MENUITEMWEB" before insert or update on MENUITEMWEB  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_MENUITEMWEB" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_METACONSTRAINT
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_METACONSTRAINT" before insert or update on METACONSTRAINT  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_METACONSTRAINT" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_METAOBJECT
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_METAOBJECT" before insert or update on METAOBJECT  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_METAOBJECT" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_MSG
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_MSG" before insert or update on MSG  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_MSG" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_MSGLINKTYPE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_MSGLINKTYPE" before insert or update on MSGLINKTYPE  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_MSGLINKTYPE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_MSGQUEUE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_MSGQUEUE" before insert or update on MSGQUEUE  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_MSGQUEUE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_MSGSITE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_MSGSITE" before insert or update on MSGSITE  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_MSGSITE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_NECESSITY
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_NECESSITY" before insert or update on NECESSITY  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_NECESSITY" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_NOTICEDOC
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_NOTICEDOC" before insert or update on NOTICEDOC  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_NOTICEDOC" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_NOTICEEMAILORG
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_NOTICEEMAILORG" before insert or update on NOTICEEMAILORG  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_NOTICEEMAILORG" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_NOTIFYMSG
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_NOTIFYMSG" before insert or update on NOTIFYMSG  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_NOTIFYMSG" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_NOTIFYMSGEVENT
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_NOTIFYMSGEVENT" before insert or update on NOTIFYMSGEVENT  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_NOTIFYMSGEVENT" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_NOTIFYMSGGROUP
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_NOTIFYMSGGROUP" before insert or update on NOTIFYMSGGROUP  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_NOTIFYMSGGROUP" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_NOTIFYMSGRULE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_NOTIFYMSGRULE" before insert or update on NOTIFYMSGRULE  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_NOTIFYMSGRULE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_NUMGENERATOR
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_NUMGENERATOR" before insert or update on NUMGENERATOR  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_NUMGENERATOR" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_NUMPREFIX
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_NUMPREFIX" before insert or update on NUMPREFIX  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_NUMPREFIX" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_NUMSEQUENCE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_NUMSEQUENCE" before insert or update on NUMSEQUENCE  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_NUMSEQUENCE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_OFFERDOC
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_OFFERDOC" before insert or update on OFFERDOC  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_OFFERDOC" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_OFRREQREASON
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_OFRREQREASON" before insert or update on OFRREQREASON  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_OFRREQREASON" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_OFRRETREASON
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_OFRRETREASON" before insert or update on OFRRETREASON  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_OFRRETREASON" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_OIDREF
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_OIDREF" before insert or update on OIDREF  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_OIDREF" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_OKTMO
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_OKTMO" before insert or update on OKTMO  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_OKTMO" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_OLAPQUERY
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_OLAPQUERY" before insert or update on OLAPQUERY  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_OLAPQUERY" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_OOSORGROLE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_OOSORGROLE" before insert or update on OOSORGROLE  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_OOSORGROLE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_OOS223PURCHASENOTICEINFO
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_OOS223PURCHASENOTICEINFO" before insert or update on OOS223PURCHASENOTICEINFO  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_OOS223PURCHASENOTICEINFO" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_OOS223PURCHNOTICELOTINFO
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_OOS223PURCHNOTICELOTINFO" before insert or update on OOS223PURCHNOTICELOTINFO  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_OOS223PURCHNOTICELOTINFO" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_OPERTYPE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_OPERTYPE" before insert or update on OPERTYPE  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_OPERTYPE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_ORDERDOC
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_ORDERDOC" before insert or update on ORDERDOC  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_ORDERDOC" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_ORDERSUMMARY
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_ORDERSUMMARY" before insert or update on ORDERSUMMARY  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_ORDERSUMMARY" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_ORG
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_ORG" before insert or update on ORG  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_ORG" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_ORGACCOUNT
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_ORGACCOUNT" before insert or update on ORGACCOUNT  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_ORGACCOUNT" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_ORGACCTYPE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_ORGACCTYPE" before insert or update on ORGACCTYPE  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_ORGACCTYPE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_ORGADDKPP
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_ORGADDKPP" before insert or update on ORGADDKPP  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_ORGADDKPP" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_ORGCONCCONT
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_ORGCONCCONT" before insert or update on ORGCONCCONT  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_ORGCONCCONT" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_ORGETP
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_ORGETP" before insert or update on ORGETP  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_ORGETP" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_ORGFORM
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_ORGFORM" before insert or update on ORGFORM  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_ORGFORM" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_ORGOOS223FZUSER
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_ORGOOS223FZUSER" before insert or update on ORGOOS223FZUSER  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_ORGOOS223FZUSER" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_ORGROLE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_ORGROLE" before insert or update on ORGROLE  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_ORGROLE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_ORGSTATUS
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_ORGSTATUS" before insert or update on ORGSTATUS  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_ORGSTATUS" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_ORGUNFAIR
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_ORGUNFAIR" before insert or update on ORGUNFAIR  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_ORGUNFAIR" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_PACKTYPE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_PACKTYPE" before insert or update on PACKTYPE  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_PACKTYPE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_PANEL
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_PANEL" before insert or update on PANEL  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_PANEL" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_PANELITEM
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_PANELITEM" before insert or update on PANELITEM  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_PANELITEM" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_PAYCONDITION
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_PAYCONDITION" before insert or update on PAYCONDITION  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_PAYCONDITION" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_PERSON
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_PERSON" before insert or update on PERSON  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_PERSON" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_PERSONAL
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_PERSONAL" before insert or update on PERSONAL  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_PERSONAL" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_PLACEMENTFEATURE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_PLACEMENTFEATURE" before insert or update on PLACEMENTFEATURE  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_PLACEMENTFEATURE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_PLACEMENTFEATUREPM
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_PLACEMENTFEATUREPM" before insert or update on PLACEMENTFEATUREPM  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_PLACEMENTFEATUREPM" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_PLACINGWAY
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_PLACINGWAY" before insert or update on PLACINGWAY  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_PLACINGWAY" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_PLANDOC
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_PLANDOC" before insert or update on PLANDOC  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_PLANDOC" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_PLANPOSITIONCHANGEREASON
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_PLANPOSITIONCHANGEREASON" before insert or update on PLANPOSITIONCHANGEREASON  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_PLANPOSITIONCHANGEREASON" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_PLAN2ARRANGEMENT
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_PLAN2ARRANGEMENT" before insert or update on PLAN2ARRANGEMENT  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_PLAN2ARRANGEMENT" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_PLAN2CHANGEREASON
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_PLAN2CHANGEREASON" before insert or update on PLAN2CHANGEREASON  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_PLAN2CHANGEREASON" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_PLAN2DOC
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_PLAN2DOC" before insert or update on PLAN2DOC  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_PLAN2DOC" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_PLAN2GOODS
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_PLAN2GOODS" before insert or update on PLAN2GOODS  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_PLAN2GOODS" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_PLAN2LEDGER
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_PLAN2LEDGER" before insert or update on PLAN2LEDGER  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_PLAN2LEDGER" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_PLAN2OOSEXTNUMBER
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_PLAN2OOSEXTNUMBER" before insert or update on PLAN2OOSEXTNUMBER  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_PLAN2OOSEXTNUMBER" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_PLAN2OOSFEATURE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_PLAN2OOSFEATURE" before insert or update on PLAN2OOSFEATURE  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_PLAN2OOSFEATURE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_PLAN2OOSKBK
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_PLAN2OOSKBK" before insert or update on PLAN2OOSKBK  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_PLAN2OOSKBK" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_PLAN2OOSKBKYEAR
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_PLAN2OOSKBKYEAR" before insert or update on PLAN2OOSKBKYEAR  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_PLAN2OOSKBKYEAR" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_PLAN2OOSOKVED
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_PLAN2OOSOKVED" before insert or update on PLAN2OOSOKVED  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_PLAN2OOSOKVED" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_PLAN2OOSPOSITION
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_PLAN2OOSPOSITION" before insert or update on PLAN2OOSPOSITION  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_PLAN2OOSPOSITION" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_PLAN2OOSPRODUCT
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_PLAN2OOSPRODUCT" before insert or update on PLAN2OOSPRODUCT  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_PLAN2OOSPRODUCT" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_PLAN3DOC
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_PLAN3DOC" before insert or update on PLAN3DOC  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_PLAN3DOC" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_PLAN3PURCHASEDOC
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_PLAN3PURCHASEDOC" before insert or update on PLAN3PURCHASEDOC  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_PLAN3PURCHASEDOC" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_PREFERENCEGROUP
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_PREFERENCEGROUP" before insert or update on PREFERENCEGROUP  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_PREFERENCEGROUP" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_PREFERENCEGROUPFEATURE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_PREFERENCEGROUPFEATURE" before insert or update on PREFERENCEGROUPFEATURE  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_PREFERENCEGROUPFEATURE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_PROCTREE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_PROCTREE" before insert or update on PROCTREE  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_PROCTREE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_PROCUREMENT
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_PROCUREMENT" before insert or update on PROCUREMENT  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_PROCUREMENT" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_PROPTYPE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_PROPTYPE" before insert or update on PROPTYPE  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_PROPTYPE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_PURCHASECARRY
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_PURCHASECARRY" before insert or update on PURCHASECARRY  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_PURCHASECARRY" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_PURCHASEMETHOD
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_PURCHASEMETHOD" before insert or update on PURCHASEMETHOD  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_PURCHASEMETHOD" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_PURCHASEMODE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_PURCHASEMODE" before insert or update on PURCHASEMODE  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_PURCHASEMODE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_PURCHASEPLAN
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_PURCHASEPLAN" before insert or update on PURCHASEPLAN  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_PURCHASEPLAN" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_PURCHASEPLANDOC
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_PURCHASEPLANDOC" before insert or update on PURCHASEPLANDOC  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_PURCHASEPLANDOC" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_QUALREQ
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_QUALREQ" before insert or update on QUALREQ  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_QUALREQ" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_RECOILDOC
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_RECOILDOC" before insert or update on RECOILDOC  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_RECOILDOC" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_REFATTACH
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_REFATTACH" before insert or update on REFATTACH  
AS

  DECLARE TaskJournalId NUMERIC(15,0);
  DECLARE RecordAction NUMERIC(1,0);
 BEGIN
 if (inserting) then 
 begin 
   if ((new.version is null or (new.version < 1))) then 
     new.version = 1; 
end 
else 
  if ((new.version IS NULL or (new.version <= old.version))) then 
    new.version = coalesce(old.version, 0) + 1; 
  if (inserting) then 
    RecordAction = 0; 
  else 
    RecordAction = 1;
  TaskJournalId = RPLTRANSACTION.get_task_journal_id; 
  if (:TaskJournalId is not null) then 
    insert into RplVersionLog (Ver, Num_Transaction, RplTable_Id, TaskJournal_Id, Record_Id, Record_Action) 
    values (new.version, dbms_transaction.local_transaction_id, 253, :TaskJournalId, new.id, :RecordAction);
 END^

SET TERM ; ^

ALTER TRIGGER "VER_REFATTACH" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_REFERENCECLASS
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_REFERENCECLASS" before insert or update on REFERENCECLASS  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_REFERENCECLASS" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_REFINANCINGRATE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_REFINANCINGRATE" before insert or update on REFINANCINGRATE  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_REFINANCINGRATE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_REFUSALFACTFOUNDATION
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_REFUSALFACTFOUNDATION" before insert or update on REFUSALFACTFOUNDATION  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_REFUSALFACTFOUNDATION" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_REPDOCUMENT
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_REPDOCUMENT" before insert or update on REPDOCUMENT  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_REPDOCUMENT" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_REPFIELD
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_REPFIELD" before insert or update on REPFIELD  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_REPFIELD" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_REPFORM
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_REPFORM" before insert or update on REPFORM  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_REPFORM" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_REPFRAGMENT
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_REPFRAGMENT" before insert or update on REPFRAGMENT  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_REPFRAGMENT" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_REPFRAGMENTCHILD
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_REPFRAGMENTCHILD" before insert or update on REPFRAGMENTCHILD  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_REPFRAGMENTCHILD" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_REPORT
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_REPORT" before insert or update on REPORT  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_REPORT" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_REPPROFILE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_REPPROFILE" before insert or update on REPPROFILE  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_REPPROFILE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_REPSOURCE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_REPSOURCE" before insert or update on REPSOURCE  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_REPSOURCE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_REPTEMPLATEATTACH
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_REPTEMPLATEATTACH" before insert or update on REPTEMPLATEATTACH  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_REPTEMPLATEATTACH" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_REQUESTDOC
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_REQUESTDOC" before insert or update on REQUESTDOC  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_REQUESTDOC" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_REQUIREMENTTYPE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_REQUIREMENTTYPE" before insert or update on REQUIREMENTTYPE  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_REQUIREMENTTYPE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_REQUIREMENTTYPEPM
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_REQUIREMENTTYPEPM" before insert or update on REQUIREMENTTYPEPM  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_REQUIREMENTTYPEPM" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_RESERVEDBUDGETLINE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_RESERVEDBUDGETLINE" before insert or update on RESERVEDBUDGETLINE  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_RESERVEDBUDGETLINE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_RESPONSIBILITY
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_RESPONSIBILITY" before insert or update on RESPONSIBILITY  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_RESPONSIBILITY" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_RNP
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_RNP" before insert or update on RNP  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_RNP" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_ROLEREGISTER
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_ROLEREGISTER" before insert or update on ROLEREGISTER  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_ROLEREGISTER" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_RPL
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_RPL" before insert or update on RPL  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_RPL" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_RPLOBJECT
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_RPLOBJECT" before insert or update on RPLOBJECT  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_RPLOBJECT" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_RPLRULE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_RPLRULE" before insert or update on RPLRULE  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_RPLRULE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_RPLSITE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_RPLSITE" before insert or update on RPLSITE  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_RPLSITE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_RPLTABLE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_RPLTABLE" before insert or update on RPLTABLE  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_RPLTABLE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_RPLTABLEPLUGIN
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_RPLTABLEPLUGIN" before insert or update on RPLTABLEPLUGIN  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_RPLTABLEPLUGIN" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_RULEREQUISITE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_RULEREQUISITE" before insert or update on RULEREQUISITE  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_RULEREQUISITE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_RULESCRIPT
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_RULESCRIPT" before insert or update on RULESCRIPT  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_RULESCRIPT" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_SCHEXPDOCS
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_SCHEXPDOCS" before insert or update on SCHEXPDOCS  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_SCHEXPDOCS" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_SCHPLAN
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_SCHPLAN" before insert or update on SCHPLAN  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_SCHPLAN" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_SCHTASK
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_SCHTASK" before insert or update on SCHTASK  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_SCHTASK" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_SERVERACTION
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_SERVERACTION" before insert or update on SERVERACTION  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_SERVERACTION" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_SERVERERROR
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_SERVERERROR" before insert or update on SERVERERROR  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_SERVERERROR" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_SERVERPROCESSOR
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_SERVERPROCESSOR" before insert or update on SERVERPROCESSOR  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_SERVERPROCESSOR" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_SERVERPROVIDER
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_SERVERPROVIDER" before insert or update on SERVERPROVIDER  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_SERVERPROVIDER" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_SIGNEXPORTLOG
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_SIGNEXPORTLOG" before insert or update on SIGNEXPORTLOG  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_SIGNEXPORTLOG" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_SIGNFORMAT
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_SIGNFORMAT" before insert or update on SIGNFORMAT  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_SIGNFORMAT" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_SIGNTYPE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_SIGNTYPE" before insert or update on SIGNTYPE  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_SIGNTYPE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_STATISTICSSOURCE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_STATISTICSSOURCE" before insert or update on STATISTICSSOURCE  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_STATISTICSSOURCE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_STOREDDOCUMENTS
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_STOREDDOCUMENTS" before insert or update on STOREDDOCUMENTS  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_STOREDDOCUMENTS" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_SUPPORTCRYPTOLIB
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_SUPPORTCRYPTOLIB" before insert or update on SUPPORTCRYPTOLIB  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_SUPPORTCRYPTOLIB" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_SUPPORTCRYPTOLIBFORMAT
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_SUPPORTCRYPTOLIBFORMAT" before insert or update on SUPPORTCRYPTOLIBFORMAT  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_SUPPORTCRYPTOLIBFORMAT" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_SUPPORTCRYPTOLIBPARAM
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_SUPPORTCRYPTOLIBPARAM" before insert or update on SUPPORTCRYPTOLIBPARAM  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_SUPPORTCRYPTOLIBPARAM" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_SYSEVENT
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_SYSEVENT" before insert or update on SYSEVENT  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_SYSEVENT" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_SYSPARAM
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_SYSPARAM" before insert or update on SYSPARAM  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_SYSPARAM" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_SYSRIGHT
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_SYSRIGHT" before insert or update on SYSRIGHT  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_SYSRIGHT" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_SYSUSER
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_SYSUSER" before insert or update on SYSUSER  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_SYSUSER" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_TASKJOURNAL
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_TASKJOURNAL" before insert or update on TASKJOURNAL  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_TASKJOURNAL" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_TENDER
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_TENDER" before insert or update on TENDER  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_TENDER" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_TENDERCRITERION
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_TENDERCRITERION" before insert or update on TENDERCRITERION  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_TENDERCRITERION" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_TENDERCRITERIONCHILD
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_TENDERCRITERIONCHILD" before insert or update on TENDERCRITERIONCHILD  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_TENDERCRITERIONCHILD" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_TENDERCRITERIONPM
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_TENDERCRITERIONPM" before insert or update on TENDERCRITERIONPM  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_TENDERCRITERIONPM" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_TENDERLINE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_TENDERLINE" before insert or update on TENDERLINE  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_TENDERLINE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_TENDERLINECOMM
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_TENDERLINECOMM" before insert or update on TENDERLINECOMM  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_TENDERLINECOMM" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_TERRITORY
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_TERRITORY" before insert or update on TERRITORY  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_TERRITORY" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_TERTYPE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_TERTYPE" before insert or update on TERTYPE  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_TERTYPE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_TYPEDOCREQGROUP
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_TYPEDOCREQGROUP" before insert or update on TYPEDOCREQGROUP  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_TYPEDOCREQGROUP" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_TYPEREQCRIT
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_TYPEREQCRIT" before insert or update on TYPEREQCRIT  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_TYPEREQCRIT" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_UNIT
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_UNIT" before insert or update on UNIT  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_UNIT" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_UPDPACKAGE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_UPDPACKAGE" before insert or update on UPDPACKAGE  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_UPDPACKAGE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_USERBUDGET
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_USERBUDGET" before insert or update on USERBUDGET  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_USERBUDGET" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_USERCERT
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_USERCERT" before insert or update on USERCERT  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_USERCERT" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_USERORG
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_USERORG" before insert or update on USERORG  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_USERORG" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_USERROLE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_USERROLE" before insert or update on USERROLE  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_USERROLE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_USERSESSION
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_USERSESSION" before insert or update on USERSESSION  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_USERSESSION" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_USESCRYPTOLIB
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_USESCRYPTOLIB" before insert or update on USESCRYPTOLIB  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_USESCRYPTOLIB" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_USESCRYPTOLIBPARAM
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_USESCRYPTOLIBPARAM" before insert or update on USESCRYPTOLIBPARAM  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_USESCRYPTOLIBPARAM" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_WEBSTATCACHE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_WEBSTATCACHE" before insert or update on WEBSTATCACHE  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_WEBSTATCACHE" ACTIVE;
--------------------------------------------------------
--  DDL for Trigger VER_WEBSTATCACHEVAL
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "VER_WEBSTATCACHEVAL" before insert or update on WEBSTATCACHEVAL  
AS

  BEGIN
IF (new.version IS NULL or (new.version <= old.version)) THEN
    new.version = coalesce(old.version, 0) + 1;
  END^

SET TERM ; ^

ALTER TRIGGER "VER_WEBSTATCACHEVAL" ACTIVE;
