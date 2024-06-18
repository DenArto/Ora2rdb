

-----------------------------------------------------------------------------
-------------------- Metadata is used only as a syntax check ----------------
-------------------- and contains logical errors, ---------------------------
-------------------- so it cannot be executed. ------------------------------
-----------------------------------------------------------------------------

CREATE OR REPLACE PACKAGE ORA.PACKAGE_1 IS


-----------------------------------------------------------------------------
-------------------- PUBLIC DECLARATIONS ------------------------------------
-----------------------------------------------------------------------------



end Cf_Rep_Customer_API;


CREATE OR REPLACE PACKAGE BODY ORA.PACKAGE_NAME_1 IS

-----------------------------------------------------------------------------
-------------------- PRIVATE DECLARATIONS -----------------------------------
-----------------------------------------------------------------------------






-----------------------------------------------------------------------------
--------------------------- PACKAGE FUNCTIONS -------------------------------
-----------------------------------------------------------------------------

--FUNCTION Public_To_Table___ (
--   public_ IN Public_Rec ) RETURN cf_rep_customer_tab%ROWTYPE;




------------------- TEST_PACKAGE_FUNCTION_1 -------------------

FUNCTION TEST_PACKAGE_FUNCTION_1 (
    inputParameter_1 Public_Rec) RETURN cf_rep_customer_tab%ROWTYPE
IS

BEGIN

    FOR Lcntr IN 1..20
    LOOP
       LCalc := Lcntr * 31;
       dbms_output.put_line(LCalc);
    END LOOP;

END TEST_PACKAGE_FUNCTION_1;





------------------- TEST_PACKAGE_FUNCTION_2 -------------------

FUNCTION TEST_PACKAGE_FUNCTION_2 (
    inputParameter_1 Public_Rec) RETURN cf_rep_customer_tab%ROWTYPE
IS

BEGIN

    FOR Lcntr IN REVERSE 1..15
    LOOP
       LCalc := Lcntr * 31;
    END LOOP;

END TEST_PACKAGE_FUNCTION_2;



------------------- TEST_PACKAGE_FUNCTION_3 -------------------

FUNCTION TEST_PACKAGE_FUNCTION_3 (
    inputParameter_1 Public_Rec) RETURN BOOLEAN
IS
    done  BOOLEAN := FALSE;
BEGIN
    WHILE done LOOP
        DBMS_OUTPUT.PUT_LINE ('This line does not print.');
        done := TRUE;  -- This assignment is not made.
    END LOOP;

    RETURN TRUE;

END TEST_PACKAGE_FUNCTION_3;




------------------- TEST_PACKAGE_FUNCTION_4 -------------------

FUNCTION TEST_PACKAGE_FUNCTION_4 (
   in_outputParameter_1 OUT  Public_Rec) RETURN BOOLEAN
IS
    param_1 Public_Rec;
BEGIN
    param_1.column1 := 'new_text';
    in_outputParameter_1 := param_1;
    RETURN TRUE;

END TEST_PACKAGE_FUNCTION_4;



------------------- TEST_PACKAGE_FUNCTION_5 -------------------

FUNCTION TEST_PACKAGE_FUNCTION_5 (
    inputParameter_1 Public_Rec) RETURN cf_rep_customer_tab%ROWTYPE
IS
    deme boolean;
BEGIN
    WHILE (TEST_PACKAGE_FUNCTION_4(inputParameter_1)) LOOP
        DBMS_OUTPUT.PUT_LINE (inputParameter_1.column1);
    END LOOP;

END TEST_PACKAGE_FUNCTION_5;


------------------- TEST_PACKAGE_FUNCTION_6 -------------------

FUNCTION TEST_PACKAGE_FUNCTION_6 (
    inputParameter_1 Public_Rec) RETURN cf_rep_customer_tab%ROWTYPE
IS

BEGIN
   FOR rec_ IN (SELECT column1, column2 FROM table1 WHERE column1 = 'text') LOOP
        DBMS_OUTPUT.PUT_LINE (rec_.column1);
        DBMS_OUTPUT.PUT_LINE (rec_.column2);
   END LOOP;

END TEST_PACKAGE_FUNCTION_6;



------------------- TEST_PACKAGE_FUNCTION_7 -------------------

FUNCTION TEST_PACKAGE_FUNCTION_7 (
    inputParameter_1 Public_Rec) RETURN cf_rep_customer_tab%ROWTYPE
IS
    text_  VARCHAR2(1000);
    CURSOR cur1 IS
          SELECT column1 column2
          FROM   table1
          WHERE  column1 = 'text';
BEGIN
    FOR pkg IN cur1 LOOP
          text_ := rec_.column1 || '.' || rec_.column2;
          function_1(text_);
    END LOOP;

END TEST_PACKAGE_FUNCTION_7;



------------------- TEST_PACKAGE_FUNCTION_8 -------------------

FUNCTION TEST_PACKAGE_FUNCTION_8 (
    daily_value NUMERIC) RETURN cf_rep_customer_tab%ROWTYPE
IS
    monthly_value NUMERIC;
BEGIN

    LOOP
       monthly_value := daily_value * 31;
       EXIT WHEN monthly_value > 4000;
    END LOOP;

END TEST_PACKAGE_FUNCTION_8;



------------------- TEST_PACKAGE_FUNCTION_9 -------------------

FUNCTION TEST_PACKAGE_FUNCTION_9 (
    inputParameter_1 Public_Rec) RETURN cf_rep_customer_tab%ROWTYPE
IS
    text_  VARCHAR2(1000);
    CURSOR cur1 IS
          SELECT column1 column2
          FROM   table1
          WHERE  column1 = 'text';

    CURSOR cur2 IS
          SELECT column3 column4
          FROM   table1
          WHERE  column3 = 'text';
BEGIN

    FOR pkg IN cur1 LOOP
          text_ := rec_.column1 || '.' || rec_.column2;
          function_1(text_);

        FOR c IN cur1 LOOP
              text_ := c.column1 || '.' || c.column2;
              function_1(text_);
        END LOOP;

    END LOOP;
END TEST_PACKAGE_FUNCTION_9;



------------------- TEST_PACKAGE_FUNCTION_10 -------------------

--FUNCTION TEST_PACKAGE_FUNCTION_10 (
--    inputParameter_1 Public_Rec) RETURN cf_rep_customer_tab%ROWTYPE
--IS
--
--BEGIN
--
--
--END TEST_PACKAGE_FUNCTION_10;

end PACKAGE_NAME_1;





-----------------------------------------------------------------------------
------------------------------- FUNCTIONS -----------------------------------
-----------------------------------------------------------------------------


------------------- TEST_FUNCTION_1 -------------------

CREATE FUNCTION TEST_FUNCTION_1 (
    inputParameter_1 Public_Rec ) RETURN Public_Rec
IS
   from_ NUMBER;
   to_   NUMBER;
BEGIN
    FOR Lcntr IN 1..20
        LOOP
           LCalc := Lcntr * 31;
           dbms_output.put_line(LCalc);
        END LOOP;
END TEST_FUNCTION_1;



----------------- TEST_FUNCTION_2 -------------------

CREATE FUNCTION TEST_FUNCTION_2 (
    inputParameter_1 Public_Rec ) RETURN Public_Rec
IS

BEGIN

    FOR Lcntr IN REVERSE 1..15
    LOOP
       LCalc := Lcntr * 31;
    END LOOP;
END TEST_FUNCTION_2;



------------------- TEST_FUNCTION_3 -------------------

CREATE FUNCTION TEST_FUNCTION_3 (
    inputParameter_1 Public_Rec ) RETURN Public_Rec
IS
    done  BOOLEAN := FALSE;
BEGIN
    WHILE done LOOP
        DBMS_OUTPUT.PUT_LINE ('This line does not print.');
        done := TRUE;  -- This assignment is not made.
    END LOOP;
END TEST_FUNCTION_3;




------------------- TEST_FUNCTION_4 -------------------

CREATE FUNCTION TEST_FUNCTION_4 (
    in_outputParameter_1 OUT Public_Rec ) RETURN BOOLEAN
IS
    param_1 Public_Rec;
BEGIN
    param_1.column1 := 'new_text';
      in_outputParameter_1 := param_1;
      RETURN TRUE;

END TEST_FUNCTION_4;



------------------- TEST_FUNCTION_5 -------------------

CREATE FUNCTION TEST_FUNCTION_5 (
    inputParameter_1 Public_Rec ) RETURN Public_Rec
IS
    bool  BOOLEAN := FALSE;
BEGIN
    WHILE (TEST_FUNCTION_4(inputParameter_1)) LOOP
            DBMS_OUTPUT.PUT_LINE (inputParameter_1.column1);
    END LOOP;
END TEST_FUNCTION_5;



------------------- TEST_FUNCTION_6 -------------------

CREATE FUNCTION TEST_FUNCTION_6 (
    inputParameter_1 Public_Rec ) RETURN Public_Rec
IS

BEGIN
   FOR rec_ IN (SELECT column1, column2 FROM table1 WHERE column1 = 'text') LOOP
        DBMS_OUTPUT.PUT_LINE (rec_.column1);
        DBMS_OUTPUT.PUT_LINE (rec_.column2);
   END LOOP;
END TEST_FUNCTION_6;



------------------- TEST_FUNCTION_7 -------------------

CREATE FUNCTION TEST_FUNCTION_7 (
    inputParameter_1 Public_Rec ) RETURN Public_Rec
IS
    text_  VARCHAR2(1000);
    CURSOR cur1 IS
          SELECT column1, column2
          FROM   table1
          WHERE  column1 = 'text';
BEGIN
    FOR pkg IN cur1 LOOP
          text_ := rec_.column1 || '.' || rec_.column2;
          function_1(text_);
    END LOOP;

END TEST_FUNCTION_7;




------------------- TEST_FUNCTION_8 -------------------

CREATE FUNCTION TEST_FUNCTION_8 (
    inputParameter_1 Public_Rec ) RETURN Public_Rec
IS

BEGIN
    LOOP
       monthly_value := daily_value * 31;
       EXIT WHEN monthly_value > 4000;
    END LOOP;
END TEST_FUNCTION_8;



------------------- TEST_FUNCTION_9 -------------------

CREATE FUNCTION TEST_FUNCTION_9 (
    inputParameter_1 Public_Rec ) RETURN Public_Rec
IS
    text_  VARCHAR2(1000);
    CURSOR cur1 IS
          SELECT column1 column2
          FROM   table1
          WHERE  column1 = 'text';

    CURSOR cur2 IS
          SELECT column3 column4
          FROM   table1
          WHERE  column3 = 'text';
BEGIN
    FOR pkg IN cur1 LOOP
          text_ := rec_.column1 || '.' || rec_.column2;
          function_1(text_);

        FOR c IN cur1 LOOP
              text_ := c.column1 || '.' || c.column2;
              function_1(text_);
        END LOOP;

    END LOOP;
END TEST_FUNCTION_9;



------------------- TEST_FUNCTION_10 -------------------

--CREATE FUNCTION TEST_FUNCTION_10 (
--    inputParameter_1 Public_Rec ) RETURN Public_Rec
--IS
--
--BEGIN
--
--END TEST_FUNCTION_10;

-----------------------------------------------------------------------------
------------------------------ PROCEDURES -----------------------------------
-----------------------------------------------------------------------------


------------------- TEST_PROCEDURE_1 -------------------

    CREATE PROCEDURE TEST_PROCEDURE_1 (
        inputParameter_1 VARCHAR2(32000),
        inputParameter_2 VARCHAR2(32000)
    )
    IS

    BEGIN
       FOR Lcntr IN 1..20
           LOOP
              LCalc := Lcntr * 31;
              dbms_output.put_line(LCalc);
           END LOOP;
    END TEST_PROCEDURE_1;




    ------------------- TEST_PROCEDURE_2 -------------------

    CREATE PROCEDURE TEST_PROCEDURE_2 (
         inputParameter_1 VARCHAR2(32000),
         nputParameter_2 VARCHAR2(32000)
        )
    IS

    BEGIN
        FOR Lcntr IN REVERSE 1..15
        LOOP
           LCalc := Lcntr * 31;
        END LOOP;
    END TEST_PROCEDURE_2;




    ------------------- TEST_PROCEDURE_3 -------------------

    CREATE PROCEDURE TEST_PROCEDURE_3 (
        inputParameter_1 VARCHAR2(32000),
        inputParameter_2 VARCHAR2(32000)
    )
    IS
        done  BOOLEAN := FALSE;

    BEGIN

        WHILE done LOOP
            DBMS_OUTPUT.PUT_LINE ('This line does not print.');
            done := TRUE;  -- This assignment is not made.
        END LOOP;

    END TEST_PROCEDURE_3;



    ------------------- TEST_PROCEDURE_4 -------------------
    CREATE PROCEDURE TEST_PROCEDURE_4 (
        inputParameter_1 VARCHAR2(32000),
        inputParameter_2 VARCHAR2(32000),
        inputParameter_1 Public_Rec
    )
    IS

    BEGIN
      WHILE (TEST_FUNCTION_4(inputParameter_1)) LOOP
                DBMS_OUTPUT.PUT_LINE (inputParameter_1.column1);
      END LOOP;
    END TEST_PROCEDURE_4;



    ----------------- TEST_PROCEDURE_5 -------------------

    CREATE PROCEDURE TEST_PROCEDURE_5 (
        inputParameter_1 VARCHAR2(32000),
        inputParameter_2 VARCHAR2(32000)
    )
    IS

    BEGIN
       FOR rec_ IN (SELECT column1, column2 FROM table1 WHERE column1 = 'text') LOOP
            DBMS_OUTPUT.PUT_LINE (rec_.column1);
            DBMS_OUTPUT.PUT_LINE (rec_.column2);
       END LOOP;
    END TEST_PROCEDURE_5;


    ------------------- TEST_PROCEDURE_6 -------------------

    CREATE PROCEDURE TEST_PROCEDURE_6 (
        inputParameter_1 VARCHAR2(32000),
        inputParameter_2 VARCHAR2(32000)
    )
    IS
        text_  VARCHAR2(1000);
        CURSOR cur1 IS
              SELECT column1 column2
              FROM   table1
              WHERE  column1 = 'text';
    BEGIN
        FOR pkg IN cur1 LOOP
              text_ := rec_.column1 || '.' || rec_.column2;
              function_1(text_);
        END LOOP;
    END TEST_PROCEDURE_6;



    ------------------- TEST_PROCEDURE_7 -------------------

    CREATE PROCEDURE TEST_PROCEDURE_7 (
        inputParameter_1 VARCHAR2(32000),
        inputParameter_2 VARCHAR2(32000)
    )
    IS

    BEGIN
        LOOP
           monthly_value := daily_value * 31;
           EXIT WHEN monthly_value > 4000;
        END LOOP;
    END TEST_PROCEDURE_7;



    ------------------- TEST_PROCEDURE_8 -------------------

--    CREATE PROCEDURE TEST_PROCEDURE_8 (
--        inputParameter_1 VARCHAR2(32000),
--        inputParameter_2 VARCHAR2(32000)
--    )
--    IS
--
--    BEGIN
--
--    END TEST_PROCEDURE_8;




    ------------------- TEST_PROCEDURE_8 -------------------

    CREATE PROCEDURE TEST_PROCEDURE_8 (
        inputParameter_1 VARCHAR2(32000),
        inputParameter_2 VARCHAR2(32000)
    )
    IS
        text_  VARCHAR2(1000);
        CURSOR cur1 IS
              SELECT column1 column2
              FROM   table1
              WHERE  column1 = 'text';

        CURSOR cur2 IS
              SELECT column3 column4
              FROM   table1
              WHERE  column3 = 'text';
    BEGIN
        FOR pkg IN cur1 LOOP
              text_ := rec_.column1 || '.' || rec_.column2;
              function_1(text_);

            FOR c IN cur1 LOOP
                  text_ := c.column1 || '.' || c.column2;
                  function_1(text_);
            END LOOP;

        END LOOP;
    END TEST_PROCEDURE_8;


-----------------------------------------------------------------------------
---------------------------PACKAGE PROCEDURES -------------------------------
-----------------------------------------------------------------------------

CREATE OR REPLACE PACKAGE BODY ORA.PACKAGE_NAME_2 IS


------------------- TEST_PACKAGE_PROCEDURE_1 -------------------

    PROCEDURE TEST_PACKAGE_PROCEDURE_1 (
       inputParameter_1 VARCHAR2(32000),
       inputParameter_2 VARCHAR2(32000)
   )
   IS

   BEGIN
      FOR Lcntr IN 1..20
          LOOP
             LCalc := Lcntr * 31;
             dbms_output.put_line(LCalc);
          END LOOP;
   END TEST_PACKAGE_PROCEDURE_1;





------------------- TEST_PACKAGE_PROCEDURE_2 -------------------

    PROCEDURE TEST_PACKAGE_PROCEDURE_2 (
       inputParameter_1 VARCHAR2(32000),
       inputParameter_2 VARCHAR2(32000)
   )
   IS
        done  BOOLEAN := FALSE;
   BEGIN

        FOR Lcntr IN REVERSE 1..15
        LOOP
           LCalc := Lcntr * 31;
        END LOOP;

   END TEST_PACKAGE_PROCEDURE_2;



------------------- TEST_PACKAGE_PROCEDURE_3 -------------------

    PROCEDURE TEST_PACKAGE_PROCEDURE_3 (
       inputParameter_1 VARCHAR2(32000),
       inputParameter_2 VARCHAR2(32000)
   )
   IS

   BEGIN

      WHILE done LOOP
          DBMS_OUTPUT.PUT_LINE ('This line does not print.');
          done := TRUE;  -- This assignment is not made.
      END LOOP;

   END TEST_PACKAGE_PROCEDURE_3;



------------------- TEST_PACKAGE_PROCEDURE_4 -------------------

    PROCEDURE TEST_PACKAGE_PROCEDURE_4 (
       inputParameter_1 VARCHAR2(32000),
       inputParameter_2 VARCHAR2(32000),
       inputParameter_1 Public_Rec
   )
   IS

   BEGIN
      WHILE (TEST_FUNCTION_4(inputParameter_1)) LOOP
                DBMS_OUTPUT.PUT_LINE (inputParameter_1.column1);
      END LOOP;

   END TEST_PACKAGE_PROCEDURE_4;



------------------- TEST_PACKAGE_PROCEDURE_5 -------------------

    PROCEDURE TEST_PACKAGE_PROCEDURE_5 (
       inputParameter_1 VARCHAR2(32000),
       inputParameter_2 VARCHAR2(32000)
   )
   IS

   BEGIN
       FOR rec_ IN (SELECT column1, column2 FROM table1 WHERE column1 = 'text') LOOP
            DBMS_OUTPUT.PUT_LINE (rec_.column1);
            DBMS_OUTPUT.PUT_LINE (rec_.column2);
       END LOOP;

   END TEST_PACKAGE_PROCEDURE_5;



------------------- TEST_PACKAGE_PROCEDURE_6 -------------------

    PROCEDURE TEST_PACKAGE_PROCEDURE_6 (
       inputParameter_1 VARCHAR2(32000),
       inputParameter_2 VARCHAR2(32000)
   )
   IS
        text_  VARCHAR2(1000);
        CURSOR cur1 IS
              SELECT column1 column2
              FROM   table1
              WHERE  column1 = 'text';
   BEGIN
        FOR pkg IN cur1 LOOP
              text_ := rec_.column1 || '.' || rec_.column2;
              function_1(text_);
        END LOOP;

   END TEST_PACKAGE_PROCEDURE_6;



------------------- TEST_PACKAGE_PROCEDURE_7 -------------------

    PROCEDURE TEST_PACKAGE_PROCEDURE_7 (
       inputParameter_1 VARCHAR2(32000),
       inputParameter_2 VARCHAR2(32000)
   )
   IS

   BEGIN
        LOOP
           monthly_value := daily_value * 31;
           EXIT WHEN monthly_value > 4000;
        END LOOP;

   END TEST_PACKAGE_PROCEDURE_7;



--------------------- TEST_PACKAGE_PROCEDURE_8 -------------------

    PROCEDURE TEST_PACKAGE_PROCEDURE_8 (
       inputParameter_1 VARCHAR2(32000),
       inputParameter_2 VARCHAR2(32000)
   )
   IS
       text_  VARCHAR2(1000);
       CURSOR cur1 IS
             SELECT column1 column2
             FROM   table1
             WHERE  column1 = 'text';

       CURSOR cur2 IS
             SELECT column3 column4
             FROM   table1
             WHERE  column3 = 'text';

   BEGIN
        FOR pkg IN cur1 LOOP
              text_ := rec_.column1 || '.' || rec_.column2;
              function_1(text_);

            FOR c IN cur1 LOOP
                  text_ := c.column1 || '.' || c.column2;
                  function_1(text_);
            END LOOP;

        END LOOP;


   END TEST_PACKAGE_PROCEDURE_8;




------------------- TEST_PACKAGE_PROCEDURE_9 -------------------
--
--    PROCEDURE TEST_PACKAGE_PROCEDURE_9 (
--       inputParameter_1 VARCHAR2(32000),
--       inputParameter_2 VARCHAR2(32000)
--   )
--   IS
--
--   BEGIN
--
--
--   END TEST_PACKAGE_PROCEDURE_9;

end PACKAGE_NAME_2;