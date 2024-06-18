--------------------------------------------------------
--  DDL for View ACTUALIZATIONVIEW
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "GZVLG"."ACTUALIZATIONVIEW" ("ID", "VERSION", "DOCUMENT_ID", "INSTANCE_LINK", "BUDGET_ID", "DOCUMENTCLASS_ID", "DISPSTATUS_ID", "OPERTYPE_ID", "DOC_NUMBER", "DOC_DATE", "DESCRIPTION", "REMARK", "AMOUNT", "FOREIGN_KEY", "PAYCONDITIONNAME", "DELIVERYBASISCODE", "ACTUAL_YEAR") AS 
  select dc.id,dc.version,dc.id,tb.id,tb.budget_id,tb.documentclass_id,tb.dispstatus_id,tb.opertype_id,tb.doc_number,tb.doc_date,tb.description,tb.remark,tb.amount,tb.foreign_key,tb.payconditionname,tb.deliverybasiscode,tb.actual_year
   from requestdoc tb
   join document dc on (dc.id = tb.document_id and dc.dispstatus_id <> -1)
   union all
   select dc.id,dc.version,dc.id,tb.id,tb.budget_id,tb.documentclass_id,tb.dispstatus_id,tb.opertype_id,tb.doc_number,tb.doc_date,tb.description,tb.remark,tb.amount,tb.foreign_key,tb.payconditionname,tb.deliverybasiscode,tb.actual_year
   from contractdoc tb
   join document dc on (dc.id = tb.document_id and dc.dispstatus_id <> -1)
   union all
   select dc.id,dc.version,dc.id,tb.id,tb.budget_id,tb.documentclass_id,tb.dispstatus_id,tb.opertype_id,tb.doc_number,tb.doc_date,tb.description,tb.remark,tb.amount,tb.foreign_key,cast(null as varchar(255)) payconditionname,cast(null as varchar(50)) deliverybasiscode,tb.actual_year
   from invoicedoc tb
   join document dc on (dc.id = tb.document_id and dc.dispstatus_id <> -1)
   union all
   select dc.id,dc.version,dc.id,tb.id,tb.budget_id,tb.documentclass_id,tb.dispstatus_id,tb.opertype_id,tb.doc_number,tb.doc_date,tb.description,tb.remark,tb.amount,tb.foreign_key,cast(null as varchar(255)) payconditionname,cast(null as varchar(50)) deliverybasiscode,tb.actual_year
   from factdoc tb
   join document dc on (dc.id = tb.document_id and dc.dispstatus_id <> -1)
   where tb.dispstatus_id not in (16, 32);
--------------------------------------------------------
--  DDL for View AUCTIONLIST_VIEW
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "GZVLG"."AUCTIONLIST_VIEW" ("ID", "BUDGET_ID", "DOCUMENT_ID", "DOCUMENTCLASS_ID", "DISPSTATUS_ID", "PURCHASEMODE_ID", "CMPDATE", "ACCEPTDATE", "CMPNAME", "CMPORG_ID", "CMPORGNAME", "DOC_NUMBER", "ISACTIVE", "AMOUNT") AS 
  select
  o.ID,
  o.Budget_ID,
  o.Document_ID,
  o.DocumentClass_ID,
  o.DispStatus_ID,
  o.PurchaseMode_ID,
  o.CmpDate,
  o.AcceptDate,
  o.CmpName,
  o.CmpOrg_id,
  o.CmpOrgName,
  o.Doc_Number,
  (select count(*) from AuctionLog al where al.Order_ID=o.ID and o.PurchaseMode_ID<>13) IsActive,
  o.amount
from
  OrderDoc o;
--------------------------------------------------------
--  DDL for View CALENDARPLANVIEW
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "GZVLG"."CALENDARPLANVIEW" ("BUDGET_ID", "ID", "DOCUMENT_ID", "INVITATIONDATE", "CMPDATE", "DEALDATE", "OPENINGDATE", "SELECTDATE", "FINISHDATE", "AMOUNT", "PURCHASEMODE_ID", "DISPSTATUS_ID", "DOCUMENTCLASS_ID", "ENTERPRISE", "LOTNAME", "LOTPOS", "CMPORG_ID", "PLANPOSITIONNUMBER", "CUSTOMER_ID") AS 
  select
  pd.budget_id,
  pd.id,
  pd.document_id,
  pa.invitationdate,
  pa.cmpdate,
  pa.dealdate,
  cast(null as date),
  cast(null as date),
  cast(null as date),
  sum(pa.amount),
  pa.purchasemode_id,
  pd.dispstatus_id,
  pd.documentclass_id,
  case when pa.purchasemode_id <> 3 then pa.isenterprise else 0 end,
  dc.description,
  cast(null as numeric),
  pa.cmporg_id,
  dic.description,
  pd.customer_id
from Plan2Arrangement pa
join Plan2Goods pg on (pg.id = pa.plan2goods_id)
join Plan2Doc pd on (pd.id = pg.plan2doc_id)
left join DescriptionCache dc on (dc.id = pa.ordernamecache_id)
left join DescriptionCache dic on (dic.id = pa.lotnumbercache_id)
where pd.documentclass_id = 41 and pd.dispstatus_id in (10, 23) and pa.issmall = 0 and pa.lotnumbercache_id is not null
group by
  pd.budget_id,
  pd.id,
  pd.document_id,
  pa.invitationdate,
  pa.cmpdate,
  pa.dealdate,
  pa.purchasemode_id,
  pd.dispstatus_id,
  pd.documentclass_id,
  case when pa.purchasemode_id <> 3 then pa.isenterprise else 0 end,
  dc.description,
  pa.cmporg_id,
  dic.description,
  pd.customer_id;
--------------------------------------------------------
--  DDL for View CALENDARPURCHASEVIEW
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "GZVLG"."CALENDARPURCHASEVIEW" ("BUDGET_ID", "ID", "DOCUMENT_ID", "INVITATIONDATE", "CMPDATE", "DEALDATE", "OPENINGDATE", "SELECTDATE", "FINISHDATE", "AMOUNT", "PURCHASEMODE_ID", "DISPSTATUS_ID", "DOCUMENTCLASS_ID", "ENTERPRISE", "LOTNAME", "LOTPOS", "CMPORG_ID") AS 
  select
  od.budget_id,
  od.id,
  od.document_id,
  trunc(od.plan_invitationdate),
  trunc(coalesce(cl.cmpdate, od.cmpdate)),
  cast(null as date),
  trunc(case when documentclass_id = 4  then od.openingdate else
        case when documentclass_id = 49 then od.finishdate else od.acceptdate end end),
  trunc(case when documentclass_id in (5, 49) then od.cmpdate else od.selectdate end),
  trunc(od.finishdate),
  coalesce(cl.amount, od.amount),
  od.purchasemode_id,
  od.dispstatus_id,
  od.documentclass_id,
  coalesce(cl.enterprise, od.enterprise),
  coalesce(cl.name, od.cmpname),
  cl.pos,
  od.cmporg_id
from OrderDoc od
left join cmplot cl on (od.id = cl.order_id and cl.islotdeclined = 0 and cl.islotreregistered = 0)
where od.dispstatus_id not in (-1, 0, 5, 17, 21) and od.documentclass_id <> 3;
--------------------------------------------------------
--  DDL for View PLAN2PURCHASECARRYINTERNAL
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "GZVLG"."PLAN2PURCHASECARRYINTERNAL" ("DOCUMENT_ID", "GROUPCODE", "OKDP_CODE", "CUSTOMER_ID", "PURCHASEMODE_ID", "CMPORG_ID", "PLANYEAR", "BUDGET_ID", "PAYCONDITION_ID", "GOODSCODE", "UNITNAME", "CODE1", "CODE2", "CODE3", "CODE4", "CODE5", "CODE6", "CODE7", "CODE8", "CODE9", "CODE10", "INDUSTRYCODE_ID", "GRANTINVESTMENT_ID", "FINSRC_ID", "DELIVERYBASIS_ID", "INVITATIONDATE", "CMPDATE", "LOT_DESCRIPTION_ID", "CONTRACTOR_ID", "ISENTERPRISE", "ISSMALL", "USEAMOUNT1", "USEAMOUNT2", "USEAMOUNT3", "USEAMOUNT4", "USECONFIRMAMOUNT1", "USECONFIRMAMOUNT2", "USECONFIRMAMOUNT3", "USECONFIRMAMOUNT4", "USEQUALIFYAMOUNT1", "USEQUALIFYAMOUNT2", "USEQUALIFYAMOUNT3", "USEQUALIFYAMOUNT4", "CONTROLAMOUNT1", "CONTROLAMOUNT2", "CONTROLAMOUNT3", "CONTROLAMOUNT4", "CONTROLQUALIFYAMOUNT1", "CONTROLQUALIFYAMOUNT2", "CONTROLQUALIFYAMOUNT3", "CONTROLQUALIFYAMOUNT4", "DECLAREDAMOUNT1", "DECLAREDAMOUNT2", "DECLAREDAMOUNT3", "DECLAREDAMOUNT4", "ECONOMYAMOUNT", "ECONOMYFINALAMOUNT", "DISTRIBUTEAMOUNT1", "DISTRIBUTEAMOUNT2", "DISTRIBUTEAMOUNT3", "DISTRIBUTEAMOUNT4", "DISTRIBUTECONFIRMAMOUNT1", "DISTRIBUTECONFIRMAMOUNT2", "DISTRIBUTECONFIRMAMOUNT3", "DISTRIBUTECONFIRMAMOUNT4", "DISTRIBUTEQUALIFYAMOUNT1", "DISTRIBUTEQUALIFYAMOUNT2", "DISTRIBUTEQUALIFYAMOUNT3", "DISTRIBUTEQUALIFYAMOUNT4", "EXECUTEAMOUNT1", "EXECUTEAMOUNT2", "EXECUTEAMOUNT3", "EXECUTEAMOUNT4", "SUPPLIEDAMOUNT", "PAYEDAMOUNT", "RECOILAMOUNT1", "RECOILAMOUNT2", "RECOILAMOUNT3", "RECOILAMOUNT4") AS 
  select
 pc.doc_id,
 pc.groupcode, pc.okdp_code, pc.recipient_id, pc.purchasemode_id, pc.cmporg_id, pc.planyear, doc.budget_id,
 pc.payconditioncache_id,
 pc.goodscode, pc.unitname, pc.code1, pc.code2, pc.code3, pc.code4, pc.code5, pc.code6, pc.code7, pc.code8, pc.code9, pc.code10,
 pc.IndustryCode_Id, pc.GrantInvestment_Id,
 pc.finsrc_id, pc.deliverybasis_id, pc.invitationdate, pc.cmpdate, pc.descriptioncache_id, pc.contractor_id, pc.isenterprise, pc.issmall,
 case when (doc.documentclass_id in (1, 2) and doc.dispstatus_id in (2, 3, 4, 11, 13, 18, 19, 28, 31, 33)) then coalesce(pc.amount1, 0) else 0.00 end,
 case when (doc.documentclass_id in (1, 2) and doc.dispstatus_id in (2, 3, 4, 11, 13, 18, 19, 28, 31, 33)) then coalesce(pc.amount2, 0) else 0.00 end,
 case when (doc.documentclass_id in (1, 2) and doc.dispstatus_id in (2, 3, 4, 11, 13, 18, 19, 28, 31, 33)) then coalesce(pc.amount3, 0) else 0.00 end,
 case when (doc.documentclass_id in (1, 2) and doc.dispstatus_id in (2, 3, 4, 11, 13, 18, 19, 28, 31, 33)) then coalesce(pc.amount4, 0) else 0.00 end,
 case when (doc.documentclass_id = 1 and doc.dispstatus_id in (3, 13, 31)) or (doc.documentclass_id = 2 and doc.dispstatus_id in (19, 31)) then coalesce(pc.amount1, 0) else 0.00 end,
 case when (doc.documentclass_id = 1 and doc.dispstatus_id in (3, 13, 31)) or (doc.documentclass_id = 2 and doc.dispstatus_id in (19, 31)) then coalesce(pc.amount2, 0) else 0.00 end,
 case when (doc.documentclass_id = 1 and doc.dispstatus_id in (3, 13, 31)) or (doc.documentclass_id = 2 and doc.dispstatus_id in (19, 31)) then coalesce(pc.amount3, 0) else 0.00 end,
 case when (doc.documentclass_id = 1 and doc.dispstatus_id in (3, 13, 31)) or (doc.documentclass_id = 2 and doc.dispstatus_id in (19, 31)) then coalesce(pc.amount4, 0) else 0.00 end,
 case when (doc.documentclass_id in (1, 2) and doc.dispstatus_id = 17) then coalesce(pc.amount1, 0) else 0.00 end,
 case when (doc.documentclass_id in (1, 2) and doc.dispstatus_id = 17) then coalesce(pc.amount2, 0) else 0.00 end,
 case when (doc.documentclass_id in (1, 2) and doc.dispstatus_id = 17) then coalesce(pc.amount3, 0) else 0.00 end,
 case when (doc.documentclass_id in (1, 2) and doc.dispstatus_id = 17) then coalesce(pc.amount4, 0) else 0.00 end,
 case when (doc.documentclass_id in (1, 2) and doc.dispstatus_id = 6) or
           (doc.documentclass_id in (4, 28, 5, 36, 49) and doc.dispstatus_id in (5, 16, 43, 44, 47, 48, 49, 50, 51, 58, 59)) or
           (doc.documentclass_id = 3 and doc.dispstatus_id in (5)) then coalesce(pc.amount1, 0) else 0.00 end,
 case when (doc.documentclass_id in (1, 2) and doc.dispstatus_id = 6) or
           (doc.documentclass_id in (4, 28, 5, 36, 49) and doc.dispstatus_id in (5, 16, 43, 44, 47, 48, 49, 50, 51, 58, 59)) or
           (doc.documentclass_id = 3 and doc.dispstatus_id in (5)) then coalesce(pc.amount2, 0) else 0.00 end,
 case when (doc.documentclass_id in (1, 2) and doc.dispstatus_id = 6) or
           (doc.documentclass_id in (4, 28, 5, 36, 49) and doc.dispstatus_id in (5, 16, 43, 44, 47, 48, 49, 50, 51, 58, 59)) or
           (doc.documentclass_id = 3 and doc.dispstatus_id in (5)) then coalesce(pc.amount3, 0) else 0.00 end,
 case when (doc.documentclass_id in (1, 2) and doc.dispstatus_id = 6) or
           (doc.documentclass_id in (4, 28, 5, 36, 49) and doc.dispstatus_id in (5, 16, 43, 44, 47, 48, 49, 50, 51, 58, 59)) or
           (doc.documentclass_id = 3 and doc.dispstatus_id in (5)) then coalesce(pc.amount4, 0) else 0.00 end,
 case when doc.documentclass_id in (4, 28, 5, 36, 3, 49) and doc.dispstatus_id = 17 then coalesce(pc.amount1, 0) else 0.00 end,
 case when doc.documentclass_id in (4, 28, 5, 36, 3, 49) and doc.dispstatus_id = 17 then coalesce(pc.amount2, 0) else 0.00 end,
 case when doc.documentclass_id in (4, 28, 5, 36, 3, 49) and doc.dispstatus_id = 17 then coalesce(pc.amount3, 0) else 0.00 end,
 case when doc.documentclass_id in (4, 28, 5, 36, 3, 49) and doc.dispstatus_id = 17 then coalesce(pc.amount4, 0) else 0.00 end,
 case when (doc.documentclass_id in (4, 28, 5, 36, 49) and doc.dispstatus_id in (10, 12, 13, 20, 31, 30, 35, 45, 46, 52, 62, 63, 64, 65, 67, 68)) or
           (doc.documentclass_id = 3 and doc.dispstatus_id in (10, 13)) then coalesce(pc.amount1, 0) else 0.00 end,
 case when (doc.documentclass_id in (4, 28, 5, 36, 49) and doc.dispstatus_id in (10, 12, 13, 20, 31, 30, 35, 45, 46, 52, 62, 63, 64, 65, 67, 68)) or
           (doc.documentclass_id = 3 and doc.dispstatus_id in (10, 13)) then coalesce(pc.amount2, 0) else 0.00 end,
 case when (doc.documentclass_id in (4, 28, 5, 36, 49) and doc.dispstatus_id in (10, 12, 13, 20, 31, 30, 35, 45, 46, 52, 62, 63, 64, 65, 67, 68)) or
           (doc.documentclass_id = 3 and doc.dispstatus_id in (10, 13)) then coalesce(pc.amount3, 0) else 0.00 end,
 case when (doc.documentclass_id in (4, 28, 5, 36, 49) and doc.dispstatus_id in (10, 12, 13, 20, 31, 30, 35, 45, 46, 52, 62, 63, 64, 65, 67, 68)) or
           (doc.documentclass_id = 3 and doc.dispstatus_id in (10, 13)) then coalesce(pc.amount4, 0) else 0.00 end,
 pc.economyamount, pc.economyfinalamount,
 case when (doc.documentclass_id in (8, 9, 32) and doc.dispstatus_id in (2, 4, 5, 6, 10, 14, 16, 19, 32, 34, 35, 24, 25, 49, 50, 51, 52)) then coalesce(pc.amount1, 0) else 0.00 end,
 case when (doc.documentclass_id in (8, 9, 32) and doc.dispstatus_id in (2, 4, 5, 6, 10, 14, 16, 19, 32, 34, 35, 24, 25, 49, 50, 51, 52)) then coalesce(pc.amount2, 0) else 0.00 end,
 case when (doc.documentclass_id in (8, 9, 32) and doc.dispstatus_id in (2, 4, 5, 6, 10, 14, 16, 19, 32, 34, 35, 24, 25, 49, 50, 51, 52)) then coalesce(pc.amount3, 0) else 0.00 end,
 case when (doc.documentclass_id in (8, 9, 32) and doc.dispstatus_id in (2, 4, 5, 6, 10, 14, 16, 19, 32, 34, 35, 24, 25, 49, 50, 51, 52)) then coalesce(pc.amount4, 0) else 0.00 end,
 case when doc.documentclass_id in (8, 9, 32) and doc.dispstatus_id in (6, 24, 34, 25) then coalesce(pc.amount1, 0) else 0.00 end,
 case when doc.documentclass_id in (8, 9, 32) and doc.dispstatus_id in (6, 24, 34, 25) then coalesce(pc.amount2, 0) else 0.00 end,
 case when doc.documentclass_id in (8, 9, 32) and doc.dispstatus_id in (6, 24, 34, 25) then coalesce(pc.amount3, 0) else 0.00 end, 
 case when doc.documentclass_id in (8, 9, 32) and doc.dispstatus_id in (6, 24, 34, 25) then coalesce(pc.amount4, 0) else 0.00 end,
 case when doc.documentclass_id in (8, 9, 32) and doc.dispstatus_id in (17) then coalesce(pc.amount1, 0) else 0.00 end,
 case when doc.documentclass_id in (8, 9, 32) and doc.dispstatus_id in (17) then coalesce(pc.amount2, 0) else 0.00 end,
 case when doc.documentclass_id in (8, 9, 32) and doc.dispstatus_id in (17) then coalesce(pc.amount3, 0) else 0.00 end,
 case when doc.documentclass_id in (8, 9, 32) and doc.dispstatus_id in (17) then coalesce(pc.amount4, 0) else 0.00 end,
 case when doc.documentclass_id in (8, 9, 32) and doc.dispstatus_id in (10) then coalesce(pc.amount1, 0) else 0.00 end,
 case when doc.documentclass_id in (8, 9, 32) and doc.dispstatus_id in (10) then coalesce(pc.amount2, 0) else 0.00 end,
 case when doc.documentclass_id in (8, 9, 32) and doc.dispstatus_id in (10) then coalesce(pc.amount3, 0) else 0.00 end,
 case when doc.documentclass_id in (8, 9, 32) and doc.dispstatus_id in (10) then coalesce(pc.amount4, 0) else 0.00 end,
 coalesce(inv.suppliedamount, con.suppliedamount),
 case when ifl.docflagtype_id is not null then inv.amount else con.payedamount end,
 case when doc.documentclass_id = 48 and doc.dispstatus_id = 10 then coalesce(-pc.amount1, 0) else 0.00 end,
 case when doc.documentclass_id = 48 and doc.dispstatus_id = 10 then coalesce(-pc.amount2, 0) else 0.00 end,
 case when doc.documentclass_id = 48 and doc.dispstatus_id = 10 then coalesce(-pc.amount3, 0) else 0.00 end,
 case when doc.documentclass_id = 48 and doc.dispstatus_id = 10 then coalesce(-pc.amount4, 0) else 0.00 end
from PurchaseCarry pc
left join document doc on (pc.doc_id = doc.id)
left join contractdoc con on (doc.id = con.document_id and doc.documentclass_id in (8, 32))
left join invoicedoc inv on (doc.id = inv.document_id and doc.documentclass_id = 9)
left join docflag ifl on (inv.document_id = ifl.document_id and ifl.docflagtype_id = 34)
where pc.planversion=2;
--------------------------------------------------------
--  DDL for View PLAN2PURCHASECARRY
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "GZVLG"."PLAN2PURCHASECARRY" ("DOCUMENT_ID", "GROUPCODE", "OKDP_CODE", "CUSTOMER_ID", "PURCHASEMODE_ID", "CMPORG_ID", "PLANYEAR", "BUDGET_ID", "PAYCONDITION_ID", "GOODSCODE", "UNITNAME", "CODE1", "CODE2", "CODE3", "CODE4", "CODE5", "CODE6", "CODE7", "CODE8", "CODE9", "CODE10", "INDUSTRYCODE_ID", "GRANTINVESTMENT_ID", "FINSRC_ID", "DELIVERYBASIS_ID", "INVITATIONDATE", "CMPDATE", "LOT_DESCRIPTION_ID", "CONTRACTOR_ID", "ISENTERPRISE", "ISSMALL", "USEAMOUNT1", "USEAMOUNT2", "USEAMOUNT3", "USEAMOUNT4", "USECONFIRMAMOUNT1", "USECONFIRMAMOUNT2", "USECONFIRMAMOUNT3", "USECONFIRMAMOUNT4", "USEQUALIFYAMOUNT1", "USEQUALIFYAMOUNT2", "USEQUALIFYAMOUNT3", "USEQUALIFYAMOUNT4", "CONTROLAMOUNT1", "CONTROLAMOUNT2", "CONTROLAMOUNT3", "CONTROLAMOUNT4", "CONTROLQUALIFYAMOUNT1", "CONTROLQUALIFYAMOUNT2", "CONTROLQUALIFYAMOUNT3", "CONTROLQUALIFYAMOUNT4", "DECLAREDAMOUNT1", "DECLAREDAMOUNT2", "DECLAREDAMOUNT3", "DECLAREDAMOUNT4", "ECONOMYAMOUNT", "ECONOMYFINALAMOUNT", "DISTRIBUTEAMOUNT1", "DISTRIBUTEAMOUNT2", "DISTRIBUTEAMOUNT3", "DISTRIBUTEAMOUNT4", "DISTRIBUTECONFIRMAMOUNT1", "DISTRIBUTECONFIRMAMOUNT2", "DISTRIBUTECONFIRMAMOUNT3", "DISTRIBUTECONFIRMAMOUNT4", "DISTRIBUTEQUALIFYAMOUNT1", "DISTRIBUTEQUALIFYAMOUNT2", "DISTRIBUTEQUALIFYAMOUNT3", "DISTRIBUTEQUALIFYAMOUNT4", "EXECUTEAMOUNT1", "EXECUTEAMOUNT2", "EXECUTEAMOUNT3", "EXECUTEAMOUNT4", "SUPPLIEDAMOUNT", "PAYEDAMOUNT", "RECOILAMOUNT1", "RECOILAMOUNT2", "RECOILAMOUNT3", "RECOILAMOUNT4") AS 
  select
 MAX(document_id),
 groupcode, okdp_code, customer_id, purchasemode_id, cmporg_id, planyear, budget_id, paycondition_id,
 goodscode, unitname, code1, code2, code3, code4, code5, code6, code7, code8, code9, code10,
 IndustryCode_Id, GrantInvestment_Id,
 finsrc_id, deliverybasis_id, invitationdate, cmpdate, lot_description_id, contractor_id, isenterprise, issmall,
 SUM(useamount1), SUM(useamount2), SUM(useamount3), SUM(useamount4),
 SUM(useconfirmamount1), SUM(useconfirmamount2), SUM(useconfirmamount3), SUM(useconfirmamount4),
 SUM(usequalifyamount1), SUM(usequalifyamount2), SUM(usequalifyamount3), SUM(usequalifyamount4),
 SUM(controlamount1), SUM(controlamount2), SUM(controlamount3), SUM(controlamount4),
 SUM(controlqualifyamount1), SUM(controlqualifyamount2), SUM(controlqualifyamount3), SUM(controlqualifyamount4),
 SUM(declaredamount1), SUM(declaredamount2), SUM(declaredamount3), SUM(declaredamount4),
 SUM(economyamount), SUM(economyfinalamount),
 SUM(distributeamount1), SUM(distributeamount2), SUM(distributeamount3), SUM(distributeamount4),
 SUM(distributeconfirmamount1), SUM(distributeconfirmamount2), SUM(distributeconfirmamount3), SUM(distributeconfirmamount4),
 SUM(distributequalifyamount1), SUM(distributequalifyamount2), SUM(distributequalifyamount3), SUM(distributequalifyamount4),
 SUM(executeamount1), SUM(executeamount2), SUM(executeamount3), SUM(executeamount4),
 SUM(suppliedamount),
 SUM(payedamount),
 SUM(recoilamount1), SUM(recoilamount2), SUM(recoilamount3), SUM(recoilamount4)
from Plan2PurchaseCarryInternal pc
group by
 groupcode, okdp_code, customer_id, purchasemode_id, cmporg_id, planyear, budget_id, paycondition_id,
 goodscode, unitname, code1, code2, code3, code4, code5, code6, code7, code8, code9, code10,
 IndustryCode_Id, GrantInvestment_Id,
 finsrc_id, deliverybasis_id, invitationdate, cmpdate, lot_description_id, contractor_id, isenterprise, issmall;
--------------------------------------------------------
--  DDL for View PLAN2PURCHASECARRYBYKBK
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "GZVLG"."PLAN2PURCHASECARRYBYKBK" ("DOCUMENT_ID", "GROUPCODE", "OKDP_CODE", "CUSTOMER_ID", "PURCHASEMODE_ID", "CMPORG_ID", "PLANYEAR", "BUDGET_ID", "PAYCONDITION_ID", "GOODSCODE", "UNITNAME", "CODE1", "CODE2", "CODE3", "CODE4", "CODE5", "CODE6", "CODE7", "CODE8", "CODE9", "CODE10", "INDUSTRYCODE_ID", "GRANTINVESTMENT_ID", "FINSRC_ID", "DELIVERYBASIS_ID", "INVITATIONDATE", "CMPDATE", "LOT_DESCRIPTION_ID", "CONTRACTOR_ID", "ISENTERPRISE", "ISSMALL", "USEAMOUNT1", "USEAMOUNT2", "USEAMOUNT3", "USEAMOUNT4", "USECONFIRMAMOUNT1", "USECONFIRMAMOUNT2", "USECONFIRMAMOUNT3", "USECONFIRMAMOUNT4", "USEQUALIFYAMOUNT1", "USEQUALIFYAMOUNT2", "USEQUALIFYAMOUNT3", "USEQUALIFYAMOUNT4", "CONTROLAMOUNT1", "CONTROLAMOUNT2", "CONTROLAMOUNT3", "CONTROLAMOUNT4", "CONTROLQUALIFYAMOUNT1", "CONTROLQUALIFYAMOUNT2", "CONTROLQUALIFYAMOUNT3", "CONTROLQUALIFYAMOUNT4", "DECLAREDAMOUNT1", "DECLAREDAMOUNT2", "DECLAREDAMOUNT3", "DECLAREDAMOUNT4", "ECONOMYAMOUNT", "ECONOMYFINALAMOUNT", "DISTRIBUTEAMOUNT1", "DISTRIBUTEAMOUNT2", "DISTRIBUTEAMOUNT3", "DISTRIBUTEAMOUNT4", "DISTRIBUTECONFIRMAMOUNT1", "DISTRIBUTECONFIRMAMOUNT2", "DISTRIBUTECONFIRMAMOUNT3", "DISTRIBUTECONFIRMAMOUNT4", "DISTRIBUTEQUALIFYAMOUNT1", "DISTRIBUTEQUALIFYAMOUNT2", "DISTRIBUTEQUALIFYAMOUNT3", "DISTRIBUTEQUALIFYAMOUNT4", "EXECUTEAMOUNT1", "EXECUTEAMOUNT2", "EXECUTEAMOUNT3", "EXECUTEAMOUNT4", "SUPPLIEDAMOUNT", "PAYEDAMOUNT", "RECOILAMOUNT1", "RECOILAMOUNT2", "RECOILAMOUNT3", "RECOILAMOUNT4") AS 
  select
 MAX(document_id),
 null, null, customer_id, purchasemode_id, cmporg_id, planyear, budget_id, paycondition_id,
 null, null, code1, code2, code3, code4, code5, code6, code7, code8, code9, code10,
 IndustryCode_Id, GrantInvestment_Id,
 finsrc_id, deliverybasis_id, invitationdate, cmpdate, lot_description_id, contractor_id, isenterprise, issmall,
 SUM(useamount1), SUM(useamount2), SUM(useamount3), SUM(useamount4),
 SUM(useconfirmamount1), SUM(useconfirmamount2), SUM(useconfirmamount3), SUM(useconfirmamount4),
 SUM(usequalifyamount1), SUM(usequalifyamount2), SUM(usequalifyamount3), SUM(usequalifyamount4),
 SUM(controlamount1), SUM(controlamount2), SUM(controlamount3), SUM(controlamount4),
 SUM(controlqualifyamount1), SUM(controlqualifyamount2), SUM(controlqualifyamount3), SUM(controlqualifyamount4),
 SUM(declaredamount1), SUM(declaredamount2), SUM(declaredamount3), SUM(declaredamount4),
 SUM(economyamount), SUM(economyfinalamount),
 SUM(distributeamount1), SUM(distributeamount2), SUM(distributeamount3), SUM(distributeamount4),
 SUM(distributeconfirmamount1), SUM(distributeconfirmamount2), SUM(distributeconfirmamount3), SUM(distributeconfirmamount4),
 SUM(distributequalifyamount1), SUM(distributequalifyamount2), SUM(distributequalifyamount3), SUM(distributequalifyamount4),
 SUM(executeamount1), SUM(executeamount2), SUM(executeamount3), SUM(executeamount4),
 SUM(suppliedamount),
 SUM(payedamount),
 SUM(recoilamount1), SUM(recoilamount2), SUM(recoilamount3), SUM(recoilamount4)
from Plan2PurchaseCarryInternal pc
group by
 customer_id, purchasemode_id, cmporg_id, planyear, budget_id, paycondition_id,
 code1, code2, code3, code4, code5, code6, code7, code8, code9, code10,
 IndustryCode_Id, GrantInvestment_Id,
 finsrc_id, deliverybasis_id, invitationdate, cmpdate, lot_description_id, contractor_id, isenterprise, issmall;
--------------------------------------------------------
--  DDL for View PLAN2PURCHASECARRYBYPURCHASE
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "GZVLG"."PLAN2PURCHASECARRYBYPURCHASE" ("DOCUMENT_ID", "GROUPCODE", "OKDP_CODE", "CUSTOMER_ID", "PURCHASEMODE_ID", "CMPORG_ID", "PLANYEAR", "BUDGET_ID", "PAYCONDITION_ID", "GOODSCODE", "UNITNAME", "CODE1", "CODE2", "CODE3", "CODE4", "CODE5", "CODE6", "CODE7", "CODE8", "CODE9", "CODE10", "INDUSTRYCODE_ID", "GRANTINVESTMENT_ID", "FINSRC_ID", "DELIVERYBASIS_ID", "INVITATIONDATE", "CMPDATE", "LOT_DESCRIPTION_ID", "CONTRACTOR_ID", "ISENTERPRISE", "ISSMALL", "USEAMOUNT1", "USEAMOUNT2", "USEAMOUNT3", "USEAMOUNT4", "USECONFIRMAMOUNT1", "USECONFIRMAMOUNT2", "USECONFIRMAMOUNT3", "USECONFIRMAMOUNT4", "USEQUALIFYAMOUNT1", "USEQUALIFYAMOUNT2", "USEQUALIFYAMOUNT3", "USEQUALIFYAMOUNT4", "CONTROLAMOUNT1", "CONTROLAMOUNT2", "CONTROLAMOUNT3", "CONTROLAMOUNT4", "CONTROLQUALIFYAMOUNT1", "CONTROLQUALIFYAMOUNT2", "CONTROLQUALIFYAMOUNT3", "CONTROLQUALIFYAMOUNT4", "DECLAREDAMOUNT1", "DECLAREDAMOUNT2", "DECLAREDAMOUNT3", "DECLAREDAMOUNT4", "ECONOMYAMOUNT", "ECONOMYFINALAMOUNT", "DISTRIBUTEAMOUNT1", "DISTRIBUTEAMOUNT2", "DISTRIBUTEAMOUNT3", "DISTRIBUTEAMOUNT4", "DISTRIBUTECONFIRMAMOUNT1", "DISTRIBUTECONFIRMAMOUNT2", "DISTRIBUTECONFIRMAMOUNT3", "DISTRIBUTECONFIRMAMOUNT4", "DISTRIBUTEQUALIFYAMOUNT1", "DISTRIBUTEQUALIFYAMOUNT2", "DISTRIBUTEQUALIFYAMOUNT3", "DISTRIBUTEQUALIFYAMOUNT4", "EXECUTEAMOUNT1", "EXECUTEAMOUNT2", "EXECUTEAMOUNT3", "EXECUTEAMOUNT4", "SUPPLIEDAMOUNT", "PAYEDAMOUNT", "RECOILAMOUNT1", "RECOILAMOUNT2", "RECOILAMOUNT3", "RECOILAMOUNT4") AS 
  select
 MAX(document_id),
 null, null, customer_id, purchasemode_id, cmporg_id, planyear, budget_id, paycondition_id,
 null, null, null, null, null, null, null, null, null, null, null, null,
 null, null,
 null, deliverybasis_id, invitationdate, cmpdate, lot_description_id, contractor_id, isenterprise, issmall,
 SUM(useamount1), SUM(useamount2), SUM(useamount3), SUM(useamount4),
 SUM(useconfirmamount1), SUM(useconfirmamount2), SUM(useconfirmamount3), SUM(useconfirmamount4),
 SUM(usequalifyamount1), SUM(usequalifyamount2), SUM(usequalifyamount3), SUM(usequalifyamount4),
 SUM(controlamount1), SUM(controlamount2), SUM(controlamount3), SUM(controlamount4),
 SUM(controlqualifyamount1), SUM(controlqualifyamount2), SUM(controlqualifyamount3), SUM(controlqualifyamount4),
 SUM(declaredamount1), SUM(declaredamount2), SUM(declaredamount3), SUM(declaredamount4),
 SUM(economyamount), SUM(economyfinalamount),
 SUM(distributeamount1), SUM(distributeamount2), SUM(distributeamount3), SUM(distributeamount4),
 SUM(distributeconfirmamount1), SUM(distributeconfirmamount2), SUM(distributeconfirmamount3), SUM(distributeconfirmamount4),
 SUM(distributequalifyamount1), SUM(distributequalifyamount2), SUM(distributequalifyamount3), SUM(distributequalifyamount4),
 SUM(executeamount1), SUM(executeamount2), SUM(executeamount3), SUM(executeamount4),
 SUM(suppliedamount),
 SUM(payedamount),
 SUM(recoilamount1), SUM(recoilamount2), SUM(recoilamount3), SUM(recoilamount4)
from Plan2PurchaseCarryInternal pc
group by
 customer_id, purchasemode_id, cmporg_id, planyear, budget_id, paycondition_id,
 deliverybasis_id, invitationdate, cmpdate, lot_description_id, contractor_id, isenterprise, issmall;
--------------------------------------------------------
--  DDL for View PLAN2PURCHASECARRYINTBYKBK
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "GZVLG"."PLAN2PURCHASECARRYINTBYKBK" ("DOCUMENT_ID", "GROUPCODE", "OKDP_CODE", "CUSTOMER_ID", "PURCHASEMODE_ID", "CMPORG_ID", "PLANYEAR", "BUDGET_ID", "PAYCONDITION_ID", "GOODSCODE", "UNITNAME", "CODE1", "CODE2", "CODE3", "CODE4", "CODE5", "CODE6", "CODE7", "CODE8", "CODE9", "CODE10", "INDUSTRYCODE_ID", "GRANTINVESTMENT_ID", "FINSRC_ID", "DELIVERYBASIS_ID", "INVITATIONDATE", "CMPDATE", "LOT_DESCRIPTION_ID", "CONTRACTOR_ID", "ISENTERPRISE", "ISSMALL", "USEAMOUNT1", "USEAMOUNT2", "USEAMOUNT3", "USEAMOUNT4", "USECONFIRMAMOUNT1", "USECONFIRMAMOUNT2", "USECONFIRMAMOUNT3", "USECONFIRMAMOUNT4", "USEQUALIFYAMOUNT1", "USEQUALIFYAMOUNT2", "USEQUALIFYAMOUNT3", "USEQUALIFYAMOUNT4", "CONTROLAMOUNT1", "CONTROLAMOUNT2", "CONTROLAMOUNT3", "CONTROLAMOUNT4", "CONTROLQUALIFYAMOUNT1", "CONTROLQUALIFYAMOUNT2", "CONTROLQUALIFYAMOUNT3", "CONTROLQUALIFYAMOUNT4", "DECLAREDAMOUNT1", "DECLAREDAMOUNT2", "DECLAREDAMOUNT3", "DECLAREDAMOUNT4", "ECONOMYAMOUNT", "ECONOMYFINALAMOUNT", "DISTRIBUTEAMOUNT1", "DISTRIBUTEAMOUNT2", "DISTRIBUTEAMOUNT3", "DISTRIBUTEAMOUNT4", "DISTRIBUTECONFIRMAMOUNT1", "DISTRIBUTECONFIRMAMOUNT2", "DISTRIBUTECONFIRMAMOUNT3", "DISTRIBUTECONFIRMAMOUNT4", "DISTRIBUTEQUALIFYAMOUNT1", "DISTRIBUTEQUALIFYAMOUNT2", "DISTRIBUTEQUALIFYAMOUNT3", "DISTRIBUTEQUALIFYAMOUNT4", "EXECUTEAMOUNT1", "EXECUTEAMOUNT2", "EXECUTEAMOUNT3", "EXECUTEAMOUNT4", "SUPPLIEDAMOUNT", "PAYEDAMOUNT", "RECOILAMOUNT1", "RECOILAMOUNT2", "RECOILAMOUNT3", "RECOILAMOUNT4") AS 
  select
 document_id,
 null, null, customer_id, purchasemode_id, cmporg_id, planyear, budget_id, paycondition_id,
 null, null, code1, code2, code3, code4, code5, code6, code7, code8, code9, code10,
 IndustryCode_Id, GrantInvestment_Id,
 finsrc_id, deliverybasis_id, invitationdate, cmpdate, lot_description_id, contractor_id, isenterprise, issmall,
 useamount1, useamount2, useamount3, useamount4,
 useconfirmamount1, useconfirmamount2, useconfirmamount3, useconfirmamount4,
 usequalifyamount1, usequalifyamount2, usequalifyamount3, usequalifyamount4,
 controlamount1, controlamount2, controlamount3, controlamount4,
 controlqualifyamount1, controlqualifyamount2, controlqualifyamount3, controlqualifyamount4,
 declaredamount1, declaredamount2, declaredamount3, declaredamount4,
 economyamount, economyfinalamount,
 distributeamount1, distributeamount2, distributeamount3, distributeamount4,
 distributeconfirmamount1, distributeconfirmamount2, distributeconfirmamount3, distributeconfirmamount4,
 distributequalifyamount1, distributequalifyamount2, distributequalifyamount3, distributequalifyamount4,
 executeamount1, executeamount2, executeamount3, executeamount4,
 suppliedamount,
 payedamount,
 recoilamount1, recoilamount2, recoilamount3, recoilamount4
from Plan2PurchaseCarryInternal pc;
--------------------------------------------------------
--  DDL for View PLAN2PURCHASECARRYINTBYPURCH
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "GZVLG"."PLAN2PURCHASECARRYINTBYPURCH" ("DOCUMENT_ID", "GROUPCODE", "OKDP_CODE", "CUSTOMER_ID", "PURCHASEMODE_ID", "CMPORG_ID", "PLANYEAR", "BUDGET_ID", "PAYCONDITION_ID", "GOODSCODE", "UNITNAME", "CODE1", "CODE2", "CODE3", "CODE4", "CODE5", "CODE6", "CODE7", "CODE8", "CODE9", "CODE10", "INDUSTRYCODE_ID", "GRANTINVESTMENT_ID", "FINSRC_ID", "DELIVERYBASIS_ID", "INVITATIONDATE", "CMPDATE", "LOT_DESCRIPTION_ID", "CONTRACTOR_ID", "ISENTERPRISE", "ISSMALL", "USEAMOUNT1", "USEAMOUNT2", "USEAMOUNT3", "USEAMOUNT4", "USECONFIRMAMOUNT1", "USECONFIRMAMOUNT2", "USECONFIRMAMOUNT3", "USECONFIRMAMOUNT4", "USEQUALIFYAMOUNT1", "USEQUALIFYAMOUNT2", "USEQUALIFYAMOUNT3", "USEQUALIFYAMOUNT4", "CONTROLAMOUNT1", "CONTROLAMOUNT2", "CONTROLAMOUNT3", "CONTROLAMOUNT4", "CONTROLQUALIFYAMOUNT1", "CONTROLQUALIFYAMOUNT2", "CONTROLQUALIFYAMOUNT3", "CONTROLQUALIFYAMOUNT4", "DECLAREDAMOUNT1", "DECLAREDAMOUNT2", "DECLAREDAMOUNT3", "DECLAREDAMOUNT4", "ECONOMYAMOUNT", "ECONOMYFINALAMOUNT", "DISTRIBUTEAMOUNT1", "DISTRIBUTEAMOUNT2", "DISTRIBUTEAMOUNT3", "DISTRIBUTEAMOUNT4", "DISTRIBUTECONFIRMAMOUNT1", "DISTRIBUTECONFIRMAMOUNT2", "DISTRIBUTECONFIRMAMOUNT3", "DISTRIBUTECONFIRMAMOUNT4", "DISTRIBUTEQUALIFYAMOUNT1", "DISTRIBUTEQUALIFYAMOUNT2", "DISTRIBUTEQUALIFYAMOUNT3", "DISTRIBUTEQUALIFYAMOUNT4", "EXECUTEAMOUNT1", "EXECUTEAMOUNT2", "EXECUTEAMOUNT3", "EXECUTEAMOUNT4", "SUPPLIEDAMOUNT", "PAYEDAMOUNT", "RECOILAMOUNT1", "RECOILAMOUNT2", "RECOILAMOUNT3", "RECOILAMOUNT4") AS 
  select
 document_id,
 null, null, customer_id, purchasemode_id, cmporg_id, planyear, budget_id, paycondition_id,
 null, null, null, null, null, null, null, null, null, null, null, null,
 null, null,
 null, deliverybasis_id, invitationdate, cmpdate, lot_description_id, contractor_id, isenterprise, issmall,
 useamount1, useamount2, useamount3, useamount4,
 useconfirmamount1, useconfirmamount2, useconfirmamount3, useconfirmamount4,
 usequalifyamount1, usequalifyamount2, usequalifyamount3, usequalifyamount4,
 controlamount1, controlamount2, controlamount3, controlamount4,
 controlqualifyamount1, controlqualifyamount2, controlqualifyamount3, controlqualifyamount4,
 declaredamount1, declaredamount2, declaredamount3, declaredamount4,
 economyamount, economyfinalamount,
 distributeamount1, distributeamount2, distributeamount3, distributeamount4,
 distributeconfirmamount1, distributeconfirmamount2, distributeconfirmamount3, distributeconfirmamount4,
 distributequalifyamount1, distributequalifyamount2, distributequalifyamount3, distributequalifyamount4,
 executeamount1, executeamount2, executeamount3, executeamount4,
 suppliedamount,
 payedamount,
 recoilamount1, recoilamount2, recoilamount3, recoilamount4
from Plan2PurchaseCarryInternal pc;
--------------------------------------------------------
--  DDL for View PLAN2VIEWERINTERNAL
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "GZVLG"."PLAN2VIEWERINTERNAL" ("DOCUMENT_ID", "BUDGET_ID", "PLANYEAR", "GROUPCODE", "OKDP_CODE", "OKPD_CODE", "OKPD_ID", "OKPD_NAME", "OKVED", "OKVED_ID", "OKVED_NAME", "PRICE", "MINREQUIREMENT", "GOODSCODE", "GOODSCAPTION", "UNITNAME", "CUSTOMER_ID", "FINSRC_ID", "DELIVERYBASIS_ID", "PURCHASEMODE_ID", "PLAN_INVITATIONDATE", "PLAN_DEALDATE", "PLAN_CONTRACTEXECDATE", "CMPORG_ID", "ISENTERPRISE", "PURCHASETYPE", "CONTRACTOR_ID", "PLANPOSITION", "DESCRIPTION", "ORDERNUMBER", "ORDERNAME", "IDENTIFICATION_CODE", "CURRENCY_ID", "ORDERFORM", "CONTRACTPAYORDERCACHE_ID", "CHANGEREASON_ID", "PAYCONDITIONCACHE_ID", "SINGLECUSTOMERREASON_ID", "OFRREQREASON_ID", "INDUSTRYCODE_ID", "GRANTINVESTMENT_ID", "CODE1", "CODE2", "CODE3", "CODE4", "CODE5", "CODE6", "CODE7", "CODE8", "CODE9", "CODE10", "CHANGEREASONINFO", "EFORM", "FIN_RECIPIENT_ID", "CONEXECSTAGESCACHE_ID", "PERIODICITYCACHE_ID", "PROHIBITIONSCACHE_ID", "PUBLICDISCUSSCACHE_ID", "GOODSUNITPRICE_FLAG", "GUARANTEECONTRACTAMOUNT", "ADVANCEPERCENT", "RECIPIENT_ID", "CHANGEREASONDATE", "DELIVERYDATEFROM", "DELIVERYDATETO", "PAYDATEFROM", "PAYDATETO", "PLAN_AMOUNT", "GUARANTEEAPPAMOUNT", "SUMPUSHASESMALLBUSINESS", "PRCPUSHASESMALLBUSINESS", "LINE_AMOUNT", "LINE_AMOUNT_2YEAR", "LINE_AMOUNT_3YEAR", "LINE_AMOUNT_FUTURE", "GOODS_AMOUNT", "GOODS_AMOUNT_2YEAR", "GOODS_AMOUNT_3YEAR", "GOODS_AMOUNT_FUTURE", "GOODS_QTY", "GOODS_QTY_2YEAR", "GOODS_QTY_3YEAR", "GOODS_QTY_FUTURE") AS 
  select
 pd.document_id, pd.budget_id, pd.planyear,
 pg.groupcode, pg.okdp_code, pg.okpd_code, pg.okpd_id, pg.okpd_name, pg.okved, pg.okved_id, pg.okved_name, pg.price, pg.minrequirement,
 pg.goodscode, pg.goodscaption, pg.unitname, pd.customer_id, pl.finsrc_id, pd.deliverybasis_id, pd.purchasemode_id,
 pd.invitationdate, pd.dealdate, pd.contractexecdate, pd.cmporg_id, pd.isenterprise,
 pd.purchasetype, pd.contractor_id, pd.planposition, pd.description, pd.ordernumber, pd.ordernamecache_id, pd.identification_code, pd.currency_id, pd.orderform,
 pd.contractpayordercache_id, pd.changereason_id, pd.payconditioncache_id, pd.singlecustomerreason_id, pd.ofrreqreason_id,
 pl.industrycode_id, pl.grantinvestment_id, pl.code1, pl.code2, pl.code3, pl.code4, pl.code5, pl.code6, pl.code7, pl.code8, pl.code9, pl.code10,
 pd.changereasoninfo, pd.eform, pl.recipient_id, pd.conexecstagescache_id, pd.periodicitycache_id,
 pd.prohibitionscache_id, pd.publicdiscusscache_id, f192.docflagtype_id, pd.guaranteecontractamount, pd.advancepercents,
 pd.recipient_id, pd.changereasondate, pd.deliverydatefrom, pd.deliverydateto, pd.paydatefrom, pd.paydateto,
 pd.amount, pd.guaranteeappamount, pd.sumpushasesmallbusiness, pd.prcpushasesmallbusiness,
 pl.amount, pl.amount_2year, pl.amount_3year, pl.amount_future,
 pg.amount, pg.amount_2year, pg.amount_3year, pg.amount_future,
 pg.qty, pg.qty_2year, pg.qty_3year, pg.qty_future
from Plan3PurchaseDoc pd
inner join Plan3DocChild on (Plan3DocChild.doc_id=pd.id)
inner join Plan3Doc on (Plan3Doc.id=Plan3DocChild.plan3doc_id and Plan3Doc.dispstatus_id in (10,24) and Plan3Doc.documentclass_id=55)
inner join Plan3PurchaseLine pl on (pl.plan3purchasedoc_id=pd.id)
left join Plan3PurchaseGoods pg on (pg.plan3purchasedoc_id=pd.id and pg.plan3purchaselinepos=pl.pos)
left join DocFlag f192 on (f192.document_id=pd.document_id and f192.docflagtype_id=192)
where pd.dispstatus_id in (10,24);
--------------------------------------------------------
--  DDL for View PLAN2VIEWER
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "GZVLG"."PLAN2VIEWER" ("DOCUMENT_ID", "BUDGET_ID", "PLANYEAR", "GROUPCODE", "OKDP_CODE", "OKPD_CODE", "OKPD_ID", "OKPD_NAME", "OKVED", "OKVED_ID", "OKVED_NAME", "PRICE", "MINREQUIREMENT", "GOODSCODE", "GOODSCAPTION", "UNITNAME", "CUSTOMER_ID", "FINSRC_ID", "DELIVERYBASIS_ID", "PURCHASEMODE_ID", "PLAN_INVITATIONDATE", "PLAN_DEALDATE", "PLAN_CONTRACTEXECDATE", "CMPORG_ID", "ISENTERPRISE", "PURCHASETYPE", "CONTRACTOR_ID", "PLANPOSITION", "DESCRIPTION", "ORDERNUMBER", "ORDERNAME", "IDENTIFICATION_CODE", "CURRENCY_ID", "ORDERFORM", "CONTRACTPAYORDERCACHE_ID", "CHANGEREASON_ID", "PAYCONDITIONCACHE_ID", "SINGLECUSTOMERREASON_ID", "OFRREQREASON_ID", "INDUSTRYCODE_ID", "GRANTINVESTMENT_ID", "CODE1", "CODE2", "CODE3", "CODE4", "CODE5", "CODE6", "CODE7", "CODE8", "CODE9", "CODE10", "CHANGEREASONINFO", "EFORM", "FIN_RECIPIENT_ID", "CONEXECSTAGESCACHE_ID", "PERIODICITYCACHE_ID", "PROHIBITIONSCACHE_ID", "PUBLICDISCUSSCACHE_ID", "GOODSUNITPRICE_FLAG", "GUARANTEECONTRACTAMOUNT", "ADVANCEPERCENT", "RECIPIENT_ID", "CHANGEREASONDATE", "DELIVERYDATEFROM", "DELIVERYDATETO", "PAYDATEFROM", "PAYDATETO", "PLAN_AMOUNT", "GUARANTEEAPPAMOUNT", "SUMPUSHASESMALLBUSINESS", "PRCPUSHASESMALLBUSINESS", "LINE_AMOUNT", "LINE_AMOUNT_2YEAR", "LINE_AMOUNT_3YEAR", "LINE_AMOUNT_FUTURE", "GOODS_AMOUNT", "GOODS_AMOUNT_2YEAR", "GOODS_AMOUNT_3YEAR", "GOODS_AMOUNT_FUTURE", "GOODS_QTY", "GOODS_QTY_2YEAR", "GOODS_QTY_3YEAR", "GOODS_QTY_FUTURE") AS 
  select
 document_id, budget_id, planyear,
 groupcode, okdp_code, okpd_code, okpd_id, okpd_name, okved, okved_id, okved_name, price, minrequirement,
 goodscode, goodscaption, unitname, customer_id, finsrc_id, deliverybasis_id, purchasemode_id,
 plan_invitationdate, plan_dealdate, plan_contractexecdate, cmporg_id, isenterprise,
 purchasetype, contractor_id, planposition, description, ordernumber, ordername, identification_code, currency_id, orderform,
 contractpayordercache_id, changereason_id, payconditioncache_id, singlecustomerreason_id, ofrreqreason_id,
 industrycode_id, grantinvestment_id, code1, code2, code3, code4, code5, code6, code7, code8, code9, code10,
 changereasoninfo, eform, fin_recipient_id, conexecstagescache_id, periodicitycache_id,
 prohibitionscache_id, publicdiscusscache_id, goodsunitprice_flag, sum(guaranteecontractamount), avg(advancepercent),
 recipient_id, changereasondate, deliverydatefrom, deliverydateto, paydatefrom, paydateto,
 sum(plan_amount), sum(guaranteeappamount), sum(sumpushasesmallbusiness), avg(prcpushasesmallbusiness),
 sum(line_amount), sum(line_amount_2year), sum(line_amount_3year), sum(line_amount_future),
 sum(goods_amount), sum(goods_amount_2year), sum(goods_amount_3year), sum(goods_amount_future),
 sum(goods_qty), sum(goods_qty_2year), sum(goods_qty_3year), sum(goods_qty_future)
from Plan2ViewerInternal
group by
 document_id, budget_id, planyear,
 groupcode, okdp_code, okpd_code, okpd_id, okpd_name, okved, okved_id, okved_name, price, minrequirement,
 goodscode, goodscaption, unitname, customer_id, finsrc_id, deliverybasis_id, purchasemode_id,
 plan_invitationdate, plan_dealdate, plan_contractexecdate, cmporg_id, isenterprise,
 purchasetype, contractor_id, planposition, description, ordernumber, ordername, identification_code, currency_id, orderform,
 contractpayordercache_id, changereason_id, payconditioncache_id, singlecustomerreason_id, ofrreqreason_id,
 industrycode_id, grantinvestment_id, code1, code2, code3, code4, code5, code6, code7, code8, code9, code10,
 changereasoninfo, eform, fin_recipient_id, conexecstagescache_id, periodicitycache_id,
 prohibitionscache_id, publicdiscusscache_id, goodsunitprice_flag,
 recipient_id, changereasondate, deliverydatefrom, deliverydateto, paydatefrom, paydateto;
 --------------------------------------------------------
--  DDL for View PLAN2VIEWERINTERNALBYGRAPH
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "GZVLG"."PLAN2VIEWERINTERNALBYGRAPH" ("DOCUMENT_ID", "BUDGET_ID", "PLANYEAR", "GROUPCODE", "OKDP_CODE", "OKPD_CODE", "OKPD_ID", "OKPD_NAME", "OKVED", "OKVED_ID", "OKVED_NAME", "PRICE", "MINREQUIREMENT", "GOODSCODE", "GOODSCAPTION", "UNITNAME", "CUSTOMER_ID", "FINSRC_ID", "DELIVERYBASIS_ID", "PURCHASEMODE_ID", "PLAN_INVITATIONDATE", "PLAN_DEALDATE", "PLAN_CONTRACTEXECDATE", "CMPORG_ID", "ISENTERPRISE", "PURCHASETYPE", "CONTRACTOR_ID", "PLANPOSITION", "DESCRIPTION", "ORDERNUMBER", "ORDERNAME", "IDENTIFICATION_CODE", "CURRENCY_ID", "ORDERFORM", "CONTRACTPAYORDERCACHE_ID", "CHANGEREASON_ID", "PAYCONDITIONCACHE_ID", "SINGLECUSTOMERREASON_ID", "OFRREQREASON_ID", "INDUSTRYCODE_ID", "GRANTINVESTMENT_ID", "CODE1", "CODE2", "CODE3", "CODE4", "CODE5", "CODE6", "CODE7", "CODE8", "CODE9", "CODE10", "CHANGEREASONINFO", "EFORM", "FIN_RECIPIENT_ID", "CONEXECSTAGESCACHE_ID", "PERIODICITYCACHE_ID", "PROHIBITIONSCACHE_ID", "PUBLICDISCUSSCACHE_ID", "GOODSUNITPRICE_FLAG", "GUARANTEECONTRACTAMOUNT", "ADVANCEPERCENT", "RECIPIENT_ID", "CHANGEREASONDATE", "DELIVERYDATEFROM", "DELIVERYDATETO", "PAYDATEFROM", "PAYDATETO", "PLAN_AMOUNT", "GUARANTEEAPPAMOUNT", "SUMPUSHASESMALLBUSINESS", "PRCPUSHASESMALLBUSINESS", "DISPSTATUS_ID", "GRAPH_DOCUMENT_ID", "LINE_AMOUNT", "LINE_AMOUNT_2YEAR", "LINE_AMOUNT_3YEAR", "LINE_AMOUNT_FUTURE", "GOODS_AMOUNT", "GOODS_AMOUNT_2YEAR", "GOODS_AMOUNT_3YEAR", "GOODS_AMOUNT_FUTURE", "GOODS_QTY", "GOODS_QTY_2YEAR", "GOODS_QTY_3YEAR", "GOODS_QTY_FUTURE") AS 
  select
 pd.document_id, pd.budget_id, pd.planyear,
 pg.groupcode, pg.okdp_code, pg.okpd_code, pg.okpd_id, pg.okpd_name, pg.okved, pg.okved_id, pg.okved_name, pg.price, pg.minrequirement,
 pg.goodscode, pg.goodscaption, pg.unitname, pd.customer_id, pl.finsrc_id, pd.deliverybasis_id, pd.purchasemode_id,
 pd.invitationdate, pd.dealdate, pd.contractexecdate, pd.cmporg_id, pd.isenterprise,
 pd.purchasetype, pd.contractor_id, pd.planposition, pd.description, pd.ordernumber, pd.ordernamecache_id, pd.identification_code, pd.currency_id, pd.orderform,
 pd.contractpayordercache_id, pd.changereason_id, pd.payconditioncache_id, pd.singlecustomerreason_id, pd.ofrreqreason_id,
 pl.industrycode_id, pl.grantinvestment_id, pl.code1, pl.code2, pl.code3, pl.code4, pl.code5, pl.code6, pl.code7, pl.code8, pl.code9, pl.code10,
 pd.changereasoninfo, pd.eform, pl.recipient_id, pd.conexecstagescache_id, pd.periodicitycache_id,
 pd.prohibitionscache_id, pd.publicdiscusscache_id, f192.docflagtype_id, pd.guaranteecontractamount, pd.advancepercents,
 pd.recipient_id, pd.changereasondate, pd.deliverydatefrom, pd.deliverydateto, pd.paydatefrom, pd.paydateto,
 pd.amount, pd.guaranteeappamount, pd.sumpushasesmallbusiness, pd.prcpushasesmallbusiness,
 pd.dispstatus_id, Plan3Doc.document_id,
 pl.amount, pl.amount_2year, pl.amount_3year, pl.amount_future,
 pg.amount, pg.amount_2year, pg.amount_3year, pg.amount_future,
 pg.qty, pg.qty_2year, pg.qty_3year, pg.qty_future
from Plan3PurchaseDoc pd
inner join Plan3DocChild on (Plan3DocChild.doc_id=pd.id)
inner join Plan3Doc on (Plan3Doc.id=Plan3DocChild.plan3doc_id and Plan3Doc.documentclass_id=55)
inner join Plan3PurchaseLine pl on (pl.plan3purchasedoc_id=pd.id)
left join Plan3PurchaseGoods pg on (pg.plan3purchasedoc_id=pd.id and pg.plan3purchaselinepos=pl.pos)
left join DocFlag f192 on (f192.document_id=pd.document_id and f192.docflagtype_id=192);
--------------------------------------------------------
--  DDL for View PLAN2VIEWERBYGRAPH
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "GZVLG"."PLAN2VIEWERBYGRAPH" ("DOCUMENT_ID", "BUDGET_ID", "PLANYEAR", "GROUPCODE", "OKDP_CODE", "OKPD_CODE", "OKPD_ID", "OKPD_NAME", "OKVED", "OKVED_ID", "OKVED_NAME", "PRICE", "MINREQUIREMENT", "GOODSCODE", "GOODSCAPTION", "UNITNAME", "CUSTOMER_ID", "FINSRC_ID", "DELIVERYBASIS_ID", "PURCHASEMODE_ID", "PLAN_INVITATIONDATE", "PLAN_DEALDATE", "PLAN_CONTRACTEXECDATE", "CMPORG_ID", "ISENTERPRISE", "PURCHASETYPE", "CONTRACTOR_ID", "PLANPOSITION", "DESCRIPTION", "ORDERNUMBER", "ORDERNAME", "IDENTIFICATION_CODE", "CURRENCY_ID", "ORDERFORM", "CONTRACTPAYORDERCACHE_ID", "CHANGEREASON_ID", "PAYCONDITIONCACHE_ID", "SINGLECUSTOMERREASON_ID", "OFRREQREASON_ID", "INDUSTRYCODE_ID", "GRANTINVESTMENT_ID", "CODE1", "CODE2", "CODE3", "CODE4", "CODE5", "CODE6", "CODE7", "CODE8", "CODE9", "CODE10", "CHANGEREASONINFO", "EFORM", "FIN_RECIPIENT_ID", "CONEXECSTAGESCACHE_ID", "PERIODICITYCACHE_ID", "PROHIBITIONSCACHE_ID", "PUBLICDISCUSSCACHE_ID", "GOODSUNITPRICE_FLAG", "GUARANTEECONTRACTAMOUNT", "ADVANCEPERCENT", "RECIPIENT_ID", "CHANGEREASONDATE", "DELIVERYDATEFROM", "DELIVERYDATETO", "PAYDATEFROM", "PAYDATETO", "PLAN_AMOUNT", "GUARANTEEAPPAMOUNT", "SUMPUSHASESMALLBUSINESS", "PRCPUSHASESMALLBUSINESS", "DISPSTATUS_ID", "GRAPH_DOCUMENT_ID", "LINE_AMOUNT", "LINE_AMOUNT_2YEAR", "LINE_AMOUNT_3YEAR", "LINE_AMOUNT_FUTURE", "GOODS_AMOUNT", "GOODS_AMOUNT_2YEAR", "GOODS_AMOUNT_3YEAR", "GOODS_AMOUNT_FUTURE", "GOODS_QTY", "GOODS_QTY_2YEAR", "GOODS_QTY_3YEAR", "GOODS_QTY_FUTURE") AS 
  select
 document_id, budget_id, planyear,
 groupcode, okdp_code, okpd_code, okpd_id, okpd_name, okved, okved_id, okved_name, price, minrequirement,
 goodscode, goodscaption, unitname, customer_id, finsrc_id, deliverybasis_id, purchasemode_id,
 plan_invitationdate, plan_dealdate, plan_contractexecdate, cmporg_id, isenterprise,
 purchasetype, contractor_id, planposition, description, ordernumber, ordername, identification_code, currency_id, orderform,
 contractpayordercache_id, changereason_id, payconditioncache_id, singlecustomerreason_id, ofrreqreason_id,
 industrycode_id, grantinvestment_id, code1, code2, code3, code4, code5, code6, code7, code8, code9, code10,
 changereasoninfo, eform, fin_recipient_id, conexecstagescache_id, periodicitycache_id,
 prohibitionscache_id, publicdiscusscache_id, goodsunitprice_flag, sum(guaranteecontractamount), avg(advancepercent),
 recipient_id, changereasondate, deliverydatefrom, deliverydateto, paydatefrom, paydateto,
 sum(plan_amount), sum(guaranteeappamount), sum(sumpushasesmallbusiness), avg(prcpushasesmallbusiness),
 dispstatus_id, graph_document_id,
 sum(line_amount), sum(line_amount_2year), sum(line_amount_3year), sum(line_amount_future),
 sum(goods_amount), sum(goods_amount_2year), sum(goods_amount_3year), sum(goods_amount_future),
 sum(goods_qty), sum(goods_qty_2year), sum(goods_qty_3year), sum(goods_qty_future)
from Plan2ViewerInternalByGraph
group by
 document_id, budget_id, planyear,
 groupcode, okdp_code, okpd_code, okpd_id, okpd_name, okved, okved_id, okved_name, price, minrequirement,
 goodscode, goodscaption, unitname, customer_id, finsrc_id, deliverybasis_id, purchasemode_id,
 plan_invitationdate, plan_dealdate, plan_contractexecdate, cmporg_id, isenterprise,
 purchasetype, contractor_id, planposition, description, ordernumber, ordername, identification_code, currency_id, orderform,
 contractpayordercache_id, changereason_id, payconditioncache_id, singlecustomerreason_id, ofrreqreason_id,
 industrycode_id, grantinvestment_id, code1, code2, code3, code4, code5, code6, code7, code8, code9, code10,
 changereasoninfo, eform, fin_recipient_id, conexecstagescache_id, periodicitycache_id,
 prohibitionscache_id, publicdiscusscache_id, goodsunitprice_flag,
 recipient_id, changereasondate, deliverydatefrom, deliverydateto, paydatefrom, paydateto,
 dispstatus_id, graph_document_id;
 --------------------------------------------------------
--  DDL for View PLAN2VIEWERINTERNALBYKBK
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "GZVLG"."PLAN2VIEWERINTERNALBYKBK" ("DOCUMENT_ID", "BUDGET_ID", "PLANYEAR", "GROUPCODE", "OKDP_CODE", "OKPD_CODE", "OKPD_ID", "OKPD_NAME", "OKVED", "OKVED_ID", "OKVED_NAME", "PRICE", "MINREQUIREMENT", "GOODSCODE", "GOODSCAPTION", "UNITNAME", "CUSTOMER_ID", "FINSRC_ID", "DELIVERYBASIS_ID", "PURCHASEMODE_ID", "PLAN_INVITATIONDATE", "PLAN_DEALDATE", "PLAN_CONTRACTEXECDATE", "CMPORG_ID", "ISENTERPRISE", "PURCHASETYPE", "CONTRACTOR_ID", "PLANPOSITION", "DESCRIPTION", "ORDERNUMBER", "ORDERNAME", "IDENTIFICATION_CODE", "CURRENCY_ID", "ORDERFORM", "CONTRACTPAYORDERCACHE_ID", "CHANGEREASON_ID", "PAYCONDITIONCACHE_ID", "SINGLECUSTOMERREASON_ID", "OFRREQREASON_ID", "INDUSTRYCODE_ID", "GRANTINVESTMENT_ID", "CODE1", "CODE2", "CODE3", "CODE4", "CODE5", "CODE6", "CODE7", "CODE8", "CODE9", "CODE10", "CHANGEREASONINFO", "EFORM", "FIN_RECIPIENT_ID", "CONEXECSTAGESCACHE_ID", "PERIODICITYCACHE_ID", "PROHIBITIONSCACHE_ID", "PUBLICDISCUSSCACHE_ID", "GOODSUNITPRICE_FLAG", "GUARANTEECONTRACTAMOUNT", "ADVANCEPERCENT", "RECIPIENT_ID", "CHANGEREASONDATE", "DELIVERYDATEFROM", "DELIVERYDATETO", "PAYDATEFROM", "PAYDATETO", "PLAN_AMOUNT", "GUARANTEEAPPAMOUNT", "SUMPUSHASESMALLBUSINESS", "PRCPUSHASESMALLBUSINESS", "LINE_AMOUNT", "LINE_AMOUNT_2YEAR", "LINE_AMOUNT_3YEAR", "LINE_AMOUNT_FUTURE", "GOODS_AMOUNT", "GOODS_AMOUNT_2YEAR", "GOODS_AMOUNT_3YEAR", "GOODS_AMOUNT_FUTURE", "GOODS_QTY", "GOODS_QTY_2YEAR", "GOODS_QTY_3YEAR", "GOODS_QTY_FUTURE") AS 
  select
 pd.document_id, pd.budget_id, pd.planyear,
 null, null, null, null, null, null, null, null, null, null,
 null, null, null, pd.customer_id, pl.finsrc_id, pd.deliverybasis_id, pd.purchasemode_id,
 pd.invitationdate, pd.dealdate, pd.contractexecdate, pd.cmporg_id, pd.isenterprise,
 pd.purchasetype, pd.contractor_id, pd.planposition, pd.description, pd.ordernumber, pd.ordernamecache_id, pd.identification_code, pd.currency_id, pd.orderform,
 pd.contractpayordercache_id, pd.changereason_id, pd.payconditioncache_id, pd.singlecustomerreason_id, pd.ofrreqreason_id,
 pl.industrycode_id, pl.grantinvestment_id, pl.code1, pl.code2, pl.code3, pl.code4, pl.code5, pl.code6, pl.code7, pl.code8, pl.code9, pl.code10,
 pd.changereasoninfo, pd.eform, pl.recipient_id, pd.conexecstagescache_id, pd.periodicitycache_id,
 pd.prohibitionscache_id, pd.publicdiscusscache_id, f192.docflagtype_id, pd.guaranteecontractamount, pd.advancepercents,
 pd.recipient_id, pd.changereasondate, pd.deliverydatefrom, pd.deliverydateto, pd.paydatefrom, pd.paydateto,
 pd.amount, pd.guaranteeappamount, pd.sumpushasesmallbusiness, pd.prcpushasesmallbusiness,
 pl.amount, pl.amount_2year, pl.amount_3year, pl.amount_future,
 0, 0, 0, 0,
 0, 0, 0, 0
from Plan3PurchaseDoc pd
inner join Plan3DocChild on (Plan3DocChild.doc_id=pd.id)
inner join Plan3Doc on (Plan3Doc.id=Plan3DocChild.plan3doc_id and Plan3Doc.dispstatus_id in (10,24) and Plan3Doc.documentclass_id=55)
inner join Plan3PurchaseLine pl on (pl.plan3purchasedoc_id=pd.id)
left join DocFlag f192 on (f192.document_id=pd.document_id and f192.docflagtype_id=192)
where pd.dispstatus_id in (10,24);
--------------------------------------------------------
--  DDL for View PLAN2VIEWERBYKBK
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "GZVLG"."PLAN2VIEWERBYKBK" ("DOCUMENT_ID", "BUDGET_ID", "PLANYEAR", "GROUPCODE", "OKDP_CODE", "OKPD_CODE", "OKPD_ID", "OKPD_NAME", "OKVED", "OKVED_ID", "OKVED_NAME", "PRICE", "MINREQUIREMENT", "GOODSCODE", "GOODSCAPTION", "UNITNAME", "CUSTOMER_ID", "FINSRC_ID", "DELIVERYBASIS_ID", "PURCHASEMODE_ID", "PLAN_INVITATIONDATE", "PLAN_DEALDATE", "PLAN_CONTRACTEXECDATE", "CMPORG_ID", "ISENTERPRISE", "PURCHASETYPE", "CONTRACTOR_ID", "PLANPOSITION", "DESCRIPTION", "ORDERNUMBER", "ORDERNAME", "IDENTIFICATION_CODE", "CURRENCY_ID", "ORDERFORM", "CONTRACTPAYORDERCACHE_ID", "CHANGEREASON_ID", "PAYCONDITIONCACHE_ID", "SINGLECUSTOMERREASON_ID", "OFRREQREASON_ID", "INDUSTRYCODE_ID", "GRANTINVESTMENT_ID", "CODE1", "CODE2", "CODE3", "CODE4", "CODE5", "CODE6", "CODE7", "CODE8", "CODE9", "CODE10", "CHANGEREASONINFO", "EFORM", "FIN_RECIPIENT_ID", "CONEXECSTAGESCACHE_ID", "PERIODICITYCACHE_ID", "PROHIBITIONSCACHE_ID", "PUBLICDISCUSSCACHE_ID", "GOODSUNITPRICE_FLAG", "GUARANTEECONTRACTAMOUNT", "ADVANCEPERCENT", "RECIPIENT_ID", "CHANGEREASONDATE", "DELIVERYDATEFROM", "DELIVERYDATETO", "PAYDATEFROM", "PAYDATETO", "PLAN_AMOUNT", "GUARANTEEAPPAMOUNT", "SUMPUSHASESMALLBUSINESS", "PRCPUSHASESMALLBUSINESS", "LINE_AMOUNT", "LINE_AMOUNT_2YEAR", "LINE_AMOUNT_3YEAR", "LINE_AMOUNT_FUTURE", "GOODS_AMOUNT", "GOODS_AMOUNT_2YEAR", "GOODS_AMOUNT_3YEAR", "GOODS_AMOUNT_FUTURE", "GOODS_QTY", "GOODS_QTY_2YEAR", "GOODS_QTY_3YEAR", "GOODS_QTY_FUTURE") AS 
  select
 document_id, budget_id, planyear,
 groupcode, okdp_code, okpd_code, okpd_id, okpd_name, okved, okved_id, okved_name, price, minrequirement,
 goodscode, goodscaption, unitname, customer_id, finsrc_id, deliverybasis_id, purchasemode_id,
 plan_invitationdate, plan_dealdate, plan_contractexecdate, cmporg_id, isenterprise,
 purchasetype, contractor_id, planposition, description, ordernumber, ordername, identification_code, currency_id, orderform,
 contractpayordercache_id, changereason_id, payconditioncache_id, singlecustomerreason_id, ofrreqreason_id,
 industrycode_id, grantinvestment_id, code1, code2, code3, code4, code5, code6, code7, code8, code9, code10,
 changereasoninfo, eform, fin_recipient_id, conexecstagescache_id, periodicitycache_id,
 prohibitionscache_id, publicdiscusscache_id, goodsunitprice_flag, sum(guaranteecontractamount), avg(advancepercent),
 recipient_id, changereasondate, deliverydatefrom, deliverydateto, paydatefrom, paydateto,
 sum(plan_amount), sum(guaranteeappamount), sum(sumpushasesmallbusiness), avg(prcpushasesmallbusiness),
 sum(line_amount), sum(line_amount_2year), sum(line_amount_3year), sum(line_amount_future),
 sum(goods_amount), sum(goods_amount_2year), sum(goods_amount_3year), sum(goods_amount_future),
 sum(goods_qty), sum(goods_qty_2year), sum(goods_qty_3year), sum(goods_qty_future)
from Plan2ViewerInternalByKBK
group by
 document_id, budget_id, planyear,
 groupcode, okdp_code, okpd_code, okpd_id, okpd_name, okved, okved_id, okved_name, price, minrequirement,
 goodscode, goodscaption, unitname, customer_id, finsrc_id, deliverybasis_id, purchasemode_id,
 plan_invitationdate, plan_dealdate, plan_contractexecdate, cmporg_id, isenterprise,
 purchasetype, contractor_id, planposition, description, ordernumber, ordername, identification_code, currency_id, orderform,
 contractpayordercache_id, changereason_id, payconditioncache_id, singlecustomerreason_id, ofrreqreason_id,
 industrycode_id, grantinvestment_id, code1, code2, code3, code4, code5, code6, code7, code8, code9, code10,
 changereasoninfo, eform, fin_recipient_id, conexecstagescache_id, periodicitycache_id,
 prohibitionscache_id, publicdiscusscache_id, goodsunitprice_flag,
 recipient_id, changereasondate, deliverydatefrom, deliverydateto, paydatefrom, paydateto;
 --------------------------------------------------------
--  DDL for View PLAN2VIEWERINTERNALBYPURCHASE
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "GZVLG"."PLAN2VIEWERINTERNALBYPURCHASE" ("DOCUMENT_ID", "BUDGET_ID", "PLANYEAR", "GROUPCODE", "OKDP_CODE", "OKPD_CODE", "OKPD_ID", "OKPD_NAME", "OKVED", "OKVED_ID", "OKVED_NAME", "PRICE", "MINREQUIREMENT", "GOODSCODE", "GOODSCAPTION", "UNITNAME", "CUSTOMER_ID", "FINSRC_ID", "DELIVERYBASIS_ID", "PURCHASEMODE_ID", "PLAN_INVITATIONDATE", "PLAN_DEALDATE", "PLAN_CONTRACTEXECDATE", "CMPORG_ID", "ISENTERPRISE", "PURCHASETYPE", "CONTRACTOR_ID", "PLANPOSITION", "DESCRIPTION", "ORDERNUMBER", "ORDERNAME", "IDENTIFICATION_CODE", "CURRENCY_ID", "ORDERFORM", "CONTRACTPAYORDERCACHE_ID", "CHANGEREASON_ID", "PAYCONDITIONCACHE_ID", "SINGLECUSTOMERREASON_ID", "OFRREQREASON_ID", "INDUSTRYCODE_ID", "GRANTINVESTMENT_ID", "CODE1", "CODE2", "CODE3", "CODE4", "CODE5", "CODE6", "CODE7", "CODE8", "CODE9", "CODE10", "CHANGEREASONINFO", "EFORM", "FIN_RECIPIENT_ID", "CONEXECSTAGESCACHE_ID", "PERIODICITYCACHE_ID", "PROHIBITIONSCACHE_ID", "PUBLICDISCUSSCACHE_ID", "GOODSUNITPRICE_FLAG", "GUARANTEECONTRACTAMOUNT", "ADVANCEPERCENT", "RECIPIENT_ID", "CHANGEREASONDATE", "DELIVERYDATEFROM", "DELIVERYDATETO", "PAYDATEFROM", "PAYDATETO", "PLAN_AMOUNT", "GUARANTEEAPPAMOUNT", "SUMPUSHASESMALLBUSINESS", "PRCPUSHASESMALLBUSINESS", "LINE_AMOUNT", "LINE_AMOUNT_2YEAR", "LINE_AMOUNT_3YEAR", "LINE_AMOUNT_FUTURE", "GOODS_AMOUNT", "GOODS_AMOUNT_2YEAR", "GOODS_AMOUNT_3YEAR", "GOODS_AMOUNT_FUTURE", "GOODS_QTY", "GOODS_QTY_2YEAR", "GOODS_QTY_3YEAR", "GOODS_QTY_FUTURE") AS 
  select
 pd.document_id, pd.budget_id, pd.planyear,
 null, null, null, null, null, null, null, null, null, null,
 null, null, null, pd.customer_id, null, pd.deliverybasis_id, pd.purchasemode_id,
 pd.invitationdate, pd.dealdate, pd.contractexecdate, pd.cmporg_id, pd.isenterprise,
 pd.purchasetype, pd.contractor_id, pd.planposition, pd.description, pd.ordernumber, pd.ordernamecache_id, pd.identification_code, pd.currency_id, pd.orderform,
 pd.contractpayordercache_id, pd.changereason_id, pd.payconditioncache_id, pd.singlecustomerreason_id, pd.ofrreqreason_id,
 null, null, null, null, null, null, null, null, null, null, null, null,
 pd.changereasoninfo, pd.eform, null, pd.conexecstagescache_id, pd.periodicitycache_id,
 pd.prohibitionscache_id, pd.publicdiscusscache_id, f192.docflagtype_id, pd.guaranteecontractamount, pd.advancepercents,
 pd.recipient_id, pd.changereasondate, pd.deliverydatefrom, pd.deliverydateto, pd.paydatefrom, pd.paydateto,
 pd.amount, pd.guaranteeappamount, pd.sumpushasesmallbusiness, pd.prcpushasesmallbusiness,
 0, 0, 0, 0,
 0, 0, 0, 0,
 0, 0, 0, 0
from Plan3PurchaseDoc pd
inner join Plan3DocChild on (Plan3DocChild.doc_id=pd.id)
inner join Plan3Doc on (Plan3Doc.id=Plan3DocChild.plan3doc_id and Plan3Doc.dispstatus_id in (10,24) and Plan3Doc.documentclass_id=55)
left join DocFlag f192 on (f192.document_id=pd.document_id and f192.docflagtype_id=192)
where pd.dispstatus_id in (10,24);
--------------------------------------------------------
--  DDL for View PLAN2VIEWERBYPURCHASE
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "GZVLG"."PLAN2VIEWERBYPURCHASE" ("DOCUMENT_ID", "BUDGET_ID", "PLANYEAR", "GROUPCODE", "OKDP_CODE", "OKPD_CODE", "OKPD_ID", "OKPD_NAME", "OKVED", "OKVED_ID", "OKVED_NAME", "PRICE", "MINREQUIREMENT", "GOODSCODE", "GOODSCAPTION", "UNITNAME", "CUSTOMER_ID", "FINSRC_ID", "DELIVERYBASIS_ID", "PURCHASEMODE_ID", "PLAN_INVITATIONDATE", "PLAN_DEALDATE", "PLAN_CONTRACTEXECDATE", "CMPORG_ID", "ISENTERPRISE", "PURCHASETYPE", "CONTRACTOR_ID", "PLANPOSITION", "DESCRIPTION", "ORDERNUMBER", "ORDERNAME", "IDENTIFICATION_CODE", "CURRENCY_ID", "ORDERFORM", "CONTRACTPAYORDERCACHE_ID", "CHANGEREASON_ID", "PAYCONDITIONCACHE_ID", "SINGLECUSTOMERREASON_ID", "OFRREQREASON_ID", "INDUSTRYCODE_ID", "GRANTINVESTMENT_ID", "CODE1", "CODE2", "CODE3", "CODE4", "CODE5", "CODE6", "CODE7", "CODE8", "CODE9", "CODE10", "CHANGEREASONINFO", "EFORM", "FIN_RECIPIENT_ID", "CONEXECSTAGESCACHE_ID", "PERIODICITYCACHE_ID", "PROHIBITIONSCACHE_ID", "PUBLICDISCUSSCACHE_ID", "GOODSUNITPRICE_FLAG", "GUARANTEECONTRACTAMOUNT", "ADVANCEPERCENT", "RECIPIENT_ID", "CHANGEREASONDATE", "DELIVERYDATEFROM", "DELIVERYDATETO", "PAYDATEFROM", "PAYDATETO", "PLAN_AMOUNT", "GUARANTEEAPPAMOUNT", "SUMPUSHASESMALLBUSINESS", "PRCPUSHASESMALLBUSINESS", "LINE_AMOUNT", "LINE_AMOUNT_2YEAR", "LINE_AMOUNT_3YEAR", "LINE_AMOUNT_FUTURE", "GOODS_AMOUNT", "GOODS_AMOUNT_2YEAR", "GOODS_AMOUNT_3YEAR", "GOODS_AMOUNT_FUTURE", "GOODS_QTY", "GOODS_QTY_2YEAR", "GOODS_QTY_3YEAR", "GOODS_QTY_FUTURE") AS 
  select
 document_id, budget_id, planyear,
 groupcode, okdp_code, okpd_code, okpd_id, okpd_name, okved, okved_id, okved_name, price, minrequirement,
 goodscode, goodscaption, unitname, customer_id, finsrc_id, deliverybasis_id, purchasemode_id,
 plan_invitationdate, plan_dealdate, plan_contractexecdate, cmporg_id, isenterprise,
 purchasetype, contractor_id, planposition, description, ordernumber, ordername, identification_code, currency_id, orderform,
 contractpayordercache_id, changereason_id, payconditioncache_id, singlecustomerreason_id, ofrreqreason_id,
 industrycode_id, grantinvestment_id, code1, code2, code3, code4, code5, code6, code7, code8, code9, code10,
 changereasoninfo, eform, fin_recipient_id, conexecstagescache_id, periodicitycache_id,
 prohibitionscache_id, publicdiscusscache_id, goodsunitprice_flag, sum(guaranteecontractamount), avg(advancepercent),
 recipient_id, changereasondate, deliverydatefrom, deliverydateto, paydatefrom, paydateto,
 sum(plan_amount), sum(guaranteeappamount), sum(sumpushasesmallbusiness), avg(prcpushasesmallbusiness),
 sum(line_amount), sum(line_amount_2year), sum(line_amount_3year), sum(line_amount_future),
 sum(goods_amount), sum(goods_amount_2year), sum(goods_amount_3year), sum(goods_amount_future),
 sum(goods_qty), sum(goods_qty_2year), sum(goods_qty_3year), sum(goods_qty_future)
from Plan2ViewerInternalByPurchase
group by
 document_id, budget_id, planyear,
 groupcode, okdp_code, okpd_code, okpd_id, okpd_name, okved, okved_id, okved_name, price, minrequirement,
 goodscode, goodscaption, unitname, customer_id, finsrc_id, deliverybasis_id, purchasemode_id,
 plan_invitationdate, plan_dealdate, plan_contractexecdate, cmporg_id, isenterprise,
 purchasetype, contractor_id, planposition, description, ordernumber, ordername, identification_code, currency_id, orderform,
 contractpayordercache_id, changereason_id, payconditioncache_id, singlecustomerreason_id, ofrreqreason_id,
 industrycode_id, grantinvestment_id, code1, code2, code3, code4, code5, code6, code7, code8, code9, code10,
 changereasoninfo, eform, fin_recipient_id, conexecstagescache_id, periodicitycache_id,
 prohibitionscache_id, publicdiscusscache_id, goodsunitprice_flag,
 recipient_id, changereasondate, deliverydatefrom, deliverydateto, paydatefrom, paydateto;
 --------------------------------------------------------
--  DDL for View PLAN2VIEWERIC_ORDER_INTERNAL
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "GZVLG"."PLAN2VIEWERIC_ORDER_INTERNAL" ("ORDER_ID", "DOCUMENT_ID", "BUDGET_ID", "PLANYEAR", "PLANPOSITIONNUMBER", "CUSTOMER_ID", "ISMAXINVITATIONDATE", "CUSTOMERPOS", "INVITATIONDATE", "AMOUNT") AS 
  select
  od.ID, od.DOCUMENT_ID, od.BUDGET_ID, extract(YEAR from coalesce(cast(od.PLAN_INVITATIONDATE as DATE), od.PLAN_DEALDATE)),
  cl.PlanPositionNumber, cl.CUSTOMER_ID, cl.ISMAXINVITATIONDATE, cl.POS,
  coalesce(cast(od.PLAN_INVITATIONDATE as DATE), od.PLAN_DEALDATE),
  coalesce(cl.AMOUNT, od.AMOUNT)
from OrderDoc od
left join CmpCustomerLot cl on (cl.Order_ID = od.id)
where od.dispstatus_id in (10, 12, 13, 20, 24, 30, 31, 35, 45, 46, 52, 61, 62, 63, 64, 65, 66, 68, 70, 71, 76,
  77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87);
--------------------------------------------------------
--  DDL for View PLAN2VIEWERIC_ORDER
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "GZVLG"."PLAN2VIEWERIC_ORDER" ("DOCUMENT_ID", "BUDGET_ID", "PLANYEAR", "PLANPOSITIONNUMBER", "CUSTOMER_ID", "INVITATIONDATE", "AMOUNT") AS 
  select
  oi.Document_ID, oi.Budget_ID, oi.PlanYear,
  oi.PlanPositionNumber, oi.Customer_ID,
  oi.InvitationDate,
  oi.Amount
from Plan2ViewerIC_Order_Internal oi
where oi.PlanPositionNumber is not null and oi.IsMaxInvitationDate <> 0;
--------------------------------------------------------
--  DDL for View PLAN2VIEWERIC_PLAN_INTERNAL
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "GZVLG"."PLAN2VIEWERIC_PLAN_INTERNAL" ("PLAN3DOC_ID", "VERSION", "DOCUMENT_ID", "BUDGET_ID", "PLANYEAR", "PLANPOSITIONNUMBER", "PURCHASEMODE_ID", "PURCHASETYPE", "CUSTOMER_ID", "CMPORG_ID", "ORDERNAME_CACHE_ID", "IDENTIFICATION_CODE", "DESCRIPTION", "CHANGEREASON_ID", "PLAN_INVITATIONDATE", "PLAN_CMPDATE", "PLAN_EXECDATE", "AMOUNT") AS 
  select
  pd.ID, pd.VERSION, pd.DOCUMENT_ID, pd.BUDGET_ID, pd.PLANYEAR, pd.PLANPOSITION, pd.PURCHASEMODE_ID,
  pd.PURCHASETYPE, pd.CUSTOMER_ID, pd.CMPORG_ID, pd.ORDERNAMECACHE_ID, pd.IDENTIFICATION_CODE, pd.DESCRIPTION,
  pd.CHANGEREASON_ID,
  pd.INVITATIONDATE, pd.DEALDATE, pd.CONTRACTEXECDATE,
  pd.AMOUNT
from PLAN3PURCHASEDOC pd
where pd.DISPSTATUS_ID in (10,24) and pd.PLANPOSITION is not null;
--------------------------------------------------------
--  DDL for View PLAN2VIEWERIC_PLAN
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "GZVLG"."PLAN2VIEWERIC_PLAN" ("PLAN3DOC_ID", "VERSION", "DOCUMENT_ID", "BUDGET_ID", "PLANYEAR", "PLANPOSITIONNUMBER", "PURCHASEMODE_ID", "PURCHASETYPE", "CUSTOMER_ID", "CMPORG_ID", "ORDERNAME_CACHE_ID", "IDENTIFICATION_CODE", "DESCRIPTION", "CHANGEREASON_ID", "PLAN_INVITATIONDATE", "PLAN_CMPDATE", "PLAN_EXECDATE", "AMOUNT") AS 
  select
  pi.Plan3Doc_ID, pi.Version, pi.Document_ID, pi.Budget_ID, pi.PlanYear, pi.PlanPositionNumber, pi.PurchaseMode_ID,
  pi.PurchaseType, pi.Customer_ID, pi.CmpOrg_ID, pi.OrderName_cache_ID, pi.Identification_Code, pi.Description,
  pi.ChangeReason_ID,
  pi.Plan_InvitationDate, pi.Plan_CmpDate, pi.Plan_ExecDate,
  SUM(pi.Amount)
from Plan2ViewerIC_Plan_Internal pi
group by
  pi.Plan3Doc_ID, pi.Version, pi.Document_ID, pi.Budget_ID, pi.PlanYear, pi.PlanPositionNumber, pi.PurchaseMode_ID,
  pi.PurchaseType, pi.Customer_ID, pi.CmpOrg_ID, pi.OrderName_cache_ID, pi.Identification_Code, pi.Description,
  pi.ChangeReason_ID,
  pi.Plan_InvitationDate, pi.Plan_CmpDate, pi.Plan_ExecDate;
--------------------------------------------------------
--  DDL for View PURCHASECARRYINTERNALVIEW
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "GZVLG"."PURCHASECARRYINTERNALVIEW" ("DOCUMENT_ID", "GROUPCODE", "OKDP_CODE", "CUSTOMER_ID", "PURCHASEMODE_ID", "CMPORG_ID", "NECESSITY_ID", "PLANYEAR", "BUDGET_ID", "USEAMOUNT1", "USEAMOUNT2", "USEAMOUNT3", "USEAMOUNT4", "CONTROLAMOUNT1", "CONTROLAMOUNT2", "CONTROLAMOUNT3", "CONTROLAMOUNT4", "DECLAREDAMOUNT1", "DECLAREDAMOUNT2", "DECLAREDAMOUNT3", "DECLAREDAMOUNT4", "ECONOMYAMOUNT", "DISTRIBUTEAMOUNT1", "DISTRIBUTEAMOUNT2", "DISTRIBUTEAMOUNT3", "DISTRIBUTEAMOUNT4", "EXECUTEAMOUNT1", "EXECUTEAMOUNT2", "EXECUTEAMOUNT3", "EXECUTEAMOUNT4") AS 
  select
 pc.doc_id,
 pc.groupcode, pc.okdp_code, pc.recipient_id, pc.purchasemode_id, pc.cmporg_id, pc.necessity_id, pc.planyear, doc.budget_id,
 case when ((doc.documentclass_id=1 or doc.documentclass_id=2) and pc.carrystatus=1) or (doc.documentclass_id in (3,4,5,28,36) and doc.dispstatus_id in (5,16)) then coalesce(pc.amount1, 0) else 0.00 end,
 case when ((doc.documentclass_id=1 or doc.documentclass_id=2) and pc.carrystatus=1) or (doc.documentclass_id in (3,4,5,28,36) and doc.dispstatus_id in (5,16)) then coalesce(pc.amount2, 0) else 0.00 end,
 case when ((doc.documentclass_id=1 or doc.documentclass_id=2) and pc.carrystatus=1) or (doc.documentclass_id in (3,4,5,28,36) and doc.dispstatus_id in (5,16)) then coalesce(pc.amount3, 0) else 0.00 end,
 case when ((doc.documentclass_id=1 or doc.documentclass_id=2) and pc.carrystatus=1) or (doc.documentclass_id in (3,4,5,28,36) and doc.dispstatus_id in (5,16)) then coalesce(pc.amount4, 0) else 0.00 end,
 case when pc.carrystatus<>1 then coalesce(pc.amount1, 0) else 0.00 end,
 case when pc.carrystatus<>1 then coalesce(pc.amount2, 0) else 0.00 end,
 case when pc.carrystatus<>1 then coalesce(pc.amount3, 0) else 0.00 end,
 case when pc.carrystatus<>1 then coalesce(pc.amount4, 0) else 0.00 end,
 case when doc.documentclass_id in (3,4,5,28,36) and doc.dispstatus_id not in (5,16) and pc.carrystatus=1 then coalesce(pc.amount1, 0) else 0.00 end,
 case when doc.documentclass_id in (3,4,5,28,36) and doc.dispstatus_id not in (5,16) and pc.carrystatus=1 then coalesce(pc.amount2, 0) else 0.00 end,
 case when doc.documentclass_id in (3,4,5,28,36) and doc.dispstatus_id not in (5,16) and pc.carrystatus=1 then coalesce(pc.amount3, 0) else 0.00 end,
 case when doc.documentclass_id in (3,4,5,28,36) and doc.dispstatus_id not in (5,16) and pc.carrystatus=1 then coalesce(pc.amount4, 0) else 0.00 end,
 pc.economyamount,
 case when doc.documentclass_id in (8,9,32) and pc.carrystatus=1 then coalesce(pc.amount1, 0) else 0.00 end,
 case when doc.documentclass_id in (8,9,32) and pc.carrystatus=1 then coalesce(pc.amount2, 0) else 0.00 end,
 case when doc.documentclass_id in (8,9,32) and pc.carrystatus=1 then coalesce(pc.amount3, 0) else 0.00 end,
 case when doc.documentclass_id in (8,9,32) and pc.carrystatus=1 then coalesce(pc.amount4, 0) else 0.00 end,
 coalesce(pc.executeamount1, 0),
 coalesce(pc.executeamount2, 0),
 coalesce(pc.executeamount3, 0),
 coalesce(pc.executeamount4, 0)
from PurchaseCarry pc
left join document doc on (pc.doc_id = doc.id)
where pc.planversion=1;
--------------------------------------------------------
--  DDL for View PURCHASECARRYVIEWERVIEW
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "GZVLG"."PURCHASECARRYVIEWERVIEW" ("DOCUMENT_ID", "GROUPCODE", "OKDP_CODE", "CUSTOMER_ID", "PURCHASEMODE_ID", "CMPORG_ID", "NECESSITY_ID", "PLANYEAR", "BUDGET_ID", "PAYCONDITIONNAME", "GOODSCODE", "UNITNAME", "CODE1", "CODE2", "CODE3", "CODE4", "CODE5", "CODE6", "CODE7", "CODE8", "CODE9", "CODE10", "FINSRC_ID", "DELIVERYBASIS_ID", "INVITATIONDATE", "CMPDATE", "DESCRIPTION", "CONTRACTOR_ID", "ISENTERPRISE", "ISSMALL", "USEAMOUNT1", "USEAMOUNT2", "USEAMOUNT3", "USEAMOUNT4", "USECONFIRMAMOUNT1", "USECONFIRMAMOUNT2", "USECONFIRMAMOUNT3", "USECONFIRMAMOUNT4", "USEQUALIFYAMOUNT1", "USEQUALIFYAMOUNT2", "USEQUALIFYAMOUNT3", "USEQUALIFYAMOUNT4", "CONTROLAMOUNT1", "CONTROLAMOUNT2", "CONTROLAMOUNT3", "CONTROLAMOUNT4", "CONTROLQUALIFYAMOUNT1", "CONTROLQUALIFYAMOUNT2", "CONTROLQUALIFYAMOUNT3", "CONTROLQUALIFYAMOUNT4", "DECLAREDAMOUNT1", "DECLAREDAMOUNT2", "DECLAREDAMOUNT3", "DECLAREDAMOUNT4", "ECONOMYAMOUNT", "DISTRIBUTEAMOUNT1", "DISTRIBUTEAMOUNT2", "DISTRIBUTEAMOUNT3", "DISTRIBUTEAMOUNT4", "DISTRIBUTECONFIRMAMOUNT1", "DISTRIBUTECONFIRMAMOUNT2", "DISTRIBUTECONFIRMAMOUNT3", "DISTRIBUTECONFIRMAMOUNT4", "DISTRIBUTEQUALIFYAMOUNT1", "DISTRIBUTEQUALIFYAMOUNT2", "DISTRIBUTEQUALIFYAMOUNT3", "DISTRIBUTEQUALIFYAMOUNT4", "EXECUTEAMOUNT1", "EXECUTEAMOUNT2", "EXECUTEAMOUNT3", "EXECUTEAMOUNT4", "SUPPLIEDAMOUNT", "PAYEDAMOUNT") AS 
  select
 MIN(0),
 groupcode, cast(null as char), customer_id, purchasemode_id, cmporg_id, necessity_id, planyear, budget_id,
 cast(null as char),
 cast(null as char), cast(null as char), cast(null as char), cast(null as char), cast(null as char), cast(null as char),
 cast(null as char), cast(null as char), cast(null as char), cast(null as char), cast(null as char), cast(null as char),
 cast(null as numeric), cast(null as numeric), cast(null as date), cast(null as date), cast(null as char),
 cast(null as numeric), cast(null as numeric), cast(null as numeric),
 SUM(useamount1), SUM(useamount2), SUM(useamount3), SUM(useamount4),
 SUM(0.00), SUM(0.00), SUM(0.00), SUM(0.00),
 SUM(0.00), SUM(0.00), SUM(0.00), SUM(0.00),
 SUM(controlamount1), SUM(controlamount2), SUM(controlamount3), SUM(controlamount4),
 SUM(0.00), SUM(0.00), SUM(0.00), SUM(0.00),
 SUM(declaredamount1), SUM(declaredamount2), SUM(declaredamount3), SUM(declaredamount4),
 SUM(economyamount),
 SUM(distributeamount1), SUM(distributeamount2), SUM(distributeamount3), SUM(distributeamount4),
 SUM(0.00), SUM(0.00), SUM(0.00), SUM(0.00),
 SUM(0.00), SUM(0.00), SUM(0.00), SUM(0.00),
 SUM(executeamount1), SUM(executeamount2), SUM(executeamount3), SUM(executeamount4),
 SUM(0.00),
 SUM(0.00)
from PurchaseCarryInternalView pc
group by
 groupcode, customer_id, purchasemode_id, cmporg_id, necessity_id, planyear, budget_id;
--------------------------------------------------------
--  DDL for View PURCHASEPLANINTERNALVIEW
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "GZVLG"."PURCHASEPLANINTERNALVIEW" ("DOCUMENT_ID", "GROUPCODE", "OKDP_CODE", "CUSTOMER_ID", "PURCHASEMODE_ID", "CMPORG_ID", "NECESSITY_ID", "PLANYEAR", "DESC_ID", "DESCRIPTION", "DATEBEGIN", "DATEEND", "BUDGET_ID", "AMOUNT1", "AMOUNT2", "AMOUNT3", "AMOUNT4", "AMOUNT5", "AMOUNT6", "AMOUNT7", "AMOUNT8", "AMOUNT9", "AMOUNT10", "AMOUNT11", "AMOUNT12", "ENTAMOUNT1", "ENTAMOUNT2", "ENTAMOUNT3", "ENTAMOUNT4", "ENTAMOUNT5", "ENTAMOUNT6", "ENTAMOUNT7", "ENTAMOUNT8", "ENTAMOUNT9", "ENTAMOUNT10", "ENTAMOUNT11", "ENTAMOUNT12") AS 
  select
 ppd.document_id,
 pp.groupcode, cast(null as char), pp.customer_id, pp.purchasemode_id, pp.cmporg_id, pp.necessity_id,
 ppd.planyear, pp.desc_id, d.description, pp.datebegin, pp.dateend, ppd.budget_id,
 coalesce(pp.amount1, 0), coalesce(pp.amount2, 0), coalesce(pp.amount3, 0),
 coalesce(pp.amount4, 0), coalesce(pp.amount5, 0), coalesce(pp.amount6, 0),
 coalesce(pp.amount7, 0), coalesce(pp.amount8, 0), coalesce(pp.amount9, 0),
 coalesce(pp.amount10, 0),coalesce(pp.amount11, 0),coalesce(pp.amount12, 0),
 coalesce(pp.entamount1, 0), coalesce(pp.entamount2, 0), coalesce(pp.entamount3, 0),
 coalesce(pp.entamount4, 0), coalesce(pp.entamount5, 0), coalesce(pp.entamount6, 0),
 coalesce(pp.entamount7, 0), coalesce(pp.entamount8, 0), coalesce(pp.entamount9, 0),
 coalesce(pp.entamount10, 0),coalesce(pp.entamount11, 0),coalesce(pp.entamount12, 0)
from PurchasePlan pp
inner join PurchasePlanDoc ppd on (pp.purchaseplandoc_id = ppd.id)
left outer join description d on (d.id = pp.desc_id)
where ppd.dispstatus_id = 10;
--------------------------------------------------------
--  DDL for View PURCHASEPLANVIEWERVIEW
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "GZVLG"."PURCHASEPLANVIEWERVIEW" ("DOCUMENT_ID", "GROUPCODE", "OKDP_CODE", "CUSTOMER_ID", "PURCHASEMODE_ID", "CMPORG_ID", "NECESSITY_ID", "PLANYEAR", "DESC_ID", "DESCRIPTION", "DATEBEGIN", "DATEEND", "BUDGET_ID", "PAYCONDITIONNAME", "PAYDATEFROM", "PAYDATETO", "GOODSCODE", "UNITNAME", "CODE1", "CODE2", "CODE3", "CODE4", "CODE5", "CODE6", "CODE7", "CODE8", "CODE9", "CODE10", "FINSRC_ID", "DELIVERYBASIS_ID", "CONTRACTOR_ID", "ISENTERPRISE", "ISSMALL", "DEALDATE", "PAYAMOUNT", "PAYAMOUNTPROLONG", "AMOUNT1", "AMOUNT2", "AMOUNT3", "AMOUNT4", "AMOUNT5", "AMOUNT6", "AMOUNT7", "AMOUNT8", "AMOUNT9", "AMOUNT10", "AMOUNT11", "AMOUNT12", "ENTAMOUNT1", "ENTAMOUNT2", "ENTAMOUNT3", "ENTAMOUNT4", "ENTAMOUNT5", "ENTAMOUNT6", "ENTAMOUNT7", "ENTAMOUNT8", "ENTAMOUNT9", "ENTAMOUNT10", "ENTAMOUNT11", "ENTAMOUNT12", "CHANGE_AMOUNT_QUARTER1", "CHANGE_AMOUNT_QUARTER2", "CHANGE_AMOUNT_QUARTER3", "CHANGE_AMOUNT_QUARTER4") AS 
  select
 MIN(0),
 groupcode, cast(null as char), customer_id, purchasemode_id, cmporg_id, necessity_id,
 planyear, desc_id, description, datebegin, dateend, budget_id,
 cast(null as char), cast(null as date), cast(null as date),
 cast(null as char), cast(null as char), cast(null as char), cast(null as char), cast(null as char), cast(null as char),
 cast(null as char), cast(null as char), cast(null as char), cast(null as char), cast(null as char), cast(null as char),
 cast(null as numeric), cast(null as numeric), cast(null as numeric), cast(null as numeric), cast(null as numeric), cast(null as date),
 SUM(0.00), SUM(0.00),
 SUM(amount1), SUM(amount2), SUM(amount3), SUM(amount4), SUM(amount5), SUM(amount6),
 SUM(amount7), SUM(amount8), SUM(amount9), SUM(amount10), SUM(amount11), SUM(amount12),
 SUM(entamount1), SUM(entamount2), SUM(entamount3), SUM(entamount4), SUM(entamount5), SUM(entamount6),
 SUM(entamount7), SUM(entamount8), SUM(entamount9), SUM(entamount10), SUM(entamount11), SUM(entamount12),
 SUM(0.00), SUM(0.00), SUM(0.00), SUM(0.00)
from PurchasePlanInternalView pp
group by
 groupcode, customer_id, purchasemode_id, cmporg_id, necessity_id,
 planyear, desc_id, description, datebegin, dateend, budget_id;
--------------------------------------------------------
--  DDL for View ROLEACTIONVIEW
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "GZVLG"."ROLEACTIONVIEW" ("USERROLE_ID", "DOCUMENTCLASS_ID", "DISPSTATUS_ID", "NAME") AS 
  select c.userrole_id,a.documentclass_id,a.dispstatus_id,a.name from docaction a 
    join roleclass c on c.documentclass_id=a.documentclass_id
  where c.access_mode=3
  union
  select e.userrole_id,a.documentclass_id,a.dispstatus_id,a.name from docaction a 
    join roleevent e on e.event_name=a.docevent_name and e.documentclass_id=a.documentclass_id and e.dispstatus_id=a.dispstatus_id
    join roleclass c on c.documentclass_id=e.documentclass_id
  where c.access_mode=2
  union
  select c.userrole_id,a.documentclass_id,a.dispstatus_id,a.name from docaction a
    join roleclass c on c.documentclass_id=a.documentclass_id
  where (c.access_mode=2 or c.access_mode=3) and a.docevent_name is null;
--------------------------------------------------------
--  DDL for View ROLEEVENTVIEW
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "GZVLG"."ROLEEVENTVIEW" ("USERROLE_ID", "DOCUMENTCLASS_ID", "DISPSTATUS_ID", "NAME") AS 
  select c.userrole_id,e.documentclass_id,e.dispstatus_id,e.name from docevent e
  join roleclass c on c.documentclass_id=e.documentclass_id
  where c.access_mode=3
  union
  select e.userrole_id,e.documentclass_id,e.dispstatus_id,e.event_name from roleevent e
  join roleclass c on c.documentclass_id=e.documentclass_id
  where c.access_mode=2;
--------------------------------------------------------
--  DDL for View SUMMARYPLANVIEW
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "GZVLG"."SUMMARYPLANVIEW" ("ID", "CAPTION", "CODE", "CUSTOMERID", "FSDESCRIPTION", "CMPORGNAME", "CUSTOMERNAME", "PMCAPTION", "CUSTOMERCODE", "AMOUNT1", "AMOUNT2", "AMOUNT3", "AMOUNT4", "AMOUNT5", "AMOUNT6", "AMOUNT7", "AMOUNT8", "AMOUNT9", "AMOUNT10", "AMOUNT11", "AMOUNT12", "PARENT_ID", "PLANYEAR", "BUDGETID", "DISPSTATUS_ID", "CMPORG_ID", "PURCHASEMODE_ID", "IS_ACTUAL", "DATEBEGIN", "DATEEND") AS 
  SELECT a.ID,a.CAPTION,a.CODE, ppd.Customer_ID CUSTOMERID,
fs.Description FSDESCRIPTION, og.Caption CMPORGNAME,ogc.Caption CUSTOMERNAME,
pm.Caption PMCaption,ogc.CustomerCode CUSTOMERCODE, SUM(pp.Amount1) Amount1,SUM(pp.Amount2) Amount2,
SUM(pp.Amount3) Amount3,SUM(pp.Amount4) Amount4,SUM(pp.Amount5) Amount5,
SUM(pp.Amount6) Amount6,SUM(pp.Amount7) Amount7,SUM(pp.Amount8) Amount8,
SUM(pp.Amount9) Amount9,SUM(pp.Amount10) Amount10,SUM(pp.Amount11) Amount11,
SUM(pp.Amount12) Amount12, a.parent_id, 
ppd.PlanYear, ppd.budget_id, ppd.dispstatus_id, pp.cmporg_id, pp.purchasemode_id, a.is_actual, pp.datebegin, pp.dateend
 FROM GOODSGROUP a
    JOIN PURCHASEPLAN pp on pp.GROUPCODE=a.CODE
    JOIN PURCHASEPLANDOC ppd on ppd.ID=pp.PurchasePlanDoc_ID
     LEFT JOIN ORG og on og.ID=pp.CMPORG_ID
     LEFT JOIN ORG ogc on ogc.ID=ppd.CUSTOMER_ID
      LEFT JOIN PURCHASEMODE pm on pm.ID=pp.PURCHASEMODE_ID
       LEFT JOIN FinSrc fs on fs.ID=pp.FINSRC_ID
         GROUP BY a.ID, a.CAPTION, a.CODE, pp.PURCHASEMODE_ID, pp.CMPORG_ID,
          ppd.Customer_ID, pp.FinSrc_ID, fs.Description, og.Caption, ogc.Caption,
          pm.Caption, ogc.CustomerCode, a.parent_id, 
          ppd.PlanYear, ppd.budget_id, ppd.dispstatus_id, pp.cmporg_id,
          pp.purchasemode_id, a.is_actual, pp.datebegin, pp.dateend
union all
SELECT a.ID,a.CAPTION,a.CODE, cast(null as numeric(18,0)) CUSTOMERID,
cast(null as varchar(255)) FsDescription, cast(null as varchar(100)) CMPORGNAME,
cast(null as varchar(100)) CUSTOMERNAME,cast(null as varchar(100)) PMCaption,
cast(null as varchar(5)) CUSTOMERCODE, cast(null as numeric(18,2)) Amount1,
cast(null as numeric(18,2)) Amount2, cast(null as numeric(18,2)) Amount3,
cast(null as numeric(18,2)) Amount4, cast(null as numeric(18,2)) Amount5,
cast(null as numeric(18,2)) Amount6, cast(null as numeric(18,2)) Amount7,
cast(null as numeric(18,2)) Amount8, cast(null as numeric(18,2)) Amount9,
cast(null as numeric(18,2)) Amount10,cast(null as numeric(18,2)) Amount11,
cast(null as numeric(18,2)) Amount12, a.parent_id,
cast(null as numeric(4,0)) PlanYear, cast(null as numeric(18,0)) budget_ID,
cast(null as numeric(18,0)) dispstatus_id, cast(null as numeric(18,0)) cmporg_id,
cast(null as numeric(18,0)) purchasemode_id, a.is_actual,
cast(null as date)datebegin, cast(null as date)dateend
 FROM GOODSGROUP a WHERE a.id in (select parent_id from GOODSGROUP);
--------------------------------------------------------
--  DDL for View USERROLES
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "GZVLG"."USERROLES" ("SYSUSER_ID", "USERROLE_ID") AS 
  select p.user_id, p.grantedrole_id from roleregister p
where p.grantdate = (select max (grantdate) from roleregister r
  where r.user_id = p.user_id and r.grantedrole_id=p.grantedrole_id
  and r.grantdate<=SYSTIMESTAMP+0.000015) and
  SYSDATE between p.fromdate and p.todate
  and p.grantdate<=SYSTIMESTAMP+0.000015  and p.dispstatus_id = 10 and p.operation = 1;
--------------------------------------------------------
--  DDL for View USERACTIONVIEW
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "GZVLG"."USERACTIONVIEW" ("SYSUSER_ID", "DOCUMENTCLASS_ID", "DISPSTATUS_ID", "NAME") AS 
  SELECT DISTINCT
    r.sysuser_id, e.documentclass_id, e.dispstatus_id, e.name
  FROM roleactionview e
    JOIN userroles r ON r.userrole_id=e.userrole_id
;
--------------------------------------------------------
--  DDL for View USEREVENTVIEW
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "GZVLG"."USEREVENTVIEW" ("SYSUSER_ID", "DOCUMENTCLASS_ID", "DISPSTATUS_ID", "NAME") AS 
  SELECT DISTINCT
    r.sysuser_id, e.documentclass_id, e.dispstatus_id, e.name
  FROM roleeventview e
    JOIN userroles r ON r.userrole_id=e.userrole_id
;
--------------------------------------------------------
--  DDL for View V_SIGNS
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "GZVLG"."V_SIGNS" ("ID", "DOCUMENT_ID", "USERROLE_ID", "USERCERT_SN", "USERCERT_ISSUER_SN", "SIGN_TYPE", "IS_VALID") AS 
  select 
  s.id as id, 
  d.document_id, 
  s.userrole_id, 
  s.certserialnumber as usercert_sn, 
  s.certissuerserialnumber as usercert_issuer_sn, 
  0 as sign_type,
  s.isvalid  as is_valid
from     
   digestsign s
   join digest d on (d.id = s.digest_id)
union all
select 
  s.id as id, 
  a.document_id, 
  s.userrole_id, 
  s.certserialnumber, 
  s.certissuerserialnumber, 
  1 as sign_type, 
  s.isvalid  as sign_valid
from     
   digestsign s
   join docattachex a on (a.id = s.docattachex_id);
