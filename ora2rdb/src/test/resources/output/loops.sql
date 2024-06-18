

-----------------------------------------------------------------------------
-------------------- Metadata is used only as a syntax check ----------------
-------------------- and contains logical errors, ---------------------------
-------------------- so it cannot be executed. ------------------------------
-----------------------------------------------------------------------------

CREATE OR ALTER PACKAGE PACKAGE_1 AS BEGIN


-----------------------------------------------------------------------------
-------------------- PUBLIC DECLARATIONS ------------------------------------
-----------------------------------------------------------------------------



end ;


SET TERM ^ ;

RECREATE   PACKAGE BODY PACKAGE_NAME_1 AS BEGIN

-----------------------------------------------------------------------------
-------------------- PRIVATE DECLARATIONS -----------------------------------
-----------------------------------------------------------------------------






-----------------------------------------------------------------------------
--------------------------- PACKAGE FUNCTIONS -------------------------------
-----------------------------------------------------------------------------

--FUNCTION Public_To_Table___ (
--   public_ IN Public_Rec ) RETURN cf_rep_customer_tab%ROWTYPE;




------------------- TEST_PACKAGE_FUNCTION_1 -------------------
--todo variable iterators are not created if nothing is declared in the IS block.
--todo add tab for Lcntr = Lcntr + 1;
FUNCTION TEST_PACKAGE_FUNCTION_1 (
    inputParameter_1 Public_Rec) RETURNS TYPE OF TABLE cf_rep_customer_tab
AS

BEGIN

    Lcntr = 1;
    WHILE ( Lcntr < 20) DO
    BEGIN
       LCalc = :Lcntr * 31;
       dbms_output.put_line(LCalc);
    Lcntr = Lcntr + 1;
    END

END 





------------------- TEST_PACKAGE_FUNCTION_2 -------------------
--todo add tab Lcntr = Lcntr - 1;
FUNCTION TEST_PACKAGE_FUNCTION_2 (
    inputParameter_1 Public_Rec) RETURNS TYPE OF TABLE cf_rep_customer_tab
AS

BEGIN

    Lcntr = 15;
    WHILE ( Lcntr  >   1) DO
    BEGIN
       LCalc = :Lcntr * 31;
Lcntr = Lcntr - 1;
    END 

END 



------------------- TEST_PACKAGE_FUNCTION_3 -------------------

FUNCTION TEST_PACKAGE_FUNCTION_3 (
    inputParameter_1 Public_Rec) RETURNS BOOLEAN
AS
    DECLARE done  BOOLEAN = FALSE;
BEGIN
    WHILE (:done) DO
    BEGIN
        DBMS_OUTPUT.PUT_LINE ('This line does not print.');
        done = TRUE;
    END  -- This assignment is not made.


    RETURN TRUE;

END 




------------------- TEST_PACKAGE_FUNCTION_4 -------------------
--todo solders an excess bracket
PROCEDURE TEST_PACKAGE_FUNCTION_4 (
   in_outputParameter_1   Public_Rec) RETURNS (RET_VAL BOOLEAN, IN_OUTPUTPARAMETER_1_OUT Public_Rec)
 )
AS
    DECLARE param_1 Public_Rec;
BEGIN
    param_1.column1 = 'new_text';
    in_outputParameter_1 = :param_1;
    RET_VAL = TRUE;
    IN_OUTPUTPARAMETER_1_OUT = IN_OUTPUTPARAMETER_1;
    SUSPEND;
    EXIT;

END 



------------------- TEST_PACKAGE_FUNCTION_5 -------------------
--todo variables of function output parameters with out parameters are not created if nothing is declared in the IS block.
FUNCTION TEST_PACKAGE_FUNCTION_5 (
    inputParameter_1 Public_Rec) RETURNS TYPE OF TABLE cf_rep_customer_tab
AS
    DECLARE deme boolean;
BEGIN
    WHILE (TRUE) DO
    BEGIN
        SELECT RET_VAL, IN_OUTPUTPARAMETER_1_OUT  FROM TEST_PACKAGE_FUNCTION_4(:inputParameter_1) INTO TEST_PACKAGE_FUNCTION_4_RET_VAL, inputParameter_1
if(:TEST_PACKAGE_FUNCTION_4_RET_VAL)
break;
DBMS_OUTPUT.PUT_LINE (inputParameter_1.column1);
    END

END 


------------------- TEST_PACKAGE_FUNCTION_6 -------------------

FUNCTION TEST_PACKAGE_FUNCTION_6 (
    inputParameter_1 Public_Rec) RETURNS TYPE OF TABLE cf_rep_customer_tab
AS

BEGIN
   FOR rec_ IN (SELECT column1, column2 FROM table1 WHERE column1 = 'text')
   DO
   BEGIN
        DBMS_OUTPUT.PUT_LINE (rec_.column1);
        DBMS_OUTPUT.PUT_LINE (rec_.column2);
   END

END 



------------------- TEST_PACKAGE_FUNCTION_7 -------------------

FUNCTION TEST_PACKAGE_FUNCTION_7 (
    inputParameter_1 Public_Rec) RETURNS TYPE OF TABLE cf_rep_customer_tab
AS
    DECLARE text_  VARCHAR(1000);
    DECLARE cur1 CURSOR FOR
          (SELECT column1 column2
          FROM   table1
          WHERE  column1 = 'text');
  DECLARE VARIABLE CUR1_PKG TYPE OF TABLE CUR1;
BEGIN
    OPEN CUR1;
    FETCH CUR1 INTO CUR1_PKG;
    WHILE ( ROW_COUNT != 0 ) DO
    BEGIN
          text_ = rec_.column1 || '.' || rec_.column2;
          function_1(:text_);
    	FETCH CUR1 INTO CUR1_PKG;
    END
    CLOSE CUR1;


END 



------------------- TEST_PACKAGE_FUNCTION_8 -------------------
--todo LOOP is not converted ... END LOOP
FUNCTION TEST_PACKAGE_FUNCTION_8 (
    daily_value NUMERIC(18, 4)) RETURNS TYPE OF TABLE cf_rep_customer_tab
AS
    DECLARE monthly_value NUMERIC(18, 4);
BEGIN

    LOOP
       monthly_value = :daily_value * 31;
       EXIT WHEN :monthly_value > 4000;
    END LOOP

END 



------------------- TEST_PACKAGE_FUNCTION_9 -------------------
-- todo the cursor opens inside the loop, it may need to be moved outside the loop.
FUNCTION TEST_PACKAGE_FUNCTION_9 (
    inputParameter_1 Public_Rec) RETURNS TYPE OF TABLE cf_rep_customer_tab
AS
    DECLARE text_  VARCHAR(1000);
    DECLARE cur1 CURSOR FOR
          (SELECT column1 column2
          FROM   table1
          WHERE  column1 = 'text');

    DECLARE cur2 CURSOR FOR
          (SELECT column3 column4
          FROM   table1
          WHERE  column3 = 'text');
  DECLARE VARIABLE CUR1_C TYPE OF TABLE CUR1;
  DECLARE VARIABLE CUR1_PKG TYPE OF TABLE CUR1;
BEGIN
    OPEN CUR1;
    FETCH CUR1 INTO CUR1_PKG;
    WHILE ( ROW_COUNT != 0 ) DO
    BEGIN
          text_ = rec_.column1 || '.' || rec_.column2;
          function_1(:text_);
        OPEN CUR1;
        FETCH CUR1 INTO CUR1_C;
        WHILE ( ROW_COUNT != 0 ) DO
        BEGIN
              text_ = CUR1_C.column1 || '.' || CUR1_C.column2;
              function_1(:text_);
        	FETCH CUR1 INTO CUR1_C;
        END
        CLOSE CUR1;

    	FETCH CUR1 INTO CUR1_PKG;
    END
    CLOSE CUR1;

END 



------------------- TEST_PACKAGE_FUNCTION_10 -------------------

--FUNCTION TEST_PACKAGE_FUNCTION_10 (
--    inputParameter_1 Public_Rec) RETURN cf_rep_customer_tab%ROWTYPE
--IS
--
--BEGIN
--
--
--END TEST_PACKAGE_FUNCTION_10;

end ;

SET TERM ; ^





-----------------------------------------------------------------------------
------------------------------- FUNCTIONS -----------------------------------
-----------------------------------------------------------------------------


------------------- TEST_FUNCTION_1 -------------------

SET TERM ^ ;

CREATE FUNCTION TEST_FUNCTION_1 (
    inputParameter_1 Public_Rec ) RETURNS Public_Rec
AS
   DECLARE from_ NUMERIC(18, 4);
   DECLARE to_   NUMERIC(18, 4);
  DECLARE VARIABLE Lcntr INTEGER;
BEGIN
    Lcntr = 1;
    WHILE ( Lcntr < 20) DO
    BEGIN
           LCalc = :Lcntr * 31;
           dbms_output.put_line(LCalc);
    Lcntr = Lcntr + 1;
    END
END ^

SET TERM ; ^



----------------- TEST_FUNCTION_2 -------------------

SET TERM ^ ;

CREATE FUNCTION TEST_FUNCTION_2 (
    inputParameter_1 Public_Rec ) RETURNS Public_Rec
AS

BEGIN

    Lcntr = 15;
    WHILE ( Lcntr  >   1) DO
    BEGIN
       LCalc = :Lcntr * 31;
Lcntr = Lcntr - 1;
    END 
END ^

SET TERM ; ^



------------------- TEST_FUNCTION_3 -------------------

SET TERM ^ ;

CREATE FUNCTION TEST_FUNCTION_3 (
    inputParameter_1 Public_Rec ) RETURNS Public_Rec
AS
    DECLARE done  BOOLEAN = FALSE;
BEGIN
    WHILE (:done) DO
    BEGIN
        DBMS_OUTPUT.PUT_LINE ('This line does not print.');
        done = TRUE;
    END  -- This assignment is not made.

END ^

SET TERM ; ^




------------------- TEST_FUNCTION_4 -------------------

SET TERM ^ ;

CREATE PROCEDURE TEST_FUNCTION_4 (
    in_outputParameter_1  Public_Rec ) RETURNS (RET_VAL BOOLEAN, IN_OUTPUTPARAMETER_1_OUT Public_Rec)
 )
AS
    DECLARE param_1 Public_Rec;
BEGIN
    param_1.column1 = 'new_text';
      in_outputParameter_1 = :param_1;
      RET_VAL = TRUE;
      IN_OUTPUTPARAMETER_1_OUT = IN_OUTPUTPARAMETER_1;
      SUSPEND;
      EXIT;

END ^

SET TERM ; ^



------------------- TEST_FUNCTION_5 -------------------
--todo variables are not declared if nothing is declared in the IS block.
SET TERM ^ ;

CREATE FUNCTION TEST_FUNCTION_5 (
    inputParameter_1 Public_Rec ) RETURNS Public_Rec
AS
    DECLARE bool  BOOLEAN = FALSE;
DECLARE TEST_FUNCTION_4_RET_VAL BOOLEAN;
BEGIN
    WHILE (TRUE) DO
    BEGIN
            SELECT RET_VAL, IN_OUTPUTPARAMETER_1_OUT  FROM TEST_FUNCTION_4(:inputParameter_1) INTO TEST_FUNCTION_4_RET_VAL, inputParameter_1
if(:TEST_FUNCTION_4_RET_VAL)
break;
DBMS_OUTPUT.PUT_LINE (inputParameter_1.column1);
    END
END ^

SET TERM ; ^



------------------- TEST_FUNCTION_6 -------------------

SET TERM ^ ;

CREATE FUNCTION TEST_FUNCTION_6 (
    inputParameter_1 Public_Rec ) RETURNS Public_Rec
AS

BEGIN
   FOR rec_ IN (SELECT column1, column2 FROM table1 WHERE column1 = 'text')
   DO
   BEGIN
        DBMS_OUTPUT.PUT_LINE (rec_.column1);
        DBMS_OUTPUT.PUT_LINE (rec_.column2);
   END
END ^

SET TERM ; ^



------------------- TEST_FUNCTION_7 -------------------

SET TERM ^ ;

CREATE FUNCTION TEST_FUNCTION_7 (
    inputParameter_1 Public_Rec ) RETURNS Public_Rec
AS
    DECLARE text_  VARCHAR(1000);
    DECLARE cur1 CURSOR FOR
          (SELECT column1, column2
          FROM   table1
          WHERE  column1 = 'text');
  DECLARE VARIABLE CUR1_PKG TYPE OF TABLE CUR1;
BEGIN
    OPEN CUR1;
    FETCH CUR1 INTO CUR1_PKG;
    WHILE ( ROW_COUNT != 0 ) DO
    BEGIN
          text_ = rec_.column1 || '.' || rec_.column2;
          function_1(:text_);
    	FETCH CUR1 INTO CUR1_PKG;
    END
    CLOSE CUR1;


END ^

SET TERM ; ^




------------------- TEST_FUNCTION_8 -------------------

SET TERM ^ ;

CREATE FUNCTION TEST_FUNCTION_8 (
    inputParameter_1 Public_Rec ) RETURNS Public_Rec
AS

BEGIN
    LOOP
       monthly_value = daily_value * 31;
       EXIT WHEN monthly_value > 4000;
    END LOOP
END ^

SET TERM ; ^



------------------- TEST_FUNCTION_9 -------------------

SET TERM ^ ;

CREATE FUNCTION TEST_FUNCTION_9 (
    inputParameter_1 Public_Rec ) RETURNS Public_Rec
AS
    DECLARE text_  VARCHAR(1000);
    DECLARE cur1 CURSOR FOR
          (SELECT column1 column2
          FROM   table1
          WHERE  column1 = 'text');

    DECLARE cur2 CURSOR FOR
          (SELECT column3 column4
          FROM   table1
          WHERE  column3 = 'text');
  DECLARE VARIABLE CUR1_C TYPE OF TABLE CUR1;
  DECLARE VARIABLE CUR1_PKG TYPE OF TABLE CUR1;
BEGIN
    OPEN CUR1;
    FETCH CUR1 INTO CUR1_PKG;
    WHILE ( ROW_COUNT != 0 ) DO
    BEGIN
          text_ = rec_.column1 || '.' || rec_.column2;
          function_1(:text_);
        OPEN CUR1;
        FETCH CUR1 INTO CUR1_C;
        WHILE ( ROW_COUNT != 0 ) DO
        BEGIN
              text_ = CUR1_C.column1 || '.' || CUR1_C.column2;
              function_1(:text_);
        	FETCH CUR1 INTO CUR1_C;
        END
        CLOSE CUR1;

    	FETCH CUR1 INTO CUR1_PKG;
    END
    CLOSE CUR1;

END ^

SET TERM ; ^



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

    SET TERM ^ ;

CREATE PROCEDURE TEST_PROCEDURE_1 (
        inputParameter_1 VARCHAR(32000),
        inputParameter_2 VARCHAR(32000)
    )
    AS

    BEGIN
       Lcntr = 1;
       WHILE ( Lcntr < 20) DO
       BEGIN
              LCalc = :Lcntr * 31;
              dbms_output.put_line(LCalc);
       Lcntr = Lcntr + 1;
       END
    END ^

SET TERM ; ^




    ------------------- TEST_PROCEDURE_2 -------------------

    SET TERM ^ ;

CREATE PROCEDURE TEST_PROCEDURE_2 (
         inputParameter_1 VARCHAR(32000),
         nputParameter_2 VARCHAR(32000)
        )
    AS

    BEGIN
        Lcntr = 15;
        WHILE ( Lcntr  >   1) DO
        BEGIN
           LCalc = :Lcntr * 31;
Lcntr = Lcntr - 1;
        END 
    END ^

SET TERM ; ^




    ------------------- TEST_PROCEDURE_3 -------------------

    SET TERM ^ ;

CREATE PROCEDURE TEST_PROCEDURE_3 (
        inputParameter_1 VARCHAR(32000),
        inputParameter_2 VARCHAR(32000)
    )
    AS
        DECLARE done  BOOLEAN = FALSE;

    BEGIN

        WHILE (:done) DO
        BEGIN
            DBMS_OUTPUT.PUT_LINE ('This line does not print.');
            done = TRUE;
        END  -- This assignment is not made.


    END ^

SET TERM ; ^



    ------------------- TEST_PROCEDURE_4 -------------------
--todo variables are not declared if nothing is declared in the IS block.
    SET TERM ^ ;

CREATE PROCEDURE TEST_PROCEDURE_4 (
        inputParameter_1 VARCHAR(32000),
        inputParameter_2 VARCHAR(32000),
        :inputParameter_1 Public_Rec
    )
    AS

    BEGIN
      WHILE (TRUE) DO
      BEGIN
                SELECT RET_VAL, IN_OUTPUTPARAMETER_1_OUT  FROM TEST_FUNCTION_4(:inputParameter_1) INTO TEST_FUNCTION_4_RET_VAL, inputParameter_1
if(:TEST_FUNCTION_4_RET_VAL)
break;
DBMS_OUTPUT.PUT_LINE (inputParameter_1.column1);
      END
    END ^

SET TERM ; ^



    ----------------- TEST_PROCEDURE_5 -------------------

    SET TERM ^ ;

CREATE PROCEDURE TEST_PROCEDURE_5 (
        inputParameter_1 VARCHAR(32000),
        inputParameter_2 VARCHAR(32000)
    )
    AS

    BEGIN
       FOR rec_ IN (SELECT column1, column2 FROM table1 WHERE column1 = 'text')
       DO
       BEGIN
            DBMS_OUTPUT.PUT_LINE (rec_.column1);
            DBMS_OUTPUT.PUT_LINE (rec_.column2);
       END
    END ^

SET TERM ; ^


    ------------------- TEST_PROCEDURE_6 -------------------

    SET TERM ^ ;

CREATE PROCEDURE TEST_PROCEDURE_6 (
        inputParameter_1 VARCHAR(32000),
        inputParameter_2 VARCHAR(32000)
    )
    AS
        DECLARE text_  VARCHAR(1000);
        DECLARE cur1 CURSOR FOR
              (SELECT column1 column2
              FROM   table1
              WHERE  column1 = 'text');
  DECLARE VARIABLE CUR1_PKG TYPE OF TABLE CUR1;
    BEGIN
        OPEN CUR1;
        FETCH CUR1 INTO CUR1_PKG;
        WHILE ( ROW_COUNT != 0 ) DO
        BEGIN
              text_ = rec_.column1 || '.' || rec_.column2;
              function_1(:text_);
        	FETCH CUR1 INTO CUR1_PKG;
        END
        CLOSE CUR1;

    END ^

SET TERM ; ^



    ------------------- TEST_PROCEDURE_7 -------------------

    SET TERM ^ ;

CREATE PROCEDURE TEST_PROCEDURE_7 (
        inputParameter_1 VARCHAR(32000),
        inputParameter_2 VARCHAR(32000)
    )
    AS

    BEGIN
        LOOP
           monthly_value = daily_value * 31;
           EXIT WHEN monthly_value > 4000;
        END LOOP
    END ^

SET TERM ; ^



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

    SET TERM ^ ;

CREATE PROCEDURE TEST_PROCEDURE_8 (
        inputParameter_1 VARCHAR(32000),
        inputParameter_2 VARCHAR(32000)
    )
    AS
        DECLARE text_  VARCHAR(1000);
        DECLARE cur1 CURSOR FOR
              (SELECT column1 column2
              FROM   table1
              WHERE  column1 = 'text');

        DECLARE cur2 CURSOR FOR
              (SELECT column3 column4
              FROM   table1
              WHERE  column3 = 'text');
  DECLARE VARIABLE CUR1_C TYPE OF TABLE CUR1;
  DECLARE VARIABLE CUR1_PKG TYPE OF TABLE CUR1;
    BEGIN
        OPEN CUR1;
        FETCH CUR1 INTO CUR1_PKG;
        WHILE ( ROW_COUNT != 0 ) DO
        BEGIN
              text_ = rec_.column1 || '.' || rec_.column2;
              function_1(:text_);
            OPEN CUR1;
            FETCH CUR1 INTO CUR1_C;
            WHILE ( ROW_COUNT != 0 ) DO
            BEGIN
                  text_ = CUR1_C.column1 || '.' || CUR1_C.column2;
                  function_1(:text_);
            	FETCH CUR1 INTO CUR1_C;
            END
            CLOSE CUR1;

        	FETCH CUR1 INTO CUR1_PKG;
        END
        CLOSE CUR1;

    END ^

SET TERM ; ^


-----------------------------------------------------------------------------
---------------------------PACKAGE PROCEDURES -------------------------------
-----------------------------------------------------------------------------

SET TERM ^ ;

RECREATE   PACKAGE BODY PACKAGE_NAME_2 AS BEGIN


------------------- TEST_PACKAGE_PROCEDURE_1 -------------------

    PROCEDURE TEST_PACKAGE_PROCEDURE_1 (
       inputParameter_1 VARCHAR(32000),
       inputParameter_2 VARCHAR(32000)
   )
   AS

   BEGIN
      Lcntr = 1;
      WHILE ( Lcntr < 20) DO
      BEGIN
             LCalc = :Lcntr * 31;
             dbms_output.put_line(LCalc);
      Lcntr = Lcntr + 1;
      END
   END 





------------------- TEST_PACKAGE_PROCEDURE_2 -------------------

    PROCEDURE TEST_PACKAGE_PROCEDURE_2 (
       inputParameter_1 VARCHAR(32000),
       inputParameter_2 VARCHAR(32000)
   )
   AS
        DECLARE done  BOOLEAN = FALSE;
  DECLARE VARIABLE Lcntr INTEGER;
   BEGIN

        Lcntr = 15;
        WHILE ( Lcntr  >   1) DO
        BEGIN
           LCalc = :Lcntr * 31;
Lcntr = Lcntr - 1;
        END 

   END 



------------------- TEST_PACKAGE_PROCEDURE_3 -------------------

    PROCEDURE TEST_PACKAGE_PROCEDURE_3 (
       inputParameter_1 VARCHAR(32000),
       inputParameter_2 VARCHAR(32000)
   )
   AS

   BEGIN

      WHILE (done) DO
      BEGIN
          DBMS_OUTPUT.PUT_LINE ('This line does not print.');
          done = TRUE;
      END  -- This assignment is not made.


   END 



------------------- TEST_PACKAGE_PROCEDURE_4 -------------------
--todo variables are not declared if nothing is declared in the IS block.
    PROCEDURE TEST_PACKAGE_PROCEDURE_4 (
       inputParameter_1 VARCHAR(32000),
       inputParameter_2 VARCHAR(32000),
       inputParameter_1 Public_Rec
   )
   AS

   BEGIN
      WHILE (TRUE) DO
      BEGIN
                SELECT RET_VAL, IN_OUTPUTPARAMETER_1_OUT  FROM TEST_FUNCTION_4(:inputParameter_1) INTO TEST_FUNCTION_4_RET_VAL, inputParameter_1
if(:TEST_FUNCTION_4_RET_VAL)
break;
DBMS_OUTPUT.PUT_LINE (inputParameter_1.column1);
      END

   END 



------------------- TEST_PACKAGE_PROCEDURE_5 -------------------

    PROCEDURE TEST_PACKAGE_PROCEDURE_5 (
       inputParameter_1 VARCHAR(32000),
       inputParameter_2 VARCHAR(32000)
   )
   AS

   BEGIN
       FOR rec_ IN (SELECT column1, column2 FROM table1 WHERE column1 = 'text')
       DO
       BEGIN
            DBMS_OUTPUT.PUT_LINE (rec_.column1);
            DBMS_OUTPUT.PUT_LINE (rec_.column2);
       END

   END 



------------------- TEST_PACKAGE_PROCEDURE_6 -------------------
--todo add tab DECLARE VARIABLE CUR 1_PKG TYPE OF TABLE CAR 1;
    PROCEDURE TEST_PACKAGE_PROCEDURE_6 (
       inputParameter_1 VARCHAR(32000),
       inputParameter_2 VARCHAR(32000)
   )
   AS
        DECLARE text_  VARCHAR(1000);
        DECLARE cur1 CURSOR FOR
              (SELECT column1 column2
              FROM   table1
              WHERE  column1 = 'text');
  DECLARE VARIABLE CUR1_PKG TYPE OF TABLE CUR1;
   BEGIN
        OPEN CUR1;
        FETCH CUR1 INTO CUR1_PKG;
        WHILE ( ROW_COUNT != 0 ) DO
        BEGIN
              text_ = rec_.column1 || '.' || rec_.column2;
              function_1(:text_);
        	FETCH CUR1 INTO CUR1_PKG;
        END
        CLOSE CUR1;


   END 



------------------- TEST_PACKAGE_PROCEDURE_7 -------------------

    PROCEDURE TEST_PACKAGE_PROCEDURE_7 (
       inputParameter_1 VARCHAR(32000),
       inputParameter_2 VARCHAR(32000)
   )
   AS

   BEGIN
        LOOP
           monthly_value = daily_value * 31;
           EXIT WHEN monthly_value > 4000;
        END LOOP

   END 



--------------------- TEST_PACKAGE_PROCEDURE_8 -------------------

    PROCEDURE TEST_PACKAGE_PROCEDURE_8 (
       inputParameter_1 VARCHAR(32000),
       inputParameter_2 VARCHAR(32000)
   )
   AS
       DECLARE text_  VARCHAR(1000);
       DECLARE cur1 CURSOR FOR
             (SELECT column1 column2
             FROM   table1
             WHERE  column1 = 'text');

       DECLARE cur2 CURSOR FOR
             (SELECT column3 column4
             FROM   table1
             WHERE  column3 = 'text');
  DECLARE VARIABLE CUR1_C TYPE OF TABLE CUR1;
  DECLARE VARIABLE CUR1_PKG TYPE OF TABLE CUR1;

   BEGIN
        OPEN CUR1;
        FETCH CUR1 INTO CUR1_PKG;
        WHILE ( ROW_COUNT != 0 ) DO
        BEGIN
              text_ = rec_.column1 || '.' || rec_.column2;
              function_1(:text_);
            OPEN CUR1;
            FETCH CUR1 INTO CUR1_C;
            WHILE ( ROW_COUNT != 0 ) DO
            BEGIN
                  text_ = CUR1_C.column1 || '.' || CUR1_C.column2;
                  function_1(:text_);
            	FETCH CUR1 INTO CUR1_C;
            END
            CLOSE CUR1;

        	FETCH CUR1 INTO CUR1_PKG;
        END
        CLOSE CUR1;



   END 




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

end ;

SET TERM ; ^