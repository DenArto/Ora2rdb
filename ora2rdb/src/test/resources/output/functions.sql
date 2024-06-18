--------------------------------------------------------
--  DDL for Function CURRENT_TRANSACTION_ID
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER FUNCTION "CURRENT_TRANSACTION_ID"
RETURNS VARCHAR(250) as
begin
  return dbms_transaction.local_transaction_id(TRUE);
end^

SET TERM ; ^


--------------------------------------------------------
--  DDL for Function GETBASEGROUP
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER FUNCTION "GETBASEGROUP" ( IDIN   numeric(18, 4),
    PURCHASEMODE  numeric(18, 4))
  RETURNS  numeric(18, 4) AS
  DECLARE p numeric(18, 4);
  DECLARE q numeric(18, 4);
BEGIN 
  p = :idin;
  while ((not :p is null)) DO
  BEGIN
    select count(*)
    from goodsgrouppurchasemode gpm where (gpm.purchasemode_id = :purchasemode) and (gpm.goodsgroup_id = :p) and (gpm.goodsgroup_id <> :idin)
    into :q;
    if (:q > 0) then
      return (:p);
    select parent_id
    from goodsgroup where goodsgroup.id=:p
    into :p;
  END
  return (null);
END^

SET TERM ; ^


--------------------------------------------------------
--  DDL for Function GETDOCIDFORATTACHID
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER FUNCTION "GETDOCIDFORATTACHID" (DocAttachId NUMERIC(18, 4)) RETURNS NUMERIC(18, 4) AS
  
  DECLARE DocId NUMERIC(18,0);
BEGIN
  IN AUTONOMOUS TRANSACTION DO BEGIN
select da.Document_id
  from DocAttachEx da where da.Id = :DocAttachId
  into :DocId;
  COMMIT;
  return DocId;
	END
END^

SET TERM ; ^


--------------------------------------------------------
--  DDL for Function GETFIRSTGROUPBYCRIT
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER FUNCTION "GETFIRSTGROUPBYCRIT" (
 grpcode  VARCHAR(250)
)
RETURNS varchar(250) AS
DECLARE ret varchar(500);
begin
 select gg.caption
 from goodsgroup gg  where gg.code like :grpcode||'%' and ROWNUM=1
 into :ret;
 return ret;
end^

SET TERM ; ^


--------------------------------------------------------
--  DDL for Function GET_ORDERID_OF_CONTRACT
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER FUNCTION "GET_ORDERID_OF_CONTRACT" (
  id  numeric(18, 4))
RETURNS  numeric(18, 4) AS
  DECLARE docid numeric(18, 4);
  DECLARE parent_id1 numeric(18, 4);
  DECLARE documentclass_id numeric(18, 4);
begin
  parent_id1 = :id;
  documentclass_id = -1;
  while (((not :documentclass_id in (4,5,28,30,25)) and not :parent_id1 is null)) DO
  BEGIN
  begin
    select d.id, d.documentclass_id, d.parent_id
    from document d 
    where d.id = :parent_id1
    into :docid, :documentclass_id, :parent_id1;    
  exception
    when no_data_found then
      return parent_id1;
  end
  END
  if (:parent_id1 is null and not :documentclass_id in (4,5,28,30,25)) then
    docid = null;
  return docid;
end^

SET TERM ; ^


--------------------------------------------------------
--  DDL for Function GET_ORGPARENT_WITH_ROLE
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER FUNCTION "GET_ORGPARENT_WITH_ROLE" (
  child_org_id  numeric(18, 4), org_role_id  numeric(18, 4), parent_first  numeric(18, 4))
  RETURNS numeric(18, 4)
AS
  DECLARE org_id numeric(18, 4);
  DECLARE parent_org_id numeric(18, 4);
  DECLARE role_id numeric(18, 4);
  DECLARE cur_org_id numeric(18, 4);
  DECLARE child_role_id numeric(18, 4);
begin
  org_id = null;
  cur_org_id = :child_org_id;
  if ((:parent_first = 1)) then
    select o.parent_id, r.orgrole_id
    from org o
      left join orgroles r on (o.id = r.org_id and r.orgrole_id = :org_role_id)
      where o.id = :cur_org_id
    into :cur_org_id, :child_role_id;
  while (((not :cur_org_id is null) and (:org_id is null))) DO
  BEGIN
    select o.parent_id, r.orgrole_id
    from org o
      left join orgroles r on (o.id = r.org_id and r.orgrole_id = :org_role_id)
      where o.id = :cur_org_id
    into :parent_org_id, :role_id;
    if ((not :role_id is null)) then
      org_id = :cur_org_id;
    if ((:parent_org_id = :cur_org_id)) then
      cur_org_id = null;
    else
      cur_org_id = :parent_org_id;
  END
  if (((:parent_first = 1) and (:org_id is null) and (not :child_role_id is null))) then
    org_id = :child_org_id;
  return org_id;
end^

SET TERM ; ^


--------------------------------------------------------
--  DDL for Function GET_PARENT_BY_DISPSTATUS
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER FUNCTION "GET_PARENT_BY_DISPSTATUS" (
  current_doc_id  numeric(18, 4), dispstatus_id  numeric(18, 4))
RETURNS  numeric(18, 4) AS
  DECLARE docid numeric(18, 4);
  DECLARE current_class_id numeric(18, 4);
  DECLARE class_id numeric(18, 4);
  DECLARE parent_doc_id numeric(18, 4);
  DECLARE next_docid numeric(18, 4);
  DECLARE next_dispstatus_id numeric(18, 4);
begin
  select documentclass_id, documentclass_id, parent_id
  from document
    where id = :current_doc_id
  into :current_class_id, :class_id, :parent_doc_id;
  while ((:class_id = :current_class_id and not :parent_doc_id is null and (:next_dispstatus_id is null or :next_dispstatus_id <> :dispstatus_id))) DO
  BEGIN
  begin
    select id, documentclass_id, parent_id, :dispstatus_id
    from document
     where id = :parent_doc_id
    into :next_docid, :class_id, :parent_doc_id, :next_dispstatus_id;
  exception
    when no_data_found then
      return null;
  end
  END
  if (:next_dispstatus_id = :dispstatus_id) then
    docid = :next_docid;
  return docid;
end^

SET TERM ; ^


--------------------------------------------------------
--  DDL for Function GET_PARENT_NO_CLASS
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER FUNCTION "GET_PARENT_NO_CLASS" (
  current_doc_id  numeric(18, 4))
RETURNS  numeric(18, 4) AS
  DECLARE docid numeric(18, 4);
  DECLARE current_class_id numeric(18, 4);
  DECLARE class_id numeric(18, 4);
  DECLARE parent_doc_id numeric(18, 4);
begin
  select documentclass_id, documentclass_id, parent_id
  from document
    where id = :current_doc_id
  into :current_class_id, :class_id, :parent_doc_id;
  while ((:class_id = :current_class_id and not :parent_doc_id is null)) DO
  BEGIN
  begin
    select id, documentclass_id, parent_id
    from document
     where id = :parent_doc_id
    into :docid, :class_id, :parent_doc_id;
  exception
    when no_data_found then
      return null;
  end
  END
  if (:class_id = :current_class_id) then
    docid = null;
  return docid;
end^

SET TERM ; ^


--------------------------------------------------------
--  DDL for Function GET_TOP_PARENT_BY_CLASS
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER FUNCTION "GET_TOP_PARENT_BY_CLASS" (
  current_doc_id  numeric(18, 4))
RETURNS  numeric(18, 4) AS
  DECLARE docid numeric(18, 4);
  DECLARE current_class_id numeric(18, 4);
  DECLARE class_id numeric(18, 4);
  DECLARE parent_doc_id numeric(18, 4);
  DECLARE next_docid numeric(18, 4);
begin
  select documentclass_id, documentclass_id, parent_id
  from document
    where id = :current_doc_id
  into :current_class_id, :class_id, :parent_doc_id;
  while ((:class_id = :current_class_id and not :parent_doc_id is null)) DO
  BEGIN
  begin
    docid = :next_docid;
    select id, documentclass_id, parent_id
    from document
     where id = :parent_doc_id
    into :next_docid, :class_id, :parent_doc_id;
  exception
    when no_data_found then
      return null;
  end
  END
  if (:class_id = :current_class_id) then
    docid = :next_docid;
  return docid;
end^

SET TERM ; ^


--------------------------------------------------------
--  DDL for Function LEFT
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER FUNCTION "LEFT" (p_Str varchar(250), p_Size integer) RETURNS VARCHAR(250) AS
begin
  return SUBSTRING (:p_Str FROM  1 FOR  :p_Size);
end^

SET TERM ; ^
