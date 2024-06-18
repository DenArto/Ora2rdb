--------------------------------------------------------
--  DDL for Function CURRENT_TRANSACTION_ID
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "GZVLG"."CURRENT_TRANSACTION_ID"
return varchar2 as
begin
  return dbms_transaction.local_transaction_id(TRUE);
end;

/
--------------------------------------------------------
--  DDL for Function GETBASEGROUP
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "GZVLG"."GETBASEGROUP" ( IDIN IN  numeric,
    PURCHASEMODE IN numeric)
  RETURN  numeric is
  p numeric;
  q numeric;
BEGIN 
  p := idin;
  while (not p is null) loop
    select count(*) into q from goodsgrouppurchasemode gpm where (gpm.purchasemode_id = purchasemode) and (gpm.goodsgroup_id = p) and (gpm.goodsgroup_id <> idin);
    if q > 0 then
      return (p);
    end if;
    select parent_id   into p  from goodsgroup where goodsgroup.id=p;
  end loop;
  return (null);
END;

/
--------------------------------------------------------
--  DDL for Function GETDOCIDFORATTACHID
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "GZVLG"."GETDOCIDFORATTACHID" (DocAttachId NUMBER) return number AS
  PRAGMA AUTONOMOUS_TRANSACTION;
  DocId number(18,0);
BEGIN
  select da.Document_id into DocId from DocAttachEx da where da.Id = DocAttachId;
  COMMIT;
  return DocId;
END;

/
--------------------------------------------------------
--  DDL for Function GETFIRSTGROUPBYCRIT
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "GZVLG"."GETFIRSTGROUPBYCRIT" (
 grpcode in varchar2
)
return varchar is
ret varchar(500);
begin
 select gg.caption into ret from goodsgroup gg  where gg.code like grpcode||'%' and ROWNUM=1;
 return ret;
end;

/
--------------------------------------------------------
--  DDL for Function GET_ORDERID_OF_CONTRACT
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "GZVLG"."GET_ORDERID_OF_CONTRACT" (
  id in numeric)
RETURN  numeric is
  docid numeric;
  parent_id1 numeric;
  documentclass_id numeric;
begin
  parent_id1 := id;
  documentclass_id := -1;
  while ((not documentclass_id in (4,5,28,30,25)) and not parent_id1 is null) loop
  begin
    select d.id, d.documentclass_id, d.parent_id into docid, documentclass_id, parent_id1 
    from document d 
    where d.id = parent_id1;    
  exception
    when no_data_found then
      return parent_id1;
  end; 
  end loop;
  if parent_id1 is null and not documentclass_id in (4,5,28,30,25) then
    docid := null;
  end if;
  return docid;
end;

/
--------------------------------------------------------
--  DDL for Function GET_ORGPARENT_WITH_ROLE
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "GZVLG"."GET_ORGPARENT_WITH_ROLE" (
  child_org_id in numeric, org_role_id in numeric, parent_first in numeric)
  return numeric
is
  org_id numeric;
  parent_org_id numeric;
  role_id numeric;
  cur_org_id numeric;
  child_role_id numeric;
begin
  org_id := null;
  cur_org_id := child_org_id;
  if (parent_first = 1) then
    select o.parent_id, r.orgrole_id into cur_org_id, child_role_id from org o
      left join orgroles r on (o.id = r.org_id and r.orgrole_id = org_role_id)
      where o.id = cur_org_id;
  end if;
  while ((not cur_org_id is null) and (org_id is null)) loop
    select o.parent_id, r.orgrole_id into parent_org_id, role_id from org o
      left join orgroles r on (o.id = r.org_id and r.orgrole_id = org_role_id)
      where o.id = cur_org_id;
    if (not role_id is null) then
      org_id := cur_org_id;
    end if;
    if (parent_org_id = cur_org_id) then
      cur_org_id := null;
    else
      cur_org_id := parent_org_id;
    end if;
  end loop;
  if ((parent_first = 1) and (org_id is null) and (not child_role_id is null)) then
    org_id := child_org_id;
  end if;
  return org_id;
end;

/
--------------------------------------------------------
--  DDL for Function GET_PARENT_BY_DISPSTATUS
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "GZVLG"."GET_PARENT_BY_DISPSTATUS" (
  current_doc_id in numeric, dispstatus_id in numeric)
return  numeric is
  docid numeric;
  current_class_id numeric;
  class_id numeric;
  parent_doc_id numeric;
  next_docid numeric;
  next_dispstatus_id numeric;
begin
  select documentclass_id, documentclass_id, parent_id
    into current_class_id, class_id, parent_doc_id from document
    where id = current_doc_id;
  while (class_id = current_class_id and not parent_doc_id is null and (next_dispstatus_id is null or next_dispstatus_id <> dispstatus_id)) loop
  begin
    select id, documentclass_id, parent_id, dispstatus_id
     into next_docid, class_id, parent_doc_id, next_dispstatus_id from document
     where id = parent_doc_id;
  exception
    when no_data_found then
      return null;
  end;
  end loop;
  if next_dispstatus_id = dispstatus_id then
    docid := next_docid;
  end if;
  return docid;
end;

/
--------------------------------------------------------
--  DDL for Function GET_PARENT_NO_CLASS
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "GZVLG"."GET_PARENT_NO_CLASS" (
  current_doc_id in numeric)
RETURN  numeric is
  docid numeric;
  current_class_id numeric;
  class_id numeric;
  parent_doc_id numeric;
begin
  select documentclass_id, documentclass_id, parent_id
    into current_class_id, class_id, parent_doc_id from document
    where id = current_doc_id;
  while (class_id = current_class_id and not parent_doc_id is null) loop
  begin
    select id, documentclass_id, parent_id
     into docid, class_id, parent_doc_id from document
     where id = parent_doc_id;
  exception
    when no_data_found then
      return null;
  end; 
  end loop;
  if class_id = current_class_id then
    docid := null;
  end if;
  return docid;
end;

/
--------------------------------------------------------
--  DDL for Function GET_TOP_PARENT_BY_CLASS
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "GZVLG"."GET_TOP_PARENT_BY_CLASS" (
  current_doc_id in numeric)
RETURN  numeric is
  docid numeric;
  current_class_id numeric;
  class_id numeric;
  parent_doc_id numeric;
  next_docid numeric;
begin
  select documentclass_id, documentclass_id, parent_id
    into current_class_id, class_id, parent_doc_id from document
    where id = current_doc_id;
  while (class_id = current_class_id and not parent_doc_id is null) loop
  begin
    docid := next_docid;
    select id, documentclass_id, parent_id
     into next_docid, class_id, parent_doc_id from document
     where id = parent_doc_id;
  exception
    when no_data_found then
      return null;
  end;
  end loop;
  if class_id = current_class_id then
    docid := next_docid;
  end if;
  return docid;
end;

/
--------------------------------------------------------
--  DDL for Function LEFT
--------------------------------------------------------

  CREATE OR REPLACE FUNCTION "GZVLG"."LEFT" (p_Str varchar, p_Size integer) return varchar2 is
begin
  return SubStr (p_Str, 1, p_Size);
end;

/
