

-----------------------------------------------------------------------------
--------------------Metadata is used only as a syntax check -----------------
--------------------and contains logical errors, ----------------------------
--------------------so it cannot be executed.--------------------------------
-----------------------------------------------------------------------------

CREATE OR REPLACE PACKAGE VTAPP.Cf_Rep_Customer_API IS

module_                   CONSTANT VARCHAR2(6)      := 'PROJ';
lu_name_                  CONSTANT VARCHAR2(30)     := 'CfRepCustomer';
lu_type_                  CONSTANT VARCHAR2(30)     := 'Entity';

-----------------------------------------------------------------------------
-------------------- PUBLIC DECLARATIONS ------------------------------------
-----------------------------------------------------------------------------

TYPE Public_Rec IS RECORD
  (customer                       CF_REP_CUSTOMER_TAB.customer%TYPE,
   "rowid"                        rowid,
   rowversion                     CF_REP_CUSTOMER_TAB.rowversion%TYPE,
   rowkey                         CF_REP_CUSTOMER_TAB.rowkey%TYPE,
   description                    CF_REP_CUSTOMER_TAB.description%TYPE);

end Cf_Rep_Customer_API;


CREATE OR REPLACE PACKAGE BODY VTAPP.Cf_Rep_Customer_API IS

-----------------------------------------------------------------------------
-------------------- PRIVATE DECLARATIONS -----------------------------------
-----------------------------------------------------------------------------

TYPE Indicator_Rec IS RECORD
  (customer                       BOOLEAN := FALSE,
   description                    BOOLEAN := FALSE);







-----------------------------------------------------------------------------
------------------------------- FUNCTIONS -----------------------------------
-----------------------------------------------------------------------------

FUNCTION Public_To_Table___ (
   public_ IN Public_Rec ) RETURN cf_rep_customer_tab%ROWTYPE;



------------------- TEST_PACKAGE_FUNCTION_2 -------------------

    FUNCTION TEST_PACKAGE_FUNCTION_2 (
        inputParameter_1 Public_Rec) RETURN cf_rep_customer_tab%ROWTYPE
    IS
       TYPE DeptRecTyp IS RECORD (
         dept_id    NUMBER(4) NOT NULL := 10,
         dept_name  VARCHAR2(30) NOT NULL := 'Administration',
         mgr_id     NUMBER(6) := 200,
         loc_id     NUMBER(4) := 1700
       );

       dept_rec DeptRecTyp;
    BEGIN
        DBMS_OUTPUT.PUT_LINE('dept_id:   ' || dept_rec.dept_id);
        DBMS_OUTPUT.PUT_LINE('dept_name: ' || dept_rec.dept_name);
        DBMS_OUTPUT.PUT_LINE('mgr_id:    ' || dept_rec.mgr_id);
        DBMS_OUTPUT.PUT_LINE('loc_id:    ' || dept_rec.loc_id);
    END TEST_PACKAGE_FUNCTION_2;


------------------- TEST_PACKAGE_FUNCTION_3 -------------------

    FUNCTION TEST_PACKAGE_FUNCTION_3 (
        inputParameter_1 Public_Rec) RETURN cf_rep_customer_tab%ROWTYPE
    IS

             CURSOR lang_ref IS
                SELECT object_name package_name
                FROM   user_procedures p
                WHERE  procedure_name = refresh_method_
                AND    object_name NOT IN ('DOMAIN_SYS', 'CUSTOM_FIELDS_SYS');

    BEGIN

            FOR rec_ IN lang_ref LOOP
                column_data_type_tab_(rec_.column_name) := rec_.data_type;
            END LOOP;
    END TEST_PACKAGE_FUNCTION_3;




------------------- TEST_PACKAGE_FUNCTION_4 -------------------

FUNCTION TEST_PACKAGE_FUNCTION_4 (
    inputParameter_1 Public_Rec) RETURN cf_rep_customer_tab%ROWTYPE
IS
   TYPE Rec_Typ IS RECORD (field1 NUMBER, field2 VARCHAR2(32) DEFAULT 'who');
   rec1 Rec_Typ;
   rec2 Rec_Typ;
BEGIN
   rec1.field1 := 100;
   rec1.field2 := 'what&';

   rec1 := rec2;
      dbms_output.put_line('Field1 = '
      || NVL(TO_CHAR(rec1.field1),'<NULL>') || ', field2 = ' || rec1.field2);

END TEST_PACKAGE_FUNCTION_4;



------------------- TEST_PACKAGE_FUNCTION_5 -------------------

FUNCTION TEST_PACKAGE_FUNCTION_5 (
    inputParameter_1 OUT cf_rep_customer_tab%ROWTYPE) RETURN cf_rep_customer_tab%ROWTYPE
IS
   REC1 cf_rep_customer_tab%ROWTYPE;
BEGIN
    REC1.PARAM1 := "NEW__";
    inputParameter_1 := REC1;
    RETURN REC1;
END TEST_PACKAGE_FUNCTION_5;


------------------- TEST_PACKAGE_FUNCTION_6 -------------------

FUNCTION TEST_PACKAGE_FUNCTION_6 (
    inputParameter_1 Public_Rec) RETURN cf_rep_customer_tab%ROWTYPE
IS
    REC1 cf_rep_customer_tab%ROWTYPE;
BEGIN
    REC1 := TEST_PACKAGE_FUNCTION_5(inputParameter_1);
    RETURN REC1;
END TEST_PACKAGE_FUNCTION_6;


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
      public_ IN Public_Rec ) RETURN cf_rep_customer_tab%ROWTYPE
   IS
      rec_ cf_rep_customer_tab%ROWTYPE;
   BEGIN
      rec_.rowversion                     := public_.rowversion;
      rec_.rowkey                         := public_.rowkey;
      rec_.customer                       := public_.customer;
      rec_.description                    := public_.description;
      RETURN rec_;
   END Public_To_Table___;


end Cf_Rep_Customer_API;




------------------- TEST_FUNCTION_2 -------------------

    CREATE FUNCTION TEST_FUNCTION_2 (
        inputParameter_1 Public_Rec ) RETURN Public_Rec
    IS
      TYPE DeptRecTyp IS RECORD (
        dept_id    NUMBER(4) NOT NULL := 10,
        dept_name  VARCHAR2(30) NOT NULL := 'Administration',
        mgr_id     NUMBER(6) := 200,
        loc_id     NUMBER(4) := 1700
      );

      dept_rec DeptRecTyp;
    BEGIN
      DBMS_OUTPUT.PUT_LINE('dept_id:   ' || dept_rec.dept_id);
      DBMS_OUTPUT.PUT_LINE('dept_name: ' || dept_rec.dept_name);
      DBMS_OUTPUT.PUT_LINE('mgr_id:    ' || dept_rec.mgr_id);
      DBMS_OUTPUT.PUT_LINE('loc_id:    ' || dept_rec.loc_id);
    END TEST_FUNCTION_2;



------------------- TEST_FUNCTION_3 -------------------

CREATE FUNCTION TEST_FUNCTION_3 (
    inputParameter_1 Public_Rec ) RETURN Public_Rec
IS

         CURSOR lang_ref IS
            SELECT object_name package_name
            FROM   user_procedures p
            WHERE  procedure_name = refresh_method_
            AND    object_name NOT IN ('DOMAIN_SYS', 'CUSTOM_FIELDS_SYS');


BEGIN

        FOR rec_ IN lang_ref LOOP
            column_data_type_tab_(rec_.column_name) := rec_.data_type;
        END LOOP;
END TEST_FUNCTION_3;



------------------- TEST_FUNCTION_4 -------------------

CREATE FUNCTION TEST_FUNCTION_4 (
    inputParameter_1 Public_Rec ) RETURN Public_Rec
IS
   TYPE Rec_Typ IS RECORD (field1 NUMBER, field2 VARCHAR2(32) DEFAULT 'who');
   rec1 Rec_Typ;
   rec2 Rec_Typ;
BEGIN
   rec1.field1 := 100;
   rec1.field2 := 'what&';

   rec1 := rec2;
      dbms_output.put_line('Field1 = '
      || NVL(TO_CHAR(rec1.field1),'<NULL>') || ', field2 = ' || rec1.field2);

END TEST_FUNCTION_4;



------------------- TEST_FUNCTION_5 -------------------

CREATE FUNCTION TEST_FUNCTION_5 (
    inputParameter_1 OUT cf_rep_customer_tab%ROWTYPE) RETURN cf_rep_customer_tab%ROWTYPE
IS
    REC1 cf_rep_customer_tab%ROWTYPE;
BEGIN
    REC1.PARAM1 := "NEW__";
    inputParameter_1 := REC1;
    RETURN REC1;
END TEST_FUNCTION_5;


------------------- TEST_FUNCTION_6 -------------------

CREATE FUNCTION TEST_FUNCTION_6 (
    inputParameter_1 Public_Rec ) RETURN cf_rep_customer_tab%ROWTYPE
IS
    REC1 cf_rep_customer_tab%ROWTYPE;
BEGIN
    REC1 := TEST_PACKAGE_FUNCTION_5(inputParameter_1);
    RETURN REC1;
END TEST_FUNCTION_6;


------------------- TEST_FUNCTION_7 -------------------

--CREATE FUNCTION TEST_FUNCTION_7 (
--    inputParameter_1 Public_Rec ) RETURN Public_Rec
--IS
--
--BEGIN
--
--END TEST_FUNCTION_7;


------------------- Table_To_Public___ -------------------

create FUNCTION Table_To_Public___ (
   rec_ IN cf_rep_customer_tab%ROWTYPE ) RETURN Public_Rec
IS

    FUNCTION Base (
      rec_ IN cf_rep_customer_tab%ROWTYPE ) RETURN Public_Rec
    IS
      public_ Public_Rec;
    BEGIN
      public_.rowversion                     := rec_.rowversion;
      public_.rowkey                         := rec_.rowkey;
      public_.customer                       := rec_.customer;
      public_.description                    := rec_.description;
      RETURN public_;
    END Base;

BEGIN
   RETURN Base(rec_);
END Table_To_Public___;

-----------------------------------------------------------------------------
------------------------------ PROCEDURES -----------------------------------
-----------------------------------------------------------------------------


------------------- TEST_PROCEDURE_2 -------------------

    create PROCEDURE TEST_PROCEDURE_2 (
        inputParameter_1 VARCHAR2(32000),
        inputParameter_2 VARCHAR2(32000)
    )
    IS
      TYPE DeptRecTyp IS RECORD (
        dept_id    NUMBER(4) NOT NULL := 10,
        dept_name  VARCHAR2(30) NOT NULL := 'Administration',
        mgr_id     NUMBER(6) := 200,
        loc_id     NUMBER(4) := 1700
      );

      dept_rec DeptRecTyp;
    BEGIN
      DBMS_OUTPUT.PUT_LINE('dept_id:   ' || dept_rec.dept_id);
      DBMS_OUTPUT.PUT_LINE('dept_name: ' || dept_rec.dept_name);
      DBMS_OUTPUT.PUT_LINE('mgr_id:    ' || dept_rec.mgr_id);
      DBMS_OUTPUT.PUT_LINE('loc_id:    ' || dept_rec.loc_id);
    END TEST_PROCEDURE_2;



------------------- TEST_PROCEDURE_3 -------------------

    create PROCEDURE TEST_PROCEDURE_3 (
        inputParameter_1 VARCHAR2(32000),
        inputParameter_2 VARCHAR2(32000)
    )
    IS
         CURSOR lang_ref IS
              SELECT object_name package_name
              FROM   user_procedures p
              WHERE  procedure_name = refresh_method_
              AND    object_name NOT IN ('DOMAIN_SYS', 'CUSTOM_FIELDS_SYS');

    BEGIN

        FOR rec_ IN lang_ref LOOP
            column_data_type_tab_(rec_.column_name) := rec_.data_type;
        END LOOP;
    END TEST_PROCEDURE_3;




------------------- TEST_PROCEDURE_4 -------------------

    create PROCEDURE TEST_PROCEDURE_4 (
        inputParameter_1 VARCHAR2(32000),
        inputParameter_2 VARCHAR2(32000)
    )
    IS
       TYPE Rec_Typ IS RECORD (field1 NUMBER, field2 VARCHAR2(32) DEFAULT 'who');
       rec1 Rec_Typ;
       rec2 Rec_Typ;
    BEGIN
       rec1.field1 := 100;
       rec1.field2 := 'what&';

       rec1 := rec2;
          dbms_output.put_line('Field1 = '
          || NVL(TO_CHAR(rec1.field1),'<NULL>') || ', field2 = ' || rec1.field2);

    END TEST_PROCEDURE_4;


------------------- TEST_PROCEDURE_5 -------------------

    create PROCEDURE TEST_PROCEDURE_5 (
        inputParameter_1 OUT cf_rep_customer_tab%ROWTYPE
    )
    IS
        REC1 cf_rep_customer_tab%ROWTYPE;
    BEGIN
        REC1.PARAM1 := "NEW__";
        inputParameter_1 := REC1;
    END TEST_PROCEDURE_5;


------------------- TEST_PROCEDURE_6 -------------------

    create PROCEDURE TEST_PROCEDURE_6 (
        inputParameter_1 Public_Rec
    )
    IS
        REC1 cf_rep_customer_tab%ROWTYPE;

    BEGIN
        REC1.ROW_1 := "QWER";
        TEST_PROCEDURE_5(REC1);
    END TEST_PROCEDURE_6;


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

create PROCEDURE Unpack___ (
   newrec_   IN OUT NOCOPY cf_rep_customer_tab%ROWTYPE,
   indrec_   IN OUT NOCOPY Indicator_Rec,
   attr_     IN OUT NOCOPY VARCHAR2 )
IS

   PROCEDURE Base (
      newrec_   IN OUT NOCOPY cf_rep_customer_tab%ROWTYPE,
      indrec_   IN OUT NOCOPY Indicator_Rec,
      attr_     IN OUT NOCOPY VARCHAR2 )
   IS
      ptr_   NUMBER;
      name_  VARCHAR2(308);
      value_ VARCHAR2(32000);
      msg_   VARCHAR2(32000);
   BEGIN
       newrec_.customer := value_;
       indrec_.customer := TRUE;
   END Base;

BEGIN
   Base(newrec_, indrec_, attr_);
END Unpack___;






CREATE OR REPLACE PACKAGE BODY ORA.PACKAGE_NAME_3 IS


------------------- TEST_PACKAGE_PROCEDURE_2 -------------------

    PROCEDURE TEST_PACKAGE_PROCEDURE_2 (
       inputParameter_1 VARCHAR2(32000),
       inputParameter_2 VARCHAR2(32000)
   )
   IS
      TYPE DeptRecTyp IS RECORD (
        dept_id    NUMBER(4) NOT NULL := 10,
        dept_name  VARCHAR2(30) NOT NULL := 'Administration',
        mgr_id     NUMBER(6) := 200,
        loc_id     NUMBER(4) := 1700
      );

      dept_rec DeptRecTyp;
   BEGIN
      DBMS_OUTPUT.PUT_LINE('dept_id:   ' || dept_rec.dept_id);
      DBMS_OUTPUT.PUT_LINE('dept_name: ' || dept_rec.dept_name);
      DBMS_OUTPUT.PUT_LINE('mgr_id:    ' || dept_rec.mgr_id);
      DBMS_OUTPUT.PUT_LINE('loc_id:    ' || dept_rec.loc_id);
   END TEST_PACKAGE_PROCEDURE_2;


------------------- TEST_PACKAGE_PROCEDURE_3 -------------------

    PROCEDURE TEST_PACKAGE_PROCEDURE_3 (
       inputParameter_1 VARCHAR2(32000),
       inputParameter_2 VARCHAR2(32000)
   )
   IS
         CURSOR lang_ref IS
            SELECT object_name package_name
            FROM   user_procedures p
            WHERE  procedure_name = refresh_method_
            AND    object_name NOT IN ('DOMAIN_SYS', 'CUSTOM_FIELDS_SYS');

   BEGIN

        FOR rec_ IN lang_ref LOOP
            column_data_type_tab_(rec_.column_name) := rec_.data_type;
        END LOOP;
   END TEST_PACKAGE_PROCEDURE_3;




------------------- TEST_PACKAGE_PROCEDURE_4 -------------------

    PROCEDURE TEST_PACKAGE_PROCEDURE_4 (
       inputParameter_1 VARCHAR2(32000),
       inputParameter_2 VARCHAR2(32000)
   )
   IS
        TYPE Rec_Typ IS RECORD (field1 NUMBER, field2 VARCHAR2(32) DEFAULT 'who');
        rec1 Rec_Typ;
        rec2 Rec_Typ;
   BEGIN
        ec1.field1 := 100;
        rec1.field2 := 'what&';

        rec1 := rec2;
        dbms_output.put_line('Field1 = '
        || NVL(TO_CHAR(rec1.field1),'<NULL>') || ', field2 = ' || rec1.field2);

   END TEST_PACKAGE_PROCEDURE_4;





------------------- TEST_PACKAGE_PROCEDURE_5 -------------------

    PROCEDURE TEST_PACKAGE_PROCEDURE_5 (
        inputParameter_1 OUT cf_rep_customer_tab%ROWTYPE
   )
   IS
        REC1 cf_rep_customer_tab%ROWTYPE;
   BEGIN
        REC1.PARAM1 := "NEW__";
        inputParameter_1 := REC1;
   END TEST_PACKAGE_PROCEDURE_5;


------------------- TEST_PACKAGE_PROCEDURE_6 -------------------



    PROCEDURE TEST_PACKAGE_PROCEDURE_6 (
        inputParameter_1 Public_Rec
   )
   IS
        REC1 cf_rep_customer_tab%ROWTYPE;
   BEGIN
        REC1.ROW_1 := "QWER";
        TEST_PROCEDURE_5(REC1);
   END TEST_PACKAGE_PROCEDURE_6;


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
      indrec_ IN OUT NOCOPY Indicator_Rec )
   IS
      empty_indrec_ Indicator_Rec;

         CURSOR lang_ref IS
            SELECT object_name package_name
            FROM   user_procedures p
            WHERE  procedure_name = refresh_method_
            AND    object_name NOT IN ('DOMAIN_SYS', 'CUSTOM_FIELDS_SYS');

   BEGIN
      indrec_ := empty_indrec_;

        FOR rec_ IN lang_ref LOOP
            column_data_type_tab_(rec_.column_name) := rec_.data_type;
        END LOOP;
   END Base;




end PACKAGE_NAME_3;