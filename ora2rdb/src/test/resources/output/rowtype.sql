

-----------------------------------------------------------------------------
--------------------Metadata is used only as a syntax check -----------------
--------------------and contains logical errors, ----------------------------
--------------------so it cannot be executed.--------------------------------
-----------------------------------------------------------------------------

CREATE OR ALTER PACKAGE Cf_Rep_Customer_API AS BEGIN

CONSTANT module_                    VARCHAR(6)      = 'PROJ';
CONSTANT lu_name_                   VARCHAR(30)     = 'CfRepCustomer';
CONSTANT lu_type_                   VARCHAR(30)     = 'Entity';

-----------------------------------------------------------------------------
-------------------- PUBLIC DECLARATIONS ------------------------------------
-----------------------------------------------------------------------------

DECLARE TYPE Public_Rec  
  (customer                       TYPE OF COLUMN CF_REP_CUSTOMER_TAB.customer,
   "rowid"                        rowid,
   rowversion                     TYPE OF COLUMN CF_REP_CUSTOMER_TAB.rowversion,
   rowkey                         TYPE OF COLUMN CF_REP_CUSTOMER_TAB.rowkey,
   description                    TYPE OF COLUMN CF_REP_CUSTOMER_TAB.description);

end ;


SET TERM ^ ;

RECREATE   PACKAGE BODY Cf_Rep_Customer_API AS BEGIN

-----------------------------------------------------------------------------
-------------------- PRIVATE DECLARATIONS -----------------------------------
-----------------------------------------------------------------------------

DECLARE TYPE Indicator_Rec  
  (customer                       BOOLEAN = FALSE,
   description                    BOOLEAN = FALSE);







-----------------------------------------------------------------------------
------------------------------- FUNCTIONS -----------------------------------
-----------------------------------------------------------------------------

FUNCTION Public_To_Table___ (
   public_  Public_Rec ) RETURNS TYPE OF TABLE cf_rep_customer_tab;



------------------- TEST_PACKAGE_FUNCTION_2 -------------------

    FUNCTION TEST_PACKAGE_FUNCTION_2 (
        inputParameter_1 Public_Rec) RETURNS TYPE OF TABLE cf_rep_customer_tab
    AS
       DECLARE TYPE DeptRecTyp   (
         dept_id    NUMERIC(4) NOT NULL = 10,
         dept_name  VARCHAR(30) NOT NULL = 'Administration',
         mgr_id     NUMERIC(6) = 200,
         loc_id     NUMERIC(4) = 1700
       );

       DECLARE dept_rec DeptRecTyp;
    BEGIN
        DBMS_OUTPUT.PUT_LINE('dept_id:   ' || dept_rec.dept_id);
        DBMS_OUTPUT.PUT_LINE('dept_name: ' || dept_rec.dept_name);
        DBMS_OUTPUT.PUT_LINE('mgr_id:    ' || dept_rec.mgr_id);
        DBMS_OUTPUT.PUT_LINE('loc_id:    ' || dept_rec.loc_id);
    END 


------------------- TEST_PACKAGE_FUNCTION_3 -------------------

    FUNCTION TEST_PACKAGE_FUNCTION_3 (
        inputParameter_1 Public_Rec) RETURNS TYPE OF TABLE cf_rep_customer_tab
    AS

             DECLARE lang_ref CURSOR FOR
                (SELECT object_name package_name
                FROM   user_procedures p
                WHERE  procedure_name = refresh_method_
                AND    object_name NOT IN ('DOMAIN_SYS', 'CUSTOM_FIELDS_SYS'));
  DECLARE VARIABLE LANG_REF_REC_ TYPE OF TABLE LANG_REF;

    BEGIN
            OPEN LANG_REF;
            FETCH LANG_REF INTO LANG_REF_REC_;
            WHILE ( ROW_COUNT != 0 ) DO
            BEGIN
                column_data_type_tab_(LANG_REF_REC_.column_name) = LANG_REF_REC_.data_type;
            	FETCH LANG_REF INTO LANG_REF_REC_;
            END
            CLOSE LANG_REF;

    END 




------------------- TEST_PACKAGE_FUNCTION_4 -------------------

FUNCTION TEST_PACKAGE_FUNCTION_4 (
    inputParameter_1 Public_Rec) RETURNS TYPE OF TABLE cf_rep_customer_tab
AS
   DECLARE TYPE Rec_Typ   (field1 NUMERIC(18, 4), field2 VARCHAR(32) DEFAULT 'who');
   DECLARE rec1 Rec_Typ;
   DECLARE rec2 Rec_Typ;
BEGIN
   rec1.field1 = 100;
   rec1.field2 = 'what&';

   rec1 = :rec2;
      dbms_output.put_line('Field1 = '
      || COALESCE(CAST(:rec1.field1),'<NULL>') || ', field2 = ' || rec1.field2);

END 



------------------- TEST_PACKAGE_FUNCTION_5 -------------------

PROCEDURE TEST_PACKAGE_FUNCTION_5 (
    inputParameter_1  TYPE OF TABLE cf_rep_customer_tab) RETURNS (RET_VAL TYPE OF TABLE cf_rep_customer_tab, INPUTPARAMETER_1_OUT TYPE OF TABLE cf_rep_customer_tab)
 )
AS
   DECLARE VARIABLE REC1 TYPE OF TABLE cf_rep_customer_tab;
BEGIN
    REC1.PARAM1 = "NEW__";
    inputParameter_1 = :REC1;
    RET_VAL = REC1;
    INPUTPARAMETER_1_OUT = INPUTPARAMETER_1;
    SUSPEND;
    EXIT;
END 


------------------- TEST_PACKAGE_FUNCTION_6 -------------------

FUNCTION TEST_PACKAGE_FUNCTION_6 (--todo TEST_PACKAGE_FUNCTION_5_RET_VAL is not be created
    inputParameter_1 Public_Rec) RETURNS TYPE OF TABLE cf_rep_customer_tab
AS
    DECLARE VARIABLE REC1 TYPE OF TABLE cf_rep_customer_tab;
BEGIN
    SELECT RET_VAL, INPUTPARAMETER_1_OUT  FROM TEST_PACKAGE_FUNCTION_5(:inputParameter_1) INTO TEST_PACKAGE_FUNCTION_5_RET_VAL, inputParameter_1
:REC1 = TEST_PACKAGE_FUNCTION_5_RET_VAL;
    RETURN REC1;
END 


------------------- TEST_PACKAGE_FUNCTION_7 -------------------

--FUNCTION TEST_PACKAGE_FUNCTION_7 (
--    inputParameter_1 Public_Rec) RETURN cf_rep_customer_tab%ROWTYPE
--IS
--
--BEGIN
--
--END TEST_PACKAGE_FUNCTION_7;



------------------- Public_To_Table___ -------------------

FUNCTION Public_To_Table___ (
      public_  Public_Rec ) RETURNS TYPE OF TABLE cf_rep_customer_tab
   AS
      DECLARE VARIABLE rec_ TYPE OF TABLE cf_rep_customer_tab;
   BEGIN
      rec_.rowversion                     = public_.rowversion;
      rec_.rowkey                         = public_.rowkey;
      rec_.customer                       = public_.customer;
      rec_.description                    = public_.description;
      RETURN rec_;
   END 


end ;

SET TERM ; ^




------------------- TEST_FUNCTION_2 -------------------

    SET TERM ^ ;

CREATE FUNCTION TEST_FUNCTION_2 (
        inputParameter_1 Public_Rec ) RETURNS Public_Rec
    AS
      DECLARE TYPE DeptRecTyp   (
        dept_id    NUMERIC(4) NOT NULL = 10,
        dept_name  VARCHAR(30) NOT NULL = 'Administration',
        mgr_id     NUMERIC(6) = 200,
        loc_id     NUMERIC(4) = 1700
      );

      DECLARE dept_rec DeptRecTyp;
    BEGIN
      DBMS_OUTPUT.PUT_LINE('dept_id:   ' || dept_rec.dept_id);
      DBMS_OUTPUT.PUT_LINE('dept_name: ' || dept_rec.dept_name);
      DBMS_OUTPUT.PUT_LINE('mgr_id:    ' || dept_rec.mgr_id);
      DBMS_OUTPUT.PUT_LINE('loc_id:    ' || dept_rec.loc_id);
    END ^

SET TERM ; ^



------------------- TEST_FUNCTION_3 -------------------

SET TERM ^ ;

CREATE FUNCTION TEST_FUNCTION_3 (
    inputParameter_1 Public_Rec ) RETURNS Public_Rec
AS

         DECLARE lang_ref CURSOR FOR
            (SELECT object_name package_name
            FROM   user_procedures p
            WHERE  procedure_name = refresh_method_
            AND    object_name NOT IN ('DOMAIN_SYS', 'CUSTOM_FIELDS_SYS'));
  DECLARE VARIABLE LANG_REF_REC_ TYPE OF TABLE LANG_REF;


BEGIN
        OPEN LANG_REF;
        FETCH LANG_REF INTO LANG_REF_REC_;
        WHILE ( ROW_COUNT != 0 ) DO
        BEGIN
            column_data_type_tab_(LANG_REF_REC_.column_name) = LANG_REF_REC_.data_type;
        	FETCH LANG_REF INTO LANG_REF_REC_;
        END
        CLOSE LANG_REF;

END ^

SET TERM ; ^



------------------- TEST_FUNCTION_4 -------------------

SET TERM ^ ;

CREATE FUNCTION TEST_FUNCTION_4 (
    inputParameter_1 Public_Rec ) RETURNS Public_Rec
AS
   DECLARE TYPE Rec_Typ   (field1 NUMERIC(18, 4), field2 VARCHAR(32) DEFAULT 'who');
   DECLARE rec1 Rec_Typ;
   DECLARE rec2 Rec_Typ;
BEGIN
   rec1.field1 = 100;
   rec1.field2 = 'what&';

   rec1 = :rec2;
      dbms_output.put_line('Field1 = '
      || COALESCE(CAST(:rec1.field1),'<NULL>') || ', field2 = ' || rec1.field2);

END ^

SET TERM ; ^



------------------- TEST_FUNCTION_5 -------------------

SET TERM ^ ;

CREATE PROCEDURE TEST_FUNCTION_5 (
    inputParameter_1  TYPE OF TABLE cf_rep_customer_tab) RETURNS (RET_VAL TYPE OF TABLE cf_rep_customer_tab, INPUTPARAMETER_1_OUT TYPE OF TABLE cf_rep_customer_tab)
 )
AS
    DECLARE VARIABLE REC1 TYPE OF TABLE cf_rep_customer_tab;
BEGIN
    REC1.PARAM1 = "NEW__";
    inputParameter_1 = :REC1;
    RET_VAL = REC1;
    INPUTPARAMETER_1_OUT = INPUTPARAMETER_1;
    SUSPEND;
    EXIT;
END ^

SET TERM ; ^


------------------- TEST_FUNCTION_6 -------------------

SET TERM ^ ;

CREATE FUNCTION TEST_FUNCTION_6 ( --todo need to correct it :REC 1 = TEST_PACKAGE_FUNCTION_5_RET_VAL;
    inputParameter_1 Public_Rec ) RETURNS TYPE OF TABLE cf_rep_customer_tab
AS
    DECLARE VARIABLE REC1 TYPE OF TABLE cf_rep_customer_tab;
DECLARE TEST_PACKAGE_FUNCTION_5_RET_VAL CF_REP_CUSTOMER_TAB%ROWTYPE;
BEGIN
    SELECT RET_VAL, INPUTPARAMETER_1_OUT  FROM TEST_PACKAGE_FUNCTION_5(:inputParameter_1) INTO TEST_PACKAGE_FUNCTION_5_RET_VAL, inputParameter_1
:REC1 = TEST_PACKAGE_FUNCTION_5_RET_VAL;
    RETURN REC1;
END ^

SET TERM ; ^


------------------- TEST_FUNCTION_7 -------------------

--CREATE FUNCTION TEST_FUNCTION_7 (
--    inputParameter_1 Public_Rec ) RETURN Public_Rec
--IS
--
--BEGIN
--
--END TEST_FUNCTION_7;


------------------- Table_To_Public___ -------------------

SET TERM ^ ;

create FUNCTION Table_To_Public___ (--todo it is necessary to correct the INDIRECT__OUT = INDIRECT; in two places
   rec_  TYPE OF TABLE cf_rep_customer_tab ) RETURNS Public_Rec
AS

    FUNCTION Base (
      rec_  TYPE OF TABLE cf_rep_customer_tab ) RETURNS Public_Rec
    AS
      DECLARE public_ Public_Rec;
    BEGIN
      public_.rowversion                     = rec_.rowversion;
      public_.rowkey                         = rec_.rowkey;
      public_.customer                       = rec_.customer;
      public_.description                    = rec_.description;
      RET_VAL = public_;
INDREC__OUT = INDREC_;
      SUSPEND;
      EXIT;
    END 

BEGIN
   RET_VAL = Base(:rec_);
INDREC__OUT = INDREC_;
   SUSPEND;
   EXIT;
END ^

SET TERM ; ^

-----------------------------------------------------------------------------
------------------------------ PROCEDURES -----------------------------------
-----------------------------------------------------------------------------


------------------- TEST_PROCEDURE_2 -------------------

    SET TERM ^ ;

create PROCEDURE TEST_PROCEDURE_2 (
        inputParameter_1 VARCHAR(32000),
        inputParameter_2 VARCHAR(32000)
    )
    AS
      DECLARE TYPE DeptRecTyp   (
        dept_id    NUMERIC(4) NOT NULL = 10,
        dept_name  VARCHAR(30) NOT NULL = 'Administration',
        mgr_id     NUMERIC(6) = 200,
        loc_id     NUMERIC(4) = 1700
      );

      DECLARE dept_rec DeptRecTyp;
    BEGIN
      DBMS_OUTPUT.PUT_LINE('dept_id:   ' || dept_rec.dept_id);
      DBMS_OUTPUT.PUT_LINE('dept_name: ' || dept_rec.dept_name);
      DBMS_OUTPUT.PUT_LINE('mgr_id:    ' || dept_rec.mgr_id);
      DBMS_OUTPUT.PUT_LINE('loc_id:    ' || dept_rec.loc_id);
    END ^

SET TERM ; ^



------------------- TEST_PROCEDURE_3 -------------------

    SET TERM ^ ;

create PROCEDURE TEST_PROCEDURE_3 (
        inputParameter_1 VARCHAR(32000),
        inputParameter_2 VARCHAR(32000)
    )
    AS
         DECLARE lang_ref CURSOR FOR
              (SELECT object_name package_name
              FROM   user_procedures p
              WHERE  procedure_name = refresh_method_
              AND    object_name NOT IN ('DOMAIN_SYS', 'CUSTOM_FIELDS_SYS'));
  DECLARE VARIABLE LANG_REF_REC_ TYPE OF TABLE LANG_REF;

    BEGIN
        OPEN LANG_REF;
        FETCH LANG_REF INTO LANG_REF_REC_;
        WHILE ( ROW_COUNT != 0 ) DO
        BEGIN
            column_data_type_tab_(LANG_REF_REC_.column_name) = LANG_REF_REC_.data_type;
        	FETCH LANG_REF INTO LANG_REF_REC_;
        END
        CLOSE LANG_REF;

    END ^

SET TERM ; ^




------------------- TEST_PROCEDURE_4 -------------------

    SET TERM ^ ;

create PROCEDURE TEST_PROCEDURE_4 (
        inputParameter_1 VARCHAR(32000),
        inputParameter_2 VARCHAR(32000)
    )
    AS
       DECLARE TYPE Rec_Typ   (field1 NUMERIC(18, 4), field2 VARCHAR(32) DEFAULT 'who');
       DECLARE rec1 Rec_Typ;
       DECLARE rec2 Rec_Typ;
    BEGIN
       rec1.field1 = 100;
       rec1.field2 = 'what&';

       rec1 = :rec2;
          dbms_output.put_line('Field1 = '
          || COALESCE(CAST(:rec1.field1),'<NULL>') || ', field2 = ' || rec1.field2);

    END ^

SET TERM ; ^


------------------- TEST_PROCEDURE_5 -------------------

    SET TERM ^ ;

create PROCEDURE TEST_PROCEDURE_5 (
        inputParameter_1  TYPE OF TABLE cf_rep_customer_tab
    )
    RETURNS( INPUTPARAMETER_1_OUT TYPE OF TABLE cf_rep_customer_tab)

AS
        DECLARE VARIABLE REC1 TYPE OF TABLE cf_rep_customer_tab;
    BEGIN
        REC1.PARAM1 = "NEW__";
        inputParameter_1 = :REC1;
        INPUTPARAMETER_1_OUT = INPUTPARAMETER_1;
    SUSPEND;
END ^

SET TERM ; ^


------------------- TEST_PROCEDURE_6 -------------------

    SET TERM ^ ;

create PROCEDURE TEST_PROCEDURE_6 (
        inputParameter_1 Public_Rec
    )
    AS
        DECLARE VARIABLE REC1 TYPE OF TABLE cf_rep_customer_tab;

    BEGIN
        REC1.ROW_1 = "QWER";
        SELECT INPUTPARAMETER_1_OUT  FROM TEST_PROCEDURE_5(:REC1) INTO INPUTPARAMETER_1;
    END ^

SET TERM ; ^


------------------- TEST_PROCEDURE_7 -------------------

--    create PROCEDURE TEST_PROCEDURE_7 (
--        inputParameter_1 VARCHAR2(32000),
--        inputParameter_2 VARCHAR2(32000)
--    )
--    IS
--
--
--      dept_rec DeptRecTyp;
--    BEGIN
--
--    END TEST_PROCEDURE_7;

------------------- Unpack___ -------------------

SET TERM ^ ;

create PROCEDURE Unpack___ (
   newrec_      TYPE OF TABLE cf_rep_customer_tab,
   indrec_      Indicator_Rec,
   attr_        VARCHAR(250) )
RETURNS( ATTR__OUT VARCHAR(250), 
INDREC__OUT Indicator_Rec, 
NEWREC__OUT TYPE OF TABLE cf_rep_customer_tab)

AS

   PROCEDURE Base (
      newrec_      TYPE OF TABLE cf_rep_customer_tab,
      indrec_      Indicator_Rec,
      attr_        VARCHAR(250) )
   RETURNS( ATTR__OUT VARCHAR(250), 
INDREC__OUT Indicator_Rec, 
NEWREC__OUT TYPE OF TABLE cf_rep_customer_tab)

AS
      DECLARE ptr_   NUMERIC(18, 4);
      DECLARE name_  VARCHAR(308);
      DECLARE value_ VARCHAR(32000);
      DECLARE msg_   VARCHAR(32000);
   BEGIN
       newrec_.customer = :value_;
       indrec_.customer = TRUE;
      NEWREC__OUT = NEWREC_;
   INDREC__OUT = INDREC_;
   ATTR__OUT = ATTR_;
   SUSPEND;
END 

BEGIN
   SELECT ATTR__OUT, INDREC__OUT, NEWREC__OUT  FROM Base(:newrec_, :indrec_, :attr_) INTO ATTR_, INDREC_, NEWREC_;
NEWREC__OUT = NEWREC_;
INDREC__OUT = INDREC_;
ATTR__OUT = ATTR_;
SUSPEND;
END ^

SET TERM ; ^






SET TERM ^ ;

RECREATE   PACKAGE BODY PACKAGE_NAME_3 AS BEGIN


------------------- TEST_PACKAGE_PROCEDURE_2 -------------------

    PROCEDURE TEST_PACKAGE_PROCEDURE_2 (
       inputParameter_1 VARCHAR(32000),
       inputParameter_2 VARCHAR(32000)
   )
   AS
      DECLARE TYPE DeptRecTyp   (
        dept_id    NUMERIC(4) NOT NULL = 10,
        dept_name  VARCHAR(30) NOT NULL = 'Administration',
        mgr_id     NUMERIC(6) = 200,
        loc_id     NUMERIC(4) = 1700
      );

      DECLARE dept_rec DeptRecTyp;
   BEGIN
      DBMS_OUTPUT.PUT_LINE('dept_id:   ' || dept_rec.dept_id);
      DBMS_OUTPUT.PUT_LINE('dept_name: ' || dept_rec.dept_name);
      DBMS_OUTPUT.PUT_LINE('mgr_id:    ' || dept_rec.mgr_id);
      DBMS_OUTPUT.PUT_LINE('loc_id:    ' || dept_rec.loc_id);
   END 


------------------- TEST_PACKAGE_PROCEDURE_3 -------------------

    PROCEDURE TEST_PACKAGE_PROCEDURE_3 (
       inputParameter_1 VARCHAR(32000),
       inputParameter_2 VARCHAR(32000)
   )
   AS
         DECLARE lang_ref CURSOR FOR
            (SELECT object_name package_name
            FROM   user_procedures p
            WHERE  procedure_name = refresh_method_
            AND    object_name NOT IN ('DOMAIN_SYS', 'CUSTOM_FIELDS_SYS'));
  DECLARE VARIABLE LANG_REF_REC_ TYPE OF TABLE LANG_REF;

   BEGIN
        OPEN LANG_REF;
        FETCH LANG_REF INTO LANG_REF_REC_;
        WHILE ( ROW_COUNT != 0 ) DO
        BEGIN
            column_data_type_tab_(LANG_REF_REC_.column_name) = LANG_REF_REC_.data_type;
        	FETCH LANG_REF INTO LANG_REF_REC_;
        END
        CLOSE LANG_REF;

   END 




------------------- TEST_PACKAGE_PROCEDURE_4 -------------------

    PROCEDURE TEST_PACKAGE_PROCEDURE_4 (
       inputParameter_1 VARCHAR(32000),
       inputParameter_2 VARCHAR(32000)
   )
   AS
        DECLARE TYPE Rec_Typ   (field1 NUMERIC(18, 4), field2 VARCHAR(32) DEFAULT 'who');
        DECLARE rec1 Rec_Typ;
        DECLARE rec2 Rec_Typ;
   BEGIN
        ec1.field1 = 100;
        rec1.field2 = 'what&';

        rec1 = :rec2;
        dbms_output.put_line('Field1 = '
        || COALESCE(CAST(:rec1.field1),'<NULL>') || ', field2 = ' || rec1.field2);

   END 





------------------- TEST_PACKAGE_PROCEDURE_5 -------------------

    PROCEDURE TEST_PACKAGE_PROCEDURE_5 (
        inputParameter_1  TYPE OF TABLE cf_rep_customer_tab
   )
   RETURNS( INPUTPARAMETER_1_OUT TYPE OF TABLE cf_rep_customer_tab)

AS
        DECLARE VARIABLE REC1 TYPE OF TABLE cf_rep_customer_tab;
   BEGIN
        REC1.PARAM1 = "NEW__";
        inputParameter_1 = :REC1;
       INPUTPARAMETER_1_OUT = INPUTPARAMETER_1;
    SUSPEND;
END 


------------------- TEST_PACKAGE_PROCEDURE_6 -------------------



    PROCEDURE TEST_PACKAGE_PROCEDURE_6 (
        inputParameter_1 Public_Rec
   )
   AS
        DECLARE VARIABLE REC1 TYPE OF TABLE cf_rep_customer_tab;
   BEGIN
        REC1.ROW_1 = "QWER";
        SELECT INPUTPARAMETER_1_OUT  FROM TEST_PROCEDURE_5(:REC1) INTO INPUTPARAMETER_1;
   END 


------------------- TEST_PACKAGE_PROCEDURE_7 -------------------

--    PROCEDURE TEST_PACKAGE_PROCEDURE_7 (
--       inputParameter_1 VARCHAR2(32000),
--       inputParameter_2 VARCHAR2(32000)
--   )
--   IS
--
--   BEGIN
--
--   END TEST_PACKAGE_PROCEDURE_7;



------------------- Base -------------------

   PROCEDURE Base (
      indrec_    Indicator_Rec )
   RETURNS( INDREC__OUT Indicator_Rec)

AS
      DECLARE empty_indrec_ Indicator_Rec;

         DECLARE lang_ref CURSOR FOR
            (SELECT object_name package_name
            FROM   user_procedures p
            WHERE  procedure_name = refresh_method_
            AND    object_name NOT IN ('DOMAIN_SYS', 'CUSTOM_FIELDS_SYS'));
  DECLARE VARIABLE LANG_REF_REC_ TYPE OF TABLE LANG_REF;

   BEGIN
      indrec_ = :empty_indrec_;
        OPEN LANG_REF;
        FETCH LANG_REF INTO LANG_REF_REC_;
        WHILE ( ROW_COUNT != 0 ) DO
        BEGIN
            column_data_type_tab_(LANG_REF_REC_.column_name) = LANG_REF_REC_.data_type;
        	FETCH LANG_REF INTO LANG_REF_REC_;
        END
        CLOSE LANG_REF;

      INDREC__OUT = INDREC_;
   SUSPEND;
END 




end ;

SET TERM ; ^