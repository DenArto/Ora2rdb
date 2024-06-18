--------------------------------------------------------
--  DDL for Table ABANDONEDREASON
--------------------------------------------------------

  CREATE TABLE "ABANDONEDREASON" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"OOSKEY" VARCHAR(100 ), 
	"CODE" VARCHAR(20 ), 
	"NAME" VARCHAR(350 ), 
	"OBJECTNAME" VARCHAR(350 ), 
	"REASONTYPE" VARCHAR(4 ), 
	"DOCTYPECODE" VARCHAR(50 ), 
	"DOCTYPENAME" VARCHAR(350 ), 
	"PLACINGWAYCODE" VARCHAR(7 ), 
	"PLACINGWAYNAME" VARCHAR(500 ), 
	"PURCHASEMODE_ID" NUMERIC(15,0), 
	"ACTUAL" NUMERIC(1,0) DEFAULT 1
   )  ;
--------------------------------------------------------
--  DDL for Table ALTGOODSGROUP
--------------------------------------------------------

  CREATE TABLE "ALTGOODSGROUP" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"CAPTION" VARCHAR(500 ), 
	"TYPE_ID" NUMERIC(15,0), 
	"PARENT_ID" NUMERIC(15,0), 
	"OKP" VARCHAR(16 ), 
	"UNITNAME" VARCHAR(50 )
   )  ;
--------------------------------------------------------
--  DDL for Table ALTGOODSGROUPLINK
--------------------------------------------------------

  CREATE TABLE "ALTGOODSGROUPLINK" 
   (	"TYPE_ID" NUMERIC(15,0), 
	"GOODSGROUP_ID" NUMERIC(15,0), 
	"ALTGOODSGROUP_ID" NUMERIC(15,0)
   )  ;
--------------------------------------------------------
--  DDL for Table ALTGOODSGROUPTYPE
--------------------------------------------------------

  CREATE TABLE "ALTGOODSGROUPTYPE" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"CAPTION" VARCHAR(100 )
   )  ;
--------------------------------------------------------
--  DDL for Table ALTUNITFACTOR
--------------------------------------------------------

  CREATE TABLE "ALTUNITFACTOR" 
   (	"UNIT_ID" NUMERIC(15,0), 
	"ALTGOODSGROUP_ID" NUMERIC(15,0), 
	"FACTOR" DOUBLE PRECISION
   )  ;
--------------------------------------------------------
--  DDL for Table ANYDATA
--------------------------------------------------------

  CREATE TABLE "ANYDATA" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"DATA" BLOB, 
	"DATA_KEY" VARCHAR(120 ), 
	"STORAGE" VARCHAR(25 ), 
	"DEVICE" VARCHAR(25 )
   )  
  ;
--------------------------------------------------------
--  DDL for Table APPMODULE
--------------------------------------------------------

  CREATE TABLE "APPMODULE" 
   (	"ID" NUMERIC(18,0), 
	"VERSION" NUMERIC(15,0), 
	"NAME" VARCHAR(32 ), 
	"DESCRIPTION" VARCHAR(256 )
   )  ;
--------------------------------------------------------
--  DDL for Table APPMODULEDEPENDENCY
--------------------------------------------------------

  CREATE TABLE "APPMODULEDEPENDENCY" 
   (	"ID" NUMERIC(18,0), 
	"DEPENDID" NUMERIC(18,0)
   )  ;
--------------------------------------------------------
--  DDL for Table APPOBJ
--------------------------------------------------------

  CREATE TABLE "APPOBJ" 
   (	"ID" NUMERIC(18,0), 
	"VERSION" NUMERIC(15,0), 
	"MODULEID" NUMERIC(18,0), 
	"PARENTNAME" VARCHAR(128 ), 
	"NAME" VARCHAR(128 ), 
	"CAPTION" VARCHAR(128 ), 
	"DESCRIPTION" VARCHAR(256 ), 
	"ICON" VARCHAR(256 ), 
	"OPENICON" VARCHAR(256 ), 
	"STYPE" NUMERIC(18,0), 
	"SHOWORDER" NUMERIC(15,0) DEFAULT 0
   )  ;
--------------------------------------------------------
--  DDL for Table APPOBJPROP
--------------------------------------------------------

  CREATE TABLE "APPOBJPROP" 
   (	"ID" NUMERIC(18,0), 
	"VERSION" NUMERIC(15,0), 
	"APPOBJID" NUMERIC(18,0), 
	"NAME" VARCHAR(32 ), 
	"VAL" VARCHAR(1024 )
   )  ;
--------------------------------------------------------
--  DDL for Table APPOINTMENT
--------------------------------------------------------

  CREATE TABLE "APPOINTMENT" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"CAPTION" VARCHAR(255 )
   )  ;
--------------------------------------------------------
--  DDL for Table ATTACHCATEGORIES
--------------------------------------------------------

  CREATE TABLE "ATTACHCATEGORIES" 
   (	"DOCATTACHEX_ID" NUMERIC(15,0), 
	"DOCCATEGORY_ID" NUMERIC(15,0)
   )  ;
--------------------------------------------------------
--  DDL for Table ATTACHEDPLANDOC
--------------------------------------------------------

  CREATE TABLE "ATTACHEDPLANDOC" 
   (	"DOC_ID" NUMERIC(15,0), 
	"PURCHASEPLANDOC_ID" NUMERIC(15,0), 
	"DOCUMENT_ID" NUMERIC(15,0)
   )  ;
--------------------------------------------------------
--  DDL for Table AUCTIONBID
--------------------------------------------------------

  CREATE TABLE "AUCTIONBID" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"DOCUMENT_ID" NUMERIC(15,0), 
	"DOCUMENTCLASS_ID" NUMERIC(15,0), 
	"DISPSTATUS_ID" NUMERIC(15,0), 
	"OPERTYPE_ID" NUMERIC(15,0) DEFAULT 0, 
	"DOC_NUMBER" VARCHAR(20 ), 
	"DOC_DATE" DATE, 
	"BUDGET_ID" NUMERIC(15,0), 
	"DESCRIPTION" VARCHAR(255 ), 
	"FOREIGN_KEY" VARCHAR(50 ), 
	"AMOUNT" NUMERIC(15,2), 
	"REMARK" VARCHAR(255 ), 
	"ORDER_ID" NUMERIC(15,0), 
	"RECEIPTTIME" DATE DEFAULT '1900-01-01', 
	"AUCTIONSTEP" NUMERIC(15,2), 
	"COMPETITORPOS" NUMERIC(15,0)
   )  ;
--------------------------------------------------------
--  DDL for Table AUCTIONLOG
--------------------------------------------------------

  CREATE TABLE "AUCTIONLOG" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"ORDER_ID" NUMERIC(15,0), 
	"LOTPOS" NUMERIC(15,0), 
	"EVENTTIME" DATE, 
	"STATE" NUMERIC(3,0), 
	"DEADLINE" DATE
   )  ;
--------------------------------------------------------
--  DDL for Table BANK
--------------------------------------------------------

  CREATE TABLE "BANK" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"BIC" VARCHAR(9 ), 
	"CORACCOUNT" VARCHAR(20 ), 
	"BANK_TYPE" VARCHAR(10 ), 
	"CITY_TYPE" VARCHAR(10 ), 
	"CITY_NAME" VARCHAR(30 ), 
	"FOREIGNKEY" VARCHAR(50 ), 
	"DESCRIPTION" VARCHAR(2000 ), 
	"IS_ACTUAL" NUMERIC(1,0) DEFAULT 1
   )  ;
--------------------------------------------------------
--  DDL for Table BANKGUARANTEEDOC
--------------------------------------------------------

  CREATE TABLE "BANKGUARANTEEDOC" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"DOCUMENT_ID" NUMERIC(15,0), 
	"DOCUMENTCLASS_ID" NUMERIC(15,0), 
	"DISPSTATUS_ID" NUMERIC(15,0), 
	"OPERTYPE_ID" NUMERIC(15,0), 
	"BUDGET_ID" NUMERIC(15,0), 
	"DOC_NUMBER" VARCHAR(20 ), 
	"DOC_DATE" DATE, 
	"AMOUNT" NUMERIC(15,2), 
	"DESCRIPTION" VARCHAR(2000 ), 
	"FOREIGN_KEY" VARCHAR(50 ), 
	"OOSKEY" VARCHAR(100 ), 
	"VERSIONNUMBER" NUMERIC(15,0), 
	"REGNUMBER" VARCHAR(20 ), 
	"DOCPUBLISHDATE" DATE, 
	"BANKINN" VARCHAR(20 ), 
	"BANKFULLNAME" VARCHAR(2000 ), 
	"BANKFACTADDRESS" VARCHAR(2000 ), 
	"SUPPLIERINN" VARCHAR(20 ), 
	"SUPPLIERKPP" VARCHAR(20 ), 
	"SUPPLIEROGRN" VARCHAR(20 ), 
	"SUPPLIERORGANIZATIONNAME" VARCHAR(2000 ), 
	"SUPPLIERFIRMNAME" VARCHAR(2000 ), 
	"SUPPLIERFACTUALADDRESS" VARCHAR(2000 ), 
	"CUSTOMER_ID" NUMERIC(15,0), 
	"CUSTOMERINN" VARCHAR(20 ), 
	"CUSTOMERKPP" VARCHAR(20 ), 
	"CUSTOMERFULLNAME" VARCHAR(2000 ), 
	"CUSTOMERSHORTNAME" VARCHAR(2000 ), 
	"CUSTOMERFACTADDRESS" VARCHAR(2000 ), 
	"PURCHASENUMBER" VARCHAR(100 ), 
	"LOTNUMBER" NUMERIC(15,0), 
	"REGNUM" VARCHAR(100 ), 
	"GUARANTEEDATE" DATE, 
	"GUARANTEENUMBER" VARCHAR(100 ), 
	"GUARANTEEAMOUNT" NUMERIC(15,2), 
	"EXPIREDATE" DATE, 
	"MODIFICATIONREASON" CHAR(1 ), 
	"MODIFICATIONINFO" VARCHAR(2000 ), 
	"HREF" VARCHAR(1024 ), 
	"PRINTFORMHREF" VARCHAR(1024 )
   )  ;
--------------------------------------------------------
--  DDL for Table BANKGUARANTEEREFDOC
--------------------------------------------------------

  CREATE TABLE "BANKGUARANTEEREFDOC" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"DOCUMENT_ID" NUMERIC(15,0), 
	"DOCUMENTCLASS_ID" NUMERIC(15,0), 
	"DISPSTATUS_ID" NUMERIC(15,0), 
	"OPERTYPE_ID" NUMERIC(15,0), 
	"BUDGET_ID" NUMERIC(15,0), 
	"DOC_NUMBER" VARCHAR(20 ), 
	"DOC_DATE" DATE, 
	"AMOUNT" NUMERIC(15,2), 
	"DESCRIPTION" VARCHAR(2000 ), 
	"FOREIGN_KEY" VARCHAR(50 ), 
	"OOSKEY" VARCHAR(100 ), 
	"REGNUMBER" VARCHAR(20 ), 
	"DOCPUBLISHDATE" DATE, 
	"HREF" VARCHAR(1024 ), 
	"PRINTFORMHREF" VARCHAR(1024 ), 
	"REFUSALINFODOCDATE" DATE, 
	"REFUSALINFODOCNAME" VARCHAR(250 ), 
	"REFUSALINFODOCNUMBER" VARCHAR(100 )
   )  ;
--------------------------------------------------------
--  DDL for Table BANKGUARANTEEREFDOCREASON
--------------------------------------------------------

  CREATE TABLE "BANKGUARANTEEREFDOCREASON" 
   (	"BANKGUARANTEEREF_ID" NUMERIC(15,0), 
	"POS" NUMERIC(15,0), 
	"CODE" NUMERIC(15,0), 
	"NAME" VARCHAR(2000 )
   )  ;
--------------------------------------------------------
--  DDL for Table BANKGUARANTEEREFREASON
--------------------------------------------------------

  CREATE TABLE "BANKGUARANTEEREFREASON" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"OOSKEY" VARCHAR(100 ), 
	"NAME" VARCHAR(2000 ), 
	"ACTUAL" NUMERIC(1,0) DEFAULT 1
   )  ;
--------------------------------------------------------
--  DDL for Table BUDGCODE
--------------------------------------------------------

  CREATE TABLE "BUDGCODE" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"BUDGET_ID" NUMERIC(15,0), 
	"SEQORDER" NUMERIC(2,0), 
	"CODE" VARCHAR(100 ), 
	"DESCRIPTION" VARCHAR(2000 ), 
	"FOREIGNKEY" VARCHAR(50 ), 
	"FINYEAR" NUMERIC(4,0)
   )  ;
--------------------------------------------------------
--  DDL for Table BUDGET
--------------------------------------------------------

  CREATE TABLE "BUDGET" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"CAPTION" VARCHAR(100 ), 
	"ISLOCAL" NUMERIC(1,0) DEFAULT 0, 
	"ISRURALVILLAGE" NUMERIC(1,0) DEFAULT 0, 
	"ISBUDGETINSTITUTION" NUMERIC(1,0) DEFAULT 0, 
	"FINSRC_ID" NUMERIC(15,0), 
	"TERRITORY_ID" NUMERIC(15,0), 
	"PARENT_ID" NUMERIC(15,0), 
	"RELATIONBUDGET_ID" NUMERIC(15,0)
   )  ;
--------------------------------------------------------
--  DDL for Table BUDGETLINE
--------------------------------------------------------

  CREATE TABLE "BUDGETLINE" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"BUDGET_ID" NUMERIC(15,0), 
	"ESTIMATE_ID" NUMERIC(15,0), 
	"RECIPIENT_ID" NUMERIC(15,0), 
	"CODE1" VARCHAR(100 ), 
	"CODE2" VARCHAR(100 ), 
	"CODE3" VARCHAR(100 ), 
	"CODE4" VARCHAR(100 ), 
	"CODE5" VARCHAR(100 ), 
	"CODE6" VARCHAR(100 ), 
	"CODE7" VARCHAR(100 ), 
	"CODE8" VARCHAR(100 ), 
	"CODE9" VARCHAR(100 ), 
	"CODE10" VARCHAR(100 ), 
	"FOREIGNKEY" VARCHAR(50 ), 
	"FINYEAR" NUMERIC(4,0), 
	"ASSIGN_AMT1" NUMERIC(15,2) DEFAULT 0, 
	"REST_ASSIGN_AMT1" NUMERIC(15,2) DEFAULT 0, 
	"ASSIGN_AMT2" NUMERIC(15,2) DEFAULT 0, 
	"REST_ASSIGN_AMT2" NUMERIC(15,2) DEFAULT 0, 
	"ASSIGN_AMT3" NUMERIC(15,2) DEFAULT 0, 
	"REST_ASSIGN_AMT3" NUMERIC(15,2) DEFAULT 0
   )  ;
--------------------------------------------------------
--  DDL for Table BUDGETSTAGE
--------------------------------------------------------

  CREATE TABLE "BUDGETSTAGE" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"STAGECODE" VARCHAR(2 )
   )  ;
--------------------------------------------------------
--  DDL for Table CACHELIST
--------------------------------------------------------

  CREATE TABLE "CACHELIST" 
   (	"ID" NUMERIC(15,0), 
	"STORAGE_NAME" VARCHAR(32 ), 
	"USERSESSION_ID" NUMERIC(15,0), 
	"CACHE_KEY" VARCHAR(64 ), 
	"HASH_CODE" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"INDEX_HASH_CODE" NUMERIC(15,0)
   )  ;
--------------------------------------------------------
--  DDL for Table CACHEMAN
--------------------------------------------------------

  CREATE TABLE "CACHEMAN" 
   (	"GUID" VARCHAR(38 ), 
	"LAST_ACCESS" DATE, 
	"USERNAME" VARCHAR(30 ), 
	"CLIENT_HOST" VARCHAR(100 )
   )  ;
--------------------------------------------------------
--  DDL for Table CAVILDOC
--------------------------------------------------------

  CREATE TABLE "CAVILDOC" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"DOCUMENT_ID" NUMERIC(15,0), 
	"DOCUMENTCLASS_ID" NUMERIC(15,0), 
	"DISPSTATUS_ID" NUMERIC(15,0), 
	"OPERTYPE_ID" NUMERIC(15,0), 
	"DOC_NUMBER" VARCHAR(20 ), 
	"DOC_DATE" DATE, 
	"AMOUNT" NUMERIC(15,2), 
	"DESCRIPTION" VARCHAR(2000 ), 
	"FOREIGN_KEY" VARCHAR(50 ), 
	"CUSTOMER_ID" NUMERIC(15,0), 
	"PUBLISH_DATE" DATE, 
	"CMPORG_ID" NUMERIC(15,0), 
	"PURCHASENUMBER" VARCHAR(50 ), 
	"VIOLATION_DESCRIPTION" BLOB SUB_TYPE TEXT, 
	"PORTALSTATUS" NUMERIC(2,0), 
	"RESPPERSON_ID" NUMERIC(15,0), 
	"EMAIL" VARCHAR(256 ), 
	"ANSWER" VARCHAR(2000 ), 
	"BUDGET_ID" NUMERIC(15,0), 
	"WEBLINK" VARCHAR(512 )
   )  
  ;
--------------------------------------------------------
--  DDL for Table CAVILTYPE
--------------------------------------------------------

  CREATE TABLE "CAVILTYPE" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"CAPTION" VARCHAR(256 )
   )  ;
--------------------------------------------------------
--  DDL for Table CDCAVILTYPE
--------------------------------------------------------

  CREATE TABLE "CDCAVILTYPE" 
   (	"CAVILDOC_ID" NUMERIC(15,0), 
	"POS" NUMERIC(15,0), 
	"CAVILTYPE_ID" NUMERIC(15,0), 
	"COMMENTS" BLOB SUB_TYPE TEXT
   )  
  ;
--------------------------------------------------------
--  DDL for Table CEEXECUTIONLINE
--------------------------------------------------------

  CREATE TABLE "CEEXECUTIONLINE" 
   (	"CONTRACTEXECDOC_ID" NUMERIC(15,0), 
	"POS" NUMERIC(15,0), 
	"TYPE" NUMERIC(1,0) DEFAULT 0, 
	"DOCUMENT_NUM" VARCHAR(100 ), 
	"DOCUMENT_DATE" DATE, 
	"EXEC_DATE" DATE, 
	"PAIDAMOUNT" NUMERIC(15,2) DEFAULT 0, 
	"DOCUMENTNAME" VARCHAR(1000 ), 
	"PRODUCT" VARCHAR(4000 ), 
	"CONTRACTEXECDOCTYPE_ID" NUMERIC(15,0), 
	"CONTRACTEXECDOCTYPE_CODE" VARCHAR(4 ), 
	"FACTDOC_ID" NUMERIC(15,0)
   )  ;
--------------------------------------------------------
--  DDL for Table CEPAYMENTPENALTY
--------------------------------------------------------

  CREATE TABLE "CEPAYMENTPENALTY" 
   (	"CONTRACTEXECDOC_ID" NUMERIC(15,0), 
	"PENALTYPOS" NUMERIC(15,0), 
	"POS" NUMERIC(15,0), 
	"DOCNAME" VARCHAR(1000 ), 
	"DOCNUMBER" VARCHAR(100 ), 
	"DOCDATE" DATE, 
	"AMOUNT" NUMERIC(15,2)
   )  ;
--------------------------------------------------------
--  DDL for Table CEPENALTY
--------------------------------------------------------

  CREATE TABLE "CEPENALTY" 
   (	"CONTRACTEXECDOC_ID" NUMERIC(15,0), 
	"DOC_ID" NUMERIC(15,0), 
	"DOCUMENT_ID" NUMERIC(15,0), 
	"POS" NUMERIC(15,0), 
	"CLAIM_DOCUMENTCLASS_ID" NUMERIC(15,0), 
	"CLAIM_DOC_NUMBER" VARCHAR(20 ), 
	"CLAIM_DOC_DATE" DATE, 
	"CONTRACTPARTY" NUMERIC(1,0), 
	"PENALTYTYPE" NUMERIC(1,0), 
	"PENALTYREASON" NUMERIC(1,0) DEFAULT 0, 
	"PAYMENT_DOCNAME" VARCHAR(1000 ), 
	"PAYMENT_DOCNUMBER" VARCHAR(100 ), 
	"PAYMENT_DOCDATE" DATE, 
	"PAYMENT_AMOUNT" NUMERIC(15,2), 
	"RETURN_DOCNAME" VARCHAR(1000 ), 
	"RETURN_DOCNUMBER" VARCHAR(100 ), 
	"RETURN_DOCDATE" DATE, 
	"RETURN_AMOUNT" NUMERIC(15,2)
   )  ;
--------------------------------------------------------
--  DDL for Table CEREPARATIONLINE
--------------------------------------------------------

  CREATE TABLE "CEREPARATIONLINE" 
   (	"CONTRACTEXECDOC_ID" NUMERIC(15,0), 
	"POS" NUMERIC(15,0), 
	"CONTRACTREPARATIONDOC_ID" NUMERIC(15,0), 
	"DOCUMENTNAME" VARCHAR(1000 ), 
	"DOCUMENTDATE" DATE, 
	"DOCUMENTNUMBER" VARCHAR(100 ), 
	"REPARATIONAMOUNT" NUMERIC(15,2) DEFAULT 0
   )  ;
--------------------------------------------------------
--  DDL for Table CERETURNPENALTY
--------------------------------------------------------

  CREATE TABLE "CERETURNPENALTY" 
   (	"CONTRACTEXECDOC_ID" NUMERIC(15,0), 
	"PENALTYPOS" NUMERIC(15,0), 
	"POS" NUMERIC(15,0), 
	"DOCNAME" VARCHAR(1000 ), 
	"DOCNUMBER" VARCHAR(100 ), 
	"DOCDATE" DATE, 
	"AMOUNT" NUMERIC(15,2)
   )  ;
--------------------------------------------------------
--  DDL for Table CERTINTERCHANGEREQUEST
--------------------------------------------------------

  CREATE TABLE "CERTINTERCHANGEREQUEST" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"DOCUMENT_ID" NUMERIC(15,0), 
	"DOCUMENTCLASS_ID" NUMERIC(15,0), 
	"DISPSTATUS_ID" NUMERIC(15,0), 
	"DOC_NUMBER" VARCHAR(20 ), 
	"DOC_DATE" DATE, 
	"REMARK" VARCHAR(255 ), 
	"USERCERT_ID" NUMERIC(15,0), 
	"EXPORTABLE" NUMERIC(1,0) DEFAULT 0, 
	"COMMENTS" VARCHAR(2000 )
   )  ;
--------------------------------------------------------
--  DDL for Table CERTREQUEST
--------------------------------------------------------

  CREATE TABLE "CERTREQUEST" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"DOCUMENT_ID" NUMERIC(15,0), 
	"DOCUMENTCLASS_ID" NUMERIC(15,0), 
	"DISPSTATUS_ID" NUMERIC(15,0), 
	"DOC_NUMBER" VARCHAR(20 ), 
	"DOC_DATE" DATE, 
	"REMARK" VARCHAR(255 ), 
	"COUNTRY" VARCHAR(2 ), 
	"CITY" VARCHAR(128 ), 
	"STATE" VARCHAR(128 ), 
	"USER_ORG" VARCHAR(255 ), 
	"USER_FIO" VARCHAR(64 ), 
	"USER_EMAIL" VARCHAR(128 ), 
	"INSURANCE_NUMBER" NUMERIC(11,0), 
	"JOB_POSITION" VARCHAR(128 ), 
	"STATUS_OWNER" NUMERIC(1,0) DEFAULT 0, 
	"ADDRESS" VARCHAR(128 ), 
	"USER_ORG_ID" NUMERIC(15,0), 
	"DEPARTMENT" VARCHAR(64 ), 
	"EXPORTABLE" NUMERIC(1,0) DEFAULT 0, 
	"COMMENTS" VARCHAR(2000 )
   )  ;
--------------------------------------------------------
--  DDL for Table CERTREQUESTOID
--------------------------------------------------------

  CREATE TABLE "CERTREQUESTOID" 
   (	"CERTREQUEST_ID" NUMERIC(15,0), 
	"OIDREF_ID" NUMERIC(15,0)
   )  ;
--------------------------------------------------------
--  DDL for Table CERTREVOKEREQUEST
--------------------------------------------------------

  CREATE TABLE "CERTREVOKEREQUEST" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"DOCUMENT_ID" NUMERIC(15,0), 
	"DOCUMENTCLASS_ID" NUMERIC(15,0), 
	"DISPSTATUS_ID" NUMERIC(15,0), 
	"DOC_NUMBER" VARCHAR(20 ), 
	"DOC_DATE" DATE, 
	"REMARK" VARCHAR(255 ), 
	"USERCERT_ID" NUMERIC(15,0), 
	"COMMENTS" VARCHAR(2000 )
   )  ;
--------------------------------------------------------
--  DDL for Table CETERMINATIONLINE
--------------------------------------------------------

  CREATE TABLE "CETERMINATIONLINE" 
   (	"CONTRACTEXECDOC_ID" NUMERIC(15,0), 
	"POS" NUMERIC(15,0), 
	"TERMINATION_DATE" DATE, 
	"PAIDAMOUNT" NUMERIC(15,2) DEFAULT 0, 
	"REASON" VARCHAR(4000 ), 
	"TERMINATIONREASON_ID" NUMERIC(15,0), 
	"TERMINATIONREASONDOC_ID" NUMERIC(15,0), 
	"TERMINATIONREASONDOC_DATE" DATE, 
	"TERMINATIONREASONDOC_NUMBER" VARCHAR(100 ), 
	"TERMINATIONREASONDOC_REFDATE" DATE
   )  ;
--------------------------------------------------------
--  DDL for Table CLAIMDOC
--------------------------------------------------------

  CREATE TABLE "CLAIMDOC" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"DOCUMENT_ID" NUMERIC(15,0), 
	"DOCUMENTCLASS_ID" NUMERIC(15,0), 
	"DISPSTATUS_ID" NUMERIC(15,0), 
	"OPERTYPE_ID" NUMERIC(15,0) DEFAULT 0, 
	"BUDGET_ID" NUMERIC(15,0), 
	"DOC_NUMBER" VARCHAR(20 ), 
	"DOC_DATE" DATE, 
	"FOREIGN_KEY" VARCHAR(50 ), 
	"AMOUNT" NUMERIC(15,2) DEFAULT 0, 
	"DESCRIPTION" VARCHAR(2000 ), 
	"CUSTOMER_ID" NUMERIC(15,0), 
	"CUSTOMERNAME" VARCHAR(2000 ), 
	"SHORT_DESCRIPTION" BLOB SUB_TYPE TEXT, 
	"COMPLETE_DATE" DATE, 
	"ANSWER" NUMERIC(1,0) DEFAULT 0, 
	"ANSWER_TEXT" BLOB SUB_TYPE TEXT, 
	"REMARK" VARCHAR(255 ), 
	"REASON" NUMERIC(1,0) DEFAULT 0, 
	"PARENT_CONTRACT_ID" NUMERIC(15,0), 
	"PENALTY_DATE" DATE, 
	"PENALTY_AMOUNT" NUMERIC(15,2), 
	"VIOLATION_NAME" BLOB SUB_TYPE TEXT, 
	"VIOLATION_DESCRIPTION" BLOB SUB_TYPE TEXT, 
	"VIOLATION_REASON" BLOB SUB_TYPE TEXT, 
	"PENALTY_TYPE" NUMERIC(1,0) DEFAULT 0, 
	"PENALTY_CHANGE_DATE" DATE, 
	"PENALTY_CHANGE_TYPE" NUMERIC(1,0), 
	"OUTSTANDINGAMOUNT" NUMERIC(15,2) DEFAULT 0, 
	"DELAYDAYS" NUMERIC(15,0) DEFAULT 0, 
	"EXECUTIONDAYS" NUMERIC(15,0) DEFAULT 0, 
	"PENALTY_DOCNAME" VARCHAR(1000 ), 
	"PENALTY_DOCNUMBER" VARCHAR(100 ), 
	"PENALTY_DOCDATE" DATE, 
	"PENALTY_RETURN_AMOUNT" NUMERIC(15,2) DEFAULT 0
   )  
  ;
--------------------------------------------------------
--  DDL for Table CLAIMPAYFACT
--------------------------------------------------------

  CREATE TABLE "CLAIMPAYFACT" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"CLAIM_ID" NUMERIC(15,0), 
	"PAYDATE" DATE, 
	"AMOUNT" NUMERIC(15,2) DEFAULT 0, 
	"NUM" VARCHAR(100 ), 
	"CAPTION" VARCHAR(500 ), 
	"DOCDATE" DATE, 
	"DOCTYPE" NUMERIC(1,0) DEFAULT 0
   )  ;
--------------------------------------------------------
--  DDL for Table CLAIMPENALTYCHANGEDOCINFO
--------------------------------------------------------

  CREATE TABLE "CLAIMPENALTYCHANGEDOCINFO" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"CLAIM_ID" NUMERIC(15,0), 
	"DOCDATE" DATE, 
	"DOCNUMBER" VARCHAR(100 ), 
	"CAPTION" VARCHAR(200 )
   )  ;
--------------------------------------------------------
--  DDL for Table CLASSOPER
--------------------------------------------------------

  CREATE TABLE "CLASSOPER" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"DOCUMENTCLASS_ID" NUMERIC(15,0), 
	"OPERTYPE_ID" NUMERIC(15,0) DEFAULT 0, 
	"CAPTION" VARCHAR(100 )
   )  ;
--------------------------------------------------------
--  DDL for Table CLIENTOBJECT
--------------------------------------------------------

  CREATE TABLE "CLIENTOBJECT" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"NAME" VARCHAR(50 ), 
	"OBJ_TYPE" NUMERIC(1,0), 
	"SYSTEM_FLAG" NUMERIC(1,0) DEFAULT 0, 
	"REPORT_FLAG" NUMERIC(1,0) DEFAULT 0, 
	"CLASS_GUID" VARCHAR(100 ), 
	"PARAMS" VARCHAR(300 ), 
	"CAPTION" VARCHAR(100 ), 
	"SUBSYSTEM" NUMERIC(15,0) DEFAULT 0, 
	"XML_PARAMS" BLOB SUB_TYPE TEXT, 
	"BUDGET_REQUIRED" NUMERIC(1,0) DEFAULT 1, 
	"HELPFILE" VARCHAR(256 ), 
	"HELPKEYWORD" VARCHAR(256 )
   )  
  ;
--------------------------------------------------------
--  DDL for Table CLIENTOBJECTCOMMENTS
--------------------------------------------------------

  CREATE TABLE "CLIENTOBJECTCOMMENTS" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"CLIENTOBJECT_ID" NUMERIC(15,0), 
	"BUDGET_ID" NUMERIC(15,0), 
	"COMMENT_FIELD" BLOB SUB_TYPE TEXT
   )  
  ;
--------------------------------------------------------
--  DDL for Table CLNDDAY
--------------------------------------------------------

  CREATE TABLE "CLNDDAY" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"CLNDTYPE_ID" NUMERIC(15,0), 
	"CLNDDAYTYPE_ID" NUMERIC(15,0), 
	"CLND_DAY" DATE
   )  ;
--------------------------------------------------------
--  DDL for Table CLNDDAYTYPE
--------------------------------------------------------

  CREATE TABLE "CLNDDAYTYPE" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"NAME" VARCHAR(255 )
   )  ;
--------------------------------------------------------
--  DDL for Table CLNDTYPE
--------------------------------------------------------

  CREATE TABLE "CLNDTYPE" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"NAME" VARCHAR(255 ), 
	"CLND_YEAR" NUMERIC(4,0)
   )  ;
--------------------------------------------------------
--  DDL for Table CMPCOMMEMBER
--------------------------------------------------------

  CREATE TABLE "CMPCOMMEMBER" 
   (	"ORDER_ID" NUMERIC(15,0), 
	"POS" NUMERIC(15,0), 
	"COMMEMBER_ID" NUMERIC(15,0), 
	"COMMEMBER_NAME" VARCHAR(255 ), 
	"COMMEMBER_ROLE" VARCHAR(255 ), 
	"COMROLE" NUMERIC(1,0), 
	"ABSENT" NUMERIC(1,0), 
	"PRESIDENT_VACATION" NUMERIC(1,0) DEFAULT 0, 
	"NOTE" VARCHAR(100 ), 
	"PHASEPOS" NUMERIC(15,0), 
	"OOS_NUMBER" VARCHAR(100 ), 
	"ISACTINGFORSECRETARY" NUMERIC(1,0) DEFAULT 0
   )  ;
--------------------------------------------------------
--  DDL for Table CMPCOMPETITOR
--------------------------------------------------------

  CREATE TABLE "CMPCOMPETITOR" 
   (	"ORDER_ID" NUMERIC(15,0), 
	"POS" NUMERIC(15,0), 
	"LOTPOS" NUMERIC(15,0), 
	"VENDOR_ID" NUMERIC(15,0), 
	"TAXCODE" VARCHAR(20 ), 
	"KPP" VARCHAR(20 ), 
	"VENDORNAME" VARCHAR(2000 ), 
	"ORDINALNUMBER" NUMERIC(15,0), 
	"SCORE" NUMERIC(15,4), 
	"ISSATISFY" NUMERIC(1,0), 
	"ISQUALIFY" NUMERIC(1,0), 
	"VENDORCARDNUMBER" NUMERIC(15,0), 
	"AUCTIONCODE" VARCHAR(20 ), 
	"PREFERENCE" NUMERIC(1,0) DEFAULT 0, 
	"PREV_SCORE" NUMERIC(15,4), 
	"PREV_ORDINALNUMBER" NUMERIC(15,0), 
	"DISCUSSION" VARCHAR(4000 ), 
	"ABSENT" NUMERIC(1,0) DEFAULT 0, 
	"EXPLANATION" VARCHAR(2000 )
   )  ;
--------------------------------------------------------
--  DDL for Table CMPCONDEALRESP
--------------------------------------------------------

  CREATE TABLE "CMPCONDEALRESP" 
   (	"ORDER_ID" NUMERIC(15,0), 
	"CMPCUSTOMERPOS" NUMERIC(15,0), 
	"PERSONAL_ID" NUMERIC(15,0), 
	"PERSONAL_NAME" VARCHAR(256 )
   )  ;
--------------------------------------------------------
--  DDL for Table CMPCRITERION
--------------------------------------------------------

  CREATE TABLE "CMPCRITERION" 
   (	"ORDER_ID" NUMERIC(15,0), 
	"POS" NUMERIC(15,0), 
	"NAME" VARCHAR(512 ), 
	"CTYPE" NUMERIC(2,0), 
	"CALCMODE" NUMERIC(1,0), 
	"BESTPARAM" NUMERIC(1,0), 
	"WEIGHT" NUMERIC(15,2), 
	"ACTUAL_WEIGHT" NUMERIC(15,2), 
	"LOTPOS" NUMERIC(15,0), 
	"TENDERCRITERION_ID" NUMERIC(15,0), 
	"MINWEIGHT" NUMERIC(15,2), 
	"MAXWEIGHT" NUMERIC(15,2), 
	"VAL" NUMERIC(15,2), 
	"DESCRIPTION" VARCHAR(2000 ), 
	"FORMULA" VARCHAR(2000 ), 
	"OOSCODE" VARCHAR(2 ) DEFAULT '0', 
	"UNITNAME" VARCHAR(50 )
   )  ;
--------------------------------------------------------
--  DDL for Table CMPCRITERIONLINE
--------------------------------------------------------

  CREATE TABLE "CMPCRITERIONLINE" 
   (	"ORDER_ID" NUMERIC(15,0), 
	"CMPCRITERIONPOS" NUMERIC(15,0), 
	"SEQORDER" NUMERIC(15,0), 
	"CAPTION" VARCHAR(2000 ), 
	"MINVALUE" NUMERIC(15,2), 
	"MAXVALUE" NUMERIC(15,2), 
	"WEIGHT" NUMERIC(15,2), 
	"LIMITDESCRIPTION" VARCHAR(2000 ), 
	"DESCRIPTION" VARCHAR(2000 )
   )  ;
--------------------------------------------------------
--  DDL for Table CMPCUSTOMER
--------------------------------------------------------

  CREATE TABLE "CMPCUSTOMER" 
   (	"ORDER_ID" NUMERIC(15,0), 
	"CUSTOMER_ID" NUMERIC(15,0), 
	"CUSTOMERNAME" VARCHAR(2000 ), 
	"REFCOUNT" NUMERIC(4,0), 
	"AMOUNT" NUMERIC(15,2) DEFAULT 0, 
	"CUSTOMERTAXCODE" VARCHAR(20 ), 
	"CUSTOMERKPP" VARCHAR(20 ), 
	"CUSTOMERFACTCOUNTRY_ID" NUMERIC(15,0), 
	"CUSTOMERFACTPOSTINDEX" VARCHAR(10 ), 
	"CUSTOMERFACTTERRITORYCODE" VARCHAR(20 ), 
	"CUSTOMERFACTADDRESS" VARCHAR(300 ), 
	"CUSTOMERPOSTCOUNTRY_ID" NUMERIC(15,0), 
	"CUSTOMERPOSTPOSTINDEX" VARCHAR(10 ), 
	"CUSTOMERPOSTTERRITORYCODE" VARCHAR(20 ), 
	"CUSTOMERPOSTADDRESS" VARCHAR(300 ), 
	"CUSTOMERFAX" VARCHAR(100 ), 
	"CUSTOMERPHONE" VARCHAR(100 ), 
	"CUSTOMEREMAIL" VARCHAR(256 )
   )  ;
--------------------------------------------------------
--  DDL for Table CMPCUSTOMERLOT
--------------------------------------------------------

  CREATE TABLE "CMPCUSTOMERLOT" 
   (	"POS" NUMERIC(15,0), 
	"ORDER_ID" NUMERIC(15,0), 
	"CUSTOMER_ID" NUMERIC(15,0), 
	"LOTPOS" NUMERIC(15,0), 
	"OOSKEY" VARCHAR(100 ), 
	"QUANTITY" VARCHAR(4000 ), 
	"DELIVERYPLACE" VARCHAR(4000 ), 
	"DELIVERYTERM" VARCHAR(1024 ), 
	"PAYMENTCONDITION" VARCHAR(4000 ), 
	"AMOUNT" NUMERIC(15,2) DEFAULT 0, 
	"QUANTITYCONTRACTSPNIR" NUMERIC(15,0), 
	"ADDITIONALINFO" VARCHAR(4000 ), 
	"ISGUARANTEEAPP" NUMERIC(1,0) DEFAULT 0, 
	"GUARANTEEAPPAMOUNT" NUMERIC(15,2), 
	"GUARAPPSETTLEMENTACC_ID" NUMERIC(15,0), 
	"GUARAPPPERSONALACC_ID" NUMERIC(15,0), 
	"GUARAPPBIC" VARCHAR(15 ), 
	"GUARANTEEAPPPROCEDURE" VARCHAR(4000 ), 
	"ISGUARANTEECONTRACT" NUMERIC(1,0) DEFAULT 0, 
	"GUARANTEECONTRACTAMOUNT" NUMERIC(15,2), 
	"GUARCONTRSETTLEMENTACC_ID" NUMERIC(15,0), 
	"GUARCONTRPERSONALACC_ID" NUMERIC(15,0), 
	"GUARANTEECONTRACTBIC" VARCHAR(15 ), 
	"GUARANTEECONTRACTPROCEDURE" VARCHAR(4000 ), 
	"GUARANTEECONTRACTISBAIL" NUMERIC(1,0) DEFAULT 0, 
	"FINANCESOURCE" VARCHAR(2000 ), 
	"PLANPOSITIONNUMBER" VARCHAR(100 ), 
	"ADVANCE" NUMERIC(15,2), 
	"ISMAXINVITATIONDATE" NUMERIC(1,0) DEFAULT 0, 
	"CONMNGRRESP_FULLNAME" VARCHAR(256 ), 
	"CUSTCANCHANGECONTERMS" NUMERIC(1,0) DEFAULT 0, 
	"CUSTCANREFUSE" NUMERIC(1,0) DEFAULT 0, 
	"CONSERVICEINFO" VARCHAR(2000 ), 
	"CONMNGRRESP_ID" NUMERIC(15,0), 
	"VATAMOUNT" NUMERIC(15,2), 
	"GUARANTEEAPPPERCENT" NUMERIC(5,2), 
	"GUARANTEECONTRACTPERCENT" NUMERIC(5,2), 
	"CUSTCANREFUSEINFO" BLOB SUB_TYPE TEXT
   )  
  ;
--------------------------------------------------------
--  DDL for Table CMPDECISION
--------------------------------------------------------

  CREATE TABLE "CMPDECISION" 
   (	"ORDER_ID" NUMERIC(15,0), 
	"POS" NUMERIC(15,0), 
	"PHASEPOS" NUMERIC(15,0), 
	"DECISION" BLOB SUB_TYPE TEXT, 
	"RESULT" NUMERIC(2,0), 
	"FOR_" NUMERIC(15,0), 
	"AGAINST" NUMERIC(15,0), 
	"ABSTAIN" NUMERIC(15,0), 
	"BYCALL" NUMERIC(1,0), 
	"COMPETITORPOS" NUMERIC(15,0)
   )  
  ;
--------------------------------------------------------
--  DDL for Table CMPDISCUSSION
--------------------------------------------------------

  CREATE TABLE "CMPDISCUSSION" 
   (	"ID" NUMERIC(15,0), 
	"ORDER_ID" NUMERIC(15,0), 
	"PHASEPOS" NUMERIC(15,0), 
	"LOTPOS" NUMERIC(15,0), 
	"DISCUSSION" BLOB SUB_TYPE TEXT
   )  
  ;
--------------------------------------------------------
--  DDL for Table CMPDOCREQ
--------------------------------------------------------

  CREATE TABLE "CMPDOCREQ" 
   (	"ORDER_ID" NUMERIC(15,0), 
	"POS" NUMERIC(15,0), 
	"LOTPOS" NUMERIC(15,0), 
	"NAME" VARCHAR(1000 ), 
	"VENDOR_TYPE" NUMERIC(2,0) DEFAULT 0, 
	"ISREQUIRED" NUMERIC(1,0) DEFAULT 1, 
	"ISCONTENTTYPE" NUMERIC(1,0) DEFAULT 0, 
	"TYPE" NUMERIC(2,0) DEFAULT 0, 
	"ETPKEY" VARCHAR(100 ), 
	"OOSKEY" VARCHAR(100 ), 
	"DESCRIPTION" VARCHAR(4000 ), 
	"REQUIREMENTTYPE_ID" NUMERIC(15,0), 
	"REQUIREMENTTYPE_NAME" VARCHAR(500 )
   )  ;
--------------------------------------------------------
--  DDL for Table CMPEXPENSE
--------------------------------------------------------

  CREATE TABLE "CMPEXPENSE" 
   (	"ORDER_ID" NUMERIC(15,0), 
	"POS" NUMERIC(15,0), 
	"EXPDATE" DATE, 
	"GROUPCODE" VARCHAR(20 ), 
	"GROUPCAPTION" VARCHAR(500 ), 
	"GOODSCODE" VARCHAR(20 ), 
	"GOODSCAPTION" VARCHAR(512 ), 
	"QTY" NUMERIC(15,4) DEFAULT 0, 
	"PRICE" NUMERIC(15,2) DEFAULT 0, 
	"AMOUNT" NUMERIC(15,2) DEFAULT 0, 
	"DESCRIPTION" VARCHAR(255 ), 
	"UNITNAME" VARCHAR(50 )
   )  ;
--------------------------------------------------------
--  DDL for Table CMPFEATURE
--------------------------------------------------------

  CREATE TABLE "CMPFEATURE" 
   (	"ORDER_ID" NUMERIC(15,0), 
	"LOTPOS" NUMERIC(15,0), 
	"POS" NUMERIC(15,0), 
	"PLACEMENTFEATURE_ID" NUMERIC(15,0), 
	"PREFVALUE" NUMERIC(15,2) DEFAULT 0, 
	"CONTENT" VARCHAR(4000 )
   )  ;
--------------------------------------------------------
--  DDL for Table CMPGOODS
--------------------------------------------------------

  CREATE TABLE "CMPGOODS" 
   (	"ORDER_ID" NUMERIC(15,0), 
	"POS" NUMERIC(15,0), 
	"GROUPCODE" VARCHAR(20 ), 
	"OKDP_CODE" VARCHAR(20 ), 
	"GROUPCAPTION" VARCHAR(500 ), 
	"GOODSCODE" VARCHAR(20 ), 
	"GOODSCAPTION" VARCHAR(512 ), 
	"QTY" NUMERIC(15,4) DEFAULT 0, 
	"PRICE" NUMERIC(15,2) DEFAULT 0, 
	"AMOUNT" NUMERIC(15,2) DEFAULT 0, 
	"LOTPOS" NUMERIC(15,0), 
	"OOSKEY" VARCHAR(100 ), 
	"STATUS" NUMERIC(1,0) DEFAULT 0, 
	"OKPD_CODE" VARCHAR(20 ), 
	"OKPD_NAME" VARCHAR(1000 ), 
	"OKPD_ID" NUMERIC(15,0), 
	"OKVED_ID" NUMERIC(15,0), 
	"OKVED" VARCHAR(20 ), 
	"OKVED_NAME" VARCHAR(1000 ), 
	"UNITNAME" VARCHAR(50 )
   )  ;
--------------------------------------------------------
--  DDL for Table CMPGOODSPROP
--------------------------------------------------------

  CREATE TABLE "CMPGOODSPROP" 
   (	"ORDER_ID" NUMERIC(15,0), 
	"GOODSPOS" NUMERIC(15,0), 
	"SEQORDER" NUMERIC(15,0), 
	"PROPTYPE_ID" NUMERIC(15,0), 
	"CAPTION" VARCHAR(512 ), 
	"PROPVALUE" VARCHAR(1500 ), 
	"OOSKEY" VARCHAR(100 )
   )  ;
--------------------------------------------------------
--  DDL for Table CMPLOT
--------------------------------------------------------

  CREATE TABLE "CMPLOT" 
   (	"ORDER_ID" NUMERIC(15,0), 
	"POS" NUMERIC(15,0), 
	"LOTNUMBER" NUMERIC(15,0), 
	"DELIVERYBASISCODE" VARCHAR(50 ), 
	"PAYCONDITIONNAME" VARCHAR(255 ), 
	"HASCONTRACTORWORK" NUMERIC(1,0) DEFAULT 0, 
	"AUCTIONSTEP" NUMERIC(15,2), 
	"AMOUNT" NUMERIC(15,2) DEFAULT 0, 
	"CONTYPE_ID" NUMERIC(15,0), 
	"PRICE_GENERATION_ORDER" BLOB SUB_TYPE TEXT, 
	"MINSCORE" NUMERIC(10,4) DEFAULT 0, 
	"MAXSCORE" NUMERIC(10,4) DEFAULT 0, 
	"CMPDATE" DATE, 
	"FACT_CMPDATE" DATE, 
	"ISLOTDECLINED" NUMERIC(1,0) DEFAULT 0, 
	"ENTERPRISE" NUMERIC(1,0) DEFAULT 0, 
	"ISLOTREREGISTERED" NUMERIC(1,0) DEFAULT 0, 
	"CHILD_ORDER_ID" NUMERIC(15,0), 
	"PLAN_DEALDATE" DATE, 
	"OOSKEY" VARCHAR(100 ), 
	"QUANTITYCONTRACTSPNIR" NUMERIC(15,0), 
	"ISAMOUNTPERCENT" NUMERIC(1,0) DEFAULT 0, 
	"AMOUNTPERCENT" NUMERIC(3,2), 
	"CURRENCY_ID" NUMERIC(15,0), 
	"CURRENCY_CODE" VARCHAR(3 ), 
	"LIMITCONDEFINITION" BLOB SUB_TYPE TEXT, 
	"GOODSLIMITS" BLOB SUB_TYPE TEXT, 
	"ENERGYTYPE" VARCHAR(3 ), 
	"NOPUBLICDISCUSSION" NUMERIC(1,0) DEFAULT 0, 
	"FIRSTPUBLICDISCUSSIONCOMPLETE" NUMERIC(1,0) DEFAULT 0, 
	"STANDARDCONTRACTNUMBER" VARCHAR(16 ), 
	"ALLOWMULTIPLECONTRACTS" NUMERIC(1,0) DEFAULT 0, 
	"PUBLICDISCUSSIONLINK" BLOB SUB_TYPE TEXT, 
	"PRICEFORMULA" BLOB SUB_TYPE TEXT, 
	"VAT" NUMERIC(1,0) DEFAULT 0, 
	"VATRATE" NUMERIC(15,4), 
	"CONTRACT_SIGN_TERM" NUMERIC(15,0), 
	"CONTRACT_DEAL_TERM" NUMERIC(15,0), 
	"POTENTIALCONTRACTORSNUMBER" NUMERIC(15,0), 
	"BIDAFTERYOURSELF" NUMERIC(1,0) DEFAULT 0, 
	"AUCTIONWITHSTEP" NUMERIC(1,0) DEFAULT 0, 
	"AUCTIONSTEPTYPE" NUMERIC(1,0) DEFAULT 0, 
	"AUCTIONSTEPVALUE" NUMERIC(15,4), 
	"AUCTIONBIDBYSTEP" NUMERIC(1,0) DEFAULT 0, 
	"AUCTIONMINSTEPLIMIT" NUMERIC(15,4), 
	"AUCTIONZEROBID" NUMERIC(1,0) DEFAULT 0, 
	"AUCTIONDIVISIBLEBID" NUMERIC(1,0) DEFAULT 0, 
	"AUCTIONAUTOSTEPDEC" NUMERIC(1,0) DEFAULT 0, 
	"AUCTIONSTEPDECVALUE" NUMERIC(15,4), 
	"AUCTIONSTEPDECLIMIT" NUMERIC(15,4), 
	"AUCTIONDECINTERVAL" NUMERIC(15,0), 
	"NAME" BLOB SUB_TYPE TEXT, 
	"RATIONALEPRICE" BLOB SUB_TYPE TEXT, 
	"SUBJECT" BLOB SUB_TYPE TEXT, 
	"ENERGYSERVICEECONOMY" BLOB SUB_TYPE TEXT
   )  
  ;
--------------------------------------------------------
--  DDL for Table CMPOOSMODIFICATION
--------------------------------------------------------

  CREATE TABLE "CMPOOSMODIFICATION" 
   (	"ORDER_ID" NUMERIC(15,0), 
	"POS" NUMERIC(15,0), 
	"PHASEPOS" NUMERIC(15,0), 
	"MODIFICATIONNUMBER" NUMERIC(15,0), 
	"PUBLISHDATE" DATE, 
	"INFO" VARCHAR(2000 ), 
	"OOSKEY" VARCHAR(100 ), 
	"CHANGE_INITIATIVETYPE" VARCHAR(2 ), 
	"CHANGE_AUTHORITYTYPE" VARCHAR(2 ), 
	"CHANGE_AUTHORITYNAME" VARCHAR(2000 ), 
	"CHANGE_DATE" DATE, 
	"CHANGE_DESNUMBER" VARCHAR(350 ), 
	"CHECKRESULT_NUMBER" VARCHAR(30 ), 
	"PRESCRIPTION_NUMBER" VARCHAR(20 ), 
	"CHANGE_DOCNAME" BLOB SUB_TYPE TEXT, 
	"CHANGE_ADDITIONALINFO" BLOB SUB_TYPE TEXT
   )  
  ;
--------------------------------------------------------
--  DDL for Table CMPPAYSHEDULE
--------------------------------------------------------

  CREATE TABLE "CMPPAYSHEDULE" 
   (	"ORDER_ID" NUMERIC(15,0), 
	"BUDGETLINEPOS" NUMERIC(15,0), 
	"PAYDATE" DATE, 
	"AMOUNT" NUMERIC(15,2) DEFAULT 0
   )  ;
--------------------------------------------------------
--  DDL for Table CMPPERSONAL
--------------------------------------------------------

  CREATE TABLE "CMPPERSONAL" 
   (	"ORDER_ID" NUMERIC(15,0), 
	"PERSONAL_ID" NUMERIC(15,0), 
	"LASTNAME" VARCHAR(50 ), 
	"FIRSTNAME" VARCHAR(50 ), 
	"PATRONYMIC" VARCHAR(50 ), 
	"ORG_ID" NUMERIC(15,0), 
	"PHONE" VARCHAR(100 ), 
	"FAX" VARCHAR(100 ), 
	"EMAIL" VARCHAR(256 )
   )  ;
--------------------------------------------------------
--  DDL for Table CMPPERSONALRESP
--------------------------------------------------------

  CREATE TABLE "CMPPERSONALRESP" 
   (	"ORDER_ID" NUMERIC(15,0), 
	"PERSONAL_ID" NUMERIC(15,0), 
	"RESPONSIBILITY_ID" NUMERIC(15,0)
   )  ;
--------------------------------------------------------
--  DDL for Table CMPPHASE
--------------------------------------------------------

  CREATE TABLE "CMPPHASE" 
   (	"ORDER_ID" NUMERIC(15,0), 
	"POS" NUMERIC(15,0), 
	"PHASECODE" NUMERIC(1,0), 
	"PHASEDATE" DATE, 
	"PHASEPLACE" VARCHAR(4000 ), 
	"COMMISSION_ID" NUMERIC(15,0), 
	"OOS_PROTOCOL_NUMBER" VARCHAR(30 ), 
	"OOS_SIGN_DATE" DATE, 
	"OOS_PUBLISH_DATE" DATE, 
	"OOS_ADDINFO" VARCHAR(2000 ), 
	"OOS_PROTOCOLPUBLISHED" NUMERIC(1,0) DEFAULT 0, 
	"OOS_PROTOCOL_ID" VARCHAR(100 )
   )  ;
--------------------------------------------------------
--  DDL for Table CMPPLACE
--------------------------------------------------------

  CREATE TABLE "CMPPLACE" 
   (	"ORDER_ID" NUMERIC(15,0), 
	"POS" NUMERIC(15,0), 
	"ESTIMATE_ID" NUMERIC(15,0), 
	"ESTIMATENAME" VARCHAR(255 ), 
	"RECIPIENT_ID" NUMERIC(15,0), 
	"RECIPIENTNAME" VARCHAR(2000 ), 
	"CODE1" VARCHAR(100 ), 
	"CODE2" VARCHAR(100 ), 
	"CODE3" VARCHAR(100 ), 
	"CODE4" VARCHAR(100 ), 
	"CODE5" VARCHAR(100 ), 
	"CODE6" VARCHAR(100 ), 
	"CODE7" VARCHAR(100 ), 
	"CODE8" VARCHAR(100 ), 
	"CODE9" VARCHAR(100 ), 
	"CODE10" VARCHAR(100 ), 
	"FINSRCNAME" VARCHAR(512 ), 
	"FINSRC_ID" NUMERIC(15,0), 
	"COUNTRY_ID" NUMERIC(15,0), 
	"TERRITORYCODE" VARCHAR(20 ), 
	"ADDRESS" VARCHAR(300 ), 
	"SUPPLYAMOUNT" NUMERIC(15,2) DEFAULT 0, 
	"USEAMOUNT" NUMERIC(1,0) DEFAULT 0, 
	"CALCPRICE" NUMERIC(1,0) DEFAULT 0, 
	"INDUSTRYCODE_ID" NUMERIC(15,0), 
	"GRANTINVESTMENT_ID" NUMERIC(15,0), 
	"CUSTOMER_ID" NUMERIC(15,0)
   )  ;
--------------------------------------------------------
--  DDL for Table CMPQUALREQ
--------------------------------------------------------

  CREATE TABLE "CMPQUALREQ" 
   (	"ORDER_ID" NUMERIC(15,0), 
	"POS" NUMERIC(15,0), 
	"LOTPOS" NUMERIC(15,0), 
	"NAME" VARCHAR(2000 ), 
	"QTYPE" NUMERIC(2,0), 
	"QMINVALUE" NUMERIC(15,4), 
	"QMAXVALUE" NUMERIC(15,4), 
	"PLACEMENTFEATURE_ID" NUMERIC(15,0), 
	"CONTENT" VARCHAR(2000 ), 
	"REQUIREMENTTYPE_ID" NUMERIC(15,0), 
	"REQUIREMENTTYPE_NAME" VARCHAR(500 )
   )  ;
--------------------------------------------------------
--  DDL for Table CMPREPDOCUMENT
--------------------------------------------------------

  CREATE TABLE "CMPREPDOCUMENT" 
   (	"ORDER_ID" NUMERIC(15,0), 
	"REPDOCUMENT_ID" NUMERIC(15,0)
   )  ;
--------------------------------------------------------
--  DDL for Table CMPSUPPLYSHEDULE
--------------------------------------------------------

  CREATE TABLE "CMPSUPPLYSHEDULE" 
   (	"ORDER_ID" NUMERIC(15,0), 
	"GOODSPOS" NUMERIC(15,0), 
	"PLACEPOS" NUMERIC(15,0), 
	"SUPPLYDATE" DATE, 
	"QTY" NUMERIC(15,4) DEFAULT 0, 
	"AMOUNT" NUMERIC(15,2) DEFAULT 0, 
	"LOTPOS" NUMERIC(15,0)
   )  ;
--------------------------------------------------------
--  DDL for Table CMPVENDOR
--------------------------------------------------------

  CREATE TABLE "CMPVENDOR" 
   (	"ORDER_ID" NUMERIC(15,0), 
	"POS" NUMERIC(15,0), 
	"VENDOR_ID" NUMERIC(15,0), 
	"TAXCODE" VARCHAR(20 ), 
	"KPP" VARCHAR(20 ), 
	"VENDORNAME" VARCHAR(2000 ), 
	"REFCOUNT" NUMERIC(4,0), 
	"PROPFORM_ID" NUMERIC(15,0)
   )  ;
--------------------------------------------------------
--  DDL for Table CMPVOTERESULT
--------------------------------------------------------

  CREATE TABLE "CMPVOTERESULT" 
   (	"DECISIONPOS" NUMERIC(15,0), 
	"ORDER_ID" NUMERIC(15,0), 
	"POS" NUMERIC(15,0), 
	"CMPCOMMEMBERPOS" NUMERIC(15,0), 
	"NOTE" VARCHAR(500 ), 
	"RESULT" NUMERIC(1,0)
   )  ;
--------------------------------------------------------
--  DDL for Table CMPWORKGROUP
--------------------------------------------------------

  CREATE TABLE "CMPWORKGROUP" 
   (	"ORDER_ID" NUMERIC(15,0), 
	"POS" NUMERIC(15,0), 
	"CAPTION" VARCHAR(250 ), 
	"ETPKEY" NUMERIC(15,0)
   )  ;
--------------------------------------------------------
--  DDL for Table CODETYPE
--------------------------------------------------------

  CREATE TABLE "CODETYPE" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"BUDGET_ID" NUMERIC(15,0), 
	"DISPLAY_ORDER" NUMERIC(15,0), 
	"SEQORDER" NUMERIC(2,0), 
	"NAME" VARCHAR(50 ), 
	"CAPTION" VARCHAR(100 ), 
	"DESCRIPTION" VARCHAR(255 ), 
	"MASK" VARCHAR(200 ), 
	"GROUPMASK" VARCHAR(100 ), 
	"DEFVALUE" VARCHAR(100 )
   )  ;
--------------------------------------------------------
--  DDL for Table COMMEMBER
--------------------------------------------------------

  CREATE TABLE "COMMEMBER" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"COMMISSION_ID" NUMERIC(15,0), 
	"COMMEMBER_ID" NUMERIC(15,0), 
	"COMROLE" NUMERIC(1,0), 
	"COMMEMBER_NAME" VARCHAR(255 ), 
	"COMMEMBER_ROLE" VARCHAR(255 ), 
	"OOSKEY" VARCHAR(100 ), 
	"ISACTINGFORSECRETARY" NUMERIC(1,0) DEFAULT 0
   )  ;
--------------------------------------------------------
--  DDL for Table COMMISSION
--------------------------------------------------------

  CREATE TABLE "COMMISSION" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"CAPTION" VARCHAR(2000 ), 
	"COMTYPE" NUMERIC(1,0), 
	"OOSREGNUMBER" VARCHAR(100 ), 
	"ISACTUAL" NUMERIC(1,0) DEFAULT 1, 
	"ORG_ID" NUMERIC(15,0), 
	"DATENUMORDERNAME" VARCHAR(2000 )
   )  ;
--------------------------------------------------------
--  DDL for Table COMPLAINTDOC
--------------------------------------------------------

  CREATE TABLE "COMPLAINTDOC" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"DOCUMENT_ID" NUMERIC(15,0), 
	"DOCUMENTCLASS_ID" NUMERIC(15,0), 
	"DISPSTATUS_ID" NUMERIC(15,0), 
	"OPERTYPE_ID" NUMERIC(15,0) DEFAULT 0, 
	"BUDGET_ID" NUMERIC(15,0), 
	"DOC_NUMBER" VARCHAR(20 ), 
	"DOC_DATE" DATE, 
	"AMOUNT" NUMERIC(15,2) DEFAULT 0, 
	"DESCRIPTION" VARCHAR(2000 ), 
	"FOREIGN_KEY" VARCHAR(50 ), 
	"INFO_DATE" DATE, 
	"SUPERVISION_ORG" VARCHAR(2000 ), 
	"COMPLAINANT_ORG" VARCHAR(2000 ), 
	"COM_LAW_ADDRESS" VARCHAR(300 ), 
	"COM_FAC_ADDRESS" VARCHAR(300 ), 
	"COM_EMAIL" VARCHAR(256 ), 
	"COM_PHONE" VARCHAR(100 ), 
	"COM_FAX" VARCHAR(100 ), 
	"COM_CONTACT_PERSON" VARCHAR(300 ), 
	"DEFENDANT_ORG_TYPE" NUMERIC(2,0), 
	"DEF_ORG_NAME" VARCHAR(2000 ), 
	"DEF_LAW_ADDRESS" VARCHAR(300 ), 
	"DEF_FAC_ADDRESS" VARCHAR(300 ), 
	"DEF_PHONE" VARCHAR(100 ), 
	"ORDER_NUMBER" VARCHAR(300 ), 
	"NOTICE_PUBLISH_DATE" DATE, 
	"PURCHASE_GOODS" BLOB SUB_TYPE TEXT, 
	"SITE_URL" VARCHAR(1000 ), 
	"COMPLAINT_BODY" BLOB SUB_TYPE TEXT, 
	"COMPLAINT_DECISION" NUMERIC(2,0), 
	"DECISION_DIRECTIONS" BLOB SUB_TYPE TEXT
   )  
  ;
--------------------------------------------------------
--  DDL for Table CONAGREEMENTSDOCS
--------------------------------------------------------

  CREATE TABLE "CONAGREEMENTSDOCS" 
   (	"CONTRACT_ID" NUMERIC(15,0), 
	"POS" NUMERIC(15,0), 
	"DOCNUMBER" VARCHAR(500 ), 
	"DOCDATE" DATE, 
	"DOCNAME" VARCHAR(2000 ), 
	"DOCINFO" VARCHAR(500 )
   )  ;
--------------------------------------------------------
--  DDL for Table CONBANKGUARANTEERETURN
--------------------------------------------------------

  CREATE TABLE "CONBANKGUARANTEERETURN" 
   (	"CONTRACT_ID" NUMERIC(15,0), 
	"POS" NUMERIC(15,0), 
	"INFO" NUMERIC(1,0), 
	"BANKGUARANTEEREGNUMBERTYPE" VARCHAR(20 ), 
	"RETURNDATE" DATE, 
	"NOTICENUMBER" VARCHAR(100 ), 
	"REASON" VARCHAR(2000 )
   )  ;
--------------------------------------------------------
--  DDL for Table CONBUDGETLINE
--------------------------------------------------------

  CREATE TABLE "CONBUDGETLINE" 
   (	"CONTRACT_ID" NUMERIC(15,0), 
	"CONTRACTORPOS" NUMERIC(15,0), 
	"PLACEPOS" NUMERIC(15,0), 
	"POS" NUMERIC(15,0), 
	"ESTIMATE_ID" NUMERIC(15,0), 
	"ESTIMATENAME" VARCHAR(255 ), 
	"RECIPIENT_ID" NUMERIC(15,0), 
	"RECIPIENTNAME" VARCHAR(2000 ), 
	"RECIPIENTACC_ID" NUMERIC(15,0), 
	"RECIPIENTACCOUNT" VARCHAR(35 ), 
	"CODE1" VARCHAR(100 ), 
	"CODE2" VARCHAR(100 ), 
	"CODE3" VARCHAR(100 ), 
	"CODE4" VARCHAR(100 ), 
	"CODE5" VARCHAR(100 ), 
	"CODE6" VARCHAR(100 ), 
	"CODE7" VARCHAR(100 ), 
	"CODE8" VARCHAR(100 ), 
	"CODE9" VARCHAR(100 ), 
	"CODE10" VARCHAR(100 ), 
	"FINSRCNAME" VARCHAR(512 ), 
	"FINSRC_ID" NUMERIC(15,0), 
	"LIABILITYEXPENSE_ID" NUMERIC(15,0), 
	"ADVANCE_DATE" DATE, 
	"ADVANCE_AMOUNT" NUMERIC(15,2), 
	"REMARK" VARCHAR(2000 ), 
	"INDUSTRYCODE_ID" NUMERIC(15,0), 
	"GRANTINVESTMENT_ID" NUMERIC(15,0)
   )  ;
--------------------------------------------------------
--  DDL for Table CONCONFIRMINGDOCS
--------------------------------------------------------

  CREATE TABLE "CONCONFIRMINGDOCS" 
   (	"CONTRACT_ID" NUMERIC(15,0), 
	"POS" NUMERIC(15,0), 
	"DOCCODE" NUMERIC(1,0) DEFAULT 1, 
	"DOCNUMBER" VARCHAR(500 ), 
	"DOCDATE" DATE, 
	"PROTOCOLNAME" VARCHAR(2000 ), 
	"DOCINFO" VARCHAR(500 )
   )  ;
--------------------------------------------------------
--  DDL for Table CONCONTRACTOR
--------------------------------------------------------

  CREATE TABLE "CONCONTRACTOR" 
   (	"CONTRACT_ID" NUMERIC(15,0), 
	"POS" NUMERIC(15,0), 
	"ORG_ID" NUMERIC(15,0), 
	"ORGNAME" VARCHAR(2000 ), 
	"ORGTAXCODE" VARCHAR(20 ), 
	"ORGKPP" VARCHAR(20 ), 
	"ORGACC_ID" NUMERIC(15,0), 
	"ORGACCOUNT" VARCHAR(35 ), 
	"ORGACCTYPE" NUMERIC(1,0) DEFAULT 0, 
	"ORGEXECUTERACC_ID" NUMERIC(15,0), 
	"ORGEXECUTERACC" VARCHAR(35 ), 
	"ORGEXECUTER_ID" NUMERIC(15,0), 
	"ORGEXECUTER" VARCHAR(2000 ), 
	"ORGCORACCOUNT" VARCHAR(35 ), 
	"ORGBIC" VARCHAR(9 ), 
	"ORGBANKNAME" VARCHAR(2000 ), 
	"ORGOKTMO" VARCHAR(11 ), 
	"ORGINCOME_CODE" VARCHAR(20 ), 
	"ORGOKTMO_ID" NUMERIC(15,0), 
	"ORGORGTYPE" NUMERIC(1,0) DEFAULT 0, 
	"ORGISTAXCODEFREE" NUMERIC(1,0) DEFAULT 0, 
	"ORGTAXPAYERCODE" VARCHAR(100 ), 
	"ORGLASTNAME" VARCHAR(250 ), 
	"ORGFIRSTNAME" VARCHAR(250 ), 
	"ORGPATRONYMIC" VARCHAR(250 ), 
	"ORGISCULTURE" NUMERIC(1,0) DEFAULT 0, 
	"ORGPROPFORM_ID" NUMERIC(15,0)
   )  ;
--------------------------------------------------------
--  DDL for Table CONDAMAGEPAYMENTS
--------------------------------------------------------

  CREATE TABLE "CONDAMAGEPAYMENTS" 
   (	"CONTRACT_ID" NUMERIC(15,0), 
	"POS" NUMERIC(15,0), 
	"DOCNUMBER" VARCHAR(100 ), 
	"DOCDATE" DATE, 
	"DOCNAME" VARCHAR(1000 ), 
	"AMOUNT" NUMERIC(15,2) DEFAULT 0
   )  ;
--------------------------------------------------------
--  DDL for Table CONEXECSTEP
--------------------------------------------------------

  CREATE TABLE "CONEXECSTEP" 
   (	"CONTRACT_ID" NUMERIC(15,0), 
	"CONTRACTORPOS" NUMERIC(15,0), 
	"BUDGETLINEPOS" NUMERIC(15,0), 
	"EXECDATE" DATE, 
	"AMOUNT" NUMERIC(15,2) DEFAULT 0
   )  ;
--------------------------------------------------------
--  DDL for Table CONEXECSTEP2
--------------------------------------------------------

  CREATE TABLE "CONEXECSTEP2" 
   (	"CONTRACT_ID" NUMERIC(15,0), 
	"POS" NUMERIC(15,0), 
	"STEPNUMBER" NUMERIC(15,0), 
	"AMOUNT" NUMERIC(15,2) DEFAULT 0, 
	"FOREIGNAMOUNT" NUMERIC(15,2) DEFAULT 0, 
	"CAPTION" VARCHAR(100 ), 
	"PLANSTARTDATE" DATE, 
	"PLANFINISHDATE" DATE, 
	"REMARKSTARTDATE" VARCHAR(1000 ), 
	"REMARKFINISHDATE" VARCHAR(1000 ), 
	"FACTSTARTDATE" DATE, 
	"FACTFINISHDATE" DATE, 
	"REPORTPRINTDATE" DATE, 
	"ISPAYIGNORED" NUMERIC(1,0) DEFAULT 0
   )  ;
--------------------------------------------------------
--  DDL for Table CONFCONCLUSIONCONTRACT
--------------------------------------------------------

  CREATE TABLE "CONFCONCLUSIONCONTRACT" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"PURCHASEMODE_ID" NUMERIC(15,0), 
	"PLACINGWAY_ID" NUMERIC(15,0), 
	"DOCCODE" VARCHAR(6 ), 
	"DOCNAME" VARCHAR(1000 ), 
	"ACTUAL" NUMERIC(1,0) DEFAULT 1
   )  ;
--------------------------------------------------------
--  DDL for Table CONGOODS
--------------------------------------------------------

  CREATE TABLE "CONGOODS" 
   (	"CONTRACT_ID" NUMERIC(15,0), 
	"POS" NUMERIC(15,0), 
	"GROUPCODE" VARCHAR(20 ), 
	"OKDP_CODE" VARCHAR(20 ), 
	"GROUPCAPTION" VARCHAR(500 ), 
	"GOODSCODE" VARCHAR(20 ), 
	"GOODSCAPTION" VARCHAR(512 ), 
	"QTY" NUMERIC(15,4) DEFAULT 0, 
	"PRICE" NUMERIC(15,2) DEFAULT 0, 
	"AMOUNT" NUMERIC(15,2) DEFAULT 0, 
	"STATUS" NUMERIC(1,0) DEFAULT 0, 
	"OKPD_CODE" VARCHAR(20 ), 
	"OKPD_NAME" VARCHAR(1000 ), 
	"OKPD_ID" NUMERIC(15,0), 
	"UNITNAME" VARCHAR(50 )
   )  ;
--------------------------------------------------------
--  DDL for Table CONGOODSPROP
--------------------------------------------------------

  CREATE TABLE "CONGOODSPROP" 
   (	"CONTRACT_ID" NUMERIC(15,0), 
	"GOODSPOS" NUMERIC(15,0), 
	"SEQORDER" NUMERIC(15,0), 
	"PROPTYPE_ID" NUMERIC(15,0), 
	"CAPTION" VARCHAR(512 ), 
	"PROPVALUE" VARCHAR(1500 )
   )  ;
--------------------------------------------------------
--  DDL for Table CONLOT
--------------------------------------------------------

  CREATE TABLE "CONLOT" 
   (	"CONTRACT_ID" NUMERIC(15,0), 
	"LOTPOS" NUMERIC(15,0), 
	"LOTNAME" VARCHAR(2000 ), 
	"LOTNUMBER" NUMERIC(15,0)
   )  ;
--------------------------------------------------------
--  DDL for Table CONORGSTATUS
--------------------------------------------------------

  CREATE TABLE "CONORGSTATUS" 
   (	"CONTRACT_ID" NUMERIC(15,0), 
	"ORGSTATUS_ID" NUMERIC(15,0)
   )  ;
--------------------------------------------------------
--  DDL for Table CONPAYFACT
--------------------------------------------------------

  CREATE TABLE "CONPAYFACT" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"CONTRACT_ID" NUMERIC(15,0), 
	"CONTRACTORPOS" NUMERIC(15,0), 
	"PAYDATE" DATE, 
	"AMOUNT" NUMERIC(15,2) DEFAULT 0, 
	"ISNOTFOREXPORTLINE" NUMERIC(1,0) DEFAULT 0, 
	"NUM" VARCHAR(100 ), 
	"CAPTION" VARCHAR(500 ), 
	"FOREIGNKEY" VARCHAR(50 ), 
	"DOCDATE" DATE, 
	"ISPREPAYMENT" NUMERIC(1,0) DEFAULT 0
   )  ;
--------------------------------------------------------
--  DDL for Table CONPAYSHEDULE
--------------------------------------------------------

  CREATE TABLE "CONPAYSHEDULE" 
   (	"CONTRACT_ID" NUMERIC(15,0), 
	"CONTRACTORPOS" NUMERIC(15,0), 
	"BUDGETLINEPOS" NUMERIC(15,0), 
	"PAYDATE" DATE, 
	"AMOUNT" NUMERIC(15,2) DEFAULT 0
   )  ;
--------------------------------------------------------
--  DDL for Table CONPLACE
--------------------------------------------------------

  CREATE TABLE "CONPLACE" 
   (	"CONTRACT_ID" NUMERIC(15,0), 
	"POS" NUMERIC(15,0), 
	"RECIPIENT_ID" NUMERIC(15,0), 
	"RECIPIENTNAME" VARCHAR(2000 ), 
	"COUNTRY_ID" NUMERIC(15,0), 
	"TERRITORYCODE" VARCHAR(20 ), 
	"ADDRESS" VARCHAR(300 ), 
	"SUPPLYAMOUNT" NUMERIC(15,2) DEFAULT 0, 
	"USEAMOUNT" NUMERIC(1,0) DEFAULT 0, 
	"CALCPRICE" NUMERIC(1,0) DEFAULT 0, 
	"EXECSTEP2POS" NUMERIC(15,0)
   )  ;
--------------------------------------------------------
--  DDL for Table CONPRODUCTSCHANGEDOCS
--------------------------------------------------------

  CREATE TABLE "CONPRODUCTSCHANGEDOCS" 
   (	"CONTRACT_ID" NUMERIC(15,0), 
	"POS" NUMERIC(15,0), 
	"DOCNUMBER" VARCHAR(100 ), 
	"DOCDATE" DATE, 
	"DOCNAME" VARCHAR(1000 )
   )  ;
--------------------------------------------------------
--  DDL for Table CONREFUSALFACT
--------------------------------------------------------

  CREATE TABLE "CONREFUSALFACT" 
   (	"CONTRACT_ID" NUMERIC(15,0), 
	"POS" NUMERIC(15,0), 
	"VOUCHERENTRY" VARCHAR(4000 ), 
	"EXPLANATION" VARCHAR(4000 ), 
	"REFUSALFACTFOUNDATION_ID" NUMERIC(15,0)
   )  ;
--------------------------------------------------------
--  DDL for Table CONSOLIDDOC
--------------------------------------------------------

  CREATE TABLE "CONSOLIDDOC" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"DOCUMENT_ID" NUMERIC(15,0), 
	"DOCUMENTCLASS_ID" NUMERIC(15,0), 
	"DISPSTATUS_ID" NUMERIC(15,0), 
	"OPERTYPE_ID" NUMERIC(15,0) DEFAULT 0, 
	"BUDGET_ID" NUMERIC(15,0), 
	"DOC_NUMBER" VARCHAR(20 ), 
	"AMOUNT" NUMERIC(15,2) DEFAULT 0, 
	"DOC_DATE" DATE, 
	"FOREIGN_KEY" VARCHAR(50 ), 
	"EXPORT_FLAG" NUMERIC(1,0) DEFAULT 0, 
	"CMPORG_ID" NUMERIC(15,0), 
	"CMPORGNAME" VARCHAR(2000 ), 
	"TERM_DATE" DATE, 
	"PURCHASEMODE_ID" NUMERIC(15,0), 
	"PURCHASEMODE_CAPTION" VARCHAR(500 ), 
	"PRICECONTROL" NUMERIC(1,0) DEFAULT 0, 
	"SUBJECT" VARCHAR(2000 ), 
	"REMARK" VARCHAR(255 ), 
	"DESCRIPTION" VARCHAR(2000 )
   )  ;
--------------------------------------------------------
--  DDL for Table CONSTRUCTION
--------------------------------------------------------

  CREATE TABLE "CONSTRUCTION" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"ADDRESS" VARCHAR(255 ), 
	"DESCRIPTION" VARCHAR(255 )
   )  ;
--------------------------------------------------------
--  DDL for Table CONSUPPLYSHEDULE
--------------------------------------------------------

  CREATE TABLE "CONSUPPLYSHEDULE" 
   (	"CONTRACT_ID" NUMERIC(15,0), 
	"GOODSPOS" NUMERIC(15,0), 
	"PLACEPOS" NUMERIC(15,0), 
	"SUPPLYDATE" DATE, 
	"QTY" NUMERIC(15,4) DEFAULT 0, 
	"AMOUNT" NUMERIC(15,2) DEFAULT 0
   )  ;
--------------------------------------------------------
--  DDL for Table CONTRACTCARDDOC
--------------------------------------------------------

  CREATE TABLE "CONTRACTCARDDOC" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"DOCUMENT_ID" NUMERIC(15,0), 
	"DOCUMENTCLASS_ID" NUMERIC(15,0), 
	"DISPSTATUS_ID" NUMERIC(15,0), 
	"OPERTYPE_ID" NUMERIC(15,0) DEFAULT 0, 
	"BUDGET_ID" NUMERIC(15,0), 
	"DOC_NUMBER" VARCHAR(20 ), 
	"DOC_DATE" DATE, 
	"SELECTIONDATE" DATE, 
	"DEALDATE" DATE, 
	"BIDDERDATE" DATE, 
	"ETP_ID" NUMERIC(15,0), 
	"ETPKEY" VARCHAR(100 ), 
	"ETP_DOC_NUMBER" VARCHAR(50 ), 
	"CUSTOMER_ID" NUMERIC(15,0), 
	"CUSTOMERNAME" VARCHAR(2000 ), 
	"CON_ID" NUMERIC(15,0), 
	"CONNAME" VARCHAR(2000 ), 
	"CONTAXCODE" VARCHAR(20 ), 
	"CONKPP" VARCHAR(20 ), 
	"CON_ETPKEY" VARCHAR(100 ), 
	"CMPNAME" VARCHAR(2000 ), 
	"REMARK" VARCHAR(255 ), 
	"AMOUNT" NUMERIC(15,2), 
	"DESCRIPTION" VARCHAR(2000 ), 
	"FOREIGN_KEY" VARCHAR(50 ), 
	"REJECTPLACE" VARCHAR(4000 ), 
	"REASONDOCUMENTS" VARCHAR(4000 ), 
	"REJECTREASONS" VARCHAR(4000 ), 
	"WEBLINK_CONTRACT" VARCHAR(2000 ), 
	"WEBLINK_REJECT" VARCHAR(2000 ), 
	"WEBLINK_REVISION" VARCHAR(2000 )
   )  ;
--------------------------------------------------------
--  DDL for Table CONTRACTDOC
--------------------------------------------------------

  CREATE TABLE "CONTRACTDOC" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"DOCUMENT_ID" NUMERIC(15,0), 
	"DOCUMENTCLASS_ID" NUMERIC(15,0), 
	"DISPSTATUS_ID" NUMERIC(15,0), 
	"OPERTYPE_ID" NUMERIC(15,0) DEFAULT 0, 
	"BUDGET_ID" NUMERIC(15,0), 
	"DOC_NUMBER" VARCHAR(30 ), 
	"DOC_DATE" DATE, 
	"AMOUNT" NUMERIC(15,2) DEFAULT 0, 
	"DESCRIPTION" VARCHAR(2000 ), 
	"CONTYPE_ID" NUMERIC(15,0), 
	"CONSTRUCTION_ID" NUMERIC(15,0), 
	"STARTDATE" DATE, 
	"FINISHDATE" DATE, 
	"INFODATE" DATE, 
	"EXECDATE" DATE, 
	"PURCHASEMODE_ID" NUMERIC(15,0), 
	"PURCHASEMODE_CAPTION" VARCHAR(500 ), 
	"CMPORG_ID" NUMERIC(15,0), 
	"CUSTOMER_ID" NUMERIC(15,0), 
	"CUSTOMERNAME" VARCHAR(2000 ), 
	"CUSTOMERTAXCODE" VARCHAR(20 ), 
	"CUSTOMERKPP" VARCHAR(20 ), 
	"RECIPIENT_ID" NUMERIC(15,0), 
	"RECIPIENTNAME" VARCHAR(2000 ), 
	"CON_ID" NUMERIC(15,0), 
	"CONNAME" VARCHAR(2000 ), 
	"CONTAXCODE" VARCHAR(20 ), 
	"CONKPP" VARCHAR(20 ), 
	"CONACC_ID" NUMERIC(15,0), 
	"CONACCOUNT" VARCHAR(35 ), 
	"CONACCTYPE" NUMERIC(1,0) DEFAULT 0, 
	"CONEXECUTERACC_ID" NUMERIC(15,0), 
	"CONEXECUTERACC" VARCHAR(35 ), 
	"CONEXECUTER_ID" NUMERIC(15,0), 
	"CONEXECUTER" VARCHAR(2000 ), 
	"CONCORACCOUNT" VARCHAR(35 ), 
	"CONBIC" VARCHAR(9 ), 
	"CONBANKNAME" VARCHAR(2000 ), 
	"CONCOUNTRY_ID" NUMERIC(15,0), 
	"CONTERRITORYCODE" VARCHAR(20 ), 
	"CONPOSTINDEX" VARCHAR(10 ), 
	"CONADDRESS" VARCHAR(300 ), 
	"CONPHONE" VARCHAR(100 ), 
	"CONFAX" VARCHAR(100 ), 
	"CONEMAIL" VARCHAR(256 ), 
	"CONPROPFORM_ID" NUMERIC(15,0), 
	"CONOKTMO" VARCHAR(11 ), 
	"CONINCOME_CODE" VARCHAR(20 ), 
	"DELIVERYBASISCODE" VARCHAR(50 ), 
	"PAYCONDITIONNAME" VARCHAR(255 ), 
	"PAYEDAMOUNT" NUMERIC(15,2) DEFAULT 0, 
	"LOTNAME" VARCHAR(512 ), 
	"CON_NUMBER" VARCHAR(50 ), 
	"CON_DATE" DATE, 
	"NOTICENUMBER" VARCHAR(20 ), 
	"CMPDATE" DATE, 
	"REMARK" VARCHAR(255 ), 
	"FOREIGN_KEY" VARCHAR(50 ), 
	"ISGROUPSMOREONE" NUMERIC(1,0), 
	"EXPORT_FLAG" NUMERIC(1,0) DEFAULT 0, 
	"CONTROLFLAGS" NUMERIC(15,0) DEFAULT 0, 
	"CONTRACTTYPE_ID" NUMERIC(15,0), 
	"ACTUAL_YEAR" NUMERIC(4,0), 
	"DISSOLVE_DATE" DATE, 
	"REVISION_DATE" DATE, 
	"COMPLETE_DATE" DATE, 
	"DEALDATE" DATE, 
	"PROCESS_BEFORE_DATE" DATE, 
	"CONFIRMNOTE" VARCHAR(4000 ), 
	"CONFIRM_DOC_NUMBER" VARCHAR(100 ), 
	"CONFIRM_DOC_DATE" DATE, 
	"SUBJECT" VARCHAR(2000 ), 
	"CHANGETYPE" NUMERIC(1,0) DEFAULT 0, 
	"SUPPLIEDAMOUNT" NUMERIC(15,2) DEFAULT 0, 
	"REMARK_EXT" VARCHAR(2000 ), 
	"OOSKEY" VARCHAR(100 ), 
	"OOSFOUNDATIONPROTOCOLNUMBER" VARCHAR(100 ), 
	"OOSCHANGEDESCRIPTION" VARCHAR(2000 ), 
	"OOSCHANGEBASE" VARCHAR(2000 ), 
	"OOSCURRENTSTAGE" VARCHAR(2 ), 
	"OOSATTACHPACKETCNT" NUMERIC(15,0) DEFAULT -1, 
	"STARTINGAMOUNT" NUMERIC(15,2) DEFAULT 0, 
	"LOTNUMBER" NUMERIC(15,0) DEFAULT 1, 
	"OFFERNUMBER" VARCHAR(20 ), 
	"DOCKIND" NUMERIC(1,0), 
	"GRNTAMOUNT" NUMERIC(15,2), 
	"GRNTFROM" DATE, 
	"GRNTTO" DATE, 
	"GRNTTYPE" NUMERIC(1,0) DEFAULT 0, 
	"GRNTGUARANTOR" VARCHAR(2000 ), 
	"GRNTRETURNAMT" NUMERIC(15,2), 
	"GRNTRETURNDATE" DATE, 
	"GRNTINFO" VARCHAR(2000 ), 
	"GRNTTERMAMOUNT" NUMERIC(15,2), 
	"GRNTTERMFROM" DATE, 
	"GRNTTERMTO" DATE, 
	"GRNTTERMTYPE" NUMERIC(1,0) DEFAULT 0, 
	"GRNTTERMGUARANTOR" VARCHAR(2000 ), 
	"GRNTTERMRETURNAMT" NUMERIC(15,2), 
	"GRNTTERMRETURNDATE" DATE, 
	"GRNTTERMINFO" VARCHAR(2000 ), 
	"PRICECHANGEREASON_ID" NUMERIC(15,0), 
	"PRICECHANGECOMMENTS" VARCHAR(4000 ), 
	"SINGLECUSTOMERREASON_ID" NUMERIC(15,0), 
	"OFRREQREASON_ID" NUMERIC(15,0), 
	"PLANPOSITIONNUMBER" VARCHAR(100 ), 
	"INVITATION_DATE" DATE, 
	"PUBLIC_DATE" DATE, 
	"EVASIONPROTOCOLOOSKEY" NUMERIC(15,0), 
	"EVASIONPROTOCOLNUMBER" VARCHAR(30 ), 
	"EVASIONPROTOCOLDATE" DATE, 
	"EVASIONPROTOCOLSIGNDATE" DATE, 
	"EVASIONPROTOCOLPUBLISHDATE" DATE, 
	"EVASIONPROTOCOLPLACE" VARCHAR(4000 ), 
	"CURYEARAMOUNT" NUMERIC(15,2) DEFAULT 0, 
	"FUTYEARAMOUNT" NUMERIC(15,2) DEFAULT 0, 
	"CURRENCY_ID" NUMERIC(15,0), 
	"FORFEITAMOUNT" NUMERIC(15,2) DEFAULT 0, 
	"OFFER_DOCDATE" DATE, 
	"SINGLECUSTOMERREASONDOC_ID" NUMERIC(15,0), 
	"SINGLECUSTOMERREASONDOC_NAME" VARCHAR(1000 ), 
	"REPORTBASE" VARCHAR(2000 ), 
	"GRNTREGNUMBER" VARCHAR(20 ), 
	"REGNUMIKU" VARCHAR(100 ), 
	"PRICETYPE" NUMERIC(1,0) DEFAULT 0, 
	"PRICEFORMULA" VARCHAR(2000 ), 
	"SUBCONTRACTORSSUMINPERCENTS" NUMERIC(15,2) DEFAULT 0, 
	"SUBCONTRACTORSSUMINRUB" NUMERIC(15,2) DEFAULT 0, 
	"ENERGYSERVICECONTRACTINFO" VARCHAR(2000 ), 
	"MODIFICATIONREASON_ID" NUMERIC(15,0), 
	"MODIFICATIONREASON_NAME" VARCHAR(1250 ), 
	"MODIFICATIONREASON_CODE" VARCHAR(15 ), 
	"MODIFICATIONREASONDOC_ID" NUMERIC(15,0), 
	"MODIFICATIONREASONDOC_NAME" VARCHAR(1000 ), 
	"MODIFICATIONREASONDOC_CODE" VARCHAR(10 ), 
	"CONOKPO" VARCHAR(20 ), 
	"CONREGISTRATIONDATE" DATE, 
	"PRODUCTSCHANGEINFO" VARCHAR(2000 ), 
	"NECESSITY_ID" NUMERIC(15,0) DEFAULT 0, 
	"NECESSITY_DESCRIPTION" VARCHAR(1000 ), 
	"GRNTREGNUMBER_ID" NUMERIC(15,0), 
	"CONFCONCCONTRACT_ID" NUMERIC(15,0), 
	"FOREIGN_STATUS" VARCHAR(100 ), 
	"SUBCONTRACTORSINFO" VARCHAR(2000 ), 
	"INFO_VERSION" NUMERIC(9,0), 
	"CONFIRMINFO_DATE" DATE, 
	"OOSPURCHASEORG_ID" NUMERIC(15,0), 
	"OOSPURCHASEORG_NAME" VARCHAR(2000 ), 
	"OOSPURCHASEORGOOSROLE" NUMERIC(1,0), 
	"ISCREDIT" NUMERIC(1,0) DEFAULT 0, 
	"CONOKTMO_ID" NUMERIC(15,0), 
	"CONORGTYPE" NUMERIC(1,0) DEFAULT 0, 
	"CONISTAXCODEFREE" NUMERIC(1,0) DEFAULT 0, 
	"CONTAXPAYERCODE" VARCHAR(100 ), 
	"CONLASTNAME" VARCHAR(250 ), 
	"CONFIRSTNAME" VARCHAR(250 ), 
	"CONPATRONYMIC" VARCHAR(250 ), 
	"CONISCULTURE" NUMERIC(1,0) DEFAULT 0
   )  ;
--------------------------------------------------------
--  DDL for Table CONTRACTEXECDOC
--------------------------------------------------------

  CREATE TABLE "CONTRACTEXECDOC" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"DOCUMENT_ID" NUMERIC(15,0), 
	"DOCUMENTCLASS_ID" NUMERIC(15,0), 
	"DISPSTATUS_ID" NUMERIC(15,0), 
	"OPERTYPE_ID" NUMERIC(15,0) DEFAULT 0, 
	"BUDGET_ID" NUMERIC(15,0), 
	"FOREIGN_KEY" VARCHAR(50 ), 
	"DOC_NUMBER" VARCHAR(20 ), 
	"DOC_DATE" DATE, 
	"AMOUNT" NUMERIC(15,2) DEFAULT 0, 
	"DESCRIPTION" VARCHAR(2000 ), 
	"REMARK" VARCHAR(255 ), 
	"PUBLISH_DATE" DATE, 
	"TYPE" NUMERIC(1,0) DEFAULT 0, 
	"STAGE_NUMBER" NUMERIC(15,0), 
	"STAGE_DATE" DATE, 
	"ORDINALNUMBER" NUMERIC(15,0), 
	"FINALSTAGEEXECUTION" NUMERIC(1,0), 
	"BANKGRNT_EXPORTFLAG" NUMERIC(1,0), 
	"BANKGRNT_IMPROPEREXECINFO" VARCHAR(2000 ), 
	"BANKGRNT_REQUIREMENTSDATE" DATE, 
	"BANKGRNT_PAYMENTAMOUNT" NUMERIC(15,2), 
	"BANKGRNT_NAME" VARCHAR(1000 ), 
	"BANKGRNT_DOCUMENTDATE" DATE, 
	"BANKGRNT_DOCUMENTNUM" VARCHAR(100 ), 
	"BANKGRNT_BANKPAID" NUMERIC(15,2), 
	"BANKGRNT_BANKCANCELDETAILS" VARCHAR(200 ), 
	"BANKGRNT_IMPROPERGRNTPAYMENT" VARCHAR(2000 ), 
	"CUSTOMER_ID" NUMERIC(15,0), 
	"CUSTOMERNAME" VARCHAR(2000 ), 
	"CUSTOMERTAXCODE" VARCHAR(20 ), 
	"CUSTOMERKPP" VARCHAR(20 ), 
	"REASON" VARCHAR(4000 ), 
	"OOSKEY" VARCHAR(100 ), 
	"TERMINATIONFLAG" NUMERIC(1,0) DEFAULT 0, 
	"TERMINATIONDATE" DATE, 
	"TERMINATIONREASON" VARCHAR(2000 ), 
	"RESTRUCTUREFLAG" NUMERIC(1,0) DEFAULT 0, 
	"RESTRUCTUREDATE" DATE, 
	"RESTRUCTUREAMOUNT" NUMERIC(15,2), 
	"REPAYMENTSCHEDULE" VARCHAR(2000 ), 
	"DELAY_WRTOFFPNLTSFLAG" NUMERIC(1,0) DEFAULT 0, 
	"TOTALAMOUNT" NUMERIC(15,2), 
	"DELAY_PENALTIESFLAG" NUMERIC(1,0) DEFAULT 0, 
	"DELAY_DATE" DATE, 
	"DELAY_AMOUNT" NUMERIC(15,2), 
	"DELAY_PERIOD" DATE, 
	"DELAY_NOTICEDOCNUM" VARCHAR(100 ), 
	"DELAY_NOTICEDOCDATE" DATE, 
	"WRITEOFF_PENALTIESFLAG" NUMERIC(1,0) DEFAULT 0, 
	"WRITEOFF_DATE" DATE, 
	"WRITEOFF_AMOUNT" NUMERIC(15,2), 
	"WRITEOFF_NOTICEDOCNUM" VARCHAR(100 ), 
	"WRITEOFF_NOTICEDOCDATE" DATE, 
	"HLDCASHENFRCMNT_FLAG" NUMERIC(1,0) DEFAULT 0, 
	"IMPROPERSUPPLIERINFO" VARCHAR(2000 ), 
	"HOLDAMOUNT" NUMERIC(15,2), 
	"HOLDDATE" DATE, 
	"BANKGRNT_REFUNDAMOUNT" NUMERIC(15,2), 
	"BANKGRNT_PENALTIESAMOUNT" NUMERIC(15,2), 
	"BANKGRNT_LOSSNOTCOVEREDAMOUNT" NUMERIC(15,2), 
	"BANKGRNT_WARRANTYAMOUNT" NUMERIC(15,2), 
	"BANKGRNT_OTHERAMOUNT" NUMERIC(15,2)
   )  ;
--------------------------------------------------------
--  DDL for Table CONTRACTOR
--------------------------------------------------------

  CREATE TABLE "CONTRACTOR" 
   (	"INSPECTOR_ID" NUMERIC(15,0), 
	"ORG_ID" NUMERIC(15,0)
   )  ;
--------------------------------------------------------
--  DDL for Table CONTRACTREASON
--------------------------------------------------------

  CREATE TABLE "CONTRACTREASON" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"CODE" VARCHAR(15 ), 
	"NAME" VARCHAR(2000 ), 
	"OOSKEY" VARCHAR(100 ), 
	"ACTUAL" NUMERIC(1,0) DEFAULT 0, 
	"REFTYPE" NUMERIC(1,0), 
	"POINTLAW" VARCHAR(1000 ), 
	"BUDGETTYPE" NUMERIC(1,0) DEFAULT 0
   )  ;
--------------------------------------------------------
--  DDL for Table CONTRACTREASON_DOCLINES
--------------------------------------------------------

  CREATE TABLE "CONTRACTREASON_DOCLINES" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"CONTRACTREASON_ID" NUMERIC(15,0), 
	"CODE" VARCHAR(10 ), 
	"NAME" VARCHAR(1000 ), 
	"ACTUAL" NUMERIC(1,0) DEFAULT 1
   )  ;
--------------------------------------------------------
--  DDL for Table CONTRACTTEMPLATEDOC
--------------------------------------------------------

  CREATE TABLE "CONTRACTTEMPLATEDOC" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"DOCUMENT_ID" NUMERIC(15,0), 
	"DOCUMENTCLASS_ID" NUMERIC(15,0), 
	"DISPSTATUS_ID" NUMERIC(15,0), 
	"BUDGET_ID" NUMERIC(15,0), 
	"OPERTYPE_ID" NUMERIC(15,0) DEFAULT 0, 
	"FOREIGN_KEY" VARCHAR(50 ), 
	"DOC_NUMBER" VARCHAR(20 ), 
	"DOC_DATE" DATE, 
	"AMOUNT" NUMERIC(15,2) DEFAULT 0, 
	"DESCRIPTION" VARCHAR(2000 ), 
	"REMARK" VARCHAR(255 ), 
	"CMPLOTPOS" NUMERIC(15,0), 
	"CUSTOMER_ID" NUMERIC(15,0), 
	"CONTRACT_ID" NUMERIC(15,0)
   )  ;
--------------------------------------------------------
--  DDL for Table CONTYPE
--------------------------------------------------------

  CREATE TABLE "CONTYPE" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"CAPTION" VARCHAR(100 ), 
	"TEMPLATENAME" VARCHAR(100 ), 
	"ISCONTRACT" NUMERIC(15,0) DEFAULT 1, 
	"CONTRACTTYPE" NUMERIC(15,0) DEFAULT 0, 
	"DESCRIPTION" VARCHAR(255 )
   )  ;
--------------------------------------------------------
--  DDL for Table CONTYPEATTACH
--------------------------------------------------------

  CREATE TABLE "CONTYPEATTACH" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"CONTYPE_ID" NUMERIC(15,0), 
	"DEVICE_NAME" VARCHAR(100 ), 
	"ATTACH_NAME" VARCHAR(100 ), 
	"DESCRIPTION" VARCHAR(255 ), 
	"ATTACH_TYPE" NUMERIC(1,0)
   )  ;
--------------------------------------------------------
--  DDL for Table COUNTRY
--------------------------------------------------------

  CREATE TABLE "COUNTRY" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"CAPTION" VARCHAR(100 )
   )  ;
--------------------------------------------------------
--  DDL for Table CRLFILE
--------------------------------------------------------

  CREATE TABLE "CRLFILE" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"CRLFILE" BLOB, 
	"CRLPOINT_ID" NUMERIC(15,0)
   )  
  ;
--------------------------------------------------------
--  DDL for Table CRLPOINT
--------------------------------------------------------

  CREATE TABLE "CRLPOINT" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"URL" VARCHAR(4000 ), 
	"THISUPDATE" DATE, 
	"NEXTUPDATE" DATE, 
	"DESCRIPTION" VARCHAR(4000 ), 
	"FULL_ISSUER" VARCHAR(1000 ), 
	"ISSUER" VARCHAR(1000 ), 
	"ACTUAL" NUMERIC(1,0) DEFAULT 1
   )  ;
--------------------------------------------------------
--  DDL for Table CSGOODS
--------------------------------------------------------

  CREATE TABLE "CSGOODS" 
   (	"CONSOLID_ID" NUMERIC(15,0), 
	"POS" NUMERIC(15,0), 
	"GROUPCODE" VARCHAR(20 ), 
	"GROUPCAPTION" VARCHAR(500 ), 
	"GOODSCODE" VARCHAR(20 ), 
	"GOODSCAPTION" VARCHAR(512 ), 
	"PRICE" NUMERIC(15,2) DEFAULT 0, 
	"OKDP_CODE" VARCHAR(20 ), 
	"OKPD_CODE" VARCHAR(20 ), 
	"OKPD_NAME" VARCHAR(1000 ), 
	"OKPD_ID" NUMERIC(15,0), 
	"UNITNAME" VARCHAR(50 )
   )  ;
--------------------------------------------------------
--  DDL for Table CSGOODSPROP
--------------------------------------------------------

  CREATE TABLE "CSGOODSPROP" 
   (	"CONSOLID_ID" NUMERIC(15,0), 
	"GOODSPOS" NUMERIC(15,0), 
	"SEQORDER" NUMERIC(15,0), 
	"PROPTYPE_ID" NUMERIC(15,0), 
	"CAPTION" VARCHAR(512 ), 
	"PROPVALUE" VARCHAR(1500 )
   )  ;
--------------------------------------------------------
--  DDL for Table CSRECIPIENT
--------------------------------------------------------

  CREATE TABLE "CSRECIPIENT" 
   (	"CONSOLID_ID" NUMERIC(15,0), 
	"ORG_ID" NUMERIC(15,0)
   )  ;
--------------------------------------------------------
--  DDL for Table CURHISTORY
--------------------------------------------------------

  CREATE TABLE "CURHISTORY" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"BUDGET_ID" NUMERIC(15,0), 
	"CURRENCY_ID" NUMERIC(15,0), 
	"DT" DATE, 
	"RATE" NUMERIC(10,4), 
	"DIVISOR" NUMERIC(10,0)
   )  ;
--------------------------------------------------------
--  DDL for Table CURRENCY
--------------------------------------------------------

  CREATE TABLE "CURRENCY" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"CODE" VARCHAR(3 ), 
	"CAPTION" VARCHAR(100 )
   )  ;
--------------------------------------------------------
--  DDL for Table DATAOBJECTCHANGELOG
--------------------------------------------------------

  CREATE TABLE "DATAOBJECTCHANGELOG" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(18,0), 
	"CHANGE_TIME" DATE, 
	"USER_NAME" VARCHAR(255 ), 
	"USER_REALNAME" VARCHAR(255 ), 
	"UK" NUMERIC(1,0), 
	"OBJ_NAME" VARCHAR(255 ), 
	"OBJ_ID" NUMERIC(15,0), 
	"OBJ_VERSION" NUMERIC(15,0), 
	"REMARK" VARCHAR(255 ), 
	"DATA" BLOB SUB_TYPE TEXT
   )  
  ;
--------------------------------------------------------
--  DDL for Table DATASOURCE
--------------------------------------------------------

  CREATE TABLE "DATASOURCE" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"NAME" VARCHAR(128 ), 
	"CAPTION" VARCHAR(128 ), 
	"JAVACLASSNAME" VARCHAR(255 ), 
	"DECLARATION" BLOB SUB_TYPE TEXT
   )  
  ;
--------------------------------------------------------
--  DDL for Table DAYVERSION
--------------------------------------------------------

  CREATE TABLE "DAYVERSION" 
   (	"DAY_DATE" DATE, 
	"DAY_VERSION" NUMERIC(15,0)
   )  ;
--------------------------------------------------------
--  DDL for Table DBCONNECT
--------------------------------------------------------

  CREATE TABLE "DBCONNECT" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"NAME" VARCHAR(250 ), 
	"URL" VARCHAR(250 ), 
	"USERNAME" VARCHAR(50 ), 
	"PSWD" VARCHAR(30 ), 
	"SYSUSERNAME" VARCHAR(50 ), 
	"SYSPASSWORD" VARCHAR(30 ), 
	"STATUS" NUMERIC(15,0) DEFAULT 6, 
	"DBCONNECT_TYPE" NUMERIC(15,0) DEFAULT 1, 
	"STATUS_DATE" DATE
   )  ;
--------------------------------------------------------
--  DDL for Table DBCONSTRAINT
--------------------------------------------------------

  CREATE TABLE "DBCONSTRAINT" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"NAME" VARCHAR(50 ), 
	"DESCRIPTION" VARCHAR(255 ), 
	"SUBSYSTEM" NUMERIC(15,0) DEFAULT 0
   )  ;
--------------------------------------------------------
--  DDL for Table DBUPDATE
--------------------------------------------------------

  CREATE TABLE "DBUPDATE" 
   (	"ID" NUMERIC(15,0), 
	"AUTHOR" VARCHAR(50 ), 
	"UPDATE_DATE" DATE, 
	"DESCRIPTION" VARCHAR(255 ), 
	"VERSIONS" BLOB 
   )  ;
--------------------------------------------------------
--  DDL for Table DECREASON
--------------------------------------------------------

  CREATE TABLE "DECREASON" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"BUDGET_ID" NUMERIC(15,0), 
	"DESCRIPTION" VARCHAR(255 ), 
	"DOCUMENTCLASS_ID" NUMERIC(15,0)
   )  ;
--------------------------------------------------------
--  DDL for Table DELIVERYBASIS
--------------------------------------------------------

  CREATE TABLE "DELIVERYBASIS" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"SYSTEM_FLAG" NUMERIC(1,0) DEFAULT 0, 
	"CODE" VARCHAR(50 ), 
	"CAPTION" VARCHAR(255 )
   )  ;
--------------------------------------------------------
--  DDL for Table DESCGROUP
--------------------------------------------------------

  CREATE TABLE "DESCGROUP" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"CAPTION" VARCHAR(100 )
   )  ;
--------------------------------------------------------
--  DDL for Table DESCRIPTION
--------------------------------------------------------

  CREATE TABLE "DESCRIPTION" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"BUDGET_ID" NUMERIC(15,0), 
	"DESCGROUP_ID" NUMERIC(15,0), 
	"DESCRIPTION" VARCHAR(2000 )
   )  ;
--------------------------------------------------------
--  DDL for Table DESCRIPTIONCACHE
--------------------------------------------------------

  CREATE TABLE "DESCRIPTIONCACHE" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"DESCRIPTION" VARCHAR(4000 )
   )  ;
--------------------------------------------------------
--  DDL for Table DEVIATIONFACTFOUNDATION
--------------------------------------------------------

  CREATE TABLE "DEVIATIONFACTFOUNDATION" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"CODE" VARCHAR(20 ), 
	"NAME" VARCHAR(500 ), 
	"ACTUAL" NUMERIC(1,0) DEFAULT 1, 
	"BUDGETTYPE" NUMERIC(1,0) DEFAULT 0
   )  ;
--------------------------------------------------------
--  DDL for Table DIGEST
--------------------------------------------------------

  CREATE TABLE "DIGEST" 
   (	"ID" NUMERIC(18,0), 
	"VERSION" NUMERIC(15,0), 
	"DOCUMENT_ID" NUMERIC(15,0), 
	"FGROUP_ID" NUMERIC(18,0), 
	"TRANSFORMVERSION" VARCHAR(32 ), 
	"DIGESTDATA" BLOB SUB_TYPE TEXT, 
	"ISACTIVE" NUMERIC(1,0) DEFAULT 0, 
	"DOCCLENANERNOTIFY" NUMERIC(15,0)
   )  
  ;
--------------------------------------------------------
--  DDL for Table DIGESTSIGN
--------------------------------------------------------

  CREATE TABLE "DIGESTSIGN" 
   (	"ID" NUMERIC(18,0), 
	"VERSION" NUMERIC(15,0), 
	"DIGEST_ID" NUMERIC(18,0), 
	"SYSUSER_ID" NUMERIC(15,0), 
	"SIGNTIME" DATE, 
	"ISVALID" NUMERIC(1,0), 
	"CHECKTIME" DATE, 
	"REMARK" BLOB SUB_TYPE TEXT, 
	"SIGN" BLOB SUB_TYPE TEXT, 
	"CERTSERIALNUMBER" VARCHAR(64 ), 
	"CERTISSUERSERIALNUMBER" VARCHAR(64 ), 
	"USERROLE_ID" NUMERIC(15,0), 
	"DISPSTATUS_ID" NUMERIC(15,0), 
	"SIGNTYPE" NUMERIC(1,0) DEFAULT 0, 
	"ALGORITHM" VARCHAR(30 ), 
	"SIGN_SEQ_CTRL" NUMERIC(1,0) DEFAULT 0, 
	"DOCATTACHEX_ID" NUMERIC(18,0), 
	"SIGNVERSION" NUMERIC(15,0), 
	"ISIMPORTED" NUMERIC(1,0) DEFAULT 0, 
	"IMPORTUSER_ID" NUMERIC(15,0)
   )  
  ;
--------------------------------------------------------
--  DDL for Table DISPSTATUS
--------------------------------------------------------

  CREATE TABLE "DISPSTATUS" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"CAPTION" VARCHAR(100 ), 
	"SUBSYSTEM" NUMERIC(15,0) DEFAULT 0
   )  ;
--------------------------------------------------------
--  DDL for Table DOCACTION
--------------------------------------------------------

  CREATE TABLE "DOCACTION" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"DOCUMENTCLASS_ID" NUMERIC(15,0), 
	"DISPSTATUS_ID" NUMERIC(15,0), 
	"NAME" VARCHAR(50 ), 
	"SHOW_ORDER" NUMERIC(15,0) DEFAULT 0, 
	"SHORTCUT_KEY" VARCHAR(30 ), 
	"CAPTION" VARCHAR(100 ), 
	"CONFIRM_TEXT" VARCHAR(255 ), 
	"CLIENTOBJECT_ID" NUMERIC(15,0), 
	"OBJECT_PARAMS" VARCHAR(300 ), 
	"DOCEVENT_NAME" VARCHAR(50 ), 
	"CLIENTOBJECT_NAME" VARCHAR(255 ), 
	"SHOW_MODE" NUMERIC(15,0) DEFAULT 0, 
	"USER_TYPE" NUMERIC(1,0) DEFAULT 0
   )  ;
--------------------------------------------------------
--  DDL for Table DOCATTACH
--------------------------------------------------------

  CREATE TABLE "DOCATTACH" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"DOCUMENT_ID" NUMERIC(15,0), 
	"ATTACH_NAME" VARCHAR(100 ), 
	"ATTACH_DATA" BLOB, 
	"AUTHOR" NUMERIC(15,0), 
	"ACTION_DATE" DATE
   )  
  ;
--------------------------------------------------------
--  DDL for Table DOCATTACHEX
--------------------------------------------------------

  CREATE TABLE "DOCATTACHEX" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"DOCUMENT_ID" NUMERIC(15,0), 
	"ATTACH_NAME" VARCHAR(256 ), 
	"DEVICE_NAME" VARCHAR(100 ), 
	"DESCRIPTION" VARCHAR(255 ), 
	"GUID" VARCHAR(100 ), 
	"CONVERTER_ID" NUMERIC(15,0), 
	"AUTHOR" NUMERIC(15,0), 
	"ACTION_DATE" DATE
   )  ;
--------------------------------------------------------
--  DDL for Table DOCATTACH_LINK
--------------------------------------------------------

  CREATE TABLE "DOCATTACH_LINK" 
   (	"DOCATTACH_ID" NUMERIC(18,0), 
	"STORAGE_NAME" VARCHAR(100 ), 
	"DEVICE_NAME" VARCHAR(100 ), 
	"REAL_FILENAME" VARCHAR(255 )
   )  ;
--------------------------------------------------------
--  DDL for Table DOCCATEGORY
--------------------------------------------------------

  CREATE TABLE "DOCCATEGORY" 
   (	"ID" NUMERIC(18,0), 
	"VERSION" NUMERIC(18,0), 
	"NAME" VARCHAR(100 ), 
	"CODE" VARCHAR(15 ), 
	"SYSTEM_FLAG" NUMERIC(1,0) DEFAULT 0
   )  ;
--------------------------------------------------------
--  DDL for Table DOCCLASS_DISPSTATUS
--------------------------------------------------------

  CREATE TABLE "DOCCLASS_DISPSTATUS" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"DOCUMENTCLASS_ID" NUMERIC(15,0), 
	"DISPSTATUS_ID" NUMERIC(15,0), 
	"PARDISPSTATUS_ID" NUMERIC(15,0), 
	"PARALLEL" NUMERIC(1,0), 
	"CONTROL_TYPE" NUMERIC(1,0) DEFAULT 0, 
	"REMARK" VARCHAR(2000 )
   )  ;
--------------------------------------------------------
--  DDL for Table DOCCOMMENT
--------------------------------------------------------

  CREATE TABLE "DOCCOMMENT" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"DOCUMENT_ID" NUMERIC(15,0), 
	"BODY" BLOB SUB_TYPE TEXT, 
	"DATE_CREATE" DATE, 
	"REALNAME" VARCHAR(100 ), 
	"USERNAME" VARCHAR(30 ), 
	"USER_ID" NUMERIC(15,0), 
	"UPDATE_DATE" DATE
   )  
  ;
--------------------------------------------------------
--  DDL for Table DOCCUSTOMFIELDS
--------------------------------------------------------

  CREATE TABLE "DOCCUSTOMFIELDS" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"DOCUMENTCLASS_ID" NUMERIC(15,0), 
	"NAME" VARCHAR(50 ), 
	"CAPTION" VARCHAR(100 ), 
	"FIELDTYPE" NUMERIC(1,0), 
	"REQUIRED" NUMERIC(1,0) DEFAULT 0, 
	"FIELDPOS" NUMERIC(15,0), 
	"METADATA" BLOB SUB_TYPE TEXT
   )  
  ;
--------------------------------------------------------
--  DDL for Table DOCCUSTOMFIELDVALUES
--------------------------------------------------------

  CREATE TABLE "DOCCUSTOMFIELDVALUES" 
   (	"DOCUMENT_ID" NUMERIC(15,0), 
	"CUSTFIELD_ID" NUMERIC(15,0), 
	"FIELD_VALUE" VARCHAR(255 ), 
	"FIELD_DATA" BLOB SUB_TYPE TEXT
   )  
  ;
--------------------------------------------------------
--  DDL for Table DOCDIGESTREQUISITES
--------------------------------------------------------

  CREATE TABLE "DOCDIGESTREQUISITES" 
   (	"DOCDIGESTRULE_ID" NUMERIC(18,0), 
	"RULEREQUISITE_ID" NUMERIC(18,0), 
	"ITEM_CONDITION" NUMERIC(1,0) DEFAULT 0, 
	"ITEM_VALUE" VARCHAR(255 )
   )  ;
--------------------------------------------------------
--  DDL for Table DOCDIGESTROLES
--------------------------------------------------------

  CREATE TABLE "DOCDIGESTROLES" 
   (	"DOCDIGESTRULE_ID" NUMERIC(18,0), 
	"USERROLE_ID" NUMERIC(18,0), 
	"SIGN_ORDER" NUMERIC(15,0) DEFAULT 0, 
	"DOCACTION_ID" NUMERIC(15,0)
   )  ;
--------------------------------------------------------
--  DDL for Table DOCDIGESTRULE
--------------------------------------------------------

  CREATE TABLE "DOCDIGESTRULE" 
   (	"ID" NUMERIC(18,0), 
	"VERSION" NUMERIC(15,0), 
	"DISPSTATUS_ID" NUMERIC(15,0), 
	"DESCRIPTION" VARCHAR(255 ), 
	"OIDREF_ID" NUMERIC(18,0), 
	"ROLE_SEQUENCE_CONTROL" NUMERIC(1,0) DEFAULT 0, 
	"FGROUPHEADER_ID" NUMERIC(18,0), 
	"PARDISPSTATUS_ID" NUMERIC(15,0), 
	"RULESCRIPT_ID" NUMERIC(15,0)
   )  ;
--------------------------------------------------------
--  DDL for Table DOCEVENT
--------------------------------------------------------

  CREATE TABLE "DOCEVENT" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"DOCUMENTCLASS_ID" NUMERIC(15,0), 
	"DISPSTATUS_ID" NUMERIC(15,0), 
	"NAME" VARCHAR(50 ), 
	"SHOW_ORDER" NUMERIC(15,0) DEFAULT 0, 
	"EXTERNAL_FLAG" NUMERIC(1,0) DEFAULT 0, 
	"CAPTION" VARCHAR(100 ), 
	"PROCTREE_ID" NUMERIC(15,0), 
	"USERPROCTREE_ID" NUMERIC(15,0), 
	"AUTO_RPL" NUMERIC(1,0) DEFAULT 1, 
	"ISOFFLINE" NUMERIC(1,0) DEFAULT 1, 
	"USER_TYPE" NUMERIC(1,0) DEFAULT 0
   )  ;
--------------------------------------------------------
--  DDL for Table DOCEVERRLOG
--------------------------------------------------------

  CREATE TABLE "DOCEVERRLOG" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"SYSUSER_ID" NUMERIC(15,0), 
	"DOCUMENT_ID" NUMERIC(15,0), 
	"DISPSTATUS_ID" NUMERIC(15,0), 
	"EVENT_BEGIN" DATE, 
	"EVENT_END" DATE, 
	"EVENT_MSG" BLOB
   )  
  ;
--------------------------------------------------------
--  DDL for Table DOCEXCHANGESCHEME
--------------------------------------------------------

  CREATE TABLE "DOCEXCHANGESCHEME" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"CAPTION" VARCHAR(100 )
   )  ;
--------------------------------------------------------
--  DDL for Table DOCFLAG
--------------------------------------------------------

  CREATE TABLE "DOCFLAG" 
   (	"DOCUMENT_ID" NUMERIC(15,0), 
	"DOCFLAGTYPE_ID" NUMERIC(15,0)
   )  ;
--------------------------------------------------------
--  DDL for Table DOCFLAGCATEGORY
--------------------------------------------------------

  CREATE TABLE "DOCFLAGCATEGORY" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"CAPTION" VARCHAR(255 )
   )  ;
--------------------------------------------------------
--  DDL for Table DOCFLAGTYPE
--------------------------------------------------------

  CREATE TABLE "DOCFLAGTYPE" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"DOCUMENTCLASS_ID" NUMERIC(15,0), 
	"CAPTION" VARCHAR(255 ), 
	"CATEGORY_ID" NUMERIC(15,0), 
	"READONLY" NUMERIC(1,0) DEFAULT 0, 
	"RADIO" NUMERIC(1,0) DEFAULT 0, 
	"VISIBLE" NUMERIC(1,0) DEFAULT 1
   )  ;
--------------------------------------------------------
--  DDL for Table DOCGROUP
--------------------------------------------------------

  CREATE TABLE "DOCGROUP" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"NAME" VARCHAR(100 ), 
	"PARENT_ID" NUMERIC(15,0), 
	"DOCUMENTCLASS_ID" NUMERIC(15,0), 
	"DESCRIPTION" VARCHAR(255 )
   )  ;
--------------------------------------------------------
--  DDL for Table DOCJOURNAL
--------------------------------------------------------

  CREATE TABLE "DOCJOURNAL" 
   (	"ID" NUMERIC(15,0), 
	"DOCUMENT_ID" NUMERIC(15,0), 
	"DISPSTATUS_ID" NUMERIC(15,0), 
	"OLD_DISPSTATUS_ID" NUMERIC(15,0), 
	"ACTION_NAME" VARCHAR(64 ), 
	"ACTION_DATA" BLOB SUB_TYPE TEXT, 
	"REMARK" BLOB SUB_TYPE TEXT, 
	"ATTACH_NAME" VARCHAR(270 ), 
	"TASKJOURNAL_ID" NUMERIC(15,0), 
	"WORK_DATE" DATE, 
	"PARDISPSTATUS_ID" NUMERIC(15,0), 
	"OLD_PARDISPSTATUS_ID" NUMERIC(15,0)
   )  
  ;
--------------------------------------------------------
--  DDL for Table DOCREQ
--------------------------------------------------------

  CREATE TABLE "DOCREQ" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"VENDOR_TYPE" NUMERIC(2,0) DEFAULT 0, 
	"ISREQUIRED" NUMERIC(1,0) DEFAULT 1, 
	"PURCHASEMODE_ID" NUMERIC(15,0) DEFAULT 1, 
	"REQUIREMENTTYPE_ID" NUMERIC(15,0) DEFAULT 1, 
	"NAME" VARCHAR(1024 ), 
	"DESCRIPTION" VARCHAR(4000 )
   )  ;
--------------------------------------------------------
--  DDL for Table DOCRETENTION
--------------------------------------------------------

  CREATE TABLE "DOCRETENTION" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"NAME" VARCHAR(200 ), 
	"CONDITION" BLOB SUB_TYPE TEXT, 
	"MSG" BLOB SUB_TYPE TEXT, 
	"FONT" VARCHAR(200 ), 
	"DOCACTION_ID" NUMERIC(15,0), 
	"DOCSTATUS_ID" NUMERIC(15,0), 
	"ISACTIVE" NUMERIC(1,0) DEFAULT 0, 
	"SUBSYSTEM" NUMERIC(15,0) DEFAULT 0
   )  
  ;
--------------------------------------------------------
--  DDL for Table DOCRETENTIONSTATITEMS
--------------------------------------------------------

  CREATE TABLE "DOCRETENTIONSTATITEMS" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"DOCUMENT_ID" NUMERIC(15,0), 
	"DOCRETENTION_ID" NUMERIC(15,0), 
	"MSG" BLOB SUB_TYPE TEXT
   )  
  ;
--------------------------------------------------------
--  DDL for Table DOCRETENTIONSTATUS
--------------------------------------------------------

  CREATE TABLE "DOCRETENTIONSTATUS" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"DOCRETENTION_ID" NUMERIC(15,0), 
	"MSG" BLOB SUB_TYPE TEXT
   )  
  ;
--------------------------------------------------------
--  DDL for Table DOCSELECT
--------------------------------------------------------

  CREATE TABLE "DOCSELECT" 
   (	"ID" NUMERIC(15,0), 
	"ORDER_ID" NUMERIC(15,0), 
	"DOCREQPOS" NUMERIC(15,0), 
	"COMPETITORPOS" NUMERIC(15,0), 
	"VAL" NUMERIC(1,0) DEFAULT null, 
	"ISREQUIRED" NUMERIC(1,0) DEFAULT 1, 
	"TYPE" NUMERIC(2,0) DEFAULT 0, 
	"REMARK" VARCHAR(2000 )
   )  ;
--------------------------------------------------------
--  DDL for Table DOCSITELINK
--------------------------------------------------------

  CREATE TABLE "DOCSITELINK" 
   (	"DOCUMENT_ID" NUMERIC(15,0), 
	"SITE_ID" NUMERIC(15,0)
   )  ;
--------------------------------------------------------
--  DDL for Table DOCSTATUS
--------------------------------------------------------

  CREATE TABLE "DOCSTATUS" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"DOCUMENTCLASS_ID" NUMERIC(15,0), 
	"DISPSTATUS_ID" NUMERIC(15,0), 
	"PROCTREE_ID" NUMERIC(15,0), 
	"USERPROCTREE_ID" NUMERIC(15,0), 
	"CAPTION" VARCHAR(100 ), 
	"PARENT_ID" NUMERIC(15,0), 
	"PARALLEL" NUMERIC(1,0) DEFAULT 0, 
	"INITIALL" NUMERIC(1,0) DEFAULT 0, 
	"CONTROL_TYPE" NUMERIC(1,0) DEFAULT 0
   )  ;
--------------------------------------------------------
--  DDL for Table DOCUMENT
--------------------------------------------------------

  CREATE TABLE "DOCUMENT" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"BUDGET_ID" NUMERIC(15,0), 
	"DOCUMENTCLASS_ID" NUMERIC(15,0), 
	"DISPSTATUS_ID" NUMERIC(15,0), 
	"PARDISPSTATUS_ID" NUMERIC(15,0), 
	"OPERTYPE_ID" NUMERIC(15,0) DEFAULT 0, 
	"CREATE_DATE" DATE, 
	"PARENT_ID" NUMERIC(15,0), 
	"NOTIFY_GROUP" NUMERIC(15,0), 
	"INSTANCE_LINK" NUMERIC(15,0), 
	"DOC_NUMBER" VARCHAR(100 ), 
	"DOC_DATE" DATE, 
	"AMOUNT" NUMERIC(15,2) DEFAULT 0, 
	"DESCRIPTION" VARCHAR(2000 ), 
	"REMARK" VARCHAR(255 ), 
	"REG_DATE" DATE, 
	"CARRY_DATE" DATE, 
	"LAST_SYS_DATE" DATE, 
	"LAST_OPER_DATE" DATE, 
	"ATTACH_CNT" NUMERIC(15,0) DEFAULT 0, 
	"AUTHOR_ID" NUMERIC(15,0), 
	"SIGN_CNT" NUMERIC(18,0) DEFAULT 0, 
	"APP_TYPE" NUMERIC(2,0)
   )  ;
--------------------------------------------------------
--  DDL for Table DOCUMENTBLOCKINFO
--------------------------------------------------------

  CREATE TABLE "DOCUMENTBLOCKINFO" 
   (	"DOCUMENT_ID" NUMERIC(15,0), 
	"SYSUSER_ID" NUMERIC(15,0), 
	"BLOCKTIME" DATE
   )  ;
--------------------------------------------------------
--  DDL for Table DOCUMENTCLASS
--------------------------------------------------------

  CREATE TABLE "DOCUMENTCLASS" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"CAPTION" VARCHAR(100 ), 
	"SERVERPROCESSOR_ID" NUMERIC(15,0), 
	"CLIENTMODULE_ID" NUMERIC(15,0), 
	"CLIENTDOCUMENT_ID" NUMERIC(15,0), 
	"DOCPRINTER_ID" NUMERIC(15,0), 
	"PRINTER_ACTION" VARCHAR(50 ), 
	"TEMPLATE_NAME" VARCHAR(100 ), 
	"PARAMS_GUID" VARCHAR(100 ), 
	"PARAMS" BLOB SUB_TYPE TEXT, 
	"CLASSNAME" VARCHAR(255 ), 
	"FUNCAT_NAME" VARCHAR(50 ), 
	"CONTROLCLASSNAME" VARCHAR(255 ), 
	"NUMGENERATOR_ID" NUMERIC(15,0), 
	"PRINTPARAMS" BLOB SUB_TYPE TEXT, 
	"PRINTCLIENTOBJECT_ID" NUMERIC(15,0)
   )  
  ;
--------------------------------------------------------
--  DDL for Table DOCUMENTREPORTS
--------------------------------------------------------

  CREATE TABLE "DOCUMENTREPORTS" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"DOCUMENTCLASS_ID" NUMERIC(15,0), 
	"DISPSTATUS_ID" NUMERIC(15,0), 
	"CAPTION" VARCHAR(255 ), 
	"DOCPRINTER_ID" NUMERIC(15,0), 
	"PRINTER_ACTION" VARCHAR(255 ), 
	"TEMPLATE_NAME" VARCHAR(255 ), 
	"NAME" VARCHAR(150 ), 
	"SUBSYSTEM" NUMERIC(15,0) DEFAULT 0, 
	"BIRT_OUTPUTFORMAT" VARCHAR(10 ), 
	"BIRT_EMITTER" VARCHAR(128 )
   )  ;
--------------------------------------------------------
--  DDL for Table DOCWEBLINK
--------------------------------------------------------

  CREATE TABLE "DOCWEBLINK" 
   (	"DOCUMENT_ID" NUMERIC(15,0), 
	"POS" NUMERIC(15,0), 
	"NAME" VARCHAR(255 ), 
	"WEBLINK" VARCHAR(2000 )
   )  ;
--------------------------------------------------------
--  DDL for Table DOMEN
--------------------------------------------------------

  CREATE TABLE "DOMEN" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"PARENT_ID" NUMERIC(15,0), 
	"CAPTION" VARCHAR(255 )
   )  ;
--------------------------------------------------------
--  DDL for Table EQUALITY
--------------------------------------------------------

  CREATE TABLE "EQUALITY" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"NAME" VARCHAR(300 )
   )  ;
--------------------------------------------------------
--  DDL for Table EQUALITYCODES
--------------------------------------------------------

  CREATE TABLE "EQUALITYCODES" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"EQUALITY_ID" NUMERIC(15,0), 
	"CODE" VARCHAR(7 )
   )  ;
--------------------------------------------------------
--  DDL for Table ESCHECKRULE
--------------------------------------------------------

  CREATE TABLE "ESCHECKRULE" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"DISPSTATUS_ID" NUMERIC(15,0), 
	"ISACTIVE" NUMERIC(1,0) DEFAULT 1, 
	"DESCRIPTION" VARCHAR(255 ), 
	"FGROUPHEADER_ID" NUMERIC(18,0), 
	"PARDISPSTATUS_ID" NUMERIC(15,0), 
	"RULESCRIPT_ID" NUMERIC(15,0)
   )  ;
--------------------------------------------------------
--  DDL for Table ESCHECKRULEREQUISITES
--------------------------------------------------------

  CREATE TABLE "ESCHECKRULEREQUISITES" 
   (	"ESCHECKRULE_ID" NUMERIC(15,0), 
	"RULEREQUISITE_ID" NUMERIC(18,0), 
	"ITEM_CONDITION" NUMERIC(1,0) DEFAULT 0, 
	"ITEM_VALUE" VARCHAR(255 )
   )  ;
--------------------------------------------------------
--  DDL for Table ESCRROLE
--------------------------------------------------------

  CREATE TABLE "ESCRROLE" 
   (	"ESCHECKRULE_ID" NUMERIC(15,0), 
	"USERROLE_ID" NUMERIC(15,0)
   )  ;
--------------------------------------------------------
--  DDL for Table ESTIMATE
--------------------------------------------------------

  CREATE TABLE "ESTIMATE" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"BUDGET_ID" NUMERIC(15,0), 
	"ORG_ID" NUMERIC(15,0), 
	"FOREIGNKEY" VARCHAR(50 ), 
	"CAPTION" VARCHAR(255 ), 
	"FINYEAR" NUMERIC(4,0)
   )  ;
--------------------------------------------------------
--  DDL for Table ETP
--------------------------------------------------------

  CREATE TABLE "ETP" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"NAME" VARCHAR(100 ), 
	"ADDRESS" VARCHAR(255 ), 
	"OOSETPCODE" VARCHAR(20 ), 
	"MSGSITE_ID" NUMERIC(15,0), 
	"CLASSNAME" VARCHAR(255 ), 
	"LINK_ADDRESS" VARCHAR(255 )
   )  ;
--------------------------------------------------------
--  DDL for Table ETPATTACH
--------------------------------------------------------

  CREATE TABLE "ETPATTACH" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"ETP_ID" NUMERIC(15,0), 
	"DOCATTACHEX_ID" NUMERIC(15,0), 
	"ETPKEY" VARCHAR(100 ), 
	"FILE_CRC" VARCHAR(100 ), 
	"URL" VARCHAR(1024 )
   )  ;
--------------------------------------------------------
--  DDL for Table ETPTYPE
--------------------------------------------------------

  CREATE TABLE "ETPTYPE" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"CODE" VARCHAR(20 ), 
	"NAME" VARCHAR(100 ), 
	"ADDRESS" VARCHAR(255 )
   )  ;
--------------------------------------------------------
--  DDL for Table EXCHANGECLASSES
--------------------------------------------------------

  CREATE TABLE "EXCHANGECLASSES" 
   (	"DOCEXCHANGESCHEME_ID" NUMERIC(15,0), 
	"DOCUMENTCLASS_ID" NUMERIC(15,0)
   )  ;
--------------------------------------------------------
--  DDL for Table FACTDOC
--------------------------------------------------------

  CREATE TABLE "FACTDOC" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"DOCUMENT_ID" NUMERIC(15,0), 
	"DOCUMENTCLASS_ID" NUMERIC(15,0), 
	"DISPSTATUS_ID" NUMERIC(15,0), 
	"OPERTYPE_ID" NUMERIC(15,0) DEFAULT 0, 
	"BUDGET_ID" NUMERIC(15,0), 
	"DOC_NUMBER" VARCHAR(100 ), 
	"DOC_DATE" DATE, 
	"AMOUNT" NUMERIC(15,2) DEFAULT 0, 
	"DESCRIPTION" VARCHAR(2000 ), 
	"REMARK" VARCHAR(255 ), 
	"FOREIGN_KEY" VARCHAR(50 ), 
	"TYPENAME" VARCHAR(50 ), 
	"RECIPIENT_ID" NUMERIC(15,0), 
	"RECIPIENTNAME" VARCHAR(2000 ), 
	"VENDOR_ID" NUMERIC(15,0), 
	"VENDORTAXCODE" VARCHAR(20 ), 
	"VENDORKPP" VARCHAR(20 ), 
	"VENDORNAME" VARCHAR(2000 ), 
	"VENDORCOUNTRY_ID" NUMERIC(15,0) DEFAULT 643, 
	"VENDORTERRITORYCODE" VARCHAR(20 ), 
	"VENDORADDRESS" VARCHAR(300 ), 
	"VENDORPOSTINDEX" VARCHAR(10 ), 
	"VENDORPHONE" VARCHAR(100 ), 
	"VENDORFAX" VARCHAR(100 ), 
	"VENDOREMAIL" VARCHAR(256 ), 
	"COUNTRY_ID" NUMERIC(15,0), 
	"TERRITORYCODE" VARCHAR(20 ), 
	"SUPPLYADDRESS" VARCHAR(300 ), 
	"ISGROUPSMOREONE" NUMERIC(1,0), 
	"FACTTYPE" NUMERIC(1,0) DEFAULT 0, 
	"EXPORT_FLAG" NUMERIC(1,0) DEFAULT 0, 
	"EXPORT_PARENT_ID" NUMERIC(15,0), 
	"PAYEDAMOUNT" NUMERIC(15,2) DEFAULT 0, 
	"ACTUAL_YEAR" NUMERIC(4,0)
   )  ;
--------------------------------------------------------
--  DDL for Table FACTDOCTYPE
--------------------------------------------------------

  CREATE TABLE "FACTDOCTYPE" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"DOCTYPE" NUMERIC(1,0), 
	"NAME" VARCHAR(50 )
   )  ;
--------------------------------------------------------
--  DDL for Table FCTGOODS
--------------------------------------------------------

  CREATE TABLE "FCTGOODS" 
   (	"FACT_ID" NUMERIC(15,0), 
	"POS" NUMERIC(15,0), 
	"GROUPCODE" VARCHAR(20 ), 
	"OKDP_CODE" VARCHAR(20 ), 
	"GROUPCAPTION" VARCHAR(500 ), 
	"GOODSCODE" VARCHAR(20 ), 
	"GOODSCAPTION" VARCHAR(512 ), 
	"QTY" NUMERIC(15,4) DEFAULT 0, 
	"PRICE" NUMERIC(15,2) DEFAULT 0, 
	"AMOUNT" NUMERIC(15,2) DEFAULT 0, 
	"STATUS" NUMERIC(1,0) DEFAULT 0, 
	"OKPD_CODE" VARCHAR(20 ), 
	"USEAMOUNT" NUMERIC(1,0) DEFAULT 0, 
	"OKPD_NAME" VARCHAR(1000 ), 
	"OKPD_ID" NUMERIC(15,0), 
	"UNITNAME" VARCHAR(50 )
   )  ;
--------------------------------------------------------
--  DDL for Table FCTGOODSPROP
--------------------------------------------------------

  CREATE TABLE "FCTGOODSPROP" 
   (	"FACT_ID" NUMERIC(15,0), 
	"GOODSPOS" NUMERIC(15,0), 
	"SEQORDER" NUMERIC(15,0), 
	"PROPTYPE_ID" NUMERIC(15,0), 
	"CAPTION" VARCHAR(512 ), 
	"PROPVALUE" VARCHAR(1500 )
   )  ;
--------------------------------------------------------
--  DDL for Table FETCHMODE
--------------------------------------------------------

  CREATE TABLE "FETCHMODE" 
   (	"ID" NUMERIC(18,0), 
	"VERSION" NUMERIC(18,0), 
	"DOCUMENTCLASS_ID" NUMERIC(18,0), 
	"PACKET_SIZE" NUMERIC(18,0), 
	"MAX_SIZE" NUMERIC(18,0), 
	"DESCRIPTION" VARCHAR(255 )
   )  ;
--------------------------------------------------------
--  DDL for Table FGROUP
--------------------------------------------------------

  CREATE TABLE "FGROUP" 
   (	"ID" NUMERIC(18,0), 
	"VERSION" NUMERIC(15,0), 
	"OBJECT_NAME" VARCHAR(255 ), 
	"BODY" BLOB SUB_TYPE TEXT, 
	"ALGORITHM" VARCHAR(30 ), 
	"CLASSNAME" VARCHAR(255 ), 
	"FGROUPHEADER_ID" NUMERIC(18,0), 
	"FG_VERSION" NUMERIC(18,0), 
	"FG_DATE" TIMESTAMP , 
	"ACTUAL" NUMERIC(1,0) DEFAULT 0
   )  
  ;
--------------------------------------------------------
--  DDL for Table FGROUPATTACH
--------------------------------------------------------

  CREATE TABLE "FGROUPATTACH" 
   (	"ID" NUMERIC(18,0), 
	"VERSION" NUMERIC(15,0), 
	"DOCATTACH_ID" NUMERIC(15,0), 
	"FGROUP_ID" NUMERIC(15,0), 
	"DATA" BLOB SUB_TYPE TEXT
   )  
  ;
--------------------------------------------------------
--  DDL for Table FGROUPHEADER
--------------------------------------------------------

  CREATE TABLE "FGROUPHEADER" 
   (	"ID" NUMERIC(18,0), 
	"VERSION" NUMERIC(15,0), 
	"NAME" VARCHAR(100 ), 
	"CAPTION" VARCHAR(255 ), 
	"DOCUMENTCLASS_ID" NUMERIC(18,0), 
	"GROUP_TYPE" NUMERIC(1,0) DEFAULT 0, 
	"DESCRIPTION" VARCHAR(255 ), 
	"SUBSYSTEM" NUMERIC(18,0) DEFAULT 0
   )  ;
--------------------------------------------------------
--  DDL for Table FILEFOLDER
--------------------------------------------------------

  CREATE TABLE "FILEFOLDER" 
   (	"FILE_NAME" VARCHAR(255 ), 
	"FOLDER" VARCHAR(32 ), 
	"DEVICE_NAME" VARCHAR(25 ) DEFAULT 'defaultDevice', 
	"STORAGE_NAME" VARCHAR(25 ) DEFAULT 'UNKNOWN'
   )  ;
--------------------------------------------------------
--  DDL for Table FINSRC
--------------------------------------------------------

  CREATE TABLE "FINSRC" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"NAME" VARCHAR(512 ), 
	"DESCRIPTION" VARCHAR(255 ), 
	"CODE" VARCHAR(16 ), 
	"FINYEAR" NUMERIC(4,0), 
	"ISCONINFONOTBUDGET" NUMERIC(1,0) DEFAULT 0, 
	"ISBUDGET" NUMERIC(1,0) DEFAULT 0, 
	"OOSKEY" VARCHAR(100 ), 
	"ACTUAL" NUMERIC(1,0) DEFAULT 1, 
	"OKTMO" VARCHAR(20 )
   )  ;
--------------------------------------------------------
--  DDL for Table FINSRCSATISFY
--------------------------------------------------------

  CREATE TABLE "FINSRCSATISFY" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"FINYEAR" NUMERIC(4,0), 
	"FINSRCSELECTEDYEARID" NUMERIC(15,0), 
	"FINSRCNEXTYEARID" NUMERIC(15,0)
   )  ;
--------------------------------------------------------
--  DDL for Table FORMATCONVERTER
--------------------------------------------------------

  CREATE TABLE "FORMATCONVERTER" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"NAME" VARCHAR(50 ), 
	"CLASSNAME" VARCHAR(100 ), 
	"CAPTION" VARCHAR(100 )
   )  ;
--------------------------------------------------------
--  DDL for Table FUNCAT
--------------------------------------------------------

  CREATE TABLE "FUNCAT" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"NAME" VARCHAR(50 ), 
	"CAPTION" VARCHAR(100 )
   )  ;
--------------------------------------------------------
--  DDL for Table FUNCDOCUMENT
--------------------------------------------------------

  CREATE TABLE "FUNCDOCUMENT" 
   (	"FUNUNIT_ID" NUMERIC(15,0), 
	"DOCUMENTCLASS_ID" NUMERIC(15,0)
   )  ;
--------------------------------------------------------
--  DDL for Table FUNCMODULE
--------------------------------------------------------

  CREATE TABLE "FUNCMODULE" 
   (	"FUNUNIT_ID" NUMERIC(15,0), 
	"MODULENAME" VARCHAR(20 )
   )  ;
--------------------------------------------------------
--  DDL for Table FUNCOBJECT
--------------------------------------------------------

  CREATE TABLE "FUNCOBJECT" 
   (	"FUNUNIT_ID" NUMERIC(15,0), 
	"CLIENTOBJECT_NAME" VARCHAR(50 )
   )  ;
--------------------------------------------------------
--  DDL for Table FUNCPROCESSOR
--------------------------------------------------------

  CREATE TABLE "FUNCPROCESSOR" 
   (	"FUNUNIT_ID" NUMERIC(15,0), 
	"SERVERPROCESSOR_NAME" VARCHAR(50 ), 
	"ACCESS_MODE" NUMERIC(15,0) DEFAULT 3
   )  ;
--------------------------------------------------------
--  DDL for Table FUNCPROVIDER
--------------------------------------------------------

  CREATE TABLE "FUNCPROVIDER" 
   (	"FUNUNIT_ID" NUMERIC(15,0), 
	"SERVERPROVIDER_NAME" VARCHAR(50 )
   )  ;
--------------------------------------------------------
--  DDL for Table FUNCREFERENCE
--------------------------------------------------------

  CREATE TABLE "FUNCREFERENCE" 
   (	"FUNUNIT_ID" NUMERIC(15,0), 
	"REF_NAME" VARCHAR(50 ), 
	"ACCESS_MODE" NUMERIC(15,0) DEFAULT 3
   )  ;
--------------------------------------------------------
--  DDL for Table FUNCUNIT
--------------------------------------------------------

  CREATE TABLE "FUNCUNIT" 
   (	"FUNUNIT_ID" NUMERIC(15,0), 
	"FUNUNIT_NAME" VARCHAR(50 ), 
	"ACCESS_MODE" NUMERIC(15,0) DEFAULT 3
   )  ;
--------------------------------------------------------
--  DDL for Table FUNUNIT
--------------------------------------------------------

  CREATE TABLE "FUNUNIT" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"NAME" VARCHAR(50 ), 
	"FUNCAT_ID" NUMERIC(15,0), 
	"CAPTION" VARCHAR(100 ), 
	"SUBTYPE" NUMERIC(18,0) DEFAULT 0, 
	"APP_ID" NUMERIC(15,0) DEFAULT 0
   )  ;
--------------------------------------------------------
--  DDL for Table GCREGISTER
--------------------------------------------------------

  CREATE TABLE "GCREGISTER" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"BUDGET_ID" NUMERIC(15,0), 
	"ATTACH_NAME" VARCHAR(100 ), 
	"ATTACH_DATA" BLOB, 
	"CAPTION" VARCHAR(255 )
   )  
  ;
--------------------------------------------------------
--  DDL for Table GOODS
--------------------------------------------------------

  CREATE TABLE "GOODS" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"CODE" VARCHAR(20 ), 
	"GROUP_ID" NUMERIC(15,0), 
	"CAPTION" VARCHAR(512 ), 
	"DESCRIPTION" VARCHAR(500 ), 
	"OKP_CODE" VARCHAR(16 ), 
	"IS_ACTUAL" NUMERIC(1,0) DEFAULT 1, 
	"UNITNAME" VARCHAR(50 )
   )  ;
--------------------------------------------------------
--  DDL for Table GOODSBAN
--------------------------------------------------------

  CREATE TABLE "GOODSBAN" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"NAME_NPA" VARCHAR(1000 ), 
	"BAN_FROMDATE" DATE, 
	"BAN_TODATE" DATE, 
	"BAN_DESCRIPTION" VARCHAR(1000 ), 
	"IS223FZ" NUMERIC(1,0) DEFAULT 0, 
	"CONTROL_MODE" NUMERIC(1,0)
   )  ;
--------------------------------------------------------
--  DDL for Table GOODSBANGOODSOKPD
--------------------------------------------------------

  CREATE TABLE "GOODSBANGOODSOKPD" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"GOODSOKPD_ID" NUMERIC(15,0), 
	"GOODSBAN_ID" NUMERIC(15,0)
   )  ;
--------------------------------------------------------
--  DDL for Table GOODSBANPURCHASEMODE
--------------------------------------------------------

  CREATE TABLE "GOODSBANPURCHASEMODE" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"PURCHASEMODE_ID" NUMERIC(15,0), 
	"GOODSBAN_ID" NUMERIC(15,0)
   )  ;
--------------------------------------------------------
--  DDL for Table GOODSBRANCH
--------------------------------------------------------

  CREATE TABLE "GOODSBRANCH" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"NAME" VARCHAR(512 ), 
	"BRANCHTYPE" NUMERIC(1,0) DEFAULT 0
   )  ;
--------------------------------------------------------
--  DDL for Table GOODSGROUP
--------------------------------------------------------

  CREATE TABLE "GOODSGROUP" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"CODE" VARCHAR(20 ), 
	"PARENT_ID" NUMERIC(15,0), 
	"CAPTION" VARCHAR(500 ), 
	"DESCRIPTION" VARCHAR(255 ), 
	"ISUNITFILTERED" NUMERIC(1,0) DEFAULT 0, 
	"IS_ACTUAL" NUMERIC(1,0) DEFAULT 1, 
	"HAS_PREFERENCE" NUMERIC(1,0) DEFAULT 0, 
	"OKP_CODE" VARCHAR(16 ), 
	"OKDP_CODE" VARCHAR(7 ), 
	"OKPD_CODE" VARCHAR(20 ), 
	"IS_ENTERPRISE" NUMERIC(1,0) DEFAULT 0, 
	"IS_CONTROLPRICE" NUMERIC(1,0) DEFAULT 0, 
	"CATEGORY" NUMERIC(1,0) DEFAULT 1, 
	"NOTFORPLAN" NUMERIC(1,0) DEFAULT 0, 
	"OKPD_ID" NUMERIC(15,0), 
	"UNITNAME" VARCHAR(50 )
   )  ;
--------------------------------------------------------
--  DDL for Table GOODSGROUPDOCDETAIL
--------------------------------------------------------

  CREATE TABLE "GOODSGROUPDOCDETAIL" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"DOCUMENT_ID" NUMERIC(15,0), 
	"GROUPCODE" VARCHAR(20 ), 
	"OKDP_CODE" VARCHAR(20 ), 
	"AMOUNT" NUMERIC(15,2) DEFAULT 0
   )  ;
--------------------------------------------------------
--  DDL for Table GOODSGROUPPURCHASEMODE
--------------------------------------------------------

  CREATE TABLE "GOODSGROUPPURCHASEMODE" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"PURCHASEMODE_ID" NUMERIC(15,0), 
	"GOODSGROUP_ID" NUMERIC(15,0)
   )  ;
--------------------------------------------------------
--  DDL for Table GOODSGROUP_TREE
--------------------------------------------------------

  CREATE TABLE "GOODSGROUP_TREE" 
   (	"GROUP_ID" NUMERIC(15,0), 
	"TREE" VARCHAR(252 )
   )  ;
--------------------------------------------------------
--  DDL for Table GOODSOKDP
--------------------------------------------------------

  CREATE TABLE "GOODSOKDP" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"CODE" VARCHAR(7 ), 
	"NAME" VARCHAR(512 ), 
	"ACTUAL" NUMERIC(1,0) DEFAULT 1, 
	"CHAPTER" NUMERIC(1,0) DEFAULT 0, 
	"UNUSABLE" NUMERIC(1,0) DEFAULT 0, 
	"ENTERPRISE" NUMERIC(1,0) DEFAULT 0, 
	"UUISPREFERENCE" NUMERIC(1,0) DEFAULT 0, 
	"INVALIDPREFERENCE" NUMERIC(1,0) DEFAULT 0, 
	"OKVED_ID" NUMERIC(15,0), 
	"PARENT_ID" NUMERIC(15,0)
   )  ;
--------------------------------------------------------
--  DDL for Table GOODSOKDPCOUNTRYPREF
--------------------------------------------------------

  CREATE TABLE "GOODSOKDPCOUNTRYPREF" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"COUNTRY_ID" NUMERIC(15,0), 
	"GOODSOKDP_ID" NUMERIC(15,0)
   )  ;
--------------------------------------------------------
--  DDL for Table GOODSOKDPPURCHASEMODE
--------------------------------------------------------

  CREATE TABLE "GOODSOKDPPURCHASEMODE" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"PURCHASEMODE_ID" NUMERIC(15,0), 
	"GOODSOKDP_ID" NUMERIC(15,0)
   )  ;
--------------------------------------------------------
--  DDL for Table GOODSOKPD
--------------------------------------------------------

  CREATE TABLE "GOODSOKPD" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"CODE" VARCHAR(20 ), 
	"NAME" VARCHAR(1000 ), 
	"DESCRIPTION" VARCHAR(4000 ), 
	"ACTUAL" NUMERIC(1,0) DEFAULT 0, 
	"CHAPTER" NUMERIC(1,0) DEFAULT 0, 
	"UNUSABLE" NUMERIC(1,0) DEFAULT 0, 
	"UUISPREFERENCE" NUMERIC(1,0) DEFAULT 0, 
	"INVALIDPREFERENCE" NUMERIC(1,0) DEFAULT 0, 
	"ONEVENDORUUIS" NUMERIC(1,0) DEFAULT 0, 
	"PARENT_ID" NUMERIC(15,0), 
	"CLASSIFIER" NUMERIC(1,0) DEFAULT 2
   )  ;
--------------------------------------------------------
--  DDL for Table GOODSOKPDCOUNTRYPREF
--------------------------------------------------------

  CREATE TABLE "GOODSOKPDCOUNTRYPREF" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"COUNTRY_ID" NUMERIC(15,0), 
	"GOODSOKPD_ID" NUMERIC(15,0)
   )  ;
--------------------------------------------------------
--  DDL for Table GOODSOKPDPURCHASEMODE
--------------------------------------------------------

  CREATE TABLE "GOODSOKPDPURCHASEMODE" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"PURCHASEMODE_ID" NUMERIC(15,0), 
	"GOODSOKPD_ID" NUMERIC(15,0)
   )  ;
--------------------------------------------------------
--  DDL for Table GOODSOKVED
--------------------------------------------------------

  CREATE TABLE "GOODSOKVED" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"CODE" VARCHAR(20 ), 
	"NAME" VARCHAR(1000 ), 
	"DESCRIPTION" VARCHAR(4000 ), 
	"ACTUAL" NUMERIC(1,0) DEFAULT 1, 
	"CHAPTER" NUMERIC(1,0) DEFAULT 0, 
	"UNUSABLE" NUMERIC(1,0) DEFAULT 0, 
	"PARENT_ID" NUMERIC(15,0), 
	"CLASSIFIER" NUMERIC(1,0) DEFAULT 2, 
	"OOSKEY" VARCHAR(100 )
   )  ;
--------------------------------------------------------
--  DDL for Table GOODSPRICE
--------------------------------------------------------

  CREATE TABLE "GOODSPRICE" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"GOODS_ID" NUMERIC(15,0), 
	"DT" DATE, 
	"PRICE" NUMERIC(15,2) DEFAULT 0
   )  ;
--------------------------------------------------------
--  DDL for Table GOODSPROP
--------------------------------------------------------

  CREATE TABLE "GOODSPROP" 
   (	"GOODS_ID" NUMERIC(15,0), 
	"GROUP_ID" NUMERIC(15,0), 
	"SEQORDER" NUMERIC(2,0), 
	"PROPTYPE" NUMERIC(1,0) DEFAULT 0, 
	"PROPVALUE" VARCHAR(1500 )
   )  ;
--------------------------------------------------------
--  DDL for Table GRANTINVESTMENT
--------------------------------------------------------

  CREATE TABLE "GRANTINVESTMENT" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"BUDGET_ID" NUMERIC(15,0), 
	"ORG_ID" NUMERIC(15,0), 
	"CODE" VARCHAR(20 ), 
	"CAPTION" VARCHAR(2000 ), 
	"GRANTTYPE" NUMERIC(4,0) DEFAULT 0, 
	"FOREIGNKEY" VARCHAR(50 ), 
	"FINYEAR" NUMERIC(4,0)
   )  ;
--------------------------------------------------------
--  DDL for Table GROUPPROP
--------------------------------------------------------

  CREATE TABLE "GROUPPROP" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"GROUP_ID" NUMERIC(15,0), 
	"SEQORDER" NUMERIC(2,0), 
	"CAPTION" VARCHAR(512 ), 
	"DESCRIPTION" VARCHAR(255 ), 
	"ISREQUIRED" NUMERIC(15,0) DEFAULT 0, 
	"DEFVALUE" VARCHAR(1500 ), 
	"PROPTYPE_ID" NUMERIC(15,0)
   )  ;
--------------------------------------------------------
--  DDL for Table GROUPPROPVALUE
--------------------------------------------------------

  CREATE TABLE "GROUPPROPVALUE" 
   (	"GROUPPROP_ID" NUMERIC(15,0), 
	"SEQORDER" NUMERIC(5,0), 
	"CAPTION" VARCHAR(1500 )
   )  ;
--------------------------------------------------------
--  DDL for Table GROUPUNIT
--------------------------------------------------------

  CREATE TABLE "GROUPUNIT" 
   (	"GROUP_ID" NUMERIC(15,0), 
	"UNITNAME" VARCHAR(50 )
   )  ;
--------------------------------------------------------
--  DDL for Table HISTORYMODIFY
--------------------------------------------------------

  CREATE TABLE "HISTORYMODIFY" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"OBJ_NAME" VARCHAR(50 ), 
	"OBJ_ID" NUMERIC(15,0), 
	"SYSUSER_ID" NUMERIC(15,0), 
	"modify" DATE, 
	"REMARK" VARCHAR(255 ), 
	"DATA" BLOB
   )  
  ;
--------------------------------------------------------
--  DDL for Table INDUSTRYCODE
--------------------------------------------------------

  CREATE TABLE "INDUSTRYCODE" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"BUDGET_ID" NUMERIC(15,0), 
	"PARENT_ID" NUMERIC(15,0), 
	"ORG_ID" NUMERIC(15,0), 
	"CODE" VARCHAR(17 ), 
	"CAPTION" VARCHAR(2000 ), 
	"FOREIGNKEY" VARCHAR(50 ), 
	"FINYEAR" NUMERIC(4,0)
   )  ;
--------------------------------------------------------
--  DDL for Table INSTITUTIONLINE
--------------------------------------------------------

  CREATE TABLE "INSTITUTIONLINE" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"BUDGET_ID" NUMERIC(15,0), 
	"RECIPIENT_ID" NUMERIC(15,0), 
	"INDUSTRYCODE_ID" NUMERIC(15,0), 
	"GRANTINVESTMENT_ID" NUMERIC(15,0), 
	"KOSGU" VARCHAR(16 ), 
	"KIF" VARCHAR(16 ), 
	"FOREIGNKEY" VARCHAR(50 ), 
	"FINYEAR" NUMERIC(4,0), 
	"PLANCHANGE_AMT1" NUMERIC(15,2) DEFAULT 0, 
	"PLANCHANGE_AMT2" NUMERIC(15,2) DEFAULT 0, 
	"PLANCHANGE_AMT3" NUMERIC(15,2) DEFAULT 0, 
	"KVR" VARCHAR(100 )
   )  ;
--------------------------------------------------------
--  DDL for Table INTERBUDGET
--------------------------------------------------------

  CREATE TABLE "INTERBUDGET" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"MSGSITE_ID" NUMERIC(15,0), 
	"BUDGET_ID" NUMERIC(15,0), 
	"OUTERBUDGET_ID" NUMERIC(15,0), 
	"FINYEAR" NUMERIC(4,0), 
	"SYSTEMTYPE" NUMERIC(1,0) DEFAULT 0, 
	"LINK_ADDRESS" VARCHAR(255 )
   )  ;
--------------------------------------------------------
--  DDL for Table INVBUDGETLINE
--------------------------------------------------------

  CREATE TABLE "INVBUDGETLINE" 
   (	"INVOICE_ID" NUMERIC(15,0), 
	"POS" NUMERIC(15,0), 
	"ESTIMATE_ID" NUMERIC(15,0), 
	"ESTIMATENAME" VARCHAR(255 ), 
	"RECIPIENT_ID" NUMERIC(15,0), 
	"RECIPIENTNAME" VARCHAR(2000 ), 
	"RECIPIENTACC_ID" NUMERIC(15,0), 
	"RECIPIENTACCOUNT" VARCHAR(35 ), 
	"CODE1" VARCHAR(100 ), 
	"CODE2" VARCHAR(100 ), 
	"CODE3" VARCHAR(100 ), 
	"CODE4" VARCHAR(100 ), 
	"CODE5" VARCHAR(100 ), 
	"CODE6" VARCHAR(100 ), 
	"CODE7" VARCHAR(100 ), 
	"CODE8" VARCHAR(100 ), 
	"CODE9" VARCHAR(100 ), 
	"CODE10" VARCHAR(100 ), 
	"FINSRCNAME" VARCHAR(512 ), 
	"FINSRC_ID" NUMERIC(15,0), 
	"AMOUNT" NUMERIC(15,2) DEFAULT 0, 
	"LIABILITYEXPENSE_ID" NUMERIC(15,0), 
	"INDUSTRYCODE_ID" NUMERIC(15,0), 
	"GRANTINVESTMENT_ID" NUMERIC(15,0)
   )  ;
--------------------------------------------------------
--  DDL for Table INVGOODS
--------------------------------------------------------

  CREATE TABLE "INVGOODS" 
   (	"INVOICE_ID" NUMERIC(15,0), 
	"POS" NUMERIC(15,0), 
	"GROUPCODE" VARCHAR(20 ), 
	"OKDP_CODE" VARCHAR(20 ), 
	"GROUPCAPTION" VARCHAR(500 ), 
	"GOODSCODE" VARCHAR(20 ), 
	"GOODSCAPTION" VARCHAR(512 ), 
	"QTY" NUMERIC(15,4) DEFAULT 0, 
	"PRICE" NUMERIC(15,2) DEFAULT 0, 
	"AMOUNT" NUMERIC(15,2) DEFAULT 0, 
	"STATUS" NUMERIC(1,0) DEFAULT 0, 
	"OKPD_CODE" VARCHAR(20 ), 
	"OKPD_NAME" VARCHAR(1000 ), 
	"OKPD_ID" NUMERIC(15,0), 
	"UNITNAME" VARCHAR(50 )
   )  ;
--------------------------------------------------------
--  DDL for Table INVGOODSPROP
--------------------------------------------------------

  CREATE TABLE "INVGOODSPROP" 
   (	"INVOICE_ID" NUMERIC(15,0), 
	"GOODSPOS" NUMERIC(15,0), 
	"SEQORDER" NUMERIC(15,0), 
	"PROPTYPE_ID" NUMERIC(15,0), 
	"CAPTION" VARCHAR(512 ), 
	"PROPVALUE" VARCHAR(1500 )
   )  ;
--------------------------------------------------------
--  DDL for Table INVOICEDOC
--------------------------------------------------------

  CREATE TABLE "INVOICEDOC" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"DOCUMENT_ID" NUMERIC(15,0), 
	"DOCUMENTCLASS_ID" NUMERIC(15,0), 
	"DISPSTATUS_ID" NUMERIC(15,0), 
	"OPERTYPE_ID" NUMERIC(15,0) DEFAULT 0, 
	"BUDGET_ID" NUMERIC(15,0), 
	"DOC_NUMBER" VARCHAR(45 ), 
	"DOC_DATE" DATE, 
	"AMOUNT" NUMERIC(15,2) DEFAULT 0, 
	"DESCRIPTION" VARCHAR(2000 ), 
	"SINGLECUSTOMERREASON_ID" NUMERIC(15,0), 
	"STARTDATE" DATE, 
	"FINISHDATE" DATE, 
	"DEALDATE" DATE, 
	"CUSTOMER_ID" NUMERIC(15,0), 
	"CUSTOMERNAME" VARCHAR(2000 ), 
	"CON_ID" NUMERIC(15,0), 
	"CONNAME" VARCHAR(2000 ), 
	"CONTAXCODE" VARCHAR(20 ), 
	"CONKPP" VARCHAR(20 ), 
	"CONACC_ID" NUMERIC(15,0), 
	"CONACCOUNT" VARCHAR(35 ), 
	"CONACCTYPE" NUMERIC(1,0) DEFAULT 0, 
	"CONEXECUTERACC_ID" NUMERIC(15,0), 
	"CONEXECUTERACC" VARCHAR(35 ), 
	"CONEXECUTER" VARCHAR(2000 ), 
	"CONCORACCOUNT" VARCHAR(20 ), 
	"CONBIC" VARCHAR(9 ), 
	"CONBANKNAME" VARCHAR(2000 ), 
	"REMARK" VARCHAR(255 ), 
	"FOREIGN_KEY" VARCHAR(50 ), 
	"COUNTRY_ID" NUMERIC(15,0), 
	"TERRITORYCODE" VARCHAR(20 ), 
	"SUPPLYADDRESS" VARCHAR(300 ), 
	"ISGROUPSMOREONE" NUMERIC(1,0), 
	"EXPORT_FLAG" NUMERIC(1,0) DEFAULT 0, 
	"CONTROLFLAGS" NUMERIC(15,0) DEFAULT 0, 
	"ACTUAL_YEAR" NUMERIC(4,0), 
	"NECESSITY_ID" NUMERIC(15,0) DEFAULT 0, 
	"NECESSITY_DESCRIPTION" VARCHAR(1000 ), 
	"SUPPLIEDAMOUNT" NUMERIC(15,2) DEFAULT 0, 
	"PLANPOSITIONNUMBER" VARCHAR(100 ), 
	"FOREIGN_STATUS" VARCHAR(100 ), 
	"CONEXECUTER_ID" NUMERIC(15,0), 
	"CONORGTYPE" NUMERIC(1,0) DEFAULT 0, 
	"CONISTAXCODEFREE" NUMERIC(1,0) DEFAULT 0, 
	"CONTAXPAYERCODE" VARCHAR(100 ), 
	"CONLASTNAME" VARCHAR(250 ), 
	"CONFIRSTNAME" VARCHAR(250 ), 
	"CONPATRONYMIC" VARCHAR(250 ), 
	"CONPROPFORM_ID" NUMERIC(15,0)
   )  ;
--------------------------------------------------------
--  DDL for Table JAVACLASS
--------------------------------------------------------

  CREATE TABLE "JAVACLASS" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"NAME" VARCHAR(250 ), 
	"STATE" NUMERIC(1,0) DEFAULT 0, 
	"SOURCE" BLOB SUB_TYPE TEXT, 
	"DATA" BLOB
   )  
  ;
--------------------------------------------------------
--  DDL for Table KBKLINEFIT
--------------------------------------------------------

  CREATE TABLE "KBKLINEFIT" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"BUDGET_ID" NUMERIC(15,0), 
	"FINYEAR" NUMERIC(4,0), 
	"FINYEAR_TO" NUMERIC(4,0), 
	"ANAL_KIND" NUMERIC(18,0), 
	"SEQ_ORDER" NUMERIC(15,0), 
	"CODE1" VARCHAR(100 ), 
	"CODE2" VARCHAR(100 ), 
	"CODE3" VARCHAR(100 ), 
	"CODE4" VARCHAR(100 ), 
	"CODE5" VARCHAR(100 ), 
	"CODE6" VARCHAR(100 ), 
	"CODE7" VARCHAR(100 ), 
	"CODE8" VARCHAR(100 ), 
	"CODE9" VARCHAR(100 ), 
	"CODE10" VARCHAR(100 ), 
	"CODE1_TO" VARCHAR(100 ), 
	"CODE2_TO" VARCHAR(100 ), 
	"CODE3_TO" VARCHAR(100 ), 
	"CODE4_TO" VARCHAR(100 ), 
	"CODE5_TO" VARCHAR(100 ), 
	"CODE6_TO" VARCHAR(100 ), 
	"CODE7_TO" VARCHAR(100 ), 
	"CODE8_TO" VARCHAR(100 ), 
	"CODE9_TO" VARCHAR(100 ), 
	"CODE10_TO" VARCHAR(100 )
   )  ;
--------------------------------------------------------
--  DDL for Table KLADR
--------------------------------------------------------

  CREATE TABLE "KLADR" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"PARENT_ID" NUMERIC(15,0), 
	"ACTUAL" NUMERIC(1,0), 
	"NAME" VARCHAR(40 ), 
	"SOCR" VARCHAR(10 ), 
	"CODE" VARCHAR(13 ), 
	"CHILDLEVEL" NUMERIC(1,0), 
	"CODE1" VARCHAR(2 ), 
	"CODE2" VARCHAR(3 ), 
	"CODE3" VARCHAR(3 ), 
	"CODE4" VARCHAR(3 ), 
	"CODE5" VARCHAR(2 )
   )  ;
--------------------------------------------------------
--  DDL for Table KLADRSTREET
--------------------------------------------------------

  CREATE TABLE "KLADRSTREET" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"ACTUAL" NUMERIC(1,0), 
	"KLADR_ID" NUMERIC(15,0), 
	"NAME" VARCHAR(40 ), 
	"SOCR" VARCHAR(10 ), 
	"CODE" VARCHAR(17 ), 
	"CODE1" VARCHAR(2 ), 
	"CODE2" VARCHAR(3 ), 
	"CODE3" VARCHAR(3 ), 
	"CODE4" VARCHAR(3 ), 
	"CODE5" VARCHAR(4 ), 
	"CODE6" VARCHAR(2 )
   )  ;
--------------------------------------------------------
--  DDL for Table LEDGER
--------------------------------------------------------

  CREATE TABLE "LEDGER" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"PLAN2DOC_ID" NUMERIC(15,0), 
	"BUDGET_ID" NUMERIC(15,0), 
	"GROUP_ID" NUMERIC(15,0), 
	"OKDP_ID" NUMERIC(15,0), 
	"GOODS_ID" NUMERIC(15,0), 
	"PURCHASEMODE_ID" NUMERIC(15,0), 
	"CUSTOMER_ID" NUMERIC(15,0), 
	"ISENTERPRISE" NUMERIC(1,0), 
	"ISSMALL" NUMERIC(1,0), 
	"DOCYEAR" NUMERIC(4,0), 
	"CODE1" VARCHAR(100 ), 
	"CODE2" VARCHAR(100 ), 
	"CODE3" VARCHAR(100 ), 
	"CODE4" VARCHAR(100 ), 
	"CODE5" VARCHAR(100 ), 
	"CODE6" VARCHAR(100 ), 
	"CODE7" VARCHAR(100 ), 
	"CODE8" VARCHAR(100 ), 
	"CODE9" VARCHAR(100 ), 
	"CODE10" VARCHAR(100 ), 
	"FINSRC_ID" NUMERIC(15,0), 
	"DELIVERYBASIS_ID" NUMERIC(15,0), 
	"PAYCONDITIONCACHE_ID" NUMERIC(15,0), 
	"INDUSTRYCODE_ID" NUMERIC(15,0), 
	"GRANTINVESTMENT_ID" NUMERIC(15,0), 
	"INVITATIONDATE" DATE, 
	"CMPDATE" DATE, 
	"DESCRIPTIONCACHE_ID" NUMERIC(15,0), 
	"CMPORG_ID" NUMERIC(15,0), 
	"CONTRACTOR_ID" NUMERIC(15,0), 
	"NECESSITY_ID" NUMERIC(15,0), 
	"PLAN_Q1" NUMERIC(15,2) DEFAULT 0, 
	"PLAN_Q2" NUMERIC(15,2) DEFAULT 0, 
	"PLAN_Q3" NUMERIC(15,2) DEFAULT 0, 
	"PLAN_Q4" NUMERIC(15,2) DEFAULT 0, 
	"FACT_Q1" NUMERIC(15,2) DEFAULT 0, 
	"FACT_Q2" NUMERIC(15,2) DEFAULT 0, 
	"FACT_Q3" NUMERIC(15,2) DEFAULT 0, 
	"FACT_Q4" NUMERIC(15,2) DEFAULT 0, 
	"UNITNAME" VARCHAR(50 )
   )  ;
--------------------------------------------------------
--  DDL for Table LIABILITYCREDENTIAL
--------------------------------------------------------

  CREATE TABLE "LIABILITYCREDENTIAL" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"STAGECODE_ID" NUMERIC(15,0), 
	"LIABILITYGROUP_ID" NUMERIC(15,0), 
	"CODE" VARCHAR(100 ), 
	"CAPTION" VARCHAR(4000 ), 
	"DESCRIPTION" VARCHAR(1024 )
   )  ;
--------------------------------------------------------
--  DDL for Table LIABILITYEXPENSE
--------------------------------------------------------

  CREATE TABLE "LIABILITYEXPENSE" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"IS_ACTUAL" NUMERIC(1,0) DEFAULT 1, 
	"CREDENTIAL_ID" NUMERIC(15,0), 
	"ORG_ID" NUMERIC(15,0), 
	"BUDGET_ID" NUMERIC(15,0), 
	"FINYEAR" NUMERIC(4,0), 
	"CODE1" VARCHAR(100 ), 
	"CODE2" VARCHAR(100 ), 
	"CODE3" VARCHAR(100 ), 
	"CODE4" VARCHAR(100 ), 
	"CODE5" VARCHAR(100 ), 
	"CODE6" VARCHAR(100 ), 
	"CODE7" VARCHAR(100 ), 
	"CODE8" VARCHAR(100 ), 
	"CODE9" VARCHAR(100 ), 
	"CODE10" VARCHAR(100 )
   )  ;
--------------------------------------------------------
--  DDL for Table LIABILITYEXPENSE_DOCLINES
--------------------------------------------------------

  CREATE TABLE "LIABILITYEXPENSE_DOCLINES" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"LIABILITYEXPENSE_ID" NUMERIC(15,0), 
	"RECIPIENT_ID" NUMERIC(15,0), 
	"CODE1" VARCHAR(100 ), 
	"CODE2" VARCHAR(100 ), 
	"CODE3" VARCHAR(100 ), 
	"CODE4" VARCHAR(100 ), 
	"CODE5" VARCHAR(100 ), 
	"CODE6" VARCHAR(100 ), 
	"CODE7" VARCHAR(100 ), 
	"CODE8" VARCHAR(100 ), 
	"CODE9" VARCHAR(100 ), 
	"CODE10" VARCHAR(100 )
   )  ;
--------------------------------------------------------
--  DDL for Table LIABILITYGROUP
--------------------------------------------------------

  CREATE TABLE "LIABILITYGROUP" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"CAPTION" VARCHAR(5 ), 
	"DESCRIPTION" VARCHAR(2000 )
   )  ;
--------------------------------------------------------
--  DDL for Table LICTYPE
--------------------------------------------------------

  CREATE TABLE "LICTYPE" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"CAPTION" VARCHAR(100 ), 
	"DESCRIPTION" VARCHAR(255 ), 
	"ISSUER" VARCHAR(255 ), 
	"ACTIVITYKIND" VARCHAR(255 )
   )  ;
--------------------------------------------------------
--  DDL for Table MAIL
--------------------------------------------------------

  CREATE TABLE "MAIL" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"SENDER_ID" NUMERIC(15,0), 
	"RECEIVER_ID" NUMERIC(15,0), 
	"SUBJECT" VARCHAR(255 ), 
	"BODY" BLOB SUB_TYPE TEXT, 
	"CREATE_DATE" DATE, 
	"ARCHIVE_DATE" DATE, 
	"READ_DATE" DATE, 
	"STATUS" NUMERIC(1,0) DEFAULT 0
   )  
  ;
--------------------------------------------------------
--  DDL for Table MAILATTACH
--------------------------------------------------------

  CREATE TABLE "MAILATTACH" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"MAIL_ID" NUMERIC(15,0), 
	"ATTACH_NAME" VARCHAR(100 ), 
	"DEVICE_NAME" VARCHAR(100 ), 
	"DESCRIPTION" VARCHAR(255 ), 
	"AUTHOR" NUMERIC(15,0), 
	"ACTION_DATE" DATE
   )  ;
--------------------------------------------------------
--  DDL for Table MAILRECEIVERGROUP
--------------------------------------------------------

  CREATE TABLE "MAILRECEIVERGROUP" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"NAME" VARCHAR(255 ), 
	"DESCRIPTION" VARCHAR(2000 )
   )  ;
--------------------------------------------------------
--  DDL for Table MAILRECEIVERGROUP_RECEIVER
--------------------------------------------------------

  CREATE TABLE "MAILRECEIVERGROUP_RECEIVER" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"MAILRECEIVERGROUP_ID" NUMERIC(15,0), 
	"SYSUSER_ID" NUMERIC(15,0)
   )  ;
--------------------------------------------------------
--  DDL for Table MENU
--------------------------------------------------------

  CREATE TABLE "MENU" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"NAME" VARCHAR(50 ), 
	"CAPTION" VARCHAR(100 )
   )  ;
--------------------------------------------------------
--  DDL for Table MENUITEM
--------------------------------------------------------

  CREATE TABLE "MENUITEM" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"MENU_ID" NUMERIC(15,0), 
	"SHOW_ORDER" NUMERIC(15,0) DEFAULT 0, 
	"CAPTION" VARCHAR(100 ), 
	"HINT_MESSAGE" VARCHAR(255 ), 
	"SHORTCUT_KEY" VARCHAR(30 ), 
	"CLIENTOBJECT_ID" NUMERIC(15,0), 
	"OBJECT_PARAMS" VARCHAR(300 ), 
	"PARENT_ID" NUMERIC(15,0), 
	"SUBSYSTEM" NUMERIC(15,0) DEFAULT 0
   )  ;
--------------------------------------------------------
--  DDL for Table MENUITEMWEB
--------------------------------------------------------

  CREATE TABLE "MENUITEMWEB" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"MENU_ID" NUMERIC(15,0), 
	"SHOW_ORDER" NUMERIC(15,0) DEFAULT 0, 
	"CAPTION" VARCHAR(100 ), 
	"HINT_MESSAGE" VARCHAR(255 ), 
	"SHORTCUT_KEY" VARCHAR(30 ), 
	"APPOBJNAME" VARCHAR(128 ), 
	"OBJECT_PARAMS" VARCHAR(300 ), 
	"PARENT_ID" NUMERIC(15,0), 
	"SUBSYSTEM" NUMERIC(15,0) DEFAULT 0
   )  ;
--------------------------------------------------------
--  DDL for Table METACONSTRAINT
--------------------------------------------------------

  CREATE TABLE "METACONSTRAINT" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"METAOBJECT_ID" NUMERIC(15,0), 
	"NAME" VARCHAR(128 ), 
	"CONSTRAINT_TYPE" NUMERIC(15,0), 
	"FOREIGNOBJECT_NAME" VARCHAR(250 ), 
	"EXPRESSION" VARCHAR(1024 )
   )  ;
--------------------------------------------------------
--  DDL for Table METAOBJECT
--------------------------------------------------------

  CREATE TABLE "METAOBJECT" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"NAME" VARCHAR(128 ), 
	"TABLE_NAME" VARCHAR(255 ), 
	"SUBSYSTEM" NUMERIC(15,0)
   )  ;
--------------------------------------------------------
--  DDL for Table MSG
--------------------------------------------------------

  CREATE TABLE "MSG" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"SENDER_ID" NUMERIC(15,0), 
	"RECEIVER_ID" NUMERIC(15,0), 
	"SEQ_NUMBER" NUMERIC(9,0) DEFAULT 0, 
	"QUEUE_NAME" VARCHAR(50 ) DEFAULT 'default', 
	"RESET_QUEUE" NUMERIC(1,0) DEFAULT 0, 
	"REQUEST_DATA" BLOB SUB_TYPE TEXT, 
	"DIAGNOSIS" VARCHAR(2000 ), 
	"DISPSTATUS" NUMERIC(1,0) DEFAULT 0, 
	"CREATE_TIME" DATE, 
	"SEND_TIME" DATE, 
	"RECEIVE_TIME" DATE, 
	"PROCESS_TIME" DATE, 
	"DESCRIPTION" VARCHAR(255 ), 
	"PROCESS_PRIORITY" NUMERIC(1,0) DEFAULT 0, 
	"REQUEST_DATA_CRC" NUMERIC(15,0), 
	"REQUEST_DATA_LEN" NUMERIC(15,0), 
	"SYSUSER_ID" NUMERIC(15,0) DEFAULT -99999, 
	"BUDGET_ID" NUMERIC(15,0), 
	"GUID" VARCHAR(100 ), 
	"RPL_OBJ_NAME" VARCHAR(255 )
   )  
  ;
--------------------------------------------------------
--  DDL for Table MSGLINKTYPE
--------------------------------------------------------

  CREATE TABLE "MSGLINKTYPE" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"CAPTION" VARCHAR(100 ), 
	"CLASSNAME" VARCHAR(100 ), 
	"EXAMPLE" VARCHAR(255 )
   )  ;
--------------------------------------------------------
--  DDL for Table MSGQUEUE
--------------------------------------------------------

  CREATE TABLE "MSGQUEUE" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"SENDER_ID" NUMERIC(15,0), 
	"RECEIVER_ID" NUMERIC(15,0), 
	"NAME" VARCHAR(50 ), 
	"SENT_NUMBER" NUMERIC(9,0) DEFAULT 0, 
	"PROCESSED_NUMBER" NUMERIC(9,0) DEFAULT 0
   )  ;
--------------------------------------------------------
--  DDL for Table MSGSITE
--------------------------------------------------------

  CREATE TABLE "MSGSITE" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"MSGLINKTYPE_ID" NUMERIC(15,0), 
	"LINK_ADDRESS" VARCHAR(255 ), 
	"SYSUSER_ID" NUMERIC(15,0), 
	"CAPTION" VARCHAR(100 ), 
	"REPLICATOR_VERSION" NUMERIC(15,0) DEFAULT 0, 
	"SPLIT_QUEUES_BY_OBJECT" NUMERIC(1,0) DEFAULT 0, 
	"SPLIT_QUEUES_BY_BUDGET" NUMERIC(1,0) DEFAULT 0
   )  ;
--------------------------------------------------------
--  DDL for Table MSGSITEEXCHANGE
--------------------------------------------------------

  CREATE TABLE "MSGSITEEXCHANGE" 
   (	"MSGSITE_ID" NUMERIC(15,0), 
	"DOCEXCHANGESCHEME_ID" NUMERIC(15,0)
   )  ;
--------------------------------------------------------
--  DDL for Table NECESSITY
--------------------------------------------------------

  CREATE TABLE "NECESSITY" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"NAME" VARCHAR(1000 ), 
	"DESCRIPTION" VARCHAR(2000 ), 
	"ACTUAL" NUMERIC(1,0) DEFAULT 1, 
	"CODE2" VARCHAR(100 ), 
	"NECTYPE" NUMERIC(1,0)
   )  ;
--------------------------------------------------------
--  DDL for Table NOTICEDOC
--------------------------------------------------------

  CREATE TABLE "NOTICEDOC" 
   (	"ID" NUMERIC(15,0), 
	"DOCUMENT_ID" NUMERIC(15,0), 
	"DOCUMENTCLASS_ID" NUMERIC(15,0), 
	"DISPSTATUS_ID" NUMERIC(15,0), 
	"DOC_NUMBER" VARCHAR(20 ), 
	"DOCGROUP_ID" NUMERIC(15,0), 
	"SYSDOCGROUP_ID" NUMERIC(15,0), 
	"AMOUNT" NUMERIC(15,2) DEFAULT 0, 
	"BUDGET_ID" NUMERIC(15,0), 
	"FOREIGN_KEY" VARCHAR(50 ), 
	"DESCRIPTION" VARCHAR(255 ), 
	"OPERTYPE_ID" NUMERIC(15,0) DEFAULT 0, 
	"REMARK" VARCHAR(255 ), 
	"VERSION" NUMERIC(15,0), 
	"BRIEF" BLOB SUB_TYPE TEXT, 
	"BODY" BLOB SUB_TYPE TEXT, 
	"SUBJECT" BLOB SUB_TYPE TEXT, 
	"DOC_DATE" DATE, 
	"ISPUBLIC" NUMERIC(1,0), 
	"PUBLISHERORG_ID" NUMERIC(15,0), 
	"AUTHORORG_ID" NUMERIC(15,0), 
	"AUTHORORGNAME" VARCHAR(2000 ), 
	"MCMPUBLISH_DATE" DATE, 
	"SENDEMAIL" NUMERIC(1,0) DEFAULT 0, 
	"FROMADDRESS" VARCHAR(100 ), 
	"ETPKEY" VARCHAR(100 ), 
	"ETP_ID" NUMERIC(15,0), 
	"OOSKEY" VARCHAR(100 ), 
	"SEND_DATE" DATE
   )  
  ;
--------------------------------------------------------
--  DDL for Table NOTICEEMAILORG
--------------------------------------------------------

  CREATE TABLE "NOTICEEMAILORG" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"NOTICEDOC_ID" NUMERIC(15,0), 
	"ORG_ID" NUMERIC(15,0), 
	"ORGNAME" VARCHAR(2000 ), 
	"EMAIL" VARCHAR(256 )
   )  ;
--------------------------------------------------------
--  DDL for Table NOTICEORG
--------------------------------------------------------

  CREATE TABLE "NOTICEORG" 
   (	"NOTICEDOC_ID" NUMERIC(15,0), 
	"ORG_ID" NUMERIC(15,0)
   )  ;
--------------------------------------------------------
--  DDL for Table NOTIFYMSG
--------------------------------------------------------

  CREATE TABLE "NOTIFYMSG" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"CREATE_DATE" DATE DEFAULT '1970-01-01', 
	"NOTIFYMSGGROUP_ID" NUMERIC(15,0), 
	"NOTIFYMSGEVENT_ID" NUMERIC(15,0), 
	"SENDER_ID" NUMERIC(15,0), 
	"RECEIVER_ID" NUMERIC(15,0), 
	"MSG_BODY" BLOB SUB_TYPE TEXT, 
	"READ_DATE" DATE, 
	"EMAILSENDED" NUMERIC(1,0) DEFAULT 0, 
	"TOEXEC" NUMERIC(1,0) DEFAULT 0, 
	"DOCUMENT_ID" NUMERIC(15,0), 
	"QUICKLY" NUMERIC(1,0) DEFAULT 0, 
	"READED" NUMERIC(1,0) DEFAULT 0
   )  
  ;
--------------------------------------------------------
--  DDL for Table NOTIFYMSGDOC
--------------------------------------------------------

  CREATE TABLE "NOTIFYMSGDOC" 
   (	"NOTIFYMSGRULE_ID" NUMERIC(15,0), 
	"DOCUMENT_ID" NUMERIC(15,0), 
	"CREATETIME" DATE, 
	"NOTIFYMSGKIND" NUMERIC(15,0) DEFAULT 0, 
	"PARAMHASH" NUMERIC(15,0)
   )  ;
--------------------------------------------------------
--  DDL for Table NOTIFYMSGEVENT
--------------------------------------------------------

  CREATE TABLE "NOTIFYMSGEVENT" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"NAME" VARCHAR(100 )
   )  ;
--------------------------------------------------------
--  DDL for Table NOTIFYMSGGROUP
--------------------------------------------------------

  CREATE TABLE "NOTIFYMSGGROUP" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"NAME" VARCHAR(100 )
   )  ;
--------------------------------------------------------
--  DDL for Table NOTIFYMSGRULE
--------------------------------------------------------

  CREATE TABLE "NOTIFYMSGRULE" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"NOTIFYMSGGROUP_ID" NUMERIC(15,0), 
	"NOTIFYMSGEVENT_ID" NUMERIC(15,0), 
	"SENDER_ID" NUMERIC(15,0), 
	"DOCUMENTCLASS_ID" NUMERIC(15,0), 
	"START_DISPSTATUS_ID" VARCHAR(255 ), 
	"END_DISPSTATUS_ID" VARCHAR(255 ), 
	"MSG" BLOB SUB_TYPE TEXT, 
	"DELAY_TIME" DATE, 
	"DOCFILTER" VARCHAR(255 ), 
	"RECEIVERSFROMDOCFIELD" VARCHAR(255 ), 
	"QUICKLY" NUMERIC(1,0) DEFAULT 0
   )  
  ;
--------------------------------------------------------
--  DDL for Table NOTIFYMSGRULE_RECEIVER
--------------------------------------------------------

  CREATE TABLE "NOTIFYMSGRULE_RECEIVER" 
   (	"NOTIFYMSGRULE_ID" NUMERIC(15,0), 
	"PERSON_ID" NUMERIC(15,0)
   )  ;
--------------------------------------------------------
--  DDL for Table NUMGENERATOR
--------------------------------------------------------

  CREATE TABLE "NUMGENERATOR" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"NAME" VARCHAR(50 ), 
	"CAPTION" VARCHAR(100 ), 
	"JAVACLASS_NAME" VARCHAR(100 ), 
	"PARAMS" VARCHAR(255 ), 
	"SUBSYSTEM" NUMERIC(15,0) DEFAULT 0
   )  ;
--------------------------------------------------------
--  DDL for Table NUMPREFIX
--------------------------------------------------------

  CREATE TABLE "NUMPREFIX" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"NUMGENERATOR_ID" NUMERIC(15,0), 
	"SYSUSER_ID" NUMERIC(15,0), 
	"PREFIX" VARCHAR(3 )
   )  ;
--------------------------------------------------------
--  DDL for Table NUMSEQUENCE
--------------------------------------------------------

  CREATE TABLE "NUMSEQUENCE" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"NAME" VARCHAR(50 ), 
	"NEXT_VALUE" NUMERIC(18,0) DEFAULT 1, 
	"CAPTION" VARCHAR(100 ), 
	"TERM_KIND" NUMERIC(1,0) DEFAULT 0, 
	"BUDGET_ID" NUMERIC(15,0)
   )  ;
--------------------------------------------------------
--  DDL for Table NUMUSAGE
--------------------------------------------------------

  CREATE TABLE "NUMUSAGE" 
   (	"NUMSEQUENCE_ID" NUMERIC(15,0), 
	"PERIOD_START" DATE, 
	"NUM_VALUE" NUMERIC(18,0), 
	"USE_COUNT" NUMERIC(9,0) DEFAULT 1
   )  ;
--------------------------------------------------------
--  DDL for Table OFFERDOC
--------------------------------------------------------

  CREATE TABLE "OFFERDOC" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"DOCUMENT_ID" NUMERIC(15,0), 
	"DOCUMENTCLASS_ID" NUMERIC(15,0), 
	"DISPSTATUS_ID" NUMERIC(15,0), 
	"OPERTYPE_ID" NUMERIC(15,0) DEFAULT 0, 
	"BUDGET_ID" NUMERIC(15,0), 
	"DOC_NUMBER" VARCHAR(20 ), 
	"DOC_DATE" DATE, 
	"AMOUNT" NUMERIC(15,2) DEFAULT 0, 
	"DESCRIPTION" VARCHAR(2000 ), 
	"REMARK" VARCHAR(255 ), 
	"FOREIGN_KEY" VARCHAR(50 ), 
	"VENDOR_ID" NUMERIC(15,0), 
	"VENDORTAXCODE" VARCHAR(20 ), 
	"VENDORKPP" VARCHAR(20 ), 
	"VENDORNAME" VARCHAR(2000 ), 
	"VENDORADDRESS" VARCHAR(300 ), 
	"VENDORCOUNTRY_ID" NUMERIC(15,0), 
	"VENDORTERRITORYCODE" VARCHAR(20 ), 
	"VENDORPOSTINDEX" VARCHAR(10 ), 
	"VENDORPOSTADDRESS" VARCHAR(300 ), 
	"VENDORPOSTCOUNTRY_ID" NUMERIC(15,0), 
	"VENDORPOSTTERRITORYCODE" VARCHAR(20 ), 
	"VENDORPOSTPOSTINDEX" VARCHAR(10 ), 
	"VENDORPHONE" VARCHAR(100 ), 
	"VENDORFAX" VARCHAR(100 ), 
	"VENDOREMAIL" VARCHAR(256 ), 
	"VENDORPROPFORM_ID" NUMERIC(15,0), 
	"DELIVERYBASISCODE" VARCHAR(50 ), 
	"PAYCONDITIONNAME" VARCHAR(255 ), 
	"CMPORG_ID" NUMERIC(15,0), 
	"PROVIDINGAMOUNT" NUMERIC(15,2), 
	"ISGROUPSMOREONE" NUMERIC(1,0), 
	"EXTRA" BLOB SUB_TYPE TEXT, 
	"FROM_WEB" NUMERIC(1,0) DEFAULT 0, 
	"ISCORRECTED" NUMERIC(1,0) DEFAULT 0, 
	"PRICE_GENERATION_ORDER" BLOB SUB_TYPE TEXT, 
	"VENDORACCOUNT" VARCHAR(35 ), 
	"VENDORACC_ID" NUMERIC(15,0), 
	"VENDORACCTYPE" NUMERIC(1,0) DEFAULT 0, 
	"VENDOREXECUTERACC_ID" NUMERIC(15,0), 
	"VENDOREXECUTERACC" VARCHAR(35 ), 
	"VENDOREXECUTER_ID" NUMERIC(15,0), 
	"VENDOREXECUTER" VARCHAR(2000 ), 
	"VENDORBIC" VARCHAR(9 ), 
	"VENDORCORACCOUNT" VARCHAR(35 ), 
	"VENDORBANKNAME" VARCHAR(2000 ), 
	"ETP_ID" NUMERIC(15,0), 
	"ETPKEY" VARCHAR(100 ), 
	"VENDOR_ETPKEY" VARCHAR(100 ), 
	"GOODS_INFO" BLOB SUB_TYPE TEXT, 
	"FINALOFFER_DATE" DATE, 
	"FINALOFFER_AMT" NUMERIC(15,2), 
	"PRICEINFO" BLOB SUB_TYPE TEXT, 
	"VENDORORGTYPE" NUMERIC(1,0) DEFAULT 0, 
	"VENDORISTAXCODEFREE" NUMERIC(1,0) DEFAULT 0, 
	"VENDORTAXPAYERCODE" VARCHAR(100 ), 
	"VENDORLASTNAME" VARCHAR(250 ), 
	"VENDORFIRSTNAME" VARCHAR(250 ), 
	"VENDORPATRONYMIC" VARCHAR(250 )
   )  
  ;
--------------------------------------------------------
--  DDL for Table OFRCRITERIONLINEVAL
--------------------------------------------------------

  CREATE TABLE "OFRCRITERIONLINEVAL" 
   (	"OFFER_ID" NUMERIC(15,0), 
	"CMPCRITERIONPOS" NUMERIC(15,0), 
	"SEQORDER" NUMERIC(15,0), 
	"CAPTION" VARCHAR(2000 ), 
	"VAL" VARCHAR(2000 ), 
	"ISFINALOFFER" NUMERIC(1,0) DEFAULT 0
   )  ;
--------------------------------------------------------
--  DDL for Table OFRCRITERIONVAL
--------------------------------------------------------

  CREATE TABLE "OFRCRITERIONVAL" 
   (	"OFFER_ID" NUMERIC(15,0), 
	"CMPCRITERIONPOS" NUMERIC(15,0), 
	"BESTPARAM" NUMERIC(1,0), 
	"NAME" VARCHAR(512 ), 
	"LOTPOS" NUMERIC(15,0), 
	"VAL" VARCHAR(255 ), 
	"WEIGHT" NUMERIC(15,2), 
	"CTYPE" NUMERIC(2,0), 
	"CALCMODE" NUMERIC(1,0), 
	"ISFINALOFFER" NUMERIC(1,0) DEFAULT 0, 
	"UNITNAME" VARCHAR(50 )
   )  ;
--------------------------------------------------------
--  DDL for Table OFRDECREASON
--------------------------------------------------------

  CREATE TABLE "OFRDECREASON" 
   (	"OFFER_ID" NUMERIC(15,0), 
	"LOTPOS" NUMERIC(15,0), 
	"POS" NUMERIC(15,0), 
	"NAME" VARCHAR(512 ), 
	"OFRRETREASONCODE" VARCHAR(20 ), 
	"OFRRETREASON_ID" NUMERIC(15,0), 
	"DESCRIPTION" VARCHAR(2000 )
   )  ;
--------------------------------------------------------
--  DDL for Table OFRDOCREQVAL
--------------------------------------------------------

  CREATE TABLE "OFRDOCREQVAL" 
   (	"OFFER_ID" NUMERIC(15,0), 
	"CMPDOCREQPOS" NUMERIC(15,0), 
	"LOTPOS" NUMERIC(15,0), 
	"DESCRIPTION" VARCHAR(1000 ), 
	"VAL" NUMERIC(1,0), 
	"VENDOR_TYPE" NUMERIC(2,0) DEFAULT 0, 
	"ISREQUIRED" NUMERIC(1,0) DEFAULT 1, 
	"REMARK" VARCHAR(2000 ), 
	"TYPE" NUMERIC(2,0) DEFAULT 0
   )  ;
--------------------------------------------------------
--  DDL for Table OFRGOODS
--------------------------------------------------------

  CREATE TABLE "OFRGOODS" 
   (	"OFFER_ID" NUMERIC(15,0), 
	"LOTPOS" NUMERIC(15,0), 
	"POS" NUMERIC(15,0), 
	"GROUPCODE" VARCHAR(20 ), 
	"GROUPCAPTION" VARCHAR(500 ), 
	"OKDP_CODE" VARCHAR(20 ), 
	"GOODSCODE" VARCHAR(20 ), 
	"GOODSCAPTION" VARCHAR(512 ), 
	"QTY" NUMERIC(15,4) DEFAULT 0, 
	"PRICE" NUMERIC(15,2) DEFAULT 0, 
	"AMOUNT" NUMERIC(15,2) DEFAULT 0, 
	"OKPD_CODE" VARCHAR(20 ), 
	"OKPD_NAME" VARCHAR(1000 ), 
	"OKPD_ID" NUMERIC(15,0), 
	"UNITNAME" VARCHAR(50 )
   )  ;
--------------------------------------------------------
--  DDL for Table OFRGOODSPROP
--------------------------------------------------------

  CREATE TABLE "OFRGOODSPROP" 
   (	"OFFER_ID" NUMERIC(15,0), 
	"GOODSPOS" NUMERIC(15,0), 
	"SEQORDER" NUMERIC(15,0), 
	"PROPTYPE_ID" NUMERIC(15,0), 
	"CAPTION" VARCHAR(512 ), 
	"PROPVALUE" VARCHAR(1500 )
   )  ;
--------------------------------------------------------
--  DDL for Table OFRGROUPPROP
--------------------------------------------------------

  CREATE TABLE "OFRGROUPPROP" 
   (	"OFFER_ID" NUMERIC(15,0), 
	"POS" NUMERIC(15,0), 
	"GROUPCODE" VARCHAR(20 ), 
	"SEQORDER" NUMERIC(2,0), 
	"CAPTION" VARCHAR(512 ), 
	"DESCRIPTION" VARCHAR(255 ), 
	"ISREQUIRED" NUMERIC(1,0) DEFAULT 0, 
	"DEFVALUE" VARCHAR(1500 ), 
	"PROPTYPE_ID" NUMERIC(15,0), 
	"GROUPPROP_ID" NUMERIC(15,0)
   )  ;
--------------------------------------------------------
--  DDL for Table OFRGROUPPROPVALUE
--------------------------------------------------------

  CREATE TABLE "OFRGROUPPROPVALUE" 
   (	"OFFER_ID" NUMERIC(15,0), 
	"GROUPPROPPOS" NUMERIC(15,0), 
	"SEQORDER" NUMERIC(5,0), 
	"CAPTION" VARCHAR(1500 )
   )  ;
--------------------------------------------------------
--  DDL for Table OFRLOT
--------------------------------------------------------

  CREATE TABLE "OFRLOT" 
   (	"OFFER_ID" NUMERIC(15,0), 
	"POS" NUMERIC(15,0), 
	"LOTNUMBER" NUMERIC(15,0), 
	"NAME" VARCHAR(2000 ), 
	"DELIVERYBASISCODE" VARCHAR(50 ), 
	"PAYCONDITIONNAME" VARCHAR(255 ), 
	"PROVIDINGAMOUNT" NUMERIC(15,2), 
	"ISUTILIZED" NUMERIC(1,0) DEFAULT 0, 
	"ISDECLINED" NUMERIC(1,0) DEFAULT 0, 
	"REMARK" VARCHAR(255 ), 
	"COMMENTS" VARCHAR(255 ), 
	"AMOUNT" NUMERIC(15,2) DEFAULT 0, 
	"ISLOTDECLINED" NUMERIC(1,0) DEFAULT 0, 
	"ISLOTREREGISTERED" NUMERIC(1,0) DEFAULT 0, 
	"OOS_DOC_NUMBER" VARCHAR(50 )
   )  ;
--------------------------------------------------------
--  DDL for Table OFRORGSTATUS
--------------------------------------------------------

  CREATE TABLE "OFRORGSTATUS" 
   (	"OFFER_ID" NUMERIC(15,0), 
	"ORGSTATUS_ID" NUMERIC(15,0)
   )  ;
--------------------------------------------------------
--  DDL for Table OFRPLACE
--------------------------------------------------------

  CREATE TABLE "OFRPLACE" 
   (	"OFFER_ID" NUMERIC(15,0), 
	"LOTPOS" NUMERIC(15,0), 
	"POS" NUMERIC(15,0), 
	"RECIPIENT_ID" NUMERIC(15,0), 
	"RECIPIENTNAME" VARCHAR(2000 ), 
	"COUNTRY_ID" NUMERIC(15,0), 
	"TERRITORYCODE" VARCHAR(20 ), 
	"ADDRESS" VARCHAR(300 ), 
	"CUSTOMER_ID" NUMERIC(15,0), 
	"SUPPLYAMOUNT" NUMERIC(15,2) DEFAULT 0, 
	"USEAMOUNT" NUMERIC(1,0) DEFAULT 0, 
	"CALCPRICE" NUMERIC(1,0) DEFAULT 0
   )  ;
--------------------------------------------------------
--  DDL for Table OFRQUALREQVAL
--------------------------------------------------------

  CREATE TABLE "OFRQUALREQVAL" 
   (	"OFFER_ID" NUMERIC(15,0), 
	"CMPQUALREQPOS" NUMERIC(15,0), 
	"LOTPOS" NUMERIC(15,0), 
	"NAME" VARCHAR(2000 ), 
	"QTYPE" NUMERIC(2,0), 
	"VAL" NUMERIC(15,4), 
	"QMINVALUE" NUMERIC(15,4), 
	"QMAXVALUE" NUMERIC(15,4), 
	"ISSATISFY" NUMERIC(1,0)
   )  ;
--------------------------------------------------------
--  DDL for Table OFRREQREASON
--------------------------------------------------------

  CREATE TABLE "OFRREQREASON" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"NAME" VARCHAR(1000 ), 
	"DESCRIPTION" VARCHAR(2000 ), 
	"ACTUAL" NUMERIC(1,0) DEFAULT 1, 
	"BUDGETTYPE" NUMERIC(1,0) DEFAULT 0
   )  ;
--------------------------------------------------------
--  DDL for Table OFRRETREASON
--------------------------------------------------------

  CREATE TABLE "OFRRETREASON" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"CODE" VARCHAR(20 ), 
	"REASON" VARCHAR(512 ), 
	"DESCRIPTION" VARCHAR(2000 ), 
	"ACTUAL" NUMERIC(1,0) DEFAULT 1, 
	"PURCHASEMODE_ID" NUMERIC(15,0), 
	"OOSKEY" VARCHAR(100 )
   )  ;
--------------------------------------------------------
--  DDL for Table OFRSUPPLYSHEDULE
--------------------------------------------------------

  CREATE TABLE "OFRSUPPLYSHEDULE" 
   (	"OFFER_ID" NUMERIC(15,0), 
	"PLACEPOS" NUMERIC(15,0), 
	"GOODSPOS" NUMERIC(15,0), 
	"SUPPLYDATE" DATE, 
	"QTY" NUMERIC(15,4) DEFAULT 0, 
	"AMOUNT" NUMERIC(15,2) DEFAULT 0, 
	"LOTPOS" NUMERIC(15,0)
   )  ;
--------------------------------------------------------
--  DDL for Table OIDREF
--------------------------------------------------------

  CREATE TABLE "OIDREF" 
   (	"ID" NUMERIC(18,0), 
	"VERSION" NUMERIC(15,0), 
	"OID" VARCHAR(100 ), 
	"DESCRIPTION" VARCHAR(255 )
   )  ;
--------------------------------------------------------
--  DDL for Table OKTMO
--------------------------------------------------------

  CREATE TABLE "OKTMO" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"CODE" VARCHAR(20 ), 
	"PARENT_CODE" VARCHAR(20 ), 
	"NAME" VARCHAR(500 ), 
	"ACTUAL" NUMERIC(1,0) DEFAULT 0, 
	"PARENT_ID" NUMERIC(15,0)
   )  ;
--------------------------------------------------------
--  DDL for Table OLAPQUERY
--------------------------------------------------------

  CREATE TABLE "OLAPQUERY" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"NAME" VARCHAR(100 )
   )  ;
--------------------------------------------------------
--  DDL for Table OOSAPPLICATION
--------------------------------------------------------

  CREATE TABLE "OOSAPPLICATION" 
   (	"NOTIFICATIONNUMBER" VARCHAR(19 ), 
	"LOTNUMBER" NUMERIC(15,0), 
	"JOURNALNUMBER" VARCHAR(20 ), 
	"APPDATE" DATE, 
	"ADMITTEDFIRST" NUMERIC(1,0) DEFAULT 0, 
	"COMMONINFO" VARCHAR(2000 ), 
	"LASTPRICE" NUMERIC(15,2), 
	"LASTPRICEDATE" DATE, 
	"PARTICIPANTPRESENT" NUMERIC(1,0) DEFAULT 0, 
	"PARTICIPANTTYPE" VARCHAR(2 ), 
	"PARTICIPANTINN" VARCHAR(12 ), 
	"PARTICIPANTKPP" VARCHAR(9 ), 
	"PARTICIPANTORGANIZATIONFORM" VARCHAR(3 ), 
	"PARTICIPANTIDNUMBER" VARCHAR(20 ), 
	"PARTICIPANTIDNUMBEREXTENSION" VARCHAR(20 ), 
	"PARTICIPANTORGANIZATIONNAME" VARCHAR(4000 ), 
	"PARTICIPANTCOUNTRYCODE" VARCHAR(3 ), 
	"PARTICIPANTFACTUALADDRESS" VARCHAR(1024 ), 
	"PARTICIPANTPOSTADDRESS" VARCHAR(1024 ), 
	"PARTICIPANTLASTNAME" VARCHAR(50 ), 
	"PARTICIPANTFIRSTNAME" VARCHAR(50 ), 
	"PARTICIPANTMIDDLENAME" VARCHAR(50 ), 
	"PARTICIPANTCONTACTEMAIL" VARCHAR(256 ), 
	"PARTICIPANTCONTACTPHONE" VARCHAR(30 ), 
	"PARTICIPANTCONTACTFAX" VARCHAR(30 ), 
	"PARTICIPANTADDITIONALINFO" VARCHAR(4000 ), 
	"PARTICIPANTSTATUS" VARCHAR(2 ), 
	"PARTICIPANTSCOUNT" NUMERIC(15,0) DEFAULT 0, 
	"ADMITTEDSECOND" NUMERIC(1,0) DEFAULT 0, 
	"APPRATING" NUMERIC(15,0), 
	"APPFORMAT" VARCHAR(1 ), 
	"RESULTTYPE" VARCHAR(17 ), 
	"EVALRESULT" NUMERIC(15,2), 
	"PREFEXPL" VARCHAR(2000 ), 
	"GENERALPREFS" NUMERIC(15,2), 
	"GOODSDELIVERED" VARCHAR(4000 ), 
	"EXPENSESINFO" VARCHAR(4000 )
   )  ;
--------------------------------------------------------
--  DDL for Table OOSCONTRACT
--------------------------------------------------------

  CREATE TABLE "OOSCONTRACT" 
   (	"ID" NUMERIC(15,0), 
	"REGNUM" VARCHAR(30 ), 
	"CONTRACTNUM" VARCHAR(100 ), 
	"PUBLISHDATE" DATE, 
	"SIGNDATE" DATE, 
	"VERSIONNUMBER" NUMERIC(15,0), 
	"NOTIFICATIONNUMBER" VARCHAR(100 ), 
	"LOTNUMBER" NUMERIC(15,0), 
	"PLACING" VARCHAR(5 ), 
	"SINGLECUSTOMER" NUMERIC(1,0) DEFAULT 0, 
	"CUSTOMERREGNUM" VARCHAR(11 ), 
	"CUSTOMERFULLNAME" VARCHAR(2000 ), 
	"CUSTOMERINN" VARCHAR(12 ), 
	"CUSTOMERKPP" VARCHAR(9 ), 
	"CUSTOMERTOFK" VARCHAR(4 ), 
	"PROTOCOLDATE" DATE, 
	"DOCUMENTBASE" VARCHAR(4000 ), 
	"PRICE" NUMERIC(15,2), 
	"CURRENCYCODE" VARCHAR(3 ), 
	"EXECUTIONMONTH" NUMERIC(15,0), 
	"EXECUTIONYEAR" NUMERIC(15,0), 
	"SUPPLIERSCOUNT" NUMERIC(15,0), 
	"ISACTUAL" NUMERIC(1,0) DEFAULT 0, 
	"CURRENTCONTRACTSTAGE" VARCHAR(2 ), 
	"BUDGETNAME" VARCHAR(2000 ), 
	"BUDGETLEVEL" VARCHAR(2 ), 
	"PLACINGTYPE" NUMERIC(1,0)
   )  ;
--------------------------------------------------------
--  DDL for Table OOSCONTRACTPRODUCTS
--------------------------------------------------------

  CREATE TABLE "OOSCONTRACTPRODUCTS" 
   (	"CONTRACT_ID" NUMERIC(15,0), 
	"POS" NUMERIC(15,0), 
	"OKDPCODE" VARCHAR(20 ), 
	"OKDPNAME" VARCHAR(1024 ), 
	"COUNTRYCODE" VARCHAR(3 ), 
	"COUNTRYFULLNAME" VARCHAR(200 ), 
	"OKEICODE" VARCHAR(3 ), 
	"OKEINAME" VARCHAR(200 ), 
	"PRICE" NUMERIC(15,2) DEFAULT 0, 
	"QUANTITY" NUMERIC(15,4) DEFAULT 0, 
	"AMOUNT" NUMERIC(15,2) DEFAULT 0, 
	"NAME" BLOB SUB_TYPE TEXT
   )  
  ;
--------------------------------------------------------
--  DDL for Table OOSCONTRACTSUPPLIER
--------------------------------------------------------

  CREATE TABLE "OOSCONTRACTSUPPLIER" 
   (	"CONTRACT_ID" NUMERIC(15,0), 
	"POS" NUMERIC(15,0), 
	"SUPPLIERTYPE" VARCHAR(2 ), 
	"INN" VARCHAR(12 ), 
	"KPP" VARCHAR(9 ), 
	"ORGANIZATIONFORM" VARCHAR(3 ), 
	"IDNUMBER" VARCHAR(20 ), 
	"IDNUMBEREXTENSION" VARCHAR(20 ), 
	"ORGANIZATIONNAME" VARCHAR(4000 ), 
	"COUNTRYCODE" VARCHAR(3 ), 
	"POSTADDRESS" VARCHAR(1024 ), 
	"LASTNAME" VARCHAR(50 ), 
	"FIRSTNAME" VARCHAR(50 ), 
	"MIDDLENAME" VARCHAR(50 ), 
	"CONTACTEMAIL" VARCHAR(256 ), 
	"CONTACTPHONE" VARCHAR(30 ), 
	"CONTACTFAX" VARCHAR(30 ), 
	"ADDITIONALINFO" VARCHAR(4000 ), 
	"STATUS" VARCHAR(2 ), 
	"FACTUALADDRESS" BLOB SUB_TYPE TEXT
   )  
  ;
--------------------------------------------------------
--  DDL for Table OOSCUSTOMERREQUIREMENT
--------------------------------------------------------

  CREATE TABLE "OOSCUSTOMERREQUIREMENT" 
   (	"ID" NUMERIC(15,0), 
	"NOTIFICATION_ID" NUMERIC(15,0), 
	"LOT_ID" NUMERIC(15,0), 
	"QUANTITY" VARCHAR(4000 ), 
	"MAXPRICE" NUMERIC(15,2), 
	"CUSTOMERREGNUM" VARCHAR(11 ), 
	"CUSTOMERFULLNAME" VARCHAR(2000 ), 
	"DELIVERYPLACE" VARCHAR(4000 ), 
	"DELIVERYTERM" VARCHAR(1024 ), 
	"GRNTAPPPROCEDURE" VARCHAR(4000 ), 
	"GRNTAPPSETTLEMENTACCOUNT" VARCHAR(20 ), 
	"GRNTAPPPERSONALACCOUNT" VARCHAR(30 ), 
	"GRNTAPPBIK" VARCHAR(9 ), 
	"GRNTAPPAMOUNT" NUMERIC(15,2), 
	"GRNTCONTRPROCEDURE" VARCHAR(4000 ), 
	"GRNTCONTRSETTLEMENTACCOUNT" VARCHAR(20 ), 
	"GRNTCONTRPERSONALACCOUNT" VARCHAR(30 ), 
	"GRNTCONTRBIK" VARCHAR(9 ), 
	"GRNTCONTRISBAIL" NUMERIC(1,0), 
	"GRNTCONTRAMOUNT" NUMERIC(15,2), 
	"ADDITIONALINFO" VARCHAR(4000 ), 
	"QUANTITYCONTRACTSPNIR" NUMERIC(15,0), 
	"FINANCESOURCE" VARCHAR(2000 ), 
	"PAYMENTCONDITION" VARCHAR(2000 )
   )  ;
--------------------------------------------------------
--  DDL for Table OOSNOTIFICATION
--------------------------------------------------------

  CREATE TABLE "OOSNOTIFICATION" 
   (	"ID" NUMERIC(15,0), 
	"NOTIFICATIONNUMBER" VARCHAR(19 ), 
	"VERSIONNUMBER" NUMERIC(15,0), 
	"CREATEDATE" DATE, 
	"PLACINGWAYCODE" VARCHAR(3 ), 
	"PLACINGWAYNAME" VARCHAR(500 ), 
	"ORDERNAME" VARCHAR(2000 ), 
	"INITIATORREGNUM" VARCHAR(11 ), 
	"INITIATORFULLNAME" VARCHAR(2000 ), 
	"INITIATORORGROLE" VARCHAR(1 ), 
	"PLACERREGNUM" VARCHAR(11 ), 
	"PLACERFULLNAME" VARCHAR(2000 ), 
	"PLACERORGROLE" VARCHAR(2 ), 
	"CONTACTORGNAME" VARCHAR(4000 ), 
	"PUBLISHDATE" DATE, 
	"MODIFICATIONINITIATIVETYPE" VARCHAR(2 ), 
	"MODIFICATIONDATE" DATE, 
	"MODIFICATIONINFO" VARCHAR(4000 ), 
	"P1DATE" DATE, 
	"P2DATE" DATE, 
	"P3DATE" DATE, 
	"EPCODE" VARCHAR(20 ), 
	"EPNAME" VARCHAR(20 ), 
	"EPURL" VARCHAR(50 ), 
	"LOTCOUNT" NUMERIC(15,0), 
	"REGIONNAME" VARCHAR(2000 ), 
	"P1PLACE" VARCHAR(4000 ), 
	"P2PLACE" VARCHAR(4000 ), 
	"P3PLACE" VARCHAR(4000 ), 
	"PLACEMENTDELIVERYTERM" VARCHAR(1024 ), 
	"PLACEMENTDELIVERYPLACE" VARCHAR(1024 ), 
	"PLACEMENTADDITIONALINFO" VARCHAR(4000 ), 
	"GRNTAPPPROCEDURE" VARCHAR(4000 ), 
	"GRNTAPPSETTLEMENTACCOUNT" VARCHAR(20 ), 
	"GRNTAPPPERSONALACCOUNT" VARCHAR(30 ), 
	"GRNTAPPBIK" VARCHAR(9 ), 
	"GRNTCONTRPROCEDURE" VARCHAR(4000 ), 
	"GRNTCONTRSETTLEMENTACCOUNT" VARCHAR(20 ), 
	"GRNTCONTRPERSONALACCOUNT" VARCHAR(30 ), 
	"GRNTCONTRBIK" VARCHAR(9 ), 
	"GRNTCONTRISBAIL" NUMERIC(1,0), 
	"DOCDELIVERYTERM" DATE, 
	"DOCDELIVERYTERM2" DATE, 
	"DOCDELIVERYPLACE" VARCHAR(2000 ), 
	"DOCDELIVERYPROCEDURE" VARCHAR(1028 ), 
	"DOCWWW" VARCHAR(4000 ), 
	"DOCGRNTPROCEDURE" VARCHAR(4000 ), 
	"DOCGRNTSETTLEMENTACCOUNT" VARCHAR(20 ), 
	"DOCGRNTPERSONALACCOUNT" VARCHAR(30 ), 
	"DOCGRNTBIK" VARCHAR(9 ), 
	"DOCGRNTCONTRAMOUNT" NUMERIC(15,2), 
	"DOCGRNTCURRENCYCODE" VARCHAR(3 ), 
	"SIGNTERM" NUMERIC(15,0), 
	"ISACTUAL" NUMERIC(1,0) DEFAULT 0, 
	"NOTIFICATIONTYPE" VARCHAR(2 )
   )  ;
--------------------------------------------------------
--  DDL for Table OOSNOTIFICATIONLOT
--------------------------------------------------------

  CREATE TABLE "OOSNOTIFICATIONLOT" 
   (	"ID" NUMERIC(15,0), 
	"NOTIFICATION_ID" NUMERIC(15,0), 
	"ORDINALNUMBER" NUMERIC(15,0), 
	"CUSTOMERCOUNT" NUMERIC(15,0), 
	"SUBJECT" VARCHAR(2000 ), 
	"ISENTERPRISE" NUMERIC(1,0) DEFAULT 0
   )  ;
--------------------------------------------------------
--  DDL for Table OOSORGANIZATION
--------------------------------------------------------

  CREATE TABLE "OOSORGANIZATION" 
   (	"REGNUMBER" VARCHAR(11 ), 
	"SHORTNAME" VARCHAR(2000 ), 
	"FULLNAME" VARCHAR(2000 ), 
	"FACTOKATO" VARCHAR(20 ), 
	"FACTADDRESSLINE" VARCHAR(2000 ), 
	"FACTAREAKLADRTYPE" VARCHAR(1 ), 
	"FACTAREAKLADRCODE" VARCHAR(20 ), 
	"FACTAREAFULLNAME" VARCHAR(200 ), 
	"FACTBUILDING" VARCHAR(200 ), 
	"FACTCOUNTRYCODE" VARCHAR(3 ), 
	"FACTCOUNTRYFULLNAME" VARCHAR(200 ), 
	"FACTFILLEDMANUALLY" NUMERIC(1,0) DEFAULT 0, 
	"FACTOFFICE" VARCHAR(200 ), 
	"FACTREGIONKLADRTYPE" VARCHAR(1 ), 
	"FACTREGIONKLADRCODE" VARCHAR(20 ), 
	"FACTREGIONFULLNAME" VARCHAR(200 ), 
	"FACTSETTLEMENTKLADRTYPE" VARCHAR(1 ), 
	"FACTSETTLEMENTKLADRCODE" VARCHAR(20 ), 
	"FACTSETTLEMENTFULLNAME" VARCHAR(200 ), 
	"FACTCITYKLADRTYPE" VARCHAR(1 ), 
	"FACTCITYKLADRCODE" VARCHAR(20 ), 
	"FACTCITYFULLNAME" VARCHAR(200 ), 
	"FACTSHORTSTREET" VARCHAR(200 ), 
	"FACTSTREETKLADRTYPE" VARCHAR(1 ), 
	"FACTSTREETKLADRCODE" VARCHAR(20 ), 
	"FACTSTREETFULLNAME" VARCHAR(200 ), 
	"FACTZIP" VARCHAR(6 ), 
	"POSTALADDRESS" VARCHAR(200 ), 
	"EMAIL" VARCHAR(256 ), 
	"PHONE" VARCHAR(30 ), 
	"FAX" VARCHAR(30 ), 
	"CONTACTLASTNAME" VARCHAR(50 ), 
	"CONTACTFIRSTNAME" VARCHAR(50 ), 
	"CONTACTMIDDLENAME" VARCHAR(50 ), 
	"HEADAGENCYREGNUM" VARCHAR(11 ), 
	"HEADAGENCYFULLNAME" VARCHAR(2000 ), 
	"ORDERINGAGENCYREGNUM" VARCHAR(11 ), 
	"ORDERINGAGENCYFULLNAME" VARCHAR(2000 ), 
	"INN" VARCHAR(12 ), 
	"KPP" VARCHAR(9 ), 
	"OGRN" VARCHAR(13 ), 
	"OKOPFCODE" VARCHAR(2 ), 
	"OKOPFFULLNAME" VARCHAR(200 ), 
	"OKOPFASSEMBLYALGORITHM" VARCHAR(250 ), 
	"OKPO" VARCHAR(11 ), 
	"OKVED" VARCHAR(2000 ), 
	"ORGANIZATIONTYPEID" NUMERIC(15,0), 
	"ORGANIZATIONTYPENAME" VARCHAR(20 ), 
	"ORGANIZATIONTYPEDESCRIPTION" VARCHAR(200 ), 
	"SUBORDINATIONTYPEID" NUMERIC(15,0), 
	"SUBORDINATIONTYPEDESCRIPTION" VARCHAR(200 ), 
	"URL" VARCHAR(40 ), 
	"TIMEZONE" NUMERIC(15,0)
   )  ;
--------------------------------------------------------
--  DDL for Table OOSORGANIZATIONROLE
--------------------------------------------------------

  CREATE TABLE "OOSORGANIZATIONROLE" 
   (	"REGNUMBER" VARCHAR(11 ), 
	"ORGROLE" VARCHAR(2 )
   )  ;
--------------------------------------------------------
--  DDL for Table OOSORGROLE
--------------------------------------------------------

  CREATE TABLE "OOSORGROLE" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"CODE" VARCHAR(10 ), 
	"CAPTION" VARCHAR(255 )
   )  ;
--------------------------------------------------------
--  DDL for Table OOSORGROLES
--------------------------------------------------------

  CREATE TABLE "OOSORGROLES" 
   (	"ORG_ID" NUMERIC(15,0), 
	"ROLECODE" VARCHAR(10 )
   )  ;
--------------------------------------------------------
--  DDL for Table OOSPRODUCTS
--------------------------------------------------------

  CREATE TABLE "OOSPRODUCTS" 
   (	"NOTIFICATION_ID" NUMERIC(15,0), 
	"LOT_ID" NUMERIC(15,0), 
	"CODE" VARCHAR(20 ), 
	"NAME" VARCHAR(1024 )
   )  ;
--------------------------------------------------------
--  DDL for Table OOSPROTOCOL
--------------------------------------------------------

  CREATE TABLE "OOSPROTOCOL" 
   (	"NOTIFICATIONNUMBER" VARCHAR(19 ), 
	"PROTOCOLNUMBER" VARCHAR(25 ), 
	"VERSIONNUMBER" NUMERIC(15,0), 
	"PROTOCOLTYPE" VARCHAR(20 ), 
	"FOUNDATIONPROTOCOLNUMBER" VARCHAR(24 ), 
	"PARENTPROTOCOLNUMBER" VARCHAR(24 ), 
	"PLACE" VARCHAR(4000 ), 
	"PROTOCOLDATE" DATE, 
	"SIGNDATE" DATE, 
	"PUBLISHDATE" DATE, 
	"COMMISSIONREGNUMBER" NUMERIC(15,0), 
	"COMMISSIONNAME" VARCHAR(2000 ), 
	"LOTCOUNT" NUMERIC(15,0), 
	"ISACTUAL" NUMERIC(1,0) DEFAULT 0
   )  ;
--------------------------------------------------------
--  DDL for Table OOSPROTOCOLLOT
--------------------------------------------------------

  CREATE TABLE "OOSPROTOCOLLOT" 
   (	"NOTIFICATIONNUMBER" VARCHAR(19 ), 
	"PROTOCOLNUMBER" VARCHAR(25 ), 
	"PROTOCOLVERSIONNUMBER" NUMERIC(15,0), 
	"PROTOCOLTYPE" VARCHAR(20 ), 
	"LOTNUMBER" NUMERIC(15,0), 
	"APPLICATIONCOUNT" NUMERIC(15,0), 
	"ALLABSENT" NUMERIC(1,0)
   )  ;
--------------------------------------------------------
--  DDL for Table OOS223PURCHASENOTICEINFO
--------------------------------------------------------

  CREATE TABLE "OOS223PURCHASENOTICEINFO" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"GUID" VARCHAR(36 ), 
	"REGISTRATIONNUMBER" NUMERIC(11,0)
   )  ;
--------------------------------------------------------
--  DDL for Table OOS223PURCHNOTICELOTINFO
--------------------------------------------------------

  CREATE TABLE "OOS223PURCHNOTICELOTINFO" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"OOS223PURCHASENOTICEINFO_ID" NUMERIC(15,0), 
	"GUID" VARCHAR(36 ), 
	"ORDINALNUMBER" NUMERIC(15,0)
   )  ;
--------------------------------------------------------
--  DDL for Table OPERTYPE
--------------------------------------------------------

  CREATE TABLE "OPERTYPE" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"CAPTION" VARCHAR(100 )
   )  ;
--------------------------------------------------------
--  DDL for Table ORDERDOC
--------------------------------------------------------

  CREATE TABLE "ORDERDOC" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"DOCUMENT_ID" NUMERIC(15,0), 
	"DOCUMENTCLASS_ID" NUMERIC(15,0), 
	"DISPSTATUS_ID" NUMERIC(15,0), 
	"OPERTYPE_ID" NUMERIC(15,0) DEFAULT 0, 
	"BUDGET_ID" NUMERIC(15,0), 
	"DOC_NUMBER" VARCHAR(20 ), 
	"DOC_DATE" DATE, 
	"AMOUNT" NUMERIC(15,2) DEFAULT 0, 
	"VENDOR_ID" NUMERIC(15,0), 
	"VENDORTAXCODE" VARCHAR(20 ), 
	"VENDORKPP" VARCHAR(20 ), 
	"VENDORPROPFORM_ID" NUMERIC(15,0), 
	"MINSCORE" NUMERIC(10,4) DEFAULT 0, 
	"MAXSCORE" NUMERIC(10,4) DEFAULT 0, 
	"REMARK" VARCHAR(255 ), 
	"FOREIGN_KEY" VARCHAR(50 ), 
	"ISGROUPSMOREONE" NUMERIC(1,0), 
	"HASCONTRACTORWORK" NUMERIC(1,0) DEFAULT 0, 
	"ENTERPRISE" NUMERIC(1,0) DEFAULT 0, 
	"CONTROLFLAGS" NUMERIC(15,0) DEFAULT 0, 
	"AUCTIONSTEP" NUMERIC(15,2), 
	"STARTTIME" DATE, 
	"PROLONGCOUNT" NUMERIC(15,0) DEFAULT 0, 
	"EXPORT_FLAG" NUMERIC(1,0) DEFAULT 0, 
	"ISASSIGNRELEASED" NUMERIC(1,0) DEFAULT 0, 
	"CONTYPE_ID" NUMERIC(15,0), 
	"AUCTIONEERPOS" NUMERIC(15,0), 
	"OPENINGDATE" DATE, 
	"SELECTDATE" DATE, 
	"PROCESS_DATE" DATE, 
	"REFUSE_DATE" DATE, 
	"PROCESS_BEFORE_DATE" DATE, 
	"PRICE_GENERATION_ORDER" BLOB SUB_TYPE TEXT, 
	"PLAN_DEALDATE" DATE, 
	"PLAN_INVITATIONDATE" DATE, 
	"OOSKEYREFUSE" VARCHAR(100 ), 
	"OOSKEY" VARCHAR(100 ), 
	"OOS_DOC_NUMBER" VARCHAR(50 ), 
	"LOTOOSKEY" VARCHAR(100 ), 
	"OOSATTACHPACKETCNT" NUMERIC(15,0) DEFAULT -1, 
	"DOCDELIVERYTERMBEGIN" DATE, 
	"DOCDELIVERYTERMEND" DATE, 
	"DOCDELIVERYPROCEDURE" VARCHAR(1028 ), 
	"ISDOCFEEBAIL" NUMERIC(1,0) DEFAULT 0, 
	"DOCFEEPERSONALACC_ID" NUMERIC(15,0), 
	"DOCFEESETTLEMENTACC_ID" NUMERIC(15,0), 
	"DOCFEESETTLEMENTBIC" VARCHAR(15 ), 
	"DOCFEECURRENCY_ID" NUMERIC(15,0), 
	"DOCFEEAMOUNT" NUMERIC(15,2) DEFAULT 0, 
	"OOSFOUNDATIONPROTOCOLNUMBER" VARCHAR(30 ), 
	"PURCHASEMODE_ID" NUMERIC(15,0), 
	"PURCHASEMODE_CAPTION" VARCHAR(500 ), 
	"DELIVERYBASISCODE" VARCHAR(50 ), 
	"PAYCONDITIONNAME" VARCHAR(255 ), 
	"CMPORG_ID" NUMERIC(15,0), 
	"CMPDATE" DATE, 
	"ACCEPTDATE" DATE, 
	"EXTRA" BLOB SUB_TYPE TEXT, 
	"NOTICE" BLOB SUB_TYPE TEXT, 
	"ACCEPTSTARTDATE" DATE, 
	"PLACINGWAY_ID" NUMERIC(15,0), 
	"QUANTITYCONTRACTSPNIR" NUMERIC(15,0), 
	"DOCDEVELOPER_ID" NUMERIC(15,0), 
	"FINISHDATE" DATE, 
	"ISAMOUNTPERCENT" NUMERIC(1,0) DEFAULT 0, 
	"AMOUNTPERCENT" NUMERIC(3,2), 
	"DOCLANGUAGE" VARCHAR(500 ), 
	"CURRENCY_ID" NUMERIC(15,0), 
	"CURRENCY_CODE" VARCHAR(3 ), 
	"PURCHASEORG_ID" NUMERIC(15,0), 
	"PURCHASEORGNAMECACHE_ID" NUMERIC(15,0), 
	"CURYEARAMOUNT" NUMERIC(15,2) DEFAULT 0, 
	"FUTYEARAMOUNT" NUMERIC(15,2) DEFAULT 0, 
	"SINGLECUSTOMERREASON_ID" NUMERIC(15,0), 
	"OFRREQREASON_ID" NUMERIC(15,0), 
	"DOCDELIVERYMODE" BLOB SUB_TYPE TEXT, 
	"AUCTIONREGPROCEDURE" BLOB SUB_TYPE TEXT, 
	"PRESELECTIONPLACE" BLOB SUB_TYPE TEXT, 
	"LIMITCONDEFINITION" BLOB SUB_TYPE TEXT, 
	"GOODSLIMITS" BLOB SUB_TYPE TEXT, 
	"COLLECTINGORDER" BLOB SUB_TYPE TEXT, 
	"CONTRACTINGTERM" BLOB SUB_TYPE TEXT, 
	"CANCEL_DATE" DATE, 
	"CANCEL_NUMBER" VARCHAR(100 ), 
	"CANCEL_PLANPUBLISHDATE" DATE, 
	"CANCEL_INITIATIVETYPE" VARCHAR(2 ), 
	"CANCEL_AUTHORITYTYPE" VARCHAR(2 ), 
	"CANCEL_AUTHORITYNAME" BLOB SUB_TYPE TEXT, 
	"CANCEL_DOCDATE" DATE, 
	"CANCEL_DOCNUMBER" VARCHAR(100 ), 
	"CANCEL_DOCNAME" BLOB SUB_TYPE TEXT, 
	"CANCEL_CHECKRESULT_NUMBER" VARCHAR(30 ), 
	"CANCEL_PRESCRIPTION_NUMBER" VARCHAR(30 ), 
	"CANCEL_ADDINFO" BLOB SUB_TYPE TEXT, 
	"SECONDPART_ACCEPTSTARTDATE" DATE, 
	"SECONDPART_ACCEPTPLACE" BLOB SUB_TYPE TEXT, 
	"SECONDPART_ACCEPTORDER" BLOB SUB_TYPE TEXT, 
	"SECONDPART_OPENINGDATE" DATE, 
	"SECONDPART_OPENINGPLACE" BLOB SUB_TYPE TEXT, 
	"SECONDPART_CMPDATE" DATE, 
	"SECONDPART_CMPPLACE" BLOB SUB_TYPE TEXT, 
	"CHANGE_DOCNAME" BLOB SUB_TYPE TEXT, 
	"CHANGE_ADDITIONALINFO" BLOB SUB_TYPE TEXT, 
	"NECESSITY_ID" NUMERIC(15,0) DEFAULT 0, 
	"NECESSITY_DESCRIPTION" VARCHAR(1000 ), 
	"REPNOTICE_ID" NUMERIC(15,0), 
	"ETP_ID" NUMERIC(15,0), 
	"OOSETPCODE" VARCHAR(20 ), 
	"ETPKEY" VARCHAR(100 ), 
	"CMPORGTAXCODE" VARCHAR(20 ), 
	"CMPORGKPP" VARCHAR(20 ), 
	"CMPORGFACTCOUNTRY_ID" NUMERIC(15,0), 
	"CMPORGFACTPOSTINDEX" VARCHAR(10 ), 
	"CMPORGFACTTERRITORYCODE" VARCHAR(20 ), 
	"CMPORGFACTADDRESS" VARCHAR(300 ), 
	"CMPORGPOSTCOUNTRY_ID" NUMERIC(15,0), 
	"CMPORGPOSTPOSTINDEX" VARCHAR(10 ), 
	"CMPORGPOSTTERRITORYCODE" VARCHAR(20 ), 
	"CMPORGPOSTADDRESS" VARCHAR(300 ), 
	"CMPORGFAX" VARCHAR(100 ), 
	"CMPORGPHONE" VARCHAR(100 ), 
	"CMPORGEMAIL" VARCHAR(256 ), 
	"CHANGE_INITIATIVETYPE" VARCHAR(2 ), 
	"CHANGE_AUTHORITYTYPE" VARCHAR(2 ), 
	"CHANGE_AUTHORITYNAME" VARCHAR(100 ), 
	"CHANGE_DATE" DATE, 
	"CHANGE_DESNUMBER" VARCHAR(350 ), 
	"ENERGYTYPE" VARCHAR(3 ), 
	"SIGNTERM" NUMERIC(15,0), 
	"FIRSTPARTETPKEY" VARCHAR(100 ), 
	"SECONDPARTETPKEY" VARCHAR(100 ), 
	"PRESCRIPTION_DATE" DATE, 
	"PRESCRIPTION_NUMBER" VARCHAR(30 ), 
	"CHECKRESULT_NUMBER" VARCHAR(30 ), 
	"COMMISSION_ID" NUMERIC(15,0), 
	"NOPUBLICDISCUSSION" NUMERIC(1,0) DEFAULT 0, 
	"FIRSTPUBLICDISCUSSIONCOMPLETE" NUMERIC(1,0) DEFAULT 0, 
	"PUBLICDISCUSSIONLINK" BLOB SUB_TYPE TEXT, 
	"PRICEFORMULA" BLOB SUB_TYPE TEXT, 
	"STANDARDCONTRACTNUMBER" VARCHAR(16 ), 
	"ALLOWMULTIPLECONTRACTS" NUMERIC(1,0) DEFAULT 0, 
	"OOSFACTSTARTDATE" DATE, 
	"CMPNAMEOFPURCHORDER" BLOB SUB_TYPE TEXT, 
	"CMPTYPE" NUMERIC(1,0) DEFAULT 0, 
	"CMPPARTICIPATION" NUMERIC(1,0) DEFAULT 0, 
	"ISVATAMOUNT" NUMERIC(1,0) DEFAULT 0, 
	"CMPORG_NEGOTIATE_CONTRACT" NUMERIC(1,0) DEFAULT 0, 
	"OFFERS_OUTSIDE_ETP" NUMERIC(1,0) DEFAULT 0, 
	"AUCTION_FINISH_TYPE" NUMERIC(1,0) DEFAULT 0, 
	"AUCTION_FINISH_DATE" DATE, 
	"AUCTION_PROLONGATION" NUMERIC(15,0), 
	"VAT" NUMERIC(1,0) DEFAULT 0, 
	"VATRATE" NUMERIC(15,4), 
	"CONTRACT_SIGN_TERM" NUMERIC(15,0), 
	"CONTRACT_DEAL_TERM" NUMERIC(15,0), 
	"POTENTIALCONTRACTORSNUMBER" NUMERIC(15,0), 
	"BIDAFTERYOURSELF" NUMERIC(1,0) DEFAULT 0, 
	"AUCTIONWITHSTEP" NUMERIC(1,0) DEFAULT 0, 
	"AUCTIONSTEPTYPE" NUMERIC(1,0) DEFAULT 0, 
	"AUCTIONSTEPVALUE" NUMERIC(15,4), 
	"AUCTIONBIDBYSTEP" NUMERIC(1,0) DEFAULT 0, 
	"AUCTIONMINSTEPLIMIT" NUMERIC(15,4), 
	"AUCTIONZEROBID" NUMERIC(1,0) DEFAULT 0, 
	"AUCTIONDIVISIBLEBID" NUMERIC(1,0) DEFAULT 0, 
	"AUCTIONAUTOSTEPDEC" NUMERIC(1,0) DEFAULT 0, 
	"AUCTIONSTEPDECVALUE" NUMERIC(15,4), 
	"AUCTIONSTEPDECLIMIT" NUMERIC(15,4), 
	"AUCTIONDECINTERVAL" NUMERIC(15,0), 
	"DOCWEBADDRESS" BLOB SUB_TYPE TEXT, 
	"P1PLACE" BLOB SUB_TYPE TEXT, 
	"P2PLACE" BLOB SUB_TYPE TEXT, 
	"P3PLACE" BLOB SUB_TYPE TEXT, 
	"CHANGE_DESCRIPTION" BLOB SUB_TYPE TEXT, 
	"P1PLACELTD" BLOB SUB_TYPE TEXT, 
	"P2PLACELTD" BLOB SUB_TYPE TEXT, 
	"EVADEDMEMBERCONDITION" BLOB SUB_TYPE TEXT, 
	"RATIONALEPRICE" BLOB SUB_TYPE TEXT, 
	"DOCFEEPAYPROCEDURE" BLOB SUB_TYPE TEXT, 
	"VENDORNAME" BLOB SUB_TYPE TEXT, 
	"DESCRIPTION" BLOB SUB_TYPE TEXT, 
	"COMMISSION_ISSUE" BLOB SUB_TYPE TEXT, 
	"SUBJECT" BLOB SUB_TYPE TEXT, 
	"CMPORGNAME" BLOB SUB_TYPE TEXT, 
	"CMPNAME" BLOB SUB_TYPE TEXT, 
	"ENERGYSERVICEECONOMY" BLOB SUB_TYPE TEXT, 
	"DOCDELIVERYPLACE" BLOB SUB_TYPE TEXT, 
	"APPFORM" BLOB SUB_TYPE TEXT, 
	"SPECIALORG_ID" NUMERIC(15,0), 
	"SPECIALORG_NAME" BLOB SUB_TYPE TEXT, 
	"CMPORGOOSROLE" NUMERIC(1,0), 
	"PROCEDUREOOSVERSION" NUMERIC(15,0), 
	"RECIPIENT_ID" NUMERIC(15,0), 
	"RECIPIENTNAME" BLOB SUB_TYPE TEXT, 
	"PARENTLOTNUMBER" NUMERIC(15,0)
   )  
  ;
--------------------------------------------------------
--  DDL for Table ORDERSUMMARY
--------------------------------------------------------

  CREATE TABLE "ORDERSUMMARY" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"ORDER_ID" NUMERIC(15,0), 
	"CUSTOMER_ID" NUMERIC(15,0), 
	"CMPLOTPOS" NUMERIC(15,0), 
	"AMOUNT" NUMERIC(15,2) DEFAULT 0, 
	"FIRSTCONTRACT_ID" NUMERIC(15,0), 
	"LASTCONTRACT_ID" NUMERIC(15,0), 
	"CMPBUDGETLINEPOS" NUMERIC(15,0), 
	"CMPGOODSPOS" NUMERIC(15,0), 
	"RESULT" NUMERIC(15,0) DEFAULT 0, 
	"LASTPHASECODE" NUMERIC(1,0) DEFAULT 0, 
	"LASTPHASEDATE" DATE
   )  ;
--------------------------------------------------------
--  DDL for Table ORG
--------------------------------------------------------

  CREATE TABLE "ORG" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"NAME" VARCHAR(50 ), 
	"CAPTION" VARCHAR(255 ), 
	"TAXCODE" VARCHAR(20 ), 
	"KPP" VARCHAR(20 ), 
	"OKPO" VARCHAR(20 ), 
	"OKONH" VARCHAR(20 ), 
	"LAW_ADDRESS" VARCHAR(300 ), 
	"ADDRESS" VARCHAR(300 ), 
	"DIRECTOR_NAME" VARCHAR(100 ), 
	"ACCOUNTANT_NAME" VARCHAR(100 ), 
	"CLOSE_DATE" DATE, 
	"COMPEXTRA" BLOB SUB_TYPE TEXT, 
	"QUOTEXTRA" BLOB SUB_TYPE TEXT, 
	"CERT_ID" NUMERIC(15,0), 
	"AUCTIONEXTRA" BLOB SUB_TYPE TEXT, 
	"SELECTIONEXTRA" BLOB SUB_TYPE TEXT, 
	"CUSTOMERCODE" VARCHAR(5 ), 
	"ACTIONPLACE" VARCHAR(255 ), 
	"AUCTIONREGPROCEDURE" VARCHAR(255 ), 
	"OOSKEY" VARCHAR(100 ), 
	"DOCWEBADDRESS" BLOB SUB_TYPE TEXT, 
	"DOCDELIVERYPLACE" VARCHAR(255 ), 
	"DOCDELIVERYPROCEDURE" BLOB SUB_TYPE TEXT, 
	"ISDOCFEEBAIL" NUMERIC(1,0) DEFAULT 0, 
	"DOCFEEPERSONALACC_ID" NUMERIC(15,0), 
	"DOCFEESETTLEMENTACC_ID" NUMERIC(15,0), 
	"OOSUSERNAME" VARCHAR(100 ), 
	"OOSPASSWORD" VARCHAR(100 ), 
	"DEFACCEPTSTARTTIME" DATE, 
	"DEFACCEPTTIME" DATE, 
	"DEFQUOTREQFORM" BLOB SUB_TYPE TEXT, 
	"DEFDELIVERYTERM" BLOB SUB_TYPE TEXT, 
	"DEFPAYMENTCONDITION" BLOB SUB_TYPE TEXT, 
	"DEFEVADEDMEMBERCONDITION" BLOB SUB_TYPE TEXT, 
	"DEFOFRREQOFFERSREGLAMENT" BLOB SUB_TYPE TEXT, 
	"DOCLANGUAGE" VARCHAR(500 ), 
	"CONSERVICEINFO" BLOB SUB_TYPE TEXT, 
	"OKTMO" VARCHAR(20 ), 
	"DOCDELIVERYMODE" BLOB SUB_TYPE TEXT, 
	"CUSTCANREFUSEINFO" BLOB SUB_TYPE TEXT, 
	"COLLECTINGORDER" BLOB SUB_TYPE TEXT, 
	"CONTRACTINGTERM" BLOB SUB_TYPE TEXT, 
	"DEFQUOTREQUESTPLACE" BLOB SUB_TYPE TEXT, 
	"PUBLICENTITYNAME" BLOB SUB_TYPE TEXT, 
	"COUNTRY_ID" NUMERIC(15,0), 
	"FOREIGNKEY" VARCHAR(50 ), 
	"TERRITORY_ID" NUMERIC(15,0), 
	"LAWTERRITORY_ID" NUMERIC(15,0), 
	"FACTERRITORY_ID" NUMERIC(15,0), 
	"FAC_ADDRESS" VARCHAR(300 ), 
	"FAC_POSTINDEX" VARCHAR(10 ), 
	"LAW_POSTINDEX" VARCHAR(10 ), 
	"PHONE" VARCHAR(100 ), 
	"FAX" VARCHAR(100 ), 
	"EMAIL" VARCHAR(256 ), 
	"REGDATE" DATE, 
	"REGPLACE" VARCHAR(255 ), 
	"REGYEAR" NUMERIC(4,0), 
	"ISTAXCODEFREE" NUMERIC(1,0) DEFAULT 0, 
	"PARENT_ID" NUMERIC(15,0), 
	"POSTINDEX" VARCHAR(10 ), 
	"PROPFORM_ID" NUMERIC(15,0), 
	"SERVEORG_ID" NUMERIC(15,0), 
	"OGRN" VARCHAR(13 ), 
	"ISCONTRACTOR" NUMERIC(1,0) DEFAULT 0, 
	"DESCRIPTION" VARCHAR(2000 ), 
	"PROP_FORM" VARCHAR(2000 ), 
	"REQUESTORDERLTD" VARCHAR(4000 ), 
	"KLARD_REGION" VARCHAR(255 ), 
	"KLARD_REGIONCODE" VARCHAR(20 ), 
	"KLARD_DISTRICT" VARCHAR(255 ), 
	"KLARD_DISTRICTCODE" VARCHAR(20 ), 
	"KLARD_CITY" VARCHAR(255 ), 
	"KLARD_CITYCODE" VARCHAR(20 ), 
	"KLARD_LOCALITY" VARCHAR(255 ), 
	"KLARD_LOCALITYCODE" VARCHAR(20 ), 
	"KLARD_STREET" VARCHAR(255 ), 
	"KLARD_STREETCODE" VARCHAR(20 ), 
	"KLARD_HOUSE" VARCHAR(200 ), 
	"KLARD_APPARTMENT" VARCHAR(200 ), 
	"STARTPLDATE" DATE, 
	"EXPIREPLDATE" DATE, 
	"ISPLPUBLIC" NUMERIC(1,0) DEFAULT 0, 
	"INTERNAL_CUSTOMERCODE" VARCHAR(20 ), 
	"OOS223FZKEY" VARCHAR(100 ), 
	"OOS223FZOFRREQCODE" NUMERIC(15,0), 
	"OKTMO_ID" NUMERIC(15,0), 
	"IKU" VARCHAR(20 ), 
	"ORGTYPE" NUMERIC(1,0) DEFAULT 0, 
	"LASTNAME" VARCHAR(250 ), 
	"FIRSTNAME" VARCHAR(250 ), 
	"PATRONYMIC" VARCHAR(250 ), 
	"SHORTNAME" VARCHAR(2000 ), 
	"COMPANYNAME" VARCHAR(2000 ), 
	"TAXPAYERCODE" VARCHAR(100 ), 
	"OKOGU" VARCHAR(20 ), 
	"DIRECTOR_ID" NUMERIC(15,0), 
	"ACCOUNTANT_ID" NUMERIC(15,0), 
	"WEBSITE" VARCHAR(2000 ), 
	"KLARD_REGIONSOCR" VARCHAR(10 ), 
	"KLARD_DISTRICTSOCR" VARCHAR(10 ), 
	"KLARD_CITYSOCR" VARCHAR(10 ), 
	"KLARD_LOCALITYSOCR" VARCHAR(10 ), 
	"KLARD_STREETSOCR" VARCHAR(10 ), 
	"OKVED_ID" NUMERIC(15,0)
   )  
  ;
--------------------------------------------------------
--  DDL for Table ORGACCOUNT
--------------------------------------------------------

  CREATE TABLE "ORGACCOUNT" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"ORGACCTYPE_ID" NUMERIC(15,0) DEFAULT 1, 
	"ORG_ID" NUMERIC(15,0), 
	"BUDGET_FLAG" NUMERIC(1,0) DEFAULT 0, 
	"BANK_ID" NUMERIC(15,0), 
	"KEEPER_ID" NUMERIC(15,0), 
	"CURRENCY_NAME" VARCHAR(50 ), 
	"ACCOUNT_NUMBER" VARCHAR(35 ), 
	"OPEN_DATE" DATE, 
	"CLOSE_DATE" DATE, 
	"DESCRIPTION" VARCHAR(255 ), 
	"DISTRIBUTIVE_FLAG" NUMERIC(1,0) DEFAULT 0, 
	"FOREIGNKEY" VARCHAR(50 ), 
	"EXECUTER_ID" NUMERIC(15,0), 
	"EXECUTERACC_ID" NUMERIC(15,0), 
	"KEEPERACC_ID" NUMERIC(15,0), 
	"OOSFLAG" NUMERIC(1,0) DEFAULT 0, 
	"RECIPIENT_DESCRIPTION" VARCHAR(2000 ), 
	"ISCONTRACTOR" NUMERIC(1,0) DEFAULT 0
   )  ;
--------------------------------------------------------
--  DDL for Table ORGACCTYPE
--------------------------------------------------------

  CREATE TABLE "ORGACCTYPE" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"CAPTION" VARCHAR(100 )
   )  ;
--------------------------------------------------------
--  DDL for Table ORGADDKPP
--------------------------------------------------------

  CREATE TABLE "ORGADDKPP" 
   (	"ORG_ID" NUMERIC(15,0), 
	"KPP" VARCHAR(20 ), 
	"DESCRIPTION" VARCHAR(2000 ), 
	"FOREIGNKEY" VARCHAR(50 ), 
	"PROPFORM_ID" NUMERIC(15,0), 
	"EXCLUDE_DATE" DATE, 
	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0)
   )  ;
--------------------------------------------------------
--  DDL for Table ORGATTACH
--------------------------------------------------------

  CREATE TABLE "ORGATTACH" 
   (	"ID" NUMERIC(15,0), 
	"ORG_ID" NUMERIC(15,0), 
	"ATTACH_NAME" VARCHAR(100 ), 
	"ATTACH_DATA" BLOB
   )  
  ;
--------------------------------------------------------
--  DDL for Table ORGCHILD
--------------------------------------------------------

  CREATE TABLE "ORGCHILD" 
   (	"ORG_ID" NUMERIC(15,0), 
	"CHILD_ID" NUMERIC(15,0)
   )  ;
--------------------------------------------------------
--  DDL for Table ORGCONCCONT
--------------------------------------------------------

  CREATE TABLE "ORGCONCCONT" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"ORG_ID" NUMERIC(15,0), 
	"CONTRACT_YEAR" NUMERIC(4,0), 
	"CONTRACT_COUNT" NUMERIC(15,0) DEFAULT 0
   )  ;
--------------------------------------------------------
--  DDL for Table ORGETP
--------------------------------------------------------

  CREATE TABLE "ORGETP" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"ORG_ID" NUMERIC(15,0), 
	"ETP_ID" NUMERIC(15,0), 
	"ETPKEY" VARCHAR(100 ), 
	"REMARK" VARCHAR(2000 ), 
	"STATUS" NUMERIC(1,0), 
	"ORGROLE_ID" NUMERIC(15,0), 
	"ETPUSERNAME" VARCHAR(100 ), 
	"ETPPASSWORD" VARCHAR(100 ), 
	"SYSUSER_ID" NUMERIC(15,0)
   )  ;
--------------------------------------------------------
--  DDL for Table ORGFORM
--------------------------------------------------------

  CREATE TABLE "ORGFORM" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"CAPTION" VARCHAR(200 ), 
	"DESCRIPTION" VARCHAR(2000 ), 
	"OOSCODE" VARCHAR(10 ), 
	"ISACTUAL" NUMERIC(1,0) DEFAULT 1
   )  ;
--------------------------------------------------------
--  DDL for Table ORGGOODSGROUP
--------------------------------------------------------

  CREATE TABLE "ORGGOODSGROUP" 
   (	"ORG_ID" NUMERIC(15,0), 
	"GROUP_ID" NUMERIC(15,0), 
	"ISSUPPLYING" NUMERIC(1,0) DEFAULT 0, 
	"SELECTION_DATE" DATE, 
	"SELECTION_RESULT" NUMERIC(1,0), 
	"FIRST_IGNORED" NUMERIC(1,0), 
	"FIRST_DOC_NUMBER" VARCHAR(20 ), 
	"FIRST_DATE" DATE, 
	"SECOND_IGNORED" NUMERIC(1,0), 
	"SECOND_DOC_NUMBER" VARCHAR(20 ), 
	"SECOND_DATE" DATE
   )  ;
--------------------------------------------------------
--  DDL for Table ORGHEARING
--------------------------------------------------------

  CREATE TABLE "ORGHEARING" 
   (	"ORG_ID" NUMERIC(15,0), 
	"POS" NUMERIC(3,0), 
	"YR" NUMERIC(4,0), 
	"DECISION" VARCHAR(255 ), 
	"CLIENT" VARCHAR(255 ), 
	"CAUSE" VARCHAR(255 ), 
	"SUBJECT" VARCHAR(255 ), 
	"AMOUNT" VARCHAR(100 )
   )  ;
--------------------------------------------------------
--  DDL for Table ORGLICENCE
--------------------------------------------------------

  CREATE TABLE "ORGLICENCE" 
   (	"ORG_ID" NUMERIC(15,0), 
	"LICTYPE_ID" NUMERIC(15,0), 
	"ISSUER_NAME" VARCHAR(255 ), 
	"ISSUE_DATE" DATE, 
	"EXPIRE_DATE" DATE, 
	"LICENCE_NUMBER" VARCHAR(30 ), 
	"HASHARDCOPY" NUMERIC(15,0) DEFAULT 0, 
	"DESCRIPTION" VARCHAR(255 )
   )  ;
--------------------------------------------------------
--  DDL for Table ORGOOS223FZUSER
--------------------------------------------------------

  CREATE TABLE "ORGOOS223FZUSER" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"ORG_ID" NUMERIC(15,0), 
	"SYSUSER_ID" NUMERIC(15,0), 
	"LOGIN" VARCHAR(100 ), 
	"PSWD" VARCHAR(100 )
   )  ;
--------------------------------------------------------
--  DDL for Table ORGPERSONAL
--------------------------------------------------------

  CREATE TABLE "ORGPERSONAL" 
   (	"ORG_ID" NUMERIC(15,0), 
	"PERSONAL_ID" NUMERIC(15,0)
   )  ;
--------------------------------------------------------
--  DDL for Table ORGPERSONALRESP
--------------------------------------------------------

  CREATE TABLE "ORGPERSONALRESP" 
   (	"ORG_ID" NUMERIC(15,0), 
	"PERSONAL_ID" NUMERIC(15,0), 
	"RESPONSIBILITY_ID" NUMERIC(15,0)
   )  ;
--------------------------------------------------------
--  DDL for Table ORGROLE
--------------------------------------------------------

  CREATE TABLE "ORGROLE" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"CAPTION" VARCHAR(100 )
   )  ;
--------------------------------------------------------
--  DDL for Table ORGROLES
--------------------------------------------------------

  CREATE TABLE "ORGROLES" 
   (	"ORG_ID" NUMERIC(15,0), 
	"ORGROLE_ID" NUMERIC(15,0)
   )  ;
--------------------------------------------------------
--  DDL for Table ORGSELSTATUS
--------------------------------------------------------

  CREATE TABLE "ORGSELSTATUS" 
   (	"ORG_ID" NUMERIC(15,0), 
	"ORGSTATUS_ID" NUMERIC(15,0)
   )  ;
--------------------------------------------------------
--  DDL for Table ORGSTATUS
--------------------------------------------------------

  CREATE TABLE "ORGSTATUS" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"CAPTION" VARCHAR(300 )
   )  ;
--------------------------------------------------------
--  DDL for Table ORGTITLE
--------------------------------------------------------

  CREATE TABLE "ORGTITLE" 
   (	"ORG_ID" NUMERIC(15,0), 
	"DTBEGIN" DATE, 
	"DTEND" DATE, 
	"DESCRIPTION" VARCHAR(500 )
   )  ;
--------------------------------------------------------
--  DDL for Table ORGTURNOVER
--------------------------------------------------------

  CREATE TABLE "ORGTURNOVER" 
   (	"ORG_ID" NUMERIC(15,0), 
	"YR" NUMERIC(4,0), 
	"AMOUNT" NUMERIC(15,2) DEFAULT 0, 
	"CURRENCY_ID" NUMERIC(15,0)
   )  ;
--------------------------------------------------------
--  DDL for Table ORGUNFAIR
--------------------------------------------------------

  CREATE TABLE "ORGUNFAIR" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"ORG_ID" NUMERIC(15,0), 
	"DT" DATE, 
	"MARK" NUMERIC(1,0) DEFAULT 1, 
	"DESCRIPTION" BLOB SUB_TYPE TEXT, 
	"PURCHASEDATE" DATE, 
	"CONTRACTDESCRIPTION" VARCHAR(500 ), 
	"CONTRACTAMOUNT" NUMERIC(15,2), 
	"CONTRACTEXECUTIONDATE" DATE, 
	"CONTRACTDISSOLVEDATE" DATE, 
	"CONTRACTDISSOLVEREASON" VARCHAR(255 ), 
	"ISUNFAIR" NUMERIC(1,0) DEFAULT 0, 
	"UNFAIRDATE" DATE, 
	"CONTRACTDOCNUMBER" VARCHAR(30 ), 
	"PURCHASEMODE_ID" NUMERIC(15,0)
   )  
  ;
--------------------------------------------------------
--  DDL for Table PACKTYPE
--------------------------------------------------------

  CREATE TABLE "PACKTYPE" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"NAME" VARCHAR(50 )
   )  ;
--------------------------------------------------------
--  DDL for Table PANEL
--------------------------------------------------------

  CREATE TABLE "PANEL" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"NAME" VARCHAR(50 ), 
	"CAPTION" VARCHAR(100 )
   )  ;
--------------------------------------------------------
--  DDL for Table PANELITEM
--------------------------------------------------------

  CREATE TABLE "PANELITEM" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"PANEL_ID" NUMERIC(15,0), 
	"CAPTION" VARCHAR(100 ), 
	"SHOW_ORDER" NUMERIC(15,0) DEFAULT 0, 
	"HINT_MESSAGE" VARCHAR(255 ), 
	"SHORTCUT_KEY" VARCHAR(30 ), 
	"CLIENTOBJECT_ID" NUMERIC(15,0), 
	"OBJECT_PARAMS" VARCHAR(300 ), 
	"IMAGE" BLOB, 
	"SUBSYSTEM" NUMERIC(15,0) DEFAULT 0
   )  
  ;
--------------------------------------------------------
--  DDL for Table PAYCONDITION
--------------------------------------------------------

  CREATE TABLE "PAYCONDITION" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"NAME" VARCHAR(255 ), 
	"DESCRIPTION" VARCHAR(2000 ), 
	"SYSTEM_FLAG" NUMERIC(1,0) DEFAULT 0, 
	"ACTUAL" NUMERIC(1,0) DEFAULT 1
   )  ;
--------------------------------------------------------
--  DDL for Table PERSON
--------------------------------------------------------

  CREATE TABLE "PERSON" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"FIO" VARCHAR(255 ), 
	"PHONE" VARCHAR(255 ), 
	"EMAIL" VARCHAR(255 )
   )  ;
--------------------------------------------------------
--  DDL for Table PERSONAL
--------------------------------------------------------

  CREATE TABLE "PERSONAL" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"LASTNAME" VARCHAR(50 ), 
	"FIRSTNAME" VARCHAR(50 ), 
	"PATRONYMIC" VARCHAR(50 ), 
	"ORG_ID" NUMERIC(15,0), 
	"APPOINTMENT" VARCHAR(255 ), 
	"PHONE" VARCHAR(100 ), 
	"PHONECOUNTRYCODE" VARCHAR(15 ), 
	"PHONECITYCODE" VARCHAR(15 ), 
	"PHONEEXTENSION" VARCHAR(15 ), 
	"EMAIL" VARCHAR(256 ), 
	"FAX" VARCHAR(100 ), 
	"FAXCOUNTRYCODE" VARCHAR(15 ), 
	"FAXCITYCODE" VARCHAR(15 ), 
	"FAXEXTENSION" VARCHAR(15 ), 
	"IS_ACTUAL" NUMERIC(1,0) DEFAULT 1
   )  ;
--------------------------------------------------------
--  DDL for Table PLACEMENTFEATURE
--------------------------------------------------------

  CREATE TABLE "PLACEMENTFEATURE" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"FOREIGNKEY" VARCHAR(50 ), 
	"NAME" VARCHAR(512 ), 
	"SHORTNAME" VARCHAR(100 ), 
	"TYPE" VARCHAR(100 ), 
	"PREFVALUE" NUMERIC(15,2) DEFAULT 0, 
	"ACTUAL" NUMERIC(1,0) DEFAULT 0, 
	"USETENDERPLANS" NUMERIC(1,0) DEFAULT 1, 
	"BUDGETTYPE" NUMERIC(1,0) DEFAULT 0
   )  ;
--------------------------------------------------------
--  DDL for Table PLACEMENTFEATUREPM
--------------------------------------------------------

  CREATE TABLE "PLACEMENTFEATUREPM" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"PLACEMENTFEATURE_ID" NUMERIC(15,0), 
	"PURCHASEMODE_ID" NUMERIC(15,0)
   )  ;
--------------------------------------------------------
--  DDL for Table PLACINGWAY
--------------------------------------------------------

  CREATE TABLE "PLACINGWAY" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"OOSKEY" VARCHAR(100 ), 
	"NAME" VARCHAR(2000 ), 
	"CODE" VARCHAR(50 ), 
	"PURCHASEMODE_ID" NUMERIC(15,0), 
	"ACTUAL" NUMERIC(1,0) DEFAULT 0
   )  ;
--------------------------------------------------------
--  DDL for Table PLANDOC
--------------------------------------------------------

  CREATE TABLE "PLANDOC" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"DOCUMENT_ID" NUMERIC(15,0), 
	"DOCUMENTCLASS_ID" NUMERIC(15,0), 
	"DISPSTATUS_ID" NUMERIC(15,0), 
	"OPERTYPE_ID" NUMERIC(15,0) DEFAULT 0, 
	"BUDGET_ID" NUMERIC(15,0), 
	"DOC_NUMBER" VARCHAR(20 ), 
	"DOC_DATE" DATE, 
	"AMOUNT" NUMERIC(15,2) DEFAULT 0, 
	"DESCRIPTION" VARCHAR(2000 ), 
	"REMARK" VARCHAR(255 ), 
	"FOREIGN_KEY" VARCHAR(50 ), 
	"CUSTOMER_ID" NUMERIC(15,0), 
	"CUSTOMERNAME" VARCHAR(2000 ), 
	"PLANYEAR" NUMERIC(4,0), 
	"PLANYEARBEGIN" NUMERIC(4,0), 
	"PLANYEAREND" NUMERIC(4,0), 
	"ISGROUPSMOREONE" NUMERIC(1,0), 
	"RECIPIENT_ID" NUMERIC(15,0), 
	"RECIPIENT_NAME" VARCHAR(2000 ), 
	"NECESSITY_ID" NUMERIC(15,0) DEFAULT 0, 
	"NECESSITY_DESCRIPTION" VARCHAR(500 )
   )  ;
--------------------------------------------------------
--  DDL for Table PLANPOSITIONCHANGEREASON
--------------------------------------------------------

  CREATE TABLE "PLANPOSITIONCHANGEREASON" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"NAME" VARCHAR(1000 ), 
	"ACTUAL" NUMERIC(1,0) DEFAULT 1, 
	"BUDGETTYPE" NUMERIC(1,0) DEFAULT 0, 
	"OOSKEY" VARCHAR(100 )
   )  ;
--------------------------------------------------------
--  DDL for Table PLANPOSITIONNUMBERERROR
--------------------------------------------------------

  CREATE TABLE "PLANPOSITIONNUMBERERROR" 
   (	"DOCUMENT_ID" NUMERIC(15,0), 
	"TEXT" BLOB SUB_TYPE TEXT
   )  
  ;
--------------------------------------------------------
--  DDL for Table PLANREQUEST
--------------------------------------------------------

  CREATE TABLE "PLANREQUEST" 
   (	"REQUEST_ID" NUMERIC(15,0), 
	"DOC_ID" NUMERIC(15,0), 
	"DOCUMENT_ID" NUMERIC(15,0)
   )  ;
--------------------------------------------------------
--  DDL for Table PLAN2ARRANGEMENT
--------------------------------------------------------

  CREATE TABLE "PLAN2ARRANGEMENT" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"PLAN2GOODS_ID" NUMERIC(15,0), 
	"PURCHASEMODE_ID" NUMERIC(15,0), 
	"PURCHASEMODE_CAPTION" VARCHAR(500 ), 
	"AMOUNT" NUMERIC(15,4), 
	"PAYAMOUNT" NUMERIC(15,4), 
	"PAYAMOUNTPROLONG" NUMERIC(15,4), 
	"INVITATIONDATE" DATE, 
	"CMPDATE" DATE, 
	"DEALDATE" DATE, 
	"CMPORG_ID" NUMERIC(15,0), 
	"CONTRACTOR_ID" NUMERIC(15,0), 
	"LOTNAMECACHE_ID" NUMERIC(15,0), 
	"ISENTERPRISE" NUMERIC(1,0) DEFAULT 0, 
	"ISSMALL" NUMERIC(1,0) DEFAULT 0, 
	"PARENTID" NUMERIC(15,0), 
	"CONTRACTEXECDATE" DATE, 
	"CHANGEDESCRIPTIONCACHE_ID" NUMERIC(15,0), 
	"LOTNUMBERCACHE_ID" NUMERIC(15,0), 
	"STATUS" NUMERIC(1,0) DEFAULT 0, 
	"DELIVERYBASIS_ID" NUMERIC(15,0), 
	"PAYCONDITIONCACHE_ID" NUMERIC(15,0), 
	"CONTRACTPROVIDINGCACHE_ID" NUMERIC(15,0), 
	"ORDERNUMBER" VARCHAR(30 ), 
	"ADVANCE" NUMERIC(15,2), 
	"ORDERNAMECACHE_ID" NUMERIC(15,0), 
	"OPENINGDATE" DATE, 
	"SELECTDATE" DATE, 
	"FINISHDATE" DATE, 
	"EXPLANATIONCACHE_ID" NUMERIC(15,0), 
	"EFORM" NUMERIC(1,0), 
	"COUNTRY_ID" NUMERIC(15,0), 
	"TERRITORYCODE" VARCHAR(20 ), 
	"DELIVERYADDRESS_ID" NUMERIC(15,0), 
	"CURRENCY_ID" NUMERIC(15,0), 
	"ORDERFORM" NUMERIC(1,0) DEFAULT 0, 
	"CONTRACTPAYORDERCACHE_ID" NUMERIC(15,0), 
	"GUARANTEEAMOUNT" NUMERIC(15,2), 
	"GUARANTEEREQUESTAMOUNT" NUMERIC(15,2), 
	"CHANGEREASON_ID" NUMERIC(15,0), 
	"CONEXECSTAGESCACHE_ID" NUMERIC(15,0), 
	"PERIODICITYCACHE_ID" NUMERIC(15,0), 
	"PROHIBITIONSCACHE_ID" NUMERIC(15,0), 
	"QUANTITYUNDEFINED" NUMERIC(1,0) DEFAULT 0, 
	"PUBLICDISCUSSCACHE_ID" NUMERIC(15,0), 
	"PREFERENCEGROUP_ID" NUMERIC(15,0)
   )  ;
--------------------------------------------------------
--  DDL for Table PLAN2CHANGEREASON
--------------------------------------------------------

  CREATE TABLE "PLAN2CHANGEREASON" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"NAME" VARCHAR(1000 ), 
	"ACTUAL" NUMERIC(1,0) DEFAULT 1
   )  ;
--------------------------------------------------------
--  DDL for Table PLAN2DAILYTOTALS
--------------------------------------------------------

  CREATE TABLE "PLAN2DAILYTOTALS" 
   (	"ID" NUMERIC(15,0), 
	"RUNDATE" DATE, 
	"BUDGET_ID" NUMERIC(15,0), 
	"PLANYEAR" NUMERIC(4,0), 
	"CUSTOMER_ID" NUMERIC(15,0), 
	"PURCHASEMODE_ID" NUMERIC(15,0), 
	"AMOUNT" NUMERIC(15,4), 
	"INVITATIONDATE" DATE, 
	"CMPDATE" DATE, 
	"DEALDATE" DATE, 
	"CONTRACTEXECDATE" DATE, 
	"ISENTERPRISE" NUMERIC(1,0) DEFAULT 0, 
	"ISSMALL" NUMERIC(1,0) DEFAULT 0
   )  ;
--------------------------------------------------------
--  DDL for Table PLAN2DOC
--------------------------------------------------------

  CREATE TABLE "PLAN2DOC" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"DOCUMENT_ID" NUMERIC(15,0), 
	"DOCUMENTCLASS_ID" NUMERIC(15,0), 
	"DISPSTATUS_ID" NUMERIC(15,0), 
	"OPERTYPE_ID" NUMERIC(15,0) DEFAULT 0, 
	"BUDGET_ID" NUMERIC(15,0), 
	"AMOUNT" NUMERIC(15,2) DEFAULT 0, 
	"FOREIGN_KEY" VARCHAR(50 ), 
	"DOC_NUMBER" VARCHAR(20 ), 
	"DOC_DATE" DATE, 
	"PLANYEAR" NUMERIC(4,0), 
	"CUSTOMER_ID" NUMERIC(15,0), 
	"CUSTOMERNAME" VARCHAR(2000 ), 
	"DESCRIPTION_ID" NUMERIC(15,0), 
	"DESCRIPTION" VARCHAR(2000 ), 
	"NECESSITY_ID" NUMERIC(15,0) DEFAULT 0, 
	"NECESSITY_DESCRIPTION" VARCHAR(500 ), 
	"REMARK" VARCHAR(255 ), 
	"ISGROUPSMOREONE" NUMERIC(1,0), 
	"OOSPLANNUMBER" VARCHAR(100 ), 
	"OOSKEY" VARCHAR(100 ), 
	"CHANGE_OOSKEY" VARCHAR(100 ), 
	"FULLDESCRIPTION" VARCHAR(4000 ), 
	"OOSDISPSTATUS_ID" NUMERIC(15,0), 
	"CONFIRMDATE" DATE, 
	"OWNER_ID" NUMERIC(15,0), 
	"OWNERNAME" VARCHAR(2000 ), 
	"RECIPIENT_ID" NUMERIC(15,0), 
	"RESPPERSONAL_ID" NUMERIC(15,0)
   )  ;
--------------------------------------------------------
--  DDL for Table PLAN2DOCCHILD
--------------------------------------------------------

  CREATE TABLE "PLAN2DOCCHILD" 
   (	"PLAN2DOC_ID" NUMERIC(15,0), 
	"DOC_ID" NUMERIC(15,0), 
	"DOCUMENT_ID" NUMERIC(15,0)
   )  ;
--------------------------------------------------------
--  DDL for Table PLAN2GOODS
--------------------------------------------------------

  CREATE TABLE "PLAN2GOODS" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"PLAN2DOC_ID" NUMERIC(15,0), 
	"GROUPCODE" VARCHAR(20 ), 
	"GROUPCAPTION" VARCHAR(500 ), 
	"OKDP_CODE" VARCHAR(20 ), 
	"OKPD_CODE" VARCHAR(20 ), 
	"OKVED" VARCHAR(20 ), 
	"GOODSCODE" VARCHAR(20 ), 
	"GOODSCAPTION" VARCHAR(512 ), 
	"PRICE" NUMERIC(15,2) DEFAULT 0, 
	"QTY" NUMERIC(15,4) DEFAULT 0, 
	"AMOUNT" NUMERIC(15,2) DEFAULT 0, 
	"AMOUNTARRANGED" NUMERIC(15,2) DEFAULT 0, 
	"FINSRC_ID" NUMERIC(15,0), 
	"CODE1" VARCHAR(100 ), 
	"CODE2" VARCHAR(100 ), 
	"CODE3" VARCHAR(100 ), 
	"CODE4" VARCHAR(100 ), 
	"CODE5" VARCHAR(100 ), 
	"CODE6" VARCHAR(100 ), 
	"CODE7" VARCHAR(100 ), 
	"CODE8" VARCHAR(100 ), 
	"CODE9" VARCHAR(100 ), 
	"CODE10" VARCHAR(100 ), 
	"DELIVERYDATEFROM" DATE, 
	"DELIVERYDATETO" DATE, 
	"INDUSTRYCODE_ID" NUMERIC(15,0), 
	"GRANTINVESTMENT_ID" NUMERIC(15,0), 
	"PAYDATE" DATE, 
	"PAYDATEFROM" DATE, 
	"PAYDATETO" DATE, 
	"PAYAMOUNT" NUMERIC(15,2), 
	"PAYAMOUNTPROLONG" NUMERIC(15,2) DEFAULT 0, 
	"GOODSFLAG" NUMERIC(1,0) DEFAULT 0, 
	"NECESSITY_ID" NUMERIC(15,0) DEFAULT 0, 
	"CHANGE_PRICE" NUMERIC(15,2) DEFAULT 0, 
	"CHANGE_QTY" NUMERIC(15,4) DEFAULT 0, 
	"CHANGE_AMOUNT" NUMERIC(15,2) DEFAULT 0, 
	"RESULT_PRICE" NUMERIC(15,2) DEFAULT 0, 
	"RESULT_QTY" NUMERIC(15,4) DEFAULT 0, 
	"RESULT_AMOUNT" NUMERIC(15,2) DEFAULT 0, 
	"FROMPARENT" NUMERIC(1,0) DEFAULT 0, 
	"GOODSBRANCH_ID" NUMERIC(15,0), 
	"SUBJECTREQUIREMENTS" VARCHAR(2000 ), 
	"RECIPIENT_ID" NUMERIC(15,0), 
	"OLDPLAN2GOODS_ID" NUMERIC(15,0), 
	"MEDICINEPROPVALUECACHE_ID" NUMERIC(15,0), 
	"OKPD_NAME" VARCHAR(1000 ), 
	"OKVED_NAME" VARCHAR(1000 ), 
	"OKPD_ID" NUMERIC(15,0), 
	"OKVED_ID" NUMERIC(15,0), 
	"UNITNAME" VARCHAR(50 )
   )  ;
--------------------------------------------------------
--  DDL for Table PLAN2LEDGER
--------------------------------------------------------

  CREATE TABLE "PLAN2LEDGER" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"PLAN2DOC_ID" NUMERIC(15,0), 
	"POS" NUMERIC(15,0), 
	"GROUP_ID" NUMERIC(15,0), 
	"OKDP_ID" NUMERIC(15,0), 
	"GOODS_ID" NUMERIC(15,0), 
	"PURCHASEMODE_ID" NUMERIC(15,0), 
	"ISENTERPRISE" NUMERIC(1,0), 
	"ISSMALL" NUMERIC(1,0), 
	"CMPORG_ID" NUMERIC(15,0), 
	"FINSRC_ID" NUMERIC(15,0), 
	"NECESSITY_ID" NUMERIC(15,0), 
	"CODE1" VARCHAR(100 ), 
	"CODE2" VARCHAR(100 ), 
	"CODE3" VARCHAR(100 ), 
	"CODE4" VARCHAR(100 ), 
	"CODE5" VARCHAR(100 ), 
	"CODE6" VARCHAR(100 ), 
	"CODE7" VARCHAR(100 ), 
	"CODE8" VARCHAR(100 ), 
	"CODE9" VARCHAR(100 ), 
	"CODE10" VARCHAR(100 ), 
	"DELIVERYBASIS_ID" NUMERIC(15,0), 
	"PAYCONDITIONCACHE_ID" NUMERIC(15,0), 
	"INDUSTRYCODE_ID" NUMERIC(15,0), 
	"GRANTINVESTMENT_ID" NUMERIC(15,0), 
	"INVITATIONDATE" DATE, 
	"CMPDATE" DATE, 
	"DESCRIPTIONCACHE_ID" NUMERIC(15,0), 
	"IDENTIFICCODECACHE_ID" NUMERIC(15,0), 
	"CONTRACTOR_ID" NUMERIC(15,0), 
	"AMOUNT_Q1" NUMERIC(15,2) DEFAULT 0, 
	"AMOUNT_Q2" NUMERIC(15,2) DEFAULT 0, 
	"AMOUNT_Q3" NUMERIC(15,2) DEFAULT 0, 
	"AMOUNT_Q4" NUMERIC(15,2) DEFAULT 0, 
	"UNITNAME" VARCHAR(50 )
   )  ;
--------------------------------------------------------
--  DDL for Table PLAN2OOSEXTNUMBER
--------------------------------------------------------

  CREATE TABLE "PLAN2OOSEXTNUMBER" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"YEARPLANOWNER" VARCHAR(104 ), 
	"PLANPOSITIONNUMBER" VARCHAR(100 ), 
	"POSITIONNUMBER" VARCHAR(30 ), 
	"EXTNUMBER" NUMERIC(15,0)
   )  ;
--------------------------------------------------------
--  DDL for Table PLAN2OOSFEATURE
--------------------------------------------------------

  CREATE TABLE "PLAN2OOSFEATURE" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"PLAN2OOSPOSITION_ID" NUMERIC(15,0), 
	"PLACEMENTFEATURE_ID" NUMERIC(15,0), 
	"OOSKEY" VARCHAR(50 ), 
	"NAME" VARCHAR(450 ), 
	"TYPE" VARCHAR(1 ), 
	"PREFVALUE" NUMERIC(15,2) DEFAULT 0, 
	"CONTENT" VARCHAR(4000 )
   )  ;
--------------------------------------------------------
--  DDL for Table PLAN2OOSKBK
--------------------------------------------------------

  CREATE TABLE "PLAN2OOSKBK" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"PLAN2OOSPOSITION_ID" NUMERIC(15,0), 
	"CODE1" VARCHAR(100 ), 
	"CODE2" VARCHAR(100 ), 
	"CODE3" VARCHAR(100 ), 
	"CODE4" VARCHAR(100 ), 
	"CODE5" VARCHAR(100 ), 
	"AMOUNT" NUMERIC(15,2) DEFAULT 0, 
	"FUTUREAMOUNT" NUMERIC(15,2) DEFAULT 0
   )  ;
--------------------------------------------------------
--  DDL for Table PLAN2OOSKBKYEAR
--------------------------------------------------------

  CREATE TABLE "PLAN2OOSKBKYEAR" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"PLAN2OOSKBK_ID" NUMERIC(15,0), 
	"PLANYEAR" NUMERIC(4,0), 
	"AMOUNT" NUMERIC(15,2) DEFAULT 0
   )  ;
--------------------------------------------------------
--  DDL for Table PLAN2OOSOKVED
--------------------------------------------------------

  CREATE TABLE "PLAN2OOSOKVED" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"PLAN2OOSPOSITION_ID" NUMERIC(15,0), 
	"CODE" VARCHAR(20 ), 
	"NAME" VARCHAR(1000 ), 
	"OKVED_ID" NUMERIC(15,0)
   )  ;
--------------------------------------------------------
--  DDL for Table PLAN2OOSPOSITION
--------------------------------------------------------

  CREATE TABLE "PLAN2OOSPOSITION" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"DOCUMENT_ID" NUMERIC(15,0), 
	"DISPSTATUS_ID" NUMERIC(15,0), 
	"POSITIONNUMBER" VARCHAR(30 ), 
	"CONTRACTSUBJECTNAME" VARCHAR(2000 ), 
	"CONTRACTMAXPRICE" NUMERIC(15,2) DEFAULT 0, 
	"CONTRACTCURRENCY_ID" NUMERIC(15,0), 
	"PURCHASEMODE_ID" NUMERIC(15,0), 
	"PURCHASEMODE_CAPTION" VARCHAR(500 ), 
	"ORDERFORM" NUMERIC(1,0) DEFAULT 1, 
	"CONTRACTPAYORDER" VARCHAR(4000 ), 
	"CONTRACTGUARANTEEPROCEDURE" VARCHAR(4000 ), 
	"CONTRACTGUARANTEEPART" NUMERIC(15,2), 
	"CONTRACTGUARANTEEAMOUNT" NUMERIC(15,2), 
	"ORDERPLACINGTERM" DATE, 
	"CONTRACTEXECUTIONTERM" DATE, 
	"CHANGEREASON_ID" NUMERIC(15,0), 
	"ADDITIONALINFO" VARCHAR(4000 ), 
	"PUBLISHDATE" DATE, 
	"CONFIRMDATE" DATE, 
	"POSITIONPUBLISHDATE" DATE, 
	"VERSIONNUMBER" NUMERIC(15,0), 
	"DIAGNOSIS" BLOB SUB_TYPE TEXT, 
	"PAYMENTS" NUMERIC(15,2) DEFAULT 0, 
	"PUBLICDISCUSSCACHE_ID" NUMERIC(15,0), 
	"PURCHASEFINPROCEDURECACHE_ID" NUMERIC(15,0), 
	"PURCHASEFINAMOUNT" NUMERIC(15,2) DEFAULT 0, 
	"ADVANCECACHE_ID" NUMERIC(15,0), 
	"CONEXECSTAGESCACHE_ID" NUMERIC(15,0), 
	"PERIODICITYCACHE_ID" NUMERIC(15,0), 
	"PROHIBITIONSCACHE_ID" NUMERIC(15,0), 
	"PURCHASETYPE" NUMERIC(2,0) DEFAULT 0, 
	"CMPORG_ID" NUMERIC(15,0), 
	"PURCHASEMETHOD_ID" NUMERIC(15,0), 
	"OOSKEY" VARCHAR(100 ), 
	"OKATO" VARCHAR(20 ), 
	"EFORM" NUMERIC(1,0), 
	"MODIFICATIONDESCRIPTION" VARCHAR(2000 ), 
	"LEGALACTREQUISITES" VARCHAR(2000 ), 
	"CONTRACTPRICEFEATURES" VARCHAR(2000 ), 
	"FEATURES111" NUMERIC(1,0)
   )  
  ;
--------------------------------------------------------
--  DDL for Table PLAN2OOSPRODUCT
--------------------------------------------------------

  CREATE TABLE "PLAN2OOSPRODUCT" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"PLAN2OOSPOSITION_ID" NUMERIC(15,0), 
	"OKDP_CODE" VARCHAR(20 ), 
	"NAME" VARCHAR(4000 ), 
	"MINREQUIREMENT" VARCHAR(4000 ), 
	"QUANTITYUNDEFINED" NUMERIC(1,0) DEFAULT 0, 
	"QUANTITY" NUMERIC(15,4) DEFAULT 0, 
	"PRICE" NUMERIC(15,2) DEFAULT 0, 
	"AMOUNT" NUMERIC(15,2) DEFAULT 0, 
	"OKPD_CODE" VARCHAR(20 ), 
	"INTERNATIONALNAME" VARCHAR(4000 ), 
	"QUANTITYCURRENTYEAR" NUMERIC(15,4) DEFAULT 0, 
	"OKPD_ID" NUMERIC(15,0), 
	"UNITNAME" VARCHAR(50 ), 
	"OKVED" VARCHAR(20 ), 
	"OKVED_ID" NUMERIC(15,0)
   )  ;
--------------------------------------------------------
--  DDL for Table PLAN3DOC
--------------------------------------------------------

  CREATE TABLE "PLAN3DOC" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"DOCUMENT_ID" NUMERIC(15,0), 
	"DOCUMENTCLASS_ID" NUMERIC(15,0), 
	"DISPSTATUS_ID" NUMERIC(15,0), 
	"OPERTYPE_ID" NUMERIC(15,0), 
	"BUDGET_ID" NUMERIC(15,0), 
	"DOC_NUMBER" VARCHAR(30 ), 
	"DOC_DATE" DATE, 
	"FOREIGN_KEY" VARCHAR(50 ), 
	"DESCRIPTION" VARCHAR(2000 ), 
	"REMARK" VARCHAR(255 ), 
	"AMOUNT" NUMERIC(15,2) DEFAULT 0, 
	"SGOZAMOUNT" NUMERIC(15,2) DEFAULT 0, 
	"SGOZENTERPRISEAMOUNT" NUMERIC(15,2) DEFAULT 0, 
	"PLANYEAR" NUMERIC(4,0), 
	"CUSTOMER_ID" NUMERIC(15,0), 
	"CUSTOMERNAME" VARCHAR(2000 ), 
	"RESPORG_ID" NUMERIC(15,0), 
	"RESPORGNAME" VARCHAR(2000 ), 
	"CONFIRMDATE" DATE, 
	"REGNUMBER" VARCHAR(100 ), 
	"VERSIONNUMBER" NUMERIC(15,0) DEFAULT 0, 
	"PLANINFO" VARCHAR(4000 ), 
	"CUSTOMERTAXCODE" VARCHAR(20 ), 
	"CUSTOMERKPP" VARCHAR(20 ), 
	"CUSTOMERPROPFORM_ID" NUMERIC(15,0), 
	"CUSTOMERPROPFORMCAPTION" VARCHAR(2000 ), 
	"CUSTOMERPROPFORMOOSCODE" VARCHAR(10 ), 
	"CUSTOMEROKTMO" VARCHAR(20 ), 
	"CUSTOMERPUBLICENTITYNAME" VARCHAR(2000 ), 
	"CUSTOMERCOUNTRY_ID" NUMERIC(15,0), 
	"CUSTOMERINDEX" VARCHAR(10 ), 
	"CUSTOMERADDRESS" VARCHAR(300 ), 
	"CUSTOMERPHONE" VARCHAR(100 ), 
	"CUSTOMERFAX" VARCHAR(100 ), 
	"CUSTOMEREMAIL" VARCHAR(256 ), 
	"RESPEXECUTER_ID" NUMERIC(15,0), 
	"RESPEXECUTERLASTNAME" VARCHAR(50 ), 
	"RESPEXECUTERFIRSTNAME" VARCHAR(50 ), 
	"RESPEXECUTERPATRONYMIC" VARCHAR(50 ), 
	"CONFIRMPERSON_ID" NUMERIC(15,0), 
	"CONFIRMPERSONLASTNAME" VARCHAR(50 ), 
	"CONFIRMPERSONFIRSTNAME" VARCHAR(50 ), 
	"CONFIRMPERSONPATRONYMIC" VARCHAR(50 ), 
	"CONFIRMPERSONAPPOINTMENT" VARCHAR(255 ), 
	"OOSKEY" VARCHAR(100 ), 
	"CUSTOMEROKPO" VARCHAR(20 ), 
	"CREDENTIALSPASSED" NUMERIC(1,0) DEFAULT 0, 
	"RESPONSIBLEORGLOCATION" VARCHAR(2000 ), 
	"RESPONSIBLEORGPHONE" VARCHAR(100 ), 
	"RESPONSIBLEORGEMAIL" VARCHAR(256 ), 
	"RESPONSIBLEORGOKPO" VARCHAR(20 ), 
	"RESPONSIBLEORGOKTMO" VARCHAR(20 ), 
	"RESPONSIBLEORGTAXCODE" VARCHAR(20 ), 
	"RESPONSIBLEORGKPP" VARCHAR(20 ), 
	"RESPORGOOSROLE" NUMERIC(1,0), 
	"PLANTYPE" NUMERIC(1,0), 
	"PERIODSTART" DATE, 
	"PERIODEND" DATE, 
	"ADDITIONALINFO" VARCHAR(2000 ), 
	"CUSTOMERFACTTERRITORY_ID" NUMERIC(15,0), 
	"MODIFICATIONDESCRIPTION" VARCHAR(2000 ), 
	"SGOZEXCLUDEAMOUNT" NUMERIC(15,2) DEFAULT NULL, 
	"SGOZENTERPRISEPERCENT" NUMERIC(15,2) DEFAULT NULL, 
	"SGOZENTMANUALAMOUNT" NUMERIC(15,2), 
	"SGOZQUOTMANUALAMOUNT" NUMERIC(15,2)
   )  ;
--------------------------------------------------------
--  DDL for Table PLAN3DOCCHILD
--------------------------------------------------------

  CREATE TABLE "PLAN3DOCCHILD" 
   (	"PLAN3DOC_ID" NUMERIC(15,0), 
	"DOC_ID" NUMERIC(15,0), 
	"DOCUMENT_ID" NUMERIC(15,0)
   )  ;
--------------------------------------------------------
--  DDL for Table PLAN3PURCHASEDOC
--------------------------------------------------------

  CREATE TABLE "PLAN3PURCHASEDOC" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"DOCUMENT_ID" NUMERIC(15,0), 
	"DOCUMENTCLASS_ID" NUMERIC(15,0), 
	"DISPSTATUS_ID" NUMERIC(15,0), 
	"OPERTYPE_ID" NUMERIC(15,0), 
	"BUDGET_ID" NUMERIC(15,0), 
	"DOC_NUMBER" VARCHAR(20 ), 
	"DOC_DATE" DATE, 
	"FOREIGN_KEY" VARCHAR(50 ), 
	"REMARK" VARCHAR(255 ), 
	"AMOUNT" NUMERIC(15,2) DEFAULT 0, 
	"ISGROUPSMOREONE" NUMERIC(1,0), 
	"PLANYEAR" NUMERIC(4,0), 
	"CUSTOMER_ID" NUMERIC(15,0), 
	"CUSTOMERNAME" VARCHAR(2000 ), 
	"RECIPIENT_ID" NUMERIC(15,0), 
	"RECIPIENTNAME" VARCHAR(2000 ), 
	"PURCHASECODE" VARCHAR(100 ), 
	"PLANPOSITION" VARCHAR(100 ), 
	"DESCRIPTION_ID" NUMERIC(15,0), 
	"DESCRIPTION" VARCHAR(2000 ), 
	"PURCHASETYPE" NUMERIC(1,0) DEFAULT 0, 
	"NECESSITY_ID" NUMERIC(15,0) DEFAULT 0, 
	"NECESSITY_DESCRIPTION" VARCHAR(1000 ), 
	"NECESSITY_ADVANCED" VARCHAR(1000 ), 
	"STATEPROGDOC_RSLT" VARCHAR(2000 ), 
	"STATEPROGDOC_PERIOD" VARCHAR(2000 ), 
	"STATEPROGDOC_PROCURE" VARCHAR(2000 ), 
	"PUBLICDISCUSSION" NUMERIC(1,0) DEFAULT 0, 
	"PURCHASEMODE_ID" NUMERIC(15,0), 
	"PURCHASEMODE_CAPTION" VARCHAR(500 ), 
	"CURRENCY_ID" NUMERIC(15,0), 
	"CURRENCY_CODE" VARCHAR(3 ), 
	"ORDERFORM" NUMERIC(1,0) DEFAULT 0, 
	"ORDERNAMECACHE_ID" NUMERIC(15,0), 
	"INVITATIONDATE" DATE, 
	"DEALDATE" DATE, 
	"CONTRACTEXECDATE" DATE, 
	"CONEXECSTAGESCACHE_ID" NUMERIC(15,0), 
	"PERIODICITYCACHE_ID" NUMERIC(15,0), 
	"PROHIBITIONSCACHE_ID" NUMERIC(15,0), 
	"SINGLECUSTOMERREASON_ID" NUMERIC(15,0), 
	"OFRREQREASON_ID" NUMERIC(15,0), 
	"CMPORG_ID" NUMERIC(15,0), 
	"CMPORGNAME" VARCHAR(2000 ), 
	"CONBANKSUPPORTCACHE_ID" NUMERIC(15,0), 
	"PUBLICDISCUSSCACHE_ID" NUMERIC(15,0), 
	"ISENTERPRISE" NUMERIC(1,0) DEFAULT 0, 
	"ADVANCE" NUMERIC(15,2), 
	"ADVANCEPERCENTS" NUMERIC(15,2), 
	"ADVANCEINFO" VARCHAR(2000 ), 
	"ISGUARANTEEAPP" NUMERIC(1,0) DEFAULT 0, 
	"GUARANTEEAPPAMOUNT" NUMERIC(15,2), 
	"GUARANTEEAPPPERCENT" NUMERIC(15,2), 
	"PURCHASEFINCONDITION" VARCHAR(2000 ), 
	"ISGUARANTEECONTRACT" NUMERIC(1,0) DEFAULT 0, 
	"GUARANTEECONTRACTAMOUNT" NUMERIC(15,2), 
	"GUARANTEECONTRACTPERCENT" NUMERIC(15,2), 
	"CONTRACTFINCONDITION" VARCHAR(2000 ), 
	"EFORM" NUMERIC(1,0), 
	"ORDERNUMBER" VARCHAR(30 ), 
	"SUMPUSHASESMALLBUSINESS" NUMERIC(15,2), 
	"PRCPUSHASESMALLBUSINESS" NUMERIC(15,2), 
	"CONTRACTPAYORDERCACHE_ID" NUMERIC(15,0), 
	"DELIVERYBASIS_ID" NUMERIC(15,0), 
	"PAYCONDITIONCACHE_ID" NUMERIC(15,0), 
	"CONTRACTOR_ID" NUMERIC(15,0), 
	"COUNTRY_ID" NUMERIC(15,0), 
	"TERRITORYCODE" VARCHAR(20 ), 
	"DELIVERYADDRESS_ID" NUMERIC(15,0), 
	"CHANGEREASONDATE" DATE, 
	"PLANCHANGEREASON_ID" NUMERIC(15,0), 
	"CHANGEREASON_ID" NUMERIC(15,0), 
	"CHANGEREASON" VARCHAR(2000 ), 
	"CHANGEREASONINFO" VARCHAR(2000 ), 
	"FINAMOUNT" NUMERIC(15,2), 
	"FINAMOUNT_2YEAR" NUMERIC(15,2), 
	"FINAMOUNT_3YEAR" NUMERIC(15,2), 
	"FINAMOUNT_FUTURE" NUMERIC(15,2), 
	"PLAN_INVITATIONYEAR" NUMERIC(4,0), 
	"INFO_7_2_17_44_FZ" NUMERIC(1,0), 
	"DELIVERYDATEFROM" DATE, 
	"DELIVERYDATETO" DATE, 
	"PAYDATEFROM" DATE, 
	"PAYDATETO" DATE, 
	"OOSPUBLISHDATE" DATE, 
	"PURCHASEMETHOD_ID" NUMERIC(15,0), 
	"MODIFICATIONDESCRIPTION" VARCHAR(2000 ), 
	"IDENTIFICATION_CODE" VARCHAR(50 ), 
	"IKOKPD_ID" NUMERIC(15,0), 
	"LEGALACTREQUISITES" VARCHAR(2000 ), 
	"CONTRACTPRICEFEATURES" VARCHAR(2000 ), 
	"PARENT_PURCHASECODE" VARCHAR(100 )
   )  ;
--------------------------------------------------------
--  DDL for Table PLAN3PURCHASEFEATURE
--------------------------------------------------------

  CREATE TABLE "PLAN3PURCHASEFEATURE" 
   (	"PLAN3PURCHASEDOC_ID" NUMERIC(15,0), 
	"POS" NUMERIC(15,0), 
	"PLACEMENTFEATURE_ID" NUMERIC(15,0), 
	"PREFVALUE" NUMERIC(15,2) DEFAULT 0, 
	"CONTENT" VARCHAR(4000 )
   )  ;
--------------------------------------------------------
--  DDL for Table PLAN3PURCHASEGOODS
--------------------------------------------------------

  CREATE TABLE "PLAN3PURCHASEGOODS" 
   (	"PLAN3PURCHASEDOC_ID" NUMERIC(15,0), 
	"POS" NUMERIC(15,0), 
	"PLAN3PURCHASELINEPOS" NUMERIC(15,0), 
	"GROUPCODE" VARCHAR(20 ), 
	"GROUPCAPTION" VARCHAR(500 ), 
	"GOODSCODE" VARCHAR(20 ), 
	"GOODSCAPTION" VARCHAR(512 ), 
	"OKDP_CODE" VARCHAR(20 ), 
	"OKPD_CODE" VARCHAR(20 ), 
	"OKVED" VARCHAR(20 ), 
	"OKEI" VARCHAR(4 ), 
	"PRICE" NUMERIC(15,2), 
	"MINREQUIREMENT" VARCHAR(2000 ), 
	"QUANTITYUNDEFINED" NUMERIC(1,0) DEFAULT 0, 
	"QTY" NUMERIC(15,4) DEFAULT 0, 
	"QTY_2YEAR" NUMERIC(15,4) DEFAULT 0, 
	"QTY_3YEAR" NUMERIC(15,4) DEFAULT 0, 
	"QTY_FUTURE" NUMERIC(15,4) DEFAULT 0, 
	"AMOUNT" NUMERIC(15,2) DEFAULT 0, 
	"AMOUNT_2YEAR" NUMERIC(15,2) DEFAULT 0, 
	"AMOUNT_3YEAR" NUMERIC(15,2) DEFAULT 0, 
	"AMOUNT_FUTURE" NUMERIC(15,2) DEFAULT 0, 
	"STATUS" NUMERIC(1,0) DEFAULT 0, 
	"OKPD_NAME" VARCHAR(1000 ), 
	"OKVED_NAME" VARCHAR(1000 ), 
	"OKPD_ID" NUMERIC(15,0), 
	"OKVED_ID" NUMERIC(15,0), 
	"UNITNAME" VARCHAR(50 )
   )  ;
--------------------------------------------------------
--  DDL for Table PLAN3PURCHASEGOODSOKVED
--------------------------------------------------------

  CREATE TABLE "PLAN3PURCHASEGOODSOKVED" 
   (	"PLAN3PURCHASEDOC_ID" NUMERIC(15,0), 
	"GOODSPOS" NUMERIC(15,0), 
	"OKVED" VARCHAR(20 ), 
	"OKVED_NAME" VARCHAR(1000 ), 
	"OKVED_ID" NUMERIC(15,0)
   )  ;
--------------------------------------------------------
--  DDL for Table PLAN3PURCHASEGOODSPROP
--------------------------------------------------------

  CREATE TABLE "PLAN3PURCHASEGOODSPROP" 
   (	"PLAN3PURCHASEDOC_ID" NUMERIC(15,0), 
	"GOODSPOS" NUMERIC(15,0), 
	"SEQORDER" NUMERIC(15,0), 
	"PROPTYPE_ID" NUMERIC(15,0), 
	"CAPTION" VARCHAR(512 ), 
	"PROPVALUE" VARCHAR(1500 )
   )  ;
--------------------------------------------------------
--  DDL for Table PLAN3PURCHASELINE
--------------------------------------------------------

  CREATE TABLE "PLAN3PURCHASELINE" 
   (	"PLAN3PURCHASEDOC_ID" NUMERIC(15,0), 
	"POS" NUMERIC(15,0), 
	"FINSRC_ID" NUMERIC(15,0), 
	"FINSRCNAME" VARCHAR(512 ), 
	"ESTIMATE_ID" NUMERIC(15,0), 
	"ESTIMATENAME" VARCHAR(255 ), 
	"RECIPIENT_ID" NUMERIC(15,0), 
	"RECIPIENTNAME" VARCHAR(2000 ), 
	"CODE1" VARCHAR(100 ), 
	"CODE2" VARCHAR(100 ), 
	"CODE3" VARCHAR(100 ), 
	"CODE4" VARCHAR(100 ), 
	"CODE5" VARCHAR(100 ), 
	"CODE6" VARCHAR(100 ), 
	"CODE7" VARCHAR(100 ), 
	"CODE8" VARCHAR(100 ), 
	"CODE9" VARCHAR(100 ), 
	"CODE10" VARCHAR(100 ), 
	"INDUSTRYCODE_ID" NUMERIC(15,0), 
	"INDUSTRYCODE" VARCHAR(17 ), 
	"GRANTINVESTMENT_ID" NUMERIC(15,0), 
	"GRANTINVESTMENTCODE" VARCHAR(20 ), 
	"AMOUNT" NUMERIC(15,2) DEFAULT 0, 
	"AMOUNT_2YEAR" NUMERIC(15,2) DEFAULT 0, 
	"AMOUNT_3YEAR" NUMERIC(15,2) DEFAULT 0, 
	"AMOUNT_FUTURE" NUMERIC(15,2) DEFAULT 0
   )  ;
--------------------------------------------------------
--  DDL for Table PLAN3PURCHASELINESHEDULE
--------------------------------------------------------

  CREATE TABLE "PLAN3PURCHASELINESHEDULE" 
   (	"PLAN3PURCHASEDOC_ID" NUMERIC(15,0), 
	"PLAN3PURCHASELINEPOS" NUMERIC(15,0), 
	"FINYEAR" NUMERIC(4,0), 
	"AMOUNT" NUMERIC(15,2) DEFAULT 0
   )  ;
--------------------------------------------------------
--  DDL for Table PLGOODS
--------------------------------------------------------

  CREATE TABLE "PLGOODS" 
   (	"ID" NUMERIC(15,0), 
	"PRICE" NUMERIC(15,2) DEFAULT 0, 
	"MAXQUANTITY" NUMERIC(15,4) DEFAULT 0, 
	"UNIT" VARCHAR(20 ), 
	"NAME" VARCHAR(512 ), 
	"GROUPCODE" VARCHAR(20 ), 
	"ORGID" NUMERIC(15,0)
   )  ;
--------------------------------------------------------
--  DDL for Table PLGOODSPROP
--------------------------------------------------------

  CREATE TABLE "PLGOODSPROP" 
   (	"GOODSID" NUMERIC(15,0), 
	"SEQORDER" NUMERIC(15,0), 
	"PROPTYPE_ID" NUMERIC(15,0), 
	"CAPTION" VARCHAR(512 ), 
	"PROPVALUE" VARCHAR(1500 )
   )  ;
--------------------------------------------------------
--  DDL for Table PLNBUDGETLINE
--------------------------------------------------------

  CREATE TABLE "PLNBUDGETLINE" 
   (	"PLANDOC_ID" NUMERIC(15,0), 
	"POS" NUMERIC(15,0), 
	"ESTIMATE_ID" NUMERIC(15,0), 
	"ESTIMATENAME" VARCHAR(255 ), 
	"RECIPIENT_ID" NUMERIC(15,0), 
	"RECIPIENTNAME" VARCHAR(2000 ), 
	"CODE1" VARCHAR(100 ), 
	"CODE2" VARCHAR(100 ), 
	"CODE3" VARCHAR(100 ), 
	"CODE4" VARCHAR(100 ), 
	"CODE5" VARCHAR(100 ), 
	"CODE6" VARCHAR(100 ), 
	"CODE7" VARCHAR(100 ), 
	"CODE8" VARCHAR(100 ), 
	"CODE9" VARCHAR(100 ), 
	"CODE10" VARCHAR(100 ), 
	"INDUSTRYCODE_ID" NUMERIC(15,0), 
	"GRANTINVESTMENT_ID" NUMERIC(15,0), 
	"FINSRCNAME" VARCHAR(512 ), 
	"FINSRC_ID" NUMERIC(15,0), 
	"AMOUNT1" NUMERIC(15,2) DEFAULT 0, 
	"AMOUNT2" NUMERIC(15,2) DEFAULT 0, 
	"AMOUNT3" NUMERIC(15,2) DEFAULT 0, 
	"AMOUNT4" NUMERIC(15,2) DEFAULT 0
   )  ;
--------------------------------------------------------
--  DDL for Table PLNGOODS
--------------------------------------------------------

  CREATE TABLE "PLNGOODS" 
   (	"PLANDOC_ID" NUMERIC(15,0), 
	"POS" NUMERIC(15,0), 
	"GROUPCODE" VARCHAR(20 ), 
	"GROUPCAPTION" VARCHAR(500 ), 
	"GOODSCODE" VARCHAR(20 ), 
	"GOODSCAPTION" VARCHAR(512 ), 
	"QTY1" NUMERIC(15,4) DEFAULT 0, 
	"QTY2" NUMERIC(15,4) DEFAULT 0, 
	"QTY3" NUMERIC(15,4) DEFAULT 0, 
	"QTY4" NUMERIC(15,4) DEFAULT 0, 
	"QTYENABLEDMASK" NUMERIC(4,0) DEFAULT 15, 
	"PRICE1" NUMERIC(15,2) DEFAULT 0, 
	"PRICE2" NUMERIC(15,2) DEFAULT 0, 
	"PRICE3" NUMERIC(15,2) DEFAULT 0, 
	"PRICE4" NUMERIC(15,2) DEFAULT 0, 
	"AMOUNT1" NUMERIC(15,2) DEFAULT 0, 
	"AMOUNT2" NUMERIC(15,2) DEFAULT 0, 
	"AMOUNT3" NUMERIC(15,2) DEFAULT 0, 
	"AMOUNT4" NUMERIC(15,2) DEFAULT 0, 
	"OKDP_CODE" VARCHAR(7 ), 
	"OKVED" VARCHAR(20 ), 
	"OKPD_NAME" VARCHAR(1000 ), 
	"OKPD_CODE" VARCHAR(20 ), 
	"OKVED_NAME" VARCHAR(1000 ), 
	"OKPD_ID" NUMERIC(15,0), 
	"OKVED_ID" NUMERIC(15,0), 
	"UNITNAME" VARCHAR(50 )
   )  ;
--------------------------------------------------------
--  DDL for Table PLNSHEDULE
--------------------------------------------------------

  CREATE TABLE "PLNSHEDULE" 
   (	"PLANDOC_ID" NUMERIC(15,0), 
	"GOODSPOS" NUMERIC(15,0), 
	"BUDGETLINEPOS" NUMERIC(15,0), 
	"QTY1" NUMERIC(15,4) DEFAULT 0, 
	"QTY2" NUMERIC(15,4) DEFAULT 0, 
	"QTY3" NUMERIC(15,4) DEFAULT 0, 
	"QTY4" NUMERIC(15,4) DEFAULT 0, 
	"AMOUNT1" NUMERIC(15,2) DEFAULT 0, 
	"AMOUNT2" NUMERIC(15,2) DEFAULT 0, 
	"AMOUNT3" NUMERIC(15,2) DEFAULT 0, 
	"AMOUNT4" NUMERIC(15,2) DEFAULT 0
   )  ;
--------------------------------------------------------
--  DDL for Table PREFERENCEGROUP
--------------------------------------------------------

  CREATE TABLE "PREFERENCEGROUP" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"CUSTOMER_ID" NUMERIC(15,0), 
	"CAPTION" VARCHAR(1000 ), 
	"PURCHASEMODE_ID" NUMERIC(15,0), 
	"BUDGETTYPE" NUMERIC(1,0) DEFAULT 0
   )  ;
--------------------------------------------------------
--  DDL for Table PREFERENCEGROUPFEATURE
--------------------------------------------------------

  CREATE TABLE "PREFERENCEGROUPFEATURE" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"PREFERENCEGROUP_ID" NUMERIC(15,0), 
	"PLACEMENTFEATURE_ID" NUMERIC(15,0), 
	"PREFVALUE" NUMERIC(15,2) DEFAULT 0, 
	"CONTENT" VARCHAR(4000 )
   )  ;
--------------------------------------------------------
--  DDL for Table PROCTREE
--------------------------------------------------------

  CREATE TABLE "PROCTREE" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"DOCUMENTCLASS_ID" NUMERIC(15,0), 
	"PARENT_ID" NUMERIC(15,0), 
	"COND_VALUE" NUMERIC(15,0) DEFAULT 0, 
	"SEQ_ORDER" NUMERIC(15,0), 
	"SCHEMA_ACT" VARCHAR(30 ), 
	"PARAMS" VARCHAR(300 ), 
	"PARAMS_ONLY" NUMERIC(1,0) DEFAULT 1
   )  ;
--------------------------------------------------------
--  DDL for Table PROCUREMENT
--------------------------------------------------------

  CREATE TABLE "PROCUREMENT" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"REQUEST_ID" NUMERIC(15,0), 
	"ORDER_ID" NUMERIC(15,0), 
	"CMPDATE" DATE, 
	"FINISHDATE" DATE, 
	"ISARCHIVE" NUMERIC(1,0) DEFAULT 0, 
	"REMARKS" VARCHAR(1000 ), 
	"RESPPERSONAL_ID" NUMERIC(15,0), 
	"COMMISSION_ID" NUMERIC(15,0)
   )  ;
--------------------------------------------------------
--  DDL for Table PROPTYPE
--------------------------------------------------------

  CREATE TABLE "PROPTYPE" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"CAPTION" VARCHAR(512 )
   )  ;
--------------------------------------------------------
--  DDL for Table PURCHASECARRY
--------------------------------------------------------

  CREATE TABLE "PURCHASECARRY" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"DOC_ID" NUMERIC(15,0), 
	"CARRYSTATUS" NUMERIC(1,0) DEFAULT 1, 
	"RECIPIENT_ID" NUMERIC(15,0), 
	"GROUPCODE" VARCHAR(20 ), 
	"OKDP_CODE" VARCHAR(20 ), 
	"PLANYEAR" NUMERIC(4,0), 
	"PURCHASEMODE_ID" NUMERIC(15,0), 
	"CMPORG_ID" NUMERIC(15,0), 
	"FINSRC_ID" NUMERIC(15,0), 
	"NECESSITY_ID" NUMERIC(15,0) DEFAULT 0, 
	"AMOUNT1" NUMERIC(15,2) DEFAULT 0, 
	"AMOUNT2" NUMERIC(15,2) DEFAULT 0, 
	"AMOUNT3" NUMERIC(15,2) DEFAULT 0, 
	"AMOUNT4" NUMERIC(15,2) DEFAULT 0, 
	"ECONOMYAMOUNT" NUMERIC(15,2) DEFAULT 0, 
	"ECONOMYFINALAMOUNT" NUMERIC(15,2) DEFAULT 0, 
	"EXECUTEAMOUNT1" NUMERIC(15,2) DEFAULT 0, 
	"EXECUTEAMOUNT2" NUMERIC(15,2) DEFAULT 0, 
	"EXECUTEAMOUNT3" NUMERIC(15,2) DEFAULT 0, 
	"EXECUTEAMOUNT4" NUMERIC(15,2) DEFAULT 0, 
	"GOODSCODE" VARCHAR(20 ), 
	"CODE1" VARCHAR(100 ), 
	"CODE2" VARCHAR(100 ), 
	"CODE3" VARCHAR(100 ), 
	"CODE4" VARCHAR(100 ), 
	"CODE5" VARCHAR(100 ), 
	"CODE6" VARCHAR(100 ), 
	"CODE7" VARCHAR(100 ), 
	"CODE8" VARCHAR(100 ), 
	"CODE9" VARCHAR(100 ), 
	"CODE10" VARCHAR(100 ), 
	"DELIVERYBASIS_ID" NUMERIC(15,0), 
	"PAYCONDITIONCACHE_ID" NUMERIC(15,0), 
	"INDUSTRYCODE_ID" NUMERIC(15,0), 
	"GRANTINVESTMENT_ID" NUMERIC(15,0), 
	"INVITATIONDATE" DATE, 
	"CMPDATE" DATE, 
	"DESCRIPTIONCACHE_ID" NUMERIC(15,0), 
	"CONTRACTOR_ID" NUMERIC(15,0), 
	"ISENTERPRISE" NUMERIC(1,0) DEFAULT 0, 
	"ISSMALL" NUMERIC(1,0) DEFAULT 0, 
	"PLANVERSION" NUMERIC(1,0) DEFAULT 1, 
	"UNITNAME" VARCHAR(50 )
   )  ;
--------------------------------------------------------
--  DDL for Table PURCHASEMETHOD
--------------------------------------------------------

  CREATE TABLE "PURCHASEMETHOD" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"OOSKEY" VARCHAR(100 ), 
	"ACTUAL" NUMERIC(1,0), 
	"CODE" NUMERIC(15,0), 
	"NAME" VARCHAR(3000 ), 
	"ELECTRONIC" NUMERIC(1,0), 
	"CREATORORG_ID" NUMERIC(15,0)
   )  ;
--------------------------------------------------------
--  DDL for Table PURCHASEMODE
--------------------------------------------------------

  CREATE TABLE "PURCHASEMODE" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"CAPTION" VARCHAR(500 ), 
	"DESCRIPTION" VARCHAR(255 ), 
	"ISPUBLIC" NUMERIC(1,0) DEFAULT 0, 
	"ISACTUAL" NUMERIC(1,0) DEFAULT 0, 
	"KIND" NUMERIC(1,0) DEFAULT 0, 
	"ISPRIOR" NUMERIC(1,0) DEFAULT 0, 
	"CODE_PPRF_807" NUMERIC(2,0), 
	"CODE" NUMERIC(2,0), 
	"CODE_MINFIN_142N" NUMERIC(2,0), 
	"OOS_CODE" VARCHAR(15 ), 
	"OOS_TYPE" VARCHAR(15 )
   )  ;
--------------------------------------------------------
--  DDL for Table PURCHASEPLAN
--------------------------------------------------------

  CREATE TABLE "PURCHASEPLAN" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"GROUPCODE" VARCHAR(20 ), 
	"CUSTOMER_ID" NUMERIC(15,0), 
	"PURCHASEMODE_ID" NUMERIC(15,0), 
	"CMPORG_ID" NUMERIC(15,0), 
	"DESC_ID" NUMERIC(15,0), 
	"PURCHASEPLANDOC_ID" NUMERIC(15,0), 
	"FINSRC_ID" NUMERIC(15,0), 
	"NECESSITY_ID" NUMERIC(15,0) DEFAULT 0, 
	"AMOUNT1" NUMERIC(15,2) DEFAULT 0, 
	"AMOUNT2" NUMERIC(15,2) DEFAULT 0, 
	"AMOUNT3" NUMERIC(15,2) DEFAULT 0, 
	"AMOUNT4" NUMERIC(15,2) DEFAULT 0, 
	"AMOUNT5" NUMERIC(15,2) DEFAULT 0, 
	"AMOUNT6" NUMERIC(15,2) DEFAULT 0, 
	"AMOUNT7" NUMERIC(15,2) DEFAULT 0, 
	"AMOUNT8" NUMERIC(15,2) DEFAULT 0, 
	"AMOUNT9" NUMERIC(15,2) DEFAULT 0, 
	"AMOUNT10" NUMERIC(15,2) DEFAULT 0, 
	"AMOUNT11" NUMERIC(15,2) DEFAULT 0, 
	"AMOUNT12" NUMERIC(15,2) DEFAULT 0, 
	"DATEBEGIN" DATE, 
	"DATEEND" DATE, 
	"ENTAMOUNT1" NUMERIC(15,2) DEFAULT 0, 
	"ENTAMOUNT2" NUMERIC(15,2) DEFAULT 0, 
	"ENTAMOUNT3" NUMERIC(15,2) DEFAULT 0, 
	"ENTAMOUNT4" NUMERIC(15,2) DEFAULT 0, 
	"ENTAMOUNT5" NUMERIC(15,2) DEFAULT 0, 
	"ENTAMOUNT6" NUMERIC(15,2) DEFAULT 0, 
	"ENTAMOUNT7" NUMERIC(15,2) DEFAULT 0, 
	"ENTAMOUNT8" NUMERIC(15,2) DEFAULT 0, 
	"ENTAMOUNT9" NUMERIC(15,2) DEFAULT 0, 
	"ENTAMOUNT10" NUMERIC(15,2) DEFAULT 0, 
	"ENTAMOUNT11" NUMERIC(15,2) DEFAULT 0, 
	"ENTAMOUNT12" NUMERIC(15,2) DEFAULT 0
   )  ;
--------------------------------------------------------
--  DDL for Table PURCHASEPLANDOC
--------------------------------------------------------

  CREATE TABLE "PURCHASEPLANDOC" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"DOCUMENT_ID" NUMERIC(15,0), 
	"DOCUMENTCLASS_ID" NUMERIC(15,0), 
	"DISPSTATUS_ID" NUMERIC(15,0), 
	"BUDGET_ID" NUMERIC(15,0), 
	"OPERTYPE_ID" NUMERIC(15,0) DEFAULT 0, 
	"DOC_NUMBER" VARCHAR(20 ), 
	"DOC_DATE" DATE, 
	"AMOUNT" NUMERIC(15,2) DEFAULT 0, 
	"DESCRIPTION" VARCHAR(2000 ), 
	"REMARK" VARCHAR(255 ), 
	"FOREIGN_KEY" VARCHAR(50 ), 
	"CUSTOMER_ID" NUMERIC(15,0), 
	"PLANYEAR" NUMERIC(4,0)
   )  ;
--------------------------------------------------------
--  DDL for Table QUALIFYSELECT
--------------------------------------------------------

  CREATE TABLE "QUALIFYSELECT" 
   (	"ID" NUMERIC(15,0), 
	"ORDER_ID" NUMERIC(15,0), 
	"QUALIFYREQPOS" NUMERIC(15,0), 
	"COMPETITORPOS" NUMERIC(15,0), 
	"SCORE" NUMERIC(15,4)
   )  ;
--------------------------------------------------------
--  DDL for Table QUALREQ
--------------------------------------------------------

  CREATE TABLE "QUALREQ" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"NAME" VARCHAR(2000 ), 
	"DESCRIPTION" VARCHAR(1000 ), 
	"PURCHASEMODE_ID" NUMERIC(15,0) DEFAULT 1, 
	"REQUIREMENTTYPE_ID" NUMERIC(15,0) DEFAULT 1
   )  ;
--------------------------------------------------------
--  DDL for Table RECOILDOC
--------------------------------------------------------

  CREATE TABLE "RECOILDOC" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"DOCUMENT_ID" NUMERIC(15,0), 
	"DOCUMENTCLASS_ID" NUMERIC(15,0), 
	"DISPSTATUS_ID" NUMERIC(15,0), 
	"OPERTYPE_ID" NUMERIC(15,0) DEFAULT 0, 
	"BUDGET_ID" NUMERIC(15,0), 
	"FOREIGN_KEY" VARCHAR(50 ), 
	"DOC_NUMBER" VARCHAR(20 ), 
	"DOC_DATE" DATE, 
	"AMOUNT" NUMERIC(15,2) DEFAULT 0, 
	"DESCRIPTION" VARCHAR(2000 ), 
	"REMARK" VARCHAR(255 ), 
	"CUSTOMER_ID" NUMERIC(15,0), 
	"CMPORG_ID" NUMERIC(15,0), 
	"PURCHASEMODE_ID" NUMERIC(15,0), 
	"NECESSITY_ID" NUMERIC(15,0) DEFAULT 0, 
	"CON_ID" NUMERIC(15,0), 
	"ISSMALL" NUMERIC(1,0) DEFAULT 0, 
	"INVITATIONDATE" DATE, 
	"DEALDATE" DATE
   )  ;
--------------------------------------------------------
--  DDL for Table RECOILLINES
--------------------------------------------------------

  CREATE TABLE "RECOILLINES" 
   (	"RECOILDOC_ID" NUMERIC(15,0), 
	"POS" NUMERIC(15,0), 
	"GROUPCODE" VARCHAR(20 ), 
	"OKDP_CODE" VARCHAR(20 ), 
	"FINSRC_ID" NUMERIC(15,0), 
	"GOODSCODE" VARCHAR(20 ), 
	"CODE1" VARCHAR(100 ), 
	"CODE2" VARCHAR(100 ), 
	"CODE3" VARCHAR(100 ), 
	"CODE4" VARCHAR(100 ), 
	"CODE5" VARCHAR(100 ), 
	"CODE6" VARCHAR(100 ), 
	"CODE7" VARCHAR(100 ), 
	"CODE8" VARCHAR(100 ), 
	"CODE9" VARCHAR(100 ), 
	"CODE10" VARCHAR(100 ), 
	"DELIVERYBASIS_ID" NUMERIC(15,0), 
	"PAYCONDITIONCACHE_ID" NUMERIC(15,0), 
	"INDUSTRYCODE_ID" NUMERIC(15,0), 
	"GRANTINVESTMENT_ID" NUMERIC(15,0), 
	"CMPDATE" DATE, 
	"ISENTERPRISE" NUMERIC(1,0) DEFAULT 0, 
	"RESERVEDAMOUNT" NUMERIC(15,2) DEFAULT 0, 
	"AMOUNT" NUMERIC(15,2) DEFAULT 0, 
	"UNITNAME" VARCHAR(50 )
   )  ;
--------------------------------------------------------
--  DDL for Table REFATTACH
--------------------------------------------------------

  CREATE TABLE "REFATTACH" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"TABLENAME" VARCHAR(50 ), 
	"RECORD_ID" NUMERIC(15,0), 
	"ATTACH_NAME" VARCHAR(100 ), 
	"ATTACH_DATA" BLOB, 
	"AUTHOR" NUMERIC(15,0), 
	"ACTION_DATE" DATE
   )  
  ;
--------------------------------------------------------
--  DDL for Table REFDOC
--------------------------------------------------------

  CREATE TABLE "REFDOC" 
   (	"DOCUMENT_ID" NUMERIC(15,0), 
	"REF_ID" NUMERIC(15,0)
   )  ;
--------------------------------------------------------
--  DDL for Table REFERENCECLASS
--------------------------------------------------------

  CREATE TABLE "REFERENCECLASS" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"NAME" VARCHAR(50 ), 
	"CAPTION" VARCHAR(255 ), 
	"PROCESSOR_NAME" VARCHAR(255 ), 
	"OBJECT_CLASS_NAME" VARCHAR(255 ), 
	"TABLE_NAME" VARCHAR(255 ), 
	"CONTROL_CLASS_NAME" VARCHAR(255 ), 
	"SUBSYSTEM" NUMERIC(15,0) DEFAULT 0
   )  ;
--------------------------------------------------------
--  DDL for Table REFINANCINGRATE
--------------------------------------------------------

  CREATE TABLE "REFINANCINGRATE" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"START_DATE" DATE, 
	"RATE" NUMERIC(15,2) DEFAULT 0, 
	"LAW_ACT" VARCHAR(255 )
   )  ;
--------------------------------------------------------
--  DDL for Table REFJOURNAL
--------------------------------------------------------

  CREATE TABLE "REFJOURNAL" 
   (	"ID" NUMERIC(15,0), 
	"REF_ID" NUMERIC(15,0), 
	"REF_OBJ_ID" NUMERIC(15,0), 
	"ACTION_NAME" VARCHAR(64 ), 
	"TASKJOURNAL_ID" NUMERIC(15,0), 
	"ACTION_DATA" BLOB SUB_TYPE TEXT, 
	"WORK_DATE" DATE
   )  
  ;
--------------------------------------------------------
--  DDL for Table REFUSALFACTFOUNDATION
--------------------------------------------------------

  CREATE TABLE "REFUSALFACTFOUNDATION" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"OOSKEY" VARCHAR(100 ), 
	"NAME" VARCHAR(1000 ), 
	"ACTUAL" NUMERIC(1,0) DEFAULT 1
   )  ;
--------------------------------------------------------
--  DDL for Table REPDOCFRAGMENT
--------------------------------------------------------

  CREATE TABLE "REPDOCFRAGMENT" 
   (	"REPDOCUMENT_ID" NUMERIC(15,0), 
	"REPFRAGMENT_ID" NUMERIC(15,0), 
	"BOOKMARK" VARCHAR(100 )
   )  ;
--------------------------------------------------------
--  DDL for Table REPDOCUMENT
--------------------------------------------------------

  CREATE TABLE "REPDOCUMENT" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"DOCUMENTTYPE" NUMERIC(1,0) DEFAULT 0, 
	"NAME" VARCHAR(100 ), 
	"CAPTION" VARCHAR(255 )
   )  ;
--------------------------------------------------------
--  DDL for Table REPFIELD
--------------------------------------------------------

  CREATE TABLE "REPFIELD" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"REPFORM_ID" NUMERIC(15,0), 
	"SEQ_ORDER" NUMERIC(4,0) DEFAULT 0, 
	"FIELD_NAME" VARCHAR(50 ), 
	"CAPTION" VARCHAR(100 ), 
	"REQUIRED_FLAG" NUMERIC(1,0) DEFAULT 0, 
	"REFERENCE_FLAG" NUMERIC(1,0) DEFAULT 1, 
	"FIELD_TYPE" NUMERIC(1,0) DEFAULT 0, 
	"EDIT_MASK" VARCHAR(100 ), 
	"MAX_LENGTH" NUMERIC(3,0), 
	"REF_NAME" VARCHAR(50 ), 
	"REF_KEYFIELDS" VARCHAR(100 ), 
	"REF_RESULTFIELD" VARCHAR(100 ), 
	"REF_PARAMS" VARCHAR(100 ), 
	"CTRL_WIDTH" NUMERIC(4,0) DEFAULT 0, 
	"CTRL_HEIGHT" NUMERIC(4,0) DEFAULT 0, 
	"LINES_COUNT" NUMERIC(4,0) DEFAULT 1, 
	"NEWLINE_FLAG" NUMERIC(1,0) DEFAULT 0, 
	"DEF_VALUE" BLOB SUB_TYPE TEXT, 
	"PARAMS" BLOB SUB_TYPE TEXT
   )  
  ;
--------------------------------------------------------
--  DDL for Table REPFORM
--------------------------------------------------------

  CREATE TABLE "REPFORM" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"NAME" VARCHAR(50 ), 
	"PARENT_FORM" VARCHAR(50 ), 
	"CAPTION" VARCHAR(100 ), 
	"SERVERPROCESSOR_ID" NUMERIC(15,0), 
	"SERVERACTION_NAME" VARCHAR(50 ), 
	"XLT_FILENAME" VARCHAR(100 ), 
	"REPORT_CODE" NUMERIC(4,0) DEFAULT 0, 
	"SUBSYSTEM" NUMERIC(15,0)
   )  ;
--------------------------------------------------------
--  DDL for Table REPFRAGMENT
--------------------------------------------------------

  CREATE TABLE "REPFRAGMENT" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"FRAGMENTTYPE" NUMERIC(1,0) DEFAULT 0, 
	"REPSOURCE_ID" NUMERIC(15,0), 
	"NAME" VARCHAR(100 ), 
	"CAPTION" VARCHAR(255 ), 
	"DIVIDER" VARCHAR(255 ), 
	"ISNOTICE" NUMERIC(1,0) DEFAULT 0, 
	"BODY" BLOB SUB_TYPE TEXT
   )  
  ;
--------------------------------------------------------
--  DDL for Table REPFRAGMENTCHILD
--------------------------------------------------------

  CREATE TABLE "REPFRAGMENTCHILD" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"REPFRAGMENT_ID" NUMERIC(15,0), 
	"CHILD_ID" NUMERIC(15,0), 
	"SOURCEFIELDNAME" VARCHAR(255 ), 
	"SOURCEFIELDVALUE" VARCHAR(1000 )
   )  ;
--------------------------------------------------------
--  DDL for Table REPORT
--------------------------------------------------------

  CREATE TABLE "REPORT" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"NAME" VARCHAR(128 ), 
	"CAPTION" VARCHAR(128 ), 
	"DECLARATION" BLOB SUB_TYPE TEXT, 
	"EXCELTEMPLATENAME" VARCHAR(255 )
   )  
  ;
--------------------------------------------------------
--  DDL for Table REPPROFILE
--------------------------------------------------------

  CREATE TABLE "REPPROFILE" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"FORM_NAME" VARCHAR(100 ), 
	"SYSUSER_ID" NUMERIC(15,0), 
	"LOCAL_FLAG" NUMERIC(18,0), 
	"NAME" VARCHAR(100 ), 
	"PROFILE_DATA" BLOB SUB_TYPE TEXT
   )  
  ;
--------------------------------------------------------
--  DDL for Table REPSOURCE
--------------------------------------------------------

  CREATE TABLE "REPSOURCE" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"SOURCETYPE" NUMERIC(1,0) DEFAULT 0, 
	"NAME" VARCHAR(100 ), 
	"CAPTION" VARCHAR(255 ), 
	"CLASSNAME" VARCHAR(255 )
   )  ;
--------------------------------------------------------
--  DDL for Table REPTEMPLATEATTACH
--------------------------------------------------------

  CREATE TABLE "REPTEMPLATEATTACH" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"REPDOCUMENT_ID" NUMERIC(15,0), 
	"DEVICE_NAME" VARCHAR(100 ), 
	"ATTACH_NAME" VARCHAR(100 ), 
	"DESCRIPTION" VARCHAR(255 )
   )  ;
--------------------------------------------------------
--  DDL for Table REQUESTDOC
--------------------------------------------------------

  CREATE TABLE "REQUESTDOC" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"DOCUMENT_ID" NUMERIC(15,0), 
	"DOCUMENTCLASS_ID" NUMERIC(15,0), 
	"DISPSTATUS_ID" NUMERIC(15,0), 
	"OPERTYPE_ID" NUMERIC(15,0) DEFAULT 0, 
	"BUDGET_ID" NUMERIC(15,0), 
	"DOC_NUMBER" VARCHAR(20 ), 
	"DOC_DATE" DATE, 
	"AMOUNT" NUMERIC(15,2) DEFAULT 0, 
	"DESCRIPTION" VARCHAR(2000 ), 
	"OFRREQREASON_ID" NUMERIC(15,0), 
	"SINGLECUSTOMERREASON_ID" NUMERIC(15,0), 
	"CUSTOMER_ID" NUMERIC(15,0), 
	"CUSTOMERNAME" VARCHAR(2000 ), 
	"DELIVERYBASISCODE" VARCHAR(50 ), 
	"PURCHASEMODE_ID" NUMERIC(15,0), 
	"PURCHASEMODE_CAPTION" VARCHAR(500 ), 
	"PAYCONDITIONNAME" VARCHAR(255 ), 
	"CMPORG_ID" NUMERIC(15,0), 
	"REMARK" VARCHAR(255 ), 
	"FOREIGN_KEY" VARCHAR(50 ), 
	"YEARAMT" NUMERIC(15,2) DEFAULT 0, 
	"ASSIGNEDAMT" NUMERIC(15,2) DEFAULT 0, 
	"IGNASSIGN" NUMERIC(1,0), 
	"ISGROUPSMOREONE" NUMERIC(1,0), 
	"EXPORT_FLAG" NUMERIC(1,0) DEFAULT 0, 
	"CONTROLFLAGS" NUMERIC(15,0) DEFAULT 0, 
	"RESPPERSONAL_NAME" VARCHAR(255 ), 
	"RESPPERSONAL_DATE" DATE, 
	"RESPPERSONAL_PHONE" VARCHAR(100 ), 
	"INCOME_NUMBER" VARCHAR(20 ), 
	"INCOME_DATE" DATE, 
	"STATCHANGE_DATE" DATE, 
	"RECIPIENT_ID" NUMERIC(15,0), 
	"RECIPIENT_NAME" VARCHAR(2000 ), 
	"ACTUAL_YEAR" NUMERIC(4,0), 
	"CONTYPE_ID" NUMERIC(15,0), 
	"CMPDATE" DATE, 
	"FUTUREAMT" NUMERIC(15,2) DEFAULT 0, 
	"ENTERPRISE" NUMERIC(1,0) DEFAULT 0, 
	"PLAN_DEALDATE" DATE, 
	"PLAN_INVITATIONDATE" DATE, 
	"SUBJECT" VARCHAR(2000 ), 
	"PRICE_GENERATION_ORDER" BLOB SUB_TYPE TEXT, 
	"RATIONALEPRICE" VARCHAR(4000 ), 
	"PLACINGWAY_ID" NUMERIC(15,0), 
	"QUANTITY" VARCHAR(4000 ), 
	"DELIVERYTERM" VARCHAR(1024 ), 
	"DELIVERYPLACE" VARCHAR(4000 ), 
	"PAYMENTCONDITION" VARCHAR(2000 ), 
	"QUANTITYCONTRACTSPNIR" NUMERIC(15,0), 
	"ADDITIONALINFO" VARCHAR(4000 ), 
	"ISGUARANTEEAPP" NUMERIC(1,0) DEFAULT 0, 
	"GUARANTEEAPPAMOUNT" NUMERIC(15,2), 
	"GUARAPPSETTLEMENTACC_ID" NUMERIC(15,0), 
	"GUARAPPPERSONALACC_ID" NUMERIC(15,0), 
	"GUARAPPBIC" VARCHAR(15 ), 
	"GUARANTEEAPPPROCEDURE" BLOB SUB_TYPE TEXT, 
	"ISGUARANTEECONTRACT" NUMERIC(1,0) DEFAULT 0, 
	"GUARANTEECONTRACTAMOUNT" NUMERIC(15,2), 
	"GUARCONTRSETTLEMENTACC_ID" NUMERIC(15,0), 
	"GUARCONTRPERSONALACC_ID" NUMERIC(15,0), 
	"GUARANTEECONTRACTBIC" VARCHAR(15 ), 
	"GUARANTEECONTRACTPROCEDURE" BLOB SUB_TYPE TEXT, 
	"GUARANTEECONTRACTISBAIL" NUMERIC(1,0) DEFAULT 0, 
	"ENERGYTYPE" VARCHAR(3 ), 
	"ENERGYSERVICEECONOMY" VARCHAR(2000 ), 
	"SIGNTERM" NUMERIC(15,0), 
	"PLANPOSITIONNUMBER" VARCHAR(100 ), 
	"PARENTREQUESTDOC_ID" NUMERIC(15,0), 
	"ADVANCE" NUMERIC(15,2), 
	"RESERVETYPE" NUMERIC(1,0) DEFAULT 0, 
	"ISAMOUNTPERCENT" NUMERIC(1,0) DEFAULT 0, 
	"AMOUNTPERCENT" NUMERIC(3,2), 
	"CURRENCY_ID" NUMERIC(15,0), 
	"CURRENCY_CODE" VARCHAR(3 ), 
	"CONMNGRRESP_FULLNAME" VARCHAR(256 ), 
	"CUSTCANCHANGECONTERMS" NUMERIC(1,0) DEFAULT 0, 
	"CUSTCANREFUSE" NUMERIC(1,0) DEFAULT 0, 
	"CONSERVICEINFO" VARCHAR(2000 ), 
	"CURYEARAMOUNT" NUMERIC(15,2) DEFAULT 0, 
	"CUSTCANREFUSEINFO" BLOB SUB_TYPE TEXT, 
	"LIMITCONDEFINITION" BLOB SUB_TYPE TEXT, 
	"GOODSLIMITS" BLOB SUB_TYPE TEXT, 
	"NECESSITY_ID" NUMERIC(15,0) DEFAULT 0, 
	"NECESSITY_DESCRIPTION" VARCHAR(1000 ), 
	"REPNOTICE_ID" NUMERIC(15,0), 
	"ETP_ID" NUMERIC(15,0), 
	"RESPPERSONAL_ID" NUMERIC(15,0), 
	"COMMISSION_ID" NUMERIC(15,0), 
	"CONMNGRRESP_ID" NUMERIC(15,0), 
	"CONSOLIDDOC_ID" NUMERIC(15,0), 
	"PRICEFORMULA" VARCHAR(2000 ), 
	"STANDARDCONTRACTNUMBER" VARCHAR(16 ), 
	"ALLOWMULTIPLECONTRACTS" NUMERIC(1,0) DEFAULT 0, 
	"GUARANTEEAPPPERCENT" NUMERIC(5,2), 
	"GUARANTEECONTRACTPERCENT" NUMERIC(5,2), 
	"DATENUMORDERNAME" VARCHAR(2000 ), 
	"ETPKEY" VARCHAR(100 ), 
	"DECLINECOUNTER" NUMERIC(15,0) DEFAULT 0
   )  
  ;
--------------------------------------------------------
--  DDL for Table REQUESTORDER
--------------------------------------------------------

  CREATE TABLE "REQUESTORDER" 
   (	"ORDER_ID" NUMERIC(15,0), 
	"DOC_ID" NUMERIC(15,0), 
	"DOCUMENT_ID" NUMERIC(15,0)
   )  ;
--------------------------------------------------------
--  DDL for Table REQUIREMENTTYPE
--------------------------------------------------------

  CREATE TABLE "REQUIREMENTTYPE" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"REFTYPE" NUMERIC(1,0), 
	"QTYPE" NUMERIC(2,0), 
	"NAME" VARCHAR(500 ), 
	"IS_ACTUAL" NUMERIC(1,0), 
	"VISIBLE" NUMERIC(1,0)
   )  ;
--------------------------------------------------------
--  DDL for Table REQUIREMENTTYPEPM
--------------------------------------------------------

  CREATE TABLE "REQUIREMENTTYPEPM" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"REQUIREMENTTYPE_ID" NUMERIC(15,0), 
	"PURCHASEMODE_ID" NUMERIC(15,0)
   )  ;
--------------------------------------------------------
--  DDL for Table RESERVEDBUDGETLINE
--------------------------------------------------------

  CREATE TABLE "RESERVEDBUDGETLINE" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"ORDER_ID" NUMERIC(15,0), 
	"CUSTOMER_ID" NUMERIC(15,0), 
	"RECIPIENT_ID" NUMERIC(15,0), 
	"ESTIMATE_ID" NUMERIC(15,0), 
	"CODE1" VARCHAR(100 ), 
	"CODE2" VARCHAR(100 ), 
	"CODE3" VARCHAR(100 ), 
	"CODE4" VARCHAR(100 ), 
	"CODE5" VARCHAR(100 ), 
	"CODE6" VARCHAR(100 ), 
	"CODE7" VARCHAR(100 ), 
	"CODE8" VARCHAR(100 ), 
	"CODE9" VARCHAR(100 ), 
	"CODE10" VARCHAR(100 ), 
	"RESERVED_AMOUNT" NUMERIC(15,2) DEFAULT 0, 
	"EXPENDED_AMOUNT" NUMERIC(15,2) DEFAULT 0, 
	"DISPSTATUS_ID" NUMERIC(15,0), 
	"ERRORCAUSE" VARCHAR(2000 ), 
	"RELEASED_AMOUNT" NUMERIC(15,2) DEFAULT 0, 
	"AMOUNT_FOR_RELEASE" NUMERIC(15,2) DEFAULT 0, 
	"AMOUNT_FOR_RETURN" NUMERIC(15,2) DEFAULT 0, 
	"FINYEAR" NUMERIC(4,0), 
	"PARENT_ID" NUMERIC(15,0), 
	"INDUSTRYCODE_ID" NUMERIC(15,0), 
	"GRANTINVESTMENT_ID" NUMERIC(15,0)
   )  ;
--------------------------------------------------------
--  DDL for Table RESPONSIBILITY
--------------------------------------------------------

  CREATE TABLE "RESPONSIBILITY" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"NAME" VARCHAR(100 ), 
	"CAPTION" VARCHAR(255 )
   )  ;
--------------------------------------------------------
--  DDL for Table RNP
--------------------------------------------------------

  CREATE TABLE "RNP" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"REGISTRY_NUMBER" VARCHAR(100 ), 
	"INCLUSIONDATE" DATE, 
	"AUTHORIZED_UNIT" VARCHAR(2000 ), 
	"VENDOR_NAME" VARCHAR(2000 ), 
	"VENDOR_TAXCODE" VARCHAR(20 ), 
	"VENDOR_POSTINDEX" VARCHAR(20 ), 
	"VENDOR_CITY" VARCHAR(300 ), 
	"VENDOR_ADDRESS" VARCHAR(1000 ), 
	"CMPDATE" DATE, 
	"CONFIRMING_DOCUMENT_DETAILS" VARCHAR(2000 ), 
	"CONTRACT_DEALDATE" DATE, 
	"CONTRACT_REGISTRY_NUMBER" VARCHAR(100 ), 
	"CONTRACT_SUBJECT" BLOB SUB_TYPE TEXT, 
	"CONTRACT_AMOUNT" NUMERIC(18,2) DEFAULT 0, 
	"CONTRACT_COMPLETEDATE" DATE, 
	"CONTRACT_DISSOLVE_REASON" BLOB SUB_TYPE TEXT, 
	"CONTRACT_DISSOLVEDATE" DATE, 
	"STATE" NUMERIC(1,0) DEFAULT 0, 
	"CONTRACT_EXCLUDEDATE" DATE, 
	"REGISTRY_FLAG" NUMERIC(1,0) DEFAULT 0
   )  
  ;
--------------------------------------------------------
--  DDL for Table ROLEAPPOBJ
--------------------------------------------------------

  CREATE TABLE "ROLEAPPOBJ" 
   (	"USERROLE_ID" NUMERIC(15,0), 
	"APPOBJNAME" VARCHAR(128 ), 
	"ACCESS_MODE" NUMERIC(1,0) DEFAULT 0
   )  ;
--------------------------------------------------------
--  DDL for Table ROLEATTACH
--------------------------------------------------------

  CREATE TABLE "ROLEATTACH" 
   (	"USERROLE_ID" NUMERIC(15,0), 
	"DOCUMENTCLASS_ID" NUMERIC(15,0), 
	"DISPSTATUS_ID" NUMERIC(15,0), 
	"CATEGORY_ID" NUMERIC(15,0), 
	"ACCESS_MODE" NUMERIC(1,0) DEFAULT 0
   )  ;
--------------------------------------------------------
--  DDL for Table ROLEBUDGET
--------------------------------------------------------

  CREATE TABLE "ROLEBUDGET" 
   (	"USERROLE_ID" NUMERIC(15,0), 
	"BUDGET_ID" NUMERIC(15,0), 
	"ACCESS_MODE" NUMERIC(1,0) DEFAULT 0
   )  ;
--------------------------------------------------------
--  DDL for Table ROLECLASS
--------------------------------------------------------

  CREATE TABLE "ROLECLASS" 
   (	"USERROLE_ID" NUMERIC(15,0), 
	"DOCUMENTCLASS_ID" NUMERIC(15,0), 
	"ACCESS_MODE" NUMERIC(1,0) DEFAULT 0
   )  ;
--------------------------------------------------------
--  DDL for Table ROLEEVENT
--------------------------------------------------------

  CREATE TABLE "ROLEEVENT" 
   (	"USERROLE_ID" NUMERIC(15,0), 
	"DOCUMENTCLASS_ID" NUMERIC(15,0), 
	"DISPSTATUS_ID" NUMERIC(15,0), 
	"EVENT_NAME" VARCHAR(50 )
   )  ;
--------------------------------------------------------
--  DDL for Table ROLEFUNC
--------------------------------------------------------

  CREATE TABLE "ROLEFUNC" 
   (	"USERROLE_ID" NUMERIC(15,0), 
	"FUNUNIT_NAME" VARCHAR(50 ), 
	"ACCESS_MODE" NUMERIC(1,0) DEFAULT 0
   )  ;
--------------------------------------------------------
--  DDL for Table ROLEORG
--------------------------------------------------------

  CREATE TABLE "ROLEORG" 
   (	"USERROLE_ID" NUMERIC(15,0), 
	"ORG_ID" NUMERIC(15,0), 
	"ACCESS_MODE" NUMERIC(1,0) DEFAULT 0
   )  ;
--------------------------------------------------------
--  DDL for Table ROLEREFCLASS
--------------------------------------------------------

  CREATE TABLE "ROLEREFCLASS" 
   (	"USERROLE_ID" NUMERIC(15,0), 
	"ACCESS_MODE" NUMERIC(1,0) DEFAULT 0, 
	"REF_NAME" VARCHAR(50 )
   )  ;
--------------------------------------------------------
--  DDL for Table ROLEREGISTER
--------------------------------------------------------

  CREATE TABLE "ROLEREGISTER" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"BUDGET_ID" NUMERIC(15,0), 
	"DOCUMENTCLASS_ID" NUMERIC(15,0), 
	"DISPSTATUS_ID" NUMERIC(15,0), 
	"DOC_NUMBER" VARCHAR(20 ), 
	"DOC_DATE" DATE, 
	"GRANTEDROLE_ID" NUMERIC(15,0), 
	"GRANTINGUSER_ID" NUMERIC(15,0), 
	"USER_ID" NUMERIC(15,0), 
	"GRANTDATE" TIMESTAMP , 
	"FROMDATE" DATE, 
	"TODATE" DATE, 
	"DESCRIPTION" BLOB SUB_TYPE TEXT, 
	"DOCUMENT_ID" NUMERIC(15,0), 
	"OPERTYPE_ID" NUMERIC(15,0) DEFAULT 0, 
	"AMOUNT" NUMERIC(15,2) DEFAULT 0, 
	"FOREIGN_KEY" VARCHAR(50 ), 
	"OPERATION" NUMERIC(2,0)
   )  
  ;
--------------------------------------------------------
--  DDL for Table ROLERIGHT
--------------------------------------------------------

  CREATE TABLE "ROLERIGHT" 
   (	"USERROLE_ID" NUMERIC(15,0), 
	"SYSRIGHT_NAME" VARCHAR(50 )
   )  ;
--------------------------------------------------------
--  DDL for Table RPL
--------------------------------------------------------

  CREATE TABLE "RPL" 
   (	"MASTER_ID" NUMERIC(15,0), 
	"CLIENT_ID" NUMERIC(15,0), 
	"RPLOBJECT_ID" NUMERIC(15,0), 
	"RPL_ACTIVE" NUMERIC(1,0) DEFAULT 1, 
	"SENT_VERSION" NUMERIC(18,0) DEFAULT 0, 
	"RECEIVED_VERSION" NUMERIC(18,0) DEFAULT 0, 
	"FLTR" VARCHAR(255 ), 
	"RPLTYPE" NUMERIC(18,0), 
	"EXEC_ORDER" NUMERIC(18,0), 
	"NAME" VARCHAR(50 ), 
	"TABLE_NAME" VARCHAR(50 ), 
	"SERVERPROCESSOR_NAME" VARCHAR(50 ), 
	"FIELD1_VALUE" NUMERIC(15,0), 
	"FIELD2_VALUE" NUMERIC(15,0), 
	"FIELD3_VALUE" NUMERIC(15,0), 
	"FIELD4_VALUE" NUMERIC(15,0), 
	"FIELD5_VALUE" NUMERIC(15,0), 
	"FILTER_CONDITION" VARCHAR(2000 ), 
	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0)
   )  ;
--------------------------------------------------------
--  DDL for Table RPL$CONSTRAINTFIELDS
--------------------------------------------------------

  CREATE TABLE "RPL$CONSTRAINTFIELDS" 
   (	"ID" NUMERIC(18,0), 
	"RPL$CONSTRAINTS_ID" NUMERIC(18,0), 
	"ENUM_ORDER" NUMERIC(18,0), 
	"FIELDNAME" VARCHAR(50 ), 
	"TARGET_FIELDNAME" VARCHAR(50 )
   )  ;
--------------------------------------------------------
--  DDL for Table RPL$CONSTRAINTS
--------------------------------------------------------

  CREATE TABLE "RPL$CONSTRAINTS" 
   (	"ID" NUMERIC(18,0), 
	"NAME" VARCHAR(50 ), 
	"TRIGGERNAME" VARCHAR(20 ), 
	"TABLENAME" VARCHAR(50 ), 
	"TARGET_TABLENAME" VARCHAR(50 ), 
	"UPDATE_RULE" VARCHAR(11 ) DEFAULT 'RESTRICT', 
	"DELETE_RULE" VARCHAR(11 ) DEFAULT 'RESTRICT', 
	"DEFFERABLE" NUMERIC(18,0) DEFAULT 0
   )  ;
--------------------------------------------------------
--  DDL for Table RPLLOG
--------------------------------------------------------

  CREATE TABLE "RPLLOG" 
   (	"RPLTABLE_ID" NUMERIC(15,0), 
	"GENERATION" NUMERIC(15,0), 
	"RECORD_ID" NUMERIC(15,0), 
	"FIELD1_VALUE" NUMERIC(15,0), 
	"FIELD2_VALUE" NUMERIC(15,0), 
	"FIELD3_VALUE" NUMERIC(15,0), 
	"FIELD4_VALUE" NUMERIC(15,0), 
	"FIELD5_VALUE" NUMERIC(15,0), 
	"TRANSACTION_ID" VARCHAR(16 )
   )  ;
--------------------------------------------------------
--  DDL for Table RPLOBJECT
--------------------------------------------------------

  CREATE TABLE "RPLOBJECT" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"NAME" VARCHAR(50 ), 
	"DESCRIPTION" VARCHAR(255 ), 
	"FLTR" VARCHAR(255 ), 
	"CLASSNAME" VARCHAR(255 ), 
	"SEQORDER" NUMERIC(15,0)
   )  ;
--------------------------------------------------------
--  DDL for Table RPLRULE
--------------------------------------------------------

  CREATE TABLE "RPLRULE" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"NAME" VARCHAR(50 )
   )  ;
--------------------------------------------------------
--  DDL for Table RPLRULEOBJ
--------------------------------------------------------

  CREATE TABLE "RPLRULEOBJ" 
   (	"RPLRULE_ID" NUMERIC(15,0), 
	"RPLOBJECT_ID" NUMERIC(15,0)
   )  ;
--------------------------------------------------------
--  DDL for Table RPLSITE
--------------------------------------------------------

  CREATE TABLE "RPLSITE" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"MASTER_ID" NUMERIC(15,0), 
	"CLIENT_ID" NUMERIC(15,0), 
	"RPLRULE_ID" NUMERIC(15,0)
   )  ;
--------------------------------------------------------
--  DDL for Table RPLTABLE
--------------------------------------------------------

  CREATE TABLE "RPLTABLE" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"NAME" VARCHAR(50 ), 
	"ISLOG_FLAG" NUMERIC(1,0) DEFAULT 0, 
	"RPLFIELD1" VARCHAR(50 ), 
	"RPLFIELD2" VARCHAR(50 ), 
	"RPLFIELD3" VARCHAR(50 ), 
	"RPLFIELD4" VARCHAR(50 ), 
	"RPLFIELD5" VARCHAR(50 ), 
	"ISPLUGIN" NUMERIC(1,0) DEFAULT 0, 
	"OLD_VALUE" NUMERIC(18,0), 
	"GENERATION_GROUP" NUMERIC(1,0) DEFAULT 0
   )  ;
--------------------------------------------------------
--  DDL for Table RPLTABLEPLUGIN
--------------------------------------------------------

  CREATE TABLE "RPLTABLEPLUGIN" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"RPLTABLE_ID" NUMERIC(15,0), 
	"PLUGIN_RPLTABLE_ID" NUMERIC(15,0), 
	"JOIN_FRAGMENT" VARCHAR(2000 )
   )  ;
--------------------------------------------------------
--  DDL for Table RPLTABLINK
--------------------------------------------------------

  CREATE TABLE "RPLTABLINK" 
   (	"RPLTABLE_ID" NUMERIC(15,0), 
	"FIELD_NAME" VARCHAR(50 )
   )  ;
--------------------------------------------------------
--  DDL for Table RPLTRANSACTMODE
--------------------------------------------------------

  CREATE TABLE "RPLTRANSACTMODE" 
   (	"NUM_TRANSACTION" VARCHAR(50 ), 
	"RPL_MODE" NUMERIC(18,0) DEFAULT 0
   )  ;
--------------------------------------------------------
--  DDL for Table RPLVERSIONLOG
--------------------------------------------------------

  CREATE TABLE "RPLVERSIONLOG" 
   (	"VER" NUMERIC(15,0), 
	"NUM_TRANSACTION" VARCHAR(50 ), 
	"RPLTABLE_ID" NUMERIC(15,0), 
	"TASKJOURNAL_ID" NUMERIC(15,0), 
	"RECORD_ID" NUMERIC(15,0), 
	"RECORD_ACTION" NUMERIC(1,0) DEFAULT 0
   )  ;
--------------------------------------------------------
--  DDL for Table RQBUDGETLINE
--------------------------------------------------------

  CREATE TABLE "RQBUDGETLINE" 
   (	"REQUEST_ID" NUMERIC(15,0), 
	"POS" NUMERIC(15,0), 
	"ESTIMATE_ID" NUMERIC(15,0), 
	"ESTIMATENAME" VARCHAR(255 ), 
	"RECIPIENT_ID" NUMERIC(15,0), 
	"RECIPIENTNAME" VARCHAR(2000 ), 
	"CODE1" VARCHAR(100 ), 
	"CODE2" VARCHAR(100 ), 
	"CODE3" VARCHAR(100 ), 
	"CODE4" VARCHAR(100 ), 
	"CODE5" VARCHAR(100 ), 
	"CODE6" VARCHAR(100 ), 
	"CODE7" VARCHAR(100 ), 
	"CODE8" VARCHAR(100 ), 
	"CODE9" VARCHAR(100 ), 
	"CODE10" VARCHAR(100 ), 
	"FINSRCNAME" VARCHAR(512 ), 
	"FINSRC_ID" NUMERIC(15,0), 
	"COUNTRY_ID" NUMERIC(15,0), 
	"TERRITORYCODE" VARCHAR(20 ), 
	"ADDRESS" VARCHAR(300 ), 
	"SUPPLYAMOUNT" NUMERIC(15,2) DEFAULT 0, 
	"USEAMOUNT" NUMERIC(1,0) DEFAULT 0, 
	"CALCPRICE" NUMERIC(1,0) DEFAULT 0, 
	"INDUSTRYCODE_ID" NUMERIC(15,0), 
	"GRANTINVESTMENT_ID" NUMERIC(15,0)
   )  ;
--------------------------------------------------------
--  DDL for Table RQCOMMEMBER
--------------------------------------------------------

  CREATE TABLE "RQCOMMEMBER" 
   (	"REQUEST_ID" NUMERIC(15,0), 
	"POS" NUMERIC(15,0), 
	"COMMEMBER_ID" NUMERIC(15,0), 
	"COMMEMBER_ROLE" VARCHAR(255 ), 
	"COMMEMBER_NAME" VARCHAR(255 ), 
	"COMROLE" NUMERIC(1,0), 
	"ABSENT" NUMERIC(1,0), 
	"NOTE" VARCHAR(100 ), 
	"ISACTINGFORSECRETARY" NUMERIC(1,0) DEFAULT 0
   )  ;
--------------------------------------------------------
--  DDL for Table RQCONDEALRESP
--------------------------------------------------------

  CREATE TABLE "RQCONDEALRESP" 
   (	"REQUEST_ID" NUMERIC(15,0), 
	"POS" NUMERIC(15,0), 
	"LOTPOS" NUMERIC(15,0), 
	"PERSONAL_ID" NUMERIC(15,0), 
	"PERSONAL_NAME" VARCHAR(256 )
   )  ;
--------------------------------------------------------
--  DDL for Table RQCRITERION
--------------------------------------------------------

  CREATE TABLE "RQCRITERION" 
   (	"REQUEST_ID" NUMERIC(15,0), 
	"POS" NUMERIC(15,0), 
	"NAME" VARCHAR(512 ), 
	"CTYPE" NUMERIC(2,0), 
	"CALCMODE" NUMERIC(1,0), 
	"BESTPARAM" NUMERIC(1,0), 
	"WEIGHT" NUMERIC(15,2), 
	"LOTPOS" NUMERIC(15,0), 
	"TENDERCRITERION_ID" NUMERIC(15,0), 
	"MINWEIGHT" NUMERIC(15,2), 
	"MAXWEIGHT" NUMERIC(15,2), 
	"VAL" NUMERIC(15,2), 
	"DESCRIPTION" VARCHAR(2000 ), 
	"FORMULA" VARCHAR(2000 ), 
	"OOSCODE" VARCHAR(2 ) DEFAULT '0', 
	"UNITNAME" VARCHAR(50 )
   )  ;
--------------------------------------------------------
--  DDL for Table RQCRITERIONLINE
--------------------------------------------------------

  CREATE TABLE "RQCRITERIONLINE" 
   (	"REQUEST_ID" NUMERIC(15,0), 
	"RQCRITERIONPOS" NUMERIC(15,0), 
	"SEQORDER" NUMERIC(15,0), 
	"CAPTION" VARCHAR(2000 ), 
	"MINVALUE" NUMERIC(15,2), 
	"MAXVALUE" NUMERIC(15,2), 
	"WEIGHT" NUMERIC(15,2), 
	"LIMITDESCRIPTION" VARCHAR(2000 ), 
	"DESCRIPTION" VARCHAR(2000 )
   )  ;
--------------------------------------------------------
--  DDL for Table RQDOCCHILD
--------------------------------------------------------

  CREATE TABLE "RQDOCCHILD" 
   (	"REQUEST_ID" NUMERIC(15,0), 
	"DOC_ID" NUMERIC(15,0), 
	"DOCUMENT_ID" NUMERIC(15,0)
   )  ;
--------------------------------------------------------
--  DDL for Table RQDOCREQ
--------------------------------------------------------

  CREATE TABLE "RQDOCREQ" 
   (	"REQUEST_ID" NUMERIC(15,0), 
	"POS" NUMERIC(15,0), 
	"LOTPOS" NUMERIC(15,0), 
	"NAME" VARCHAR(1000 ), 
	"VENDOR_TYPE" VARCHAR(2 ) DEFAULT 0, 
	"ISREQUIRED" NUMERIC(1,0) DEFAULT 1, 
	"ISCONTENTTYPE" NUMERIC(1,0) DEFAULT 0, 
	"TYPE" NUMERIC(2,0) DEFAULT 0, 
	"DESCRIPTION" VARCHAR(4000 ), 
	"REQUIREMENTTYPE_ID" NUMERIC(15,0), 
	"REQUIREMENTTYPE_NAME" VARCHAR(500 )
   )  ;
--------------------------------------------------------
--  DDL for Table RQFEATURE
--------------------------------------------------------

  CREATE TABLE "RQFEATURE" 
   (	"REQUEST_ID" NUMERIC(15,0), 
	"POS" NUMERIC(15,0), 
	"LOTPOS" NUMERIC(15,0), 
	"PLACEMENTFEATURE_ID" NUMERIC(15,0), 
	"PREFVALUE" NUMERIC(15,2) DEFAULT 0, 
	"CONTENT" VARCHAR(4000 )
   )  ;
--------------------------------------------------------
--  DDL for Table RQGOODS
--------------------------------------------------------

  CREATE TABLE "RQGOODS" 
   (	"REQUEST_ID" NUMERIC(15,0), 
	"POS" NUMERIC(15,0), 
	"GROUPCODE" VARCHAR(20 ), 
	"GROUPCAPTION" VARCHAR(500 ), 
	"OKDP_CODE" VARCHAR(20 ), 
	"GOODSCODE" VARCHAR(20 ), 
	"GOODSCAPTION" VARCHAR(512 ), 
	"QTY" NUMERIC(15,4) DEFAULT 0, 
	"PRICE" NUMERIC(15,2) DEFAULT 0, 
	"AMOUNT" NUMERIC(15,2) DEFAULT 0, 
	"STATUS" NUMERIC(1,0) DEFAULT 0, 
	"OKPD_CODE" VARCHAR(20 ), 
	"OKPD_NAME" VARCHAR(1000 ), 
	"OKPD_ID" NUMERIC(15,0), 
	"OKVED_ID" NUMERIC(15,0), 
	"OKVED" VARCHAR(20 ), 
	"OKVED_NAME" VARCHAR(1000 ), 
	"UNITNAME" VARCHAR(50 )
   )  ;
--------------------------------------------------------
--  DDL for Table RQGOODSPROP
--------------------------------------------------------

  CREATE TABLE "RQGOODSPROP" 
   (	"REQUEST_ID" NUMERIC(15,0), 
	"GOODSPOS" NUMERIC(15,0), 
	"SEQORDER" NUMERIC(15,0), 
	"PROPTYPE_ID" NUMERIC(15,0), 
	"CAPTION" VARCHAR(512 ), 
	"PROPVALUE" VARCHAR(1500 )
   )  ;
--------------------------------------------------------
--  DDL for Table RQLOT
--------------------------------------------------------

  CREATE TABLE "RQLOT" 
   (	"REQUEST_ID" NUMERIC(15,0), 
	"POS" NUMERIC(15,0), 
	"LOTNUMBER" NUMERIC(15,0), 
	"NAME" VARCHAR(2000 ), 
	"DELIVERYBASISCODE" VARCHAR(50 ), 
	"PAYCONDITIONNAME" VARCHAR(255 ), 
	"CONTYPE_ID" NUMERIC(15,0), 
	"AMOUNT" NUMERIC(15,2) DEFAULT 0, 
	"CMPDATE" DATE, 
	"ENTERPRISE" NUMERIC(1,0) DEFAULT 0, 
	"PLAN_DEALDATE" DATE, 
	"SUBJECT" VARCHAR(2000 ), 
	"PRICE_GENERATION_ORDER" BLOB SUB_TYPE TEXT, 
	"RATIONALEPRICE" VARCHAR(4000 ), 
	"QUANTITY" VARCHAR(4000 ), 
	"DELIVERYTERM" VARCHAR(1024 ), 
	"DELIVERYPLACE" VARCHAR(4000 ), 
	"PAYMENTCONDITION" VARCHAR(2000 ), 
	"QUANTITYCONTRACTSPNIR" NUMERIC(15,0), 
	"ADDITIONALINFO" VARCHAR(4000 ), 
	"ISGUARANTEEAPP" NUMERIC(1,0) DEFAULT 0, 
	"GUARANTEEAPPAMOUNT" NUMERIC(15,2), 
	"GUARAPPSETTLEMENTACC_ID" NUMERIC(15,0), 
	"GUARAPPPERSONALACC_ID" NUMERIC(15,0), 
	"GUARAPPBIC" VARCHAR(15 ), 
	"GUARANTEEAPPPROCEDURE" BLOB SUB_TYPE TEXT, 
	"ISGUARANTEECONTRACT" NUMERIC(1,0) DEFAULT 0, 
	"GUARANTEECONTRACTAMOUNT" NUMERIC(15,2), 
	"GUARCONTRSETTLEMENTACC_ID" NUMERIC(15,0), 
	"GUARCONTRPERSONALACC_ID" NUMERIC(15,0), 
	"GUARANTEECONTRACTBIC" VARCHAR(15 ), 
	"GUARANTEECONTRACTPROCEDURE" BLOB SUB_TYPE TEXT, 
	"GUARANTEECONTRACTISBAIL" NUMERIC(1,0) DEFAULT 0, 
	"ENERGYTYPE" VARCHAR(3 ), 
	"ENERGYSERVICEECONOMY" VARCHAR(2000 ), 
	"PLANPOSITIONNUMBER" VARCHAR(100 ), 
	"ADVANCE" NUMERIC(15,2), 
	"ISAMOUNTPERCENT" NUMERIC(1,0) DEFAULT 0, 
	"AMOUNTPERCENT" NUMERIC(3,2), 
	"CURRENCY_ID" NUMERIC(15,0), 
	"CURRENCY_CODE" VARCHAR(3 ), 
	"CONMNGRRESP_FULLNAME" VARCHAR(256 ), 
	"CUSTCANCHANGECONTERMS" NUMERIC(1,0) DEFAULT 0, 
	"CUSTCANREFUSE" NUMERIC(1,0) DEFAULT 0, 
	"CONSERVICEINFO" VARCHAR(2000 ), 
	"CUSTCANREFUSEINFO" BLOB SUB_TYPE TEXT, 
	"LIMITCONDEFINITION" BLOB SUB_TYPE TEXT, 
	"GOODSLIMITS" BLOB SUB_TYPE TEXT, 
	"CONMNGRRESP_ID" NUMERIC(15,0), 
	"PRICEFORMULA" VARCHAR(2000 ), 
	"STANDARDCONTRACTNUMBER" VARCHAR(16 ), 
	"ALLOWMULTIPLECONTRACTS" NUMERIC(1,0) DEFAULT 0, 
	"GUARANTEEAPPPERCENT" NUMERIC(5,2), 
	"GUARANTEECONTRACTPERCENT" NUMERIC(5,2)
   )  
  ;
--------------------------------------------------------
--  DDL for Table RQOPTIMIZEDPRICE
--------------------------------------------------------

  CREATE TABLE "RQOPTIMIZEDPRICE" 
   (	"REQUEST_ID" NUMERIC(15,0), 
	"POS" NUMERIC(15,0), 
	"PLANPOSITIONNUMBER" VARCHAR(100 ), 
	"PERCENT" NUMERIC(5,2) DEFAULT 0, 
	"AMOUNT" NUMERIC(15,2) DEFAULT 0
   )  ;
--------------------------------------------------------
--  DDL for Table RQPAYSHEDULE
--------------------------------------------------------

  CREATE TABLE "RQPAYSHEDULE" 
   (	"REQUEST_ID" NUMERIC(15,0), 
	"BUDGETLINEPOS" NUMERIC(15,0), 
	"PAYDATE" DATE, 
	"AMOUNT" NUMERIC(15,2) DEFAULT 0
   )  ;
--------------------------------------------------------
--  DDL for Table RQQUALREQ
--------------------------------------------------------

  CREATE TABLE "RQQUALREQ" 
   (	"REQUEST_ID" NUMERIC(15,0), 
	"POS" NUMERIC(15,0), 
	"LOTPOS" NUMERIC(15,0), 
	"NAME" VARCHAR(2000 ), 
	"QTYPE" NUMERIC(2,0), 
	"QMINVALUE" NUMERIC(15,4), 
	"QMAXVALUE" NUMERIC(15,4), 
	"PLACEMENTFEATURE_ID" NUMERIC(15,0), 
	"CONTENT" VARCHAR(2000 ), 
	"REQUIREMENTTYPE_ID" NUMERIC(15,0), 
	"REQUIREMENTTYPE_NAME" VARCHAR(500 )
   )  ;
--------------------------------------------------------
--  DDL for Table RQSUPPLYSHEDULE
--------------------------------------------------------

  CREATE TABLE "RQSUPPLYSHEDULE" 
   (	"REQUEST_ID" NUMERIC(15,0), 
	"BUDGETLINEPOS" NUMERIC(15,0), 
	"GOODSPOS" NUMERIC(15,0), 
	"SUPPLYDATE" DATE, 
	"QTY" NUMERIC(15,4) DEFAULT 0, 
	"AMOUNT" NUMERIC(15,2) DEFAULT 0, 
	"LOTPOS" NUMERIC(15,0)
   )  ;
--------------------------------------------------------
--  DDL for Table RQVENDOR
--------------------------------------------------------

  CREATE TABLE "RQVENDOR" 
   (	"REQUEST_ID" NUMERIC(15,0), 
	"POS" NUMERIC(15,0), 
	"VENDOR_ID" NUMERIC(15,0), 
	"TAXCODE" VARCHAR(20 ), 
	"KPP" VARCHAR(20 ), 
	"VENDORNAME" VARCHAR(2000 ), 
	"REFCOUNT" NUMERIC(4,0), 
	"PROPFORM_ID" NUMERIC(15,0)
   )  ;
--------------------------------------------------------
--  DDL for Table RULEREQUISITE
--------------------------------------------------------

  CREATE TABLE "RULEREQUISITE" 
   (	"ID" NUMERIC(18,0), 
	"VERSION" NUMERIC(15,0), 
	"DOCUMENTCLASS_ID" NUMERIC(18,0), 
	"CAPTION" VARCHAR(255 ), 
	"FIELD_NAME" VARCHAR(50 ), 
	"REF_PARAM" VARCHAR(255 ), 
	"EXPR" VARCHAR(255 )
   )  ;
--------------------------------------------------------
--  DDL for Table RULESCRIPT
--------------------------------------------------------

  CREATE TABLE "RULESCRIPT" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"SUBSYSTEM" NUMERIC(15,0) DEFAULT 0, 
	"BODY" BLOB SUB_TYPE TEXT, 
	"CAPTION" VARCHAR(256 ), 
	"LANG" VARCHAR(50 )
   )  
  ;
--------------------------------------------------------
--  DDL for Table SCHEXPDOCS
--------------------------------------------------------

  CREATE TABLE "SCHEXPDOCS" 
   (	"ID" NUMERIC(18,0), 
	"VERSION" NUMERIC(15,0), 
	"DOCCLASS_ID" NUMERIC(15,0), 
	"STATUSES" VARCHAR(255 ), 
	"ROLES" VARCHAR(255 ), 
	"REMARK" VARCHAR(255 )
   )  ;
--------------------------------------------------------
--  DDL for Table SCHPLAN
--------------------------------------------------------

  CREATE TABLE "SCHPLAN" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"SCHTASK_ID" NUMERIC(15,0), 
	"MODEL" NUMERIC(1,0), 
	"DAYS" VARCHAR(7 ), 
	"START_DATE" DATE, 
	"ISACTIVE" NUMERIC(1,0) DEFAULT 1, 
	"NAME" VARCHAR(50 ), 
	"INSTANCE" VARCHAR(255 ), 
	"LAST_RUNNING_TIME" DATE, 
	"LAST_START" DATE, 
	"PARAMS" VARCHAR(255 ), 
	"LAST_FINISH_TIME" DATE, 
	"LAST_RESULT" BLOB SUB_TYPE TEXT, 
	"RUN_AFTER_SYS_START" NUMERIC(1,0) DEFAULT 0
   )  
  ;
--------------------------------------------------------
--  DDL for Table SCHTASK
--------------------------------------------------------

  CREATE TABLE "SCHTASK" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"NAME" VARCHAR(50 ), 
	"DESCRIPTION" VARCHAR(255 ), 
	"ALONE" NUMERIC(1,0) DEFAULT 0, 
	"SUBSYSTEM" NUMERIC(15,0) DEFAULT 0, 
	"EXAMPLE" BLOB SUB_TYPE TEXT, 
	"PROCESSOR_XML" VARCHAR(255 )
   )  
  ;
--------------------------------------------------------
--  DDL for Table SERVERACTION
--------------------------------------------------------

  CREATE TABLE "SERVERACTION" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"SERVERPROCESSOR_ID" NUMERIC(15,0), 
	"ACTION_NAME" VARCHAR(50 ), 
	"EXTERNAL_FLAG" NUMERIC(1,0) DEFAULT 0, 
	"READONLY_FLAG" NUMERIC(1,0) DEFAULT 0, 
	"CAPTION" VARCHAR(100 ), 
	"JAVACLASS_NAME" VARCHAR(100 ), 
	"SERIALIZABLE_FLAG" NUMERIC(1,0) DEFAULT 0
   )  ;
--------------------------------------------------------
--  DDL for Table SERVERERROR
--------------------------------------------------------

  CREATE TABLE "SERVERERROR" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"DESCRIPTION" VARCHAR(255 ), 
	"SUBSYSTEM" NUMERIC(15,0) DEFAULT 0
   )  ;
--------------------------------------------------------
--  DDL for Table SERVERPROCESSOR
--------------------------------------------------------

  CREATE TABLE "SERVERPROCESSOR" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"NAME" VARCHAR(50 ), 
	"CLASSNAME" VARCHAR(100 ), 
	"CAPTION" VARCHAR(100 ), 
	"SYSTEM_FLAG" NUMERIC(1,0) DEFAULT 0, 
	"PUBLIC_FLAG" NUMERIC(1,0) DEFAULT 0, 
	"DATA_CLASSNAME" VARCHAR(100 ), 
	"PARAMS" VARCHAR(255 ), 
	"SUBSYSTEM" NUMERIC(15,0) DEFAULT 0
   )  ;
--------------------------------------------------------
--  DDL for Table SERVERPROVIDER
--------------------------------------------------------

  CREATE TABLE "SERVERPROVIDER" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"NAME" VARCHAR(50 ), 
	"CLASSNAME" VARCHAR(100 ), 
	"PUBLIC_FLAG" NUMERIC(1,0) DEFAULT 0, 
	"CAPTION" VARCHAR(100 ), 
	"REPORT_FLAG" NUMERIC(1,0) DEFAULT 0, 
	"PARAMS" BLOB SUB_TYPE TEXT, 
	"SUBSYSTEM" NUMERIC(15,0) DEFAULT 0
   )  
  ;
--------------------------------------------------------
--  DDL for Table SIGNEXPORTLOG
--------------------------------------------------------

  CREATE TABLE "SIGNEXPORTLOG" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"DIGEST_ID" NUMERIC(15,0), 
	"EXPORT_TIME" DATE, 
	"SYSUSER_ID" NUMERIC(15,0), 
	"DISPSTATUS_ID" NUMERIC(15,0), 
	"SIGNTYPE" NUMERIC(1,0) DEFAULT 0, 
	"DOCATTACHEX_ID" NUMERIC(18,0)
   )  ;
--------------------------------------------------------
--  DDL for Table SIGNFORMAT
--------------------------------------------------------

  CREATE TABLE "SIGNFORMAT" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"NAME" VARCHAR(255 )
   )  ;
--------------------------------------------------------
--  DDL for Table SIGNTYPE
--------------------------------------------------------

  CREATE TABLE "SIGNTYPE" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"NAME" VARCHAR(255 ), 
	"SIGNFORMAT_ID" NUMERIC(15,0)
   )  ;
--------------------------------------------------------
--  DDL for Table STATISTICSSOURCE
--------------------------------------------------------

  CREATE TABLE "STATISTICSSOURCE" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"NAME" VARCHAR(100 ), 
	"CAPTION" VARCHAR(255 ), 
	"CLASSNAME" VARCHAR(255 )
   )  ;
--------------------------------------------------------
--  DDL for Table STOREDDOCUMENTS
--------------------------------------------------------

  CREATE TABLE "STOREDDOCUMENTS" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"DOCUMENT_ID" NUMERIC(15,0), 
	"STORE_DATE" DATE, 
	"DATA" BLOB SUB_TYPE TEXT
   )  
  ;
--------------------------------------------------------
--  DDL for Table STOREPLACE
--------------------------------------------------------

  CREATE TABLE "STOREPLACE" 
   (	"GOODSID" NUMERIC(15,0), 
	"POS" NUMERIC(15,0), 
	"QUANTITY" NUMERIC(15,4), 
	"TERRITORYCODE" VARCHAR(20 ), 
	"ADDRESS" VARCHAR(300 )
   )  ;
--------------------------------------------------------
--  DDL for Table SUPPLYPLACE
--------------------------------------------------------

  CREATE TABLE "SUPPLYPLACE" 
   (	"GOODSID" NUMERIC(15,0), 
	"POS" NUMERIC(15,0), 
	"QUANTITY" NUMERIC(15,4), 
	"SUPPLYPRICE" NUMERIC(15,2), 
	"TERRITORYCODE" VARCHAR(20 ), 
	"ADDRESS" VARCHAR(300 ), 
	"REMARK" VARCHAR(2000 )
   )  ;
--------------------------------------------------------
--  DDL for Table SUPPORTCRYPTOLIB
--------------------------------------------------------

  CREATE TABLE "SUPPORTCRYPTOLIB" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"NAME" VARCHAR(100 ), 
	"DESCRIPTION" VARCHAR(255 ), 
	"LIBTYPE" VARCHAR(20 ) DEFAULT 'WIN_CSP'
   )  ;
--------------------------------------------------------
--  DDL for Table SUPPORTCRYPTOLIBFORMAT
--------------------------------------------------------

  CREATE TABLE "SUPPORTCRYPTOLIBFORMAT" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"SUPPORTCRYPTOLIB_ID" NUMERIC(15,0), 
	"SIGNFORMAT_ID" NUMERIC(15,0)
   )  ;
--------------------------------------------------------
--  DDL for Table SUPPORTCRYPTOLIBPARAM
--------------------------------------------------------

  CREATE TABLE "SUPPORTCRYPTOLIBPARAM" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"SUPPORTCRYPTOLIB_ID" NUMERIC(15,0), 
	"NAME" VARCHAR(50 ), 
	"VAL" VARCHAR(255 )
   )  ;
--------------------------------------------------------
--  DDL for Table SYSEVENT
--------------------------------------------------------

  CREATE TABLE "SYSEVENT" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"CREATETIME" DATE, 
	"MSGTYPE" NUMERIC(1,0), 
	"SRC" VARCHAR(50 ), 
	"SYSUSER_ID" NUMERIC(15,0), 
	"SERVERNAME" VARCHAR(50 ), 
	"REPORT" VARCHAR(2000 ), 
	"OBJECTID" NUMERIC(15,0), 
	"EXTRA" BLOB SUB_TYPE TEXT
   )  
  ;
--------------------------------------------------------
--  DDL for Table SYSPARAM
--------------------------------------------------------

  CREATE TABLE "SYSPARAM" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"NAME" VARCHAR(255 ), 
	"CAPTION" VARCHAR(100 ), 
	"PARAM_VALUE" BLOB SUB_TYPE TEXT, 
	"SYSUSER_ID" NUMERIC(15,0)
   )  
  ;
--------------------------------------------------------
--  DDL for Table SYSRIGHT
--------------------------------------------------------

  CREATE TABLE "SYSRIGHT" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"NAME" VARCHAR(50 ), 
	"FUNCAT_NAME" VARCHAR(50 ), 
	"DESCRIPTION" VARCHAR(255 )
   )  ;
--------------------------------------------------------
--  DDL for Table SYSTEMSITE
--------------------------------------------------------

  CREATE TABLE "SYSTEMSITE" 
   (	"SITE_ID" NUMERIC(15,0), 
	"SUBSYSTEM" NUMERIC(15,0) DEFAULT 0, 
	"SITETYPE" NUMERIC(1,0) DEFAULT 0, 
	"CLEAN_GENERATION_1" NUMERIC(15,0), 
	"CLEAN_GENERATION_2" NUMERIC(15,0), 
	"CLEAN_GENERATION_3" NUMERIC(15,0), 
	"AS" NUMERIC(18,0), 
	"LAST_GENERATION" NUMERIC(15,0) DEFAULT 0
   )  ;
--------------------------------------------------------
--  DDL for Table SYSUSER
--------------------------------------------------------

  CREATE TABLE "SYSUSER" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"MENU_ID" NUMERIC(15,0), 
	"USERNAME" VARCHAR(30 ), 
	"PSWD" VARCHAR(50 ), 
	"REALNAME" VARCHAR(100 ), 
	"ORG_ROLES" NUMERIC(1,0) DEFAULT 0, 
	"SIGNDEMAND" NUMERIC(1,0) DEFAULT 1, 
	"REMARK" VARCHAR(255 ), 
	"USER_LOCKED" NUMERIC(1,0) DEFAULT 0, 
	"FORCE_CP_MODE" NUMERIC(1,0) DEFAULT 0, 
	"LAST_CP_TIME" DATE, 
	"EMAIL" VARCHAR(255 ), 
	"SSL_CERT" BLOB SUB_TYPE TEXT, 
	"COMMENTARY" VARCHAR(2000 ), 
	"USER_TYPE" NUMERIC(1,0) DEFAULT 0, 
	"ARCHIVED" NUMERIC(1,0) DEFAULT 0, 
	"ORG_ID" NUMERIC(15,0), 
	"PANEL_ID" NUMERIC(15,0), 
	"PERSON_ID" NUMERIC(15,0), 
	"DOMEN_ID" NUMERIC(15,0) DEFAULT 0, 
	"NO_PASSWORD_EXPIRY_CHECK" NUMERIC(1,0) DEFAULT 0, 
	"USER_LOCK_REASON" VARCHAR(255 ), 
	"OOS_LOGIN" VARCHAR(100 ), 
	"OOS_PASSWORD" VARCHAR(100 )
   )  
  ;
--------------------------------------------------------
--  DDL for Table SYSUSEREXT
--------------------------------------------------------

  CREATE TABLE "SYSUSEREXT" 
   (	"ID" NUMERIC(18,0), 
	"BADATTEMPT_COUNT" NUMERIC(5,0), 
	"LAST_BADATTEMPT_TIME" DATE, 
	"LAST_LOGIN_TIME" DATE
   )  ;
--------------------------------------------------------
--  DDL for Table TASKJOURNAL
--------------------------------------------------------

  CREATE TABLE "TASKJOURNAL" 
   (	"ID" NUMERIC(15,0), 
	"ACTION_DATE" DATE, 
	"URL" VARCHAR(255 ), 
	"TASK_TIME" NUMERIC(15,0), 
	"PROCESSOR_NAME" VARCHAR(255 ), 
	"SPECIFICATION" VARCHAR(255 ), 
	"ACTION_NAME" VARCHAR(255 ), 
	"COMPLETED" NUMERIC(1,0), 
	"EVENT_TYPE" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"SYSUSER_ID" NUMERIC(15,0), 
	"BUDGET_ID" NUMERIC(15,0), 
	"SERVER_HOST" VARCHAR(100 ), 
	"SERVER_PORT" NUMERIC(5,0), 
	"CLIENT_HOST" VARCHAR(100 ), 
	"CLIENT_PORT" NUMERIC(5,0)
   )  ;
--------------------------------------------------------
--  DDL for Table TENDER
--------------------------------------------------------

  CREATE TABLE "TENDER" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"ORDER_ID" NUMERIC(15,0), 
	"CRITERIONPOS" NUMERIC(15,0), 
	"COMPETITORPOS" NUMERIC(15,0), 
	"RATE" NUMERIC(17,4), 
	"SCORE" NUMERIC(10,4), 
	"OFFERVAL" VARCHAR(255 ), 
	"TENDERCRITERION_ID" NUMERIC(15,0), 
	"ISFINALOFFER" NUMERIC(1,0) DEFAULT 0
   )  ;
--------------------------------------------------------
--  DDL for Table TENDERCRITERION
--------------------------------------------------------

  CREATE TABLE "TENDERCRITERION" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"NAME" VARCHAR(512 ), 
	"CTYPE" NUMERIC(2,0), 
	"CALCMODE" NUMERIC(1,0), 
	"BESTPARAM" NUMERIC(1,0), 
	"DESCRIPTION" VARCHAR(2000 ), 
	"MINWEIGHT" NUMERIC(15,2), 
	"MAXWEIGHT" NUMERIC(15,2), 
	"DEFWEIGHT" NUMERIC(15,2), 
	"CHILDWEIGHT" NUMERIC(15,2), 
	"DIFFERENCE" NUMERIC(15,2), 
	"ROUNDVALUE" NUMERIC(15,2), 
	"ISACTUAL" NUMERIC(1,0) DEFAULT 1, 
	"ISUNIQUE" NUMERIC(1,0) DEFAULT 0, 
	"ISREQUIRED" NUMERIC(1,0) DEFAULT 0, 
	"ISCANCELLABLE" NUMERIC(1,0) DEFAULT 0, 
	"FORMULA" VARCHAR(2000 ), 
	"OOSCODE" VARCHAR(2 ) DEFAULT '0'
   )  ;
--------------------------------------------------------
--  DDL for Table TENDERCRITERIONCHILD
--------------------------------------------------------

  CREATE TABLE "TENDERCRITERIONCHILD" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"TENDERCRITERION_ID" NUMERIC(15,0), 
	"CHILD_ID" NUMERIC(15,0)
   )  ;
--------------------------------------------------------
--  DDL for Table TENDERCRITERIONPM
--------------------------------------------------------

  CREATE TABLE "TENDERCRITERIONPM" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"TENDERCRITERION_ID" NUMERIC(15,0), 
	"PURCHASEMODE_ID" NUMERIC(15,0)
   )  ;
--------------------------------------------------------
--  DDL for Table TENDERLINE
--------------------------------------------------------

  CREATE TABLE "TENDERLINE" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"ORDER_ID" NUMERIC(15,0), 
	"TENDER_ID" NUMERIC(15,0), 
	"CRITERIONLINESEQORDER" NUMERIC(15,0), 
	"CRITERIONPOS" NUMERIC(15,0), 
	"RATE" NUMERIC(17,4), 
	"SCORE" NUMERIC(10,4), 
	"OFFERVAL" VARCHAR(2000 )
   )  ;
--------------------------------------------------------
--  DDL for Table TENDERLINECOMM
--------------------------------------------------------

  CREATE TABLE "TENDERLINECOMM" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"ORDER_ID" NUMERIC(15,0), 
	"TENDERLINE_ID" NUMERIC(15,0), 
	"COMMEMBERPOS" NUMERIC(15,0), 
	"SCORE" NUMERIC(10,4)
   )  ;
--------------------------------------------------------
--  DDL for Table TERRITORY
--------------------------------------------------------

  CREATE TABLE "TERRITORY" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"COUNTRY_ID" NUMERIC(15,0), 
	"PARENT_ID" NUMERIC(15,0), 
	"CODE" VARCHAR(20 ), 
	"TERTYPE_ID" NUMERIC(15,0), 
	"CAPTION" VARCHAR(100 )
   )  ;
--------------------------------------------------------
--  DDL for Table TER_TREE
--------------------------------------------------------

  CREATE TABLE "TER_TREE" 
   (	"TER_ID" NUMERIC(15,0), 
	"TREE" VARCHAR(252 ), 
	"PATH" VARCHAR(512 )
   )  ;
--------------------------------------------------------
--  DDL for Table TERTYPE
--------------------------------------------------------

  CREATE TABLE "TERTYPE" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"NAME" VARCHAR(20 ), 
	"CAPTION" VARCHAR(100 )
   )  ;
--------------------------------------------------------
--  DDL for Table TYPECRIT
--------------------------------------------------------

  CREATE TABLE "TYPECRIT" 
   (	"TYPEREQCRITID" NUMERIC(15,0), 
	"POS" NUMERIC(15,0), 
	"NAME" VARCHAR(2000 ), 
	"CTYPE" NUMERIC(2,0), 
	"CALCMODE" NUMERIC(1,0), 
	"BESTPARAM" NUMERIC(1,0), 
	"WEIGHT" NUMERIC(15,2), 
	"TENDERCRITERION_ID" NUMERIC(15,0), 
	"MINWEIGHT" NUMERIC(15,2), 
	"MAXWEIGHT" NUMERIC(15,2), 
	"VAL" NUMERIC(15,2), 
	"DESCRIPTION" VARCHAR(2000 ), 
	"FORMULA" VARCHAR(2000 ), 
	"UNITNAME" VARCHAR(50 )
   )  ;
--------------------------------------------------------
--  DDL for Table TYPECRITLINE
--------------------------------------------------------

  CREATE TABLE "TYPECRITLINE" 
   (	"TYPEREQCRIT_ID" NUMERIC(15,0), 
	"TYPECRITPOS" NUMERIC(15,0), 
	"SEQORDER" NUMERIC(15,0), 
	"CAPTION" VARCHAR(2000 ), 
	"MINVALUE" NUMERIC(15,2), 
	"MAXVALUE" NUMERIC(15,2), 
	"WEIGHT" NUMERIC(15,2), 
	"LIMITDESCRIPTION" VARCHAR(2000 ), 
	"DESCRIPTION" VARCHAR(2000 )
   )  ;
--------------------------------------------------------
--  DDL for Table TYPEDOCREQ
--------------------------------------------------------

  CREATE TABLE "TYPEDOCREQ" 
   (	"TYPEDOCREQGROUPID" NUMERIC(15,0), 
	"POS" NUMERIC(15,0), 
	"VENDOR_TYPE" NUMERIC(2,0) DEFAULT 0, 
	"ISREQUIRED" NUMERIC(1,0) DEFAULT 1, 
	"PURCHASEMODE_ID" NUMERIC(15,0) DEFAULT 1, 
	"REQUIREMENTTYPE_ID" NUMERIC(15,0) DEFAULT 1, 
	"NAME" VARCHAR(1024 ), 
	"DESCRIPTION" VARCHAR(4000 )
   )  ;
--------------------------------------------------------
--  DDL for Table TYPEDOCREQGROUP
--------------------------------------------------------

  CREATE TABLE "TYPEDOCREQGROUP" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"PURCHASEMODE_ID" NUMERIC(15,0) DEFAULT 1, 
	"NAME" VARCHAR(1024 ), 
	"DESCRIPTION" VARCHAR(4000 )
   )  ;
--------------------------------------------------------
--  DDL for Table TYPEREQ
--------------------------------------------------------

  CREATE TABLE "TYPEREQ" 
   (	"TYPEREQCRITID" NUMERIC(15,0), 
	"POS" NUMERIC(15,0), 
	"NAME" VARCHAR(2000 ), 
	"PURCHASEMODE_ID" NUMERIC(15,0) DEFAULT 1, 
	"REQUIREMENTTYPE_ID" NUMERIC(15,0) DEFAULT 1, 
	"DESCRIPTION" VARCHAR(1000 )
   )  ;
--------------------------------------------------------
--  DDL for Table TYPEREQCRIT
--------------------------------------------------------

  CREATE TABLE "TYPEREQCRIT" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"NAME" VARCHAR(2000 ), 
	"DESCRIPTION" VARCHAR(500 ), 
	"PURCHASEMODE_ID" NUMERIC(15,0) DEFAULT 1
   )  ;
--------------------------------------------------------
--  DDL for Table UNIT
--------------------------------------------------------

  CREATE TABLE "UNIT" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"CAPTION" VARCHAR(100 ), 
	"OKEI" VARCHAR(4 ), 
	"IS_ACTUAL" NUMERIC(1,0) DEFAULT 1, 
	"NAME" VARCHAR(50 )
   )  ;
--------------------------------------------------------
--  DDL for Table UPDPACKAGE
--------------------------------------------------------

  CREATE TABLE "UPDPACKAGE" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"RECEIVE_TIME" DATE, 
	"PROCESS_TIME" DATE, 
	"SOURCE_BUILD" VARCHAR(50 ), 
	"TARGET_BUILD" VARCHAR(50 ), 
	"MODEL" VARCHAR(100 ), 
	"SENDER_ID" NUMERIC(15,0), 
	"RECEIVER_ID" NUMERIC(15,0), 
	"DISPSTATUS" NUMERIC(1,0) DEFAULT 0, 
	"BUNDLE_PATH" VARCHAR(512 ), 
	"UPDATE_LOG" BLOB SUB_TYPE TEXT, 
	"DESCRIPTION" VARCHAR(1024 ), 
	"UPDATE_STARTUP_FILE" NUMERIC(1,0)
   )  
  ;
--------------------------------------------------------
--  DDL for Table USERBUDGET
--------------------------------------------------------

  CREATE TABLE "USERBUDGET" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"SYSUSER_ID" NUMERIC(15,0), 
	"BUDGET_ID" NUMERIC(15,0), 
	"ACCESS_MODE" NUMERIC(1,0) DEFAULT 0
   )  ;
--------------------------------------------------------
--  DDL for Table USERCERT
--------------------------------------------------------

  CREATE TABLE "USERCERT" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"SYSUSER_ID" NUMERIC(15,0), 
	"SERIALNUMBER" VARCHAR(64 ), 
	"SUBJECT" VARCHAR(255 ), 
	"ISSUERSERIALNUMBER" VARCHAR(64 ), 
	"ISSUER" VARCHAR(255 ), 
	"VALIDFROM" DATE, 
	"VALIDBY" DATE, 
	"REVOKEDDATE" DATE DEFAULT '4000-01-01', 
	"REMARK" VARCHAR(1000 ), 
	"CERTENCODED" BLOB SUB_TYPE TEXT, 
	"CHECKOID" NUMERIC(1,0) DEFAULT 0, 
	"SUBJECT_STATUS" NUMERIC(1,0) DEFAULT 0, 
	"ASSIGNEE" VARCHAR(100 ), 
	"SUBJECT_ORG" VARCHAR(255 ), 
	"SUBJECT_TITLE" VARCHAR(255 ), 
	"FULL_ISSUER" VARCHAR(255 ), 
	"SIGNTYPE_ID" NUMERIC(15,0) DEFAULT 1, 
	"ISNOTNOTIFY" NUMERIC(1,0) DEFAULT 0, 
	"SUBJECT_OGRN" VARCHAR(20 ), 
	"SUBJECT_INN" VARCHAR(13 ), 
	"SUBJECT_LOCATION" VARCHAR(300 ), 
	"BLOCKED" NUMERIC(1,0) DEFAULT 0, 
	"CRLPOINT_ID" NUMERIC(15,0), 
	"SUBJECT_EMAIL" VARCHAR(255 ), 
	"SUBJECT_SNILS" VARCHAR(100 ), 
	"CA_NAME" VARCHAR(255 ), 
	"CA_CONTACT_INFO" VARCHAR(1024 )
   )  
  ;
--------------------------------------------------------
--  DDL for Table USERCERTSYSUSER
--------------------------------------------------------

  CREATE TABLE "USERCERTSYSUSER" 
   (	"SYSUSER_ID" NUMERIC(15,0), 
	"USERCERT_ID" NUMERIC(15,0)
   )  ;
--------------------------------------------------------
--  DDL for Table USERORG
--------------------------------------------------------

  CREATE TABLE "USERORG" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"SYSUSER_ID" NUMERIC(15,0), 
	"ORG_ID" NUMERIC(15,0), 
	"ACCESS_MODE" NUMERIC(1,0) DEFAULT 1
   )  ;
--------------------------------------------------------
--  DDL for Table USERPROFILE
--------------------------------------------------------

  CREATE TABLE "USERPROFILE" 
   (	"SYSUSER_ID" NUMERIC(15,0), 
	"PVALUE" BLOB SUB_TYPE TEXT
   )  
  ;
--------------------------------------------------------
--  DDL for Table USERROLE
--------------------------------------------------------

  CREATE TABLE "USERROLE" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"NAME" VARCHAR(50 ), 
	"ROLE_TYPE" NUMERIC(1,0) DEFAULT 0, 
	"DESCRIPTION" VARCHAR(255 ), 
	"ISSIGNROLE" NUMERIC(1,0), 
	"ISBLOCKED" NUMERIC(1,0) DEFAULT 0, 
	"ISPRIVATEORG" NUMERIC(1,0) DEFAULT 0, 
	"HASCHILDORGS" NUMERIC(1,0) DEFAULT 0
   )  ;
--------------------------------------------------------
--  DDL for Table USERSESSION
--------------------------------------------------------

  CREATE TABLE "USERSESSION" 
   (	"ID" NUMERIC(15,0), 
	"SYSUSER_ID" NUMERIC(15,0), 
	"BUDGET_ID" NUMERIC(15,0), 
	"WORK_DATE" DATE, 
	"SERVER_HOST" VARCHAR(100 ), 
	"SERVER_PORT" NUMERIC(5,0), 
	"CLIENT_HOST" VARCHAR(100 ), 
	"CLIENT_PORT" NUMERIC(5,0), 
	"OPEN_TIME" DATE, 
	"CLOSE_TIME" DATE, 
	"VERSION" NUMERIC(15,0)
   )  ;
--------------------------------------------------------
--  DDL for Table USERSESSIONACCESS
--------------------------------------------------------

  CREATE TABLE "USERSESSIONACCESS" 
   (	"ID" NUMERIC(15,0), 
	"ACCESS_TIME" DATE, 
	"REQUEST_COUNT" NUMERIC(9,0) DEFAULT 0
   )  ;
--------------------------------------------------------
--  DDL for Table USESCRYPTOLIB
--------------------------------------------------------

  CREATE TABLE "USESCRYPTOLIB" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"SUPPORTCRYPTOLIB_ID" NUMERIC(15,0), 
	"DESCRIPTION" VARCHAR(255 ), 
	"REQUESTERTYPE" NUMERIC(1,0)
   )  ;
--------------------------------------------------------
--  DDL for Table USESCRYPTOLIBPARAM
--------------------------------------------------------

  CREATE TABLE "USESCRYPTOLIBPARAM" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"USESCRYPTOLIB_ID" NUMERIC(15,0), 
	"NAME" VARCHAR(50 ), 
	"VAL" VARCHAR(255 )
   )  ;
--------------------------------------------------------
--  DDL for Table WEBSTATCACHE
--------------------------------------------------------

  CREATE TABLE "WEBSTATCACHE" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"BUDGET_ID" NUMERIC(15,0), 
	"YEAR_NUM" NUMERIC(18,0), 
	"STATISTICSSOURCE_ID" NUMERIC(15,0), 
	"PURNAME" VARCHAR(100 ), 
	"KEYTYPE" VARCHAR(100 ), 
	"INSTANCE" VARCHAR(2000 )
   )  ;
--------------------------------------------------------
--  DDL for Table WEBSTATCACHEVAL
--------------------------------------------------------

  CREATE TABLE "WEBSTATCACHEVAL" 
   (	"ID" NUMERIC(15,0), 
	"VERSION" NUMERIC(15,0), 
	"KEYNAME" VARCHAR(100 ), 
	"WEBSTAT_ID" NUMERIC(15,0), 
	"PURCOUNT" NUMERIC(15,0) DEFAULT 0, 
	"PURAMOUNT" NUMERIC(15,2) DEFAULT 0
   )  ;
