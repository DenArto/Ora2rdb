

-----------------------------------------------------------------------------
-------------------- Metadata is used only as a syntax check ----------------
-------------------- and contains logical errors, ---------------------------
-------------------- so it cannot be executed. ------------------------------
-----------------------------------------------------------------------------


CREATE OR REPLACE PACKAGE ORA.PACKAGE_1 IS


-----------------------------------------------------------------------------
-------------------- PUBLIC DECLARATIONS ------------------------------------
-----------------------------------------------------------------------------



end PACKAGE_1;


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
        NUM NUMBER) RETURN BOOLEAN
IS
    TYPE TEST_PACKAGE_FUNCTION_1_population IS TABLE OF NUMBER INDEX BY VARCHAR2(64);
    city_population  TEST_PACKAGE_FUNCTION_1_population;
BEGIN
    null;
END TEST_PACKAGE_FUNCTION_1;



------------------- TEST_PACKAGE_FUNCTION_2 -------------------

FUNCTION TEST_PACKAGE_FUNCTION_2 (
        NUM NUMBER) RETURN BOOLEAN
IS
    TYPE TEST_PACKAGE_FUNCTION_2_population IS TABLE OF NUMBER INDEX BY VARCHAR2(64);
    city_population  TEST_PACKAGE_FUNCTION_2_population;
BEGIN
    city_population('Village')   := 2000;
END TEST_PACKAGE_FUNCTION_2;



------------------- TEST_PACKAGE_FUNCTION_3 -------------------

FUNCTION TEST_PACKAGE_FUNCTION_3 (
        NUM NUMBER) RETURN BOOLEAN
IS
    TYPE TEST_PACKAGE_FUNCTION_3_population IS TABLE OF NUMBER INDEX BY VARCHAR2(64);
    city_population  TEST_PACKAGE_FUNCTION_3_population;
BEGIN
 DBMS_Output.PUT_LINE( city_population('Village') );
END TEST_PACKAGE_FUNCTION_3;



------------------- TEST_PACKAGE_FUNCTION_4 -------------------

FUNCTION TEST_PACKAGE_FUNCTION_4 (
        NUM NUMBER) RETURN BOOLEAN
IS
    FUNCTION Base (
            NUM NUMBER) RETURN BOOLEAN
    IS
        TYPE TEST_PACKAGE_FUNCTION_4_Base_population IS TABLE OF NUMBER INDEX BY VARCHAR2(64);
        city_population  TEST_PACKAGE_FUNCTION_4_Base_population;
    BEGIN
            city_population('Village')   := 2000;
            DBMS_Output.PUT_LINE( city_population('Village') );
    END Base;

BEGIN
    null;
END TEST_PACKAGE_FUNCTION_4;



------------------- TEST_PACKAGE_FUNCTION_5 -------------------

--FUNCTION TEST_PACKAGE_FUNCTION_5 (
--        NUM NUMBER) RETURN BOOLEAN
--IS
--
--BEGIN
--    null;
--END TEST_PACKAGE_FUNCTION_5;





end PACKAGE_NAME_1;





-----------------------------------------------------------------------------
------------------------------- FUNCTIONS -----------------------------------
-----------------------------------------------------------------------------


------------------- TEST_FUNCTION_1 -------------------

CREATE FUNCTION TEST_FUNCTION_1 (
    NUM NUMBER ) RETURN BOOLEAN
IS
    TYPE TEST_FUNCTION_1_population IS TABLE OF NUMBER INDEX BY VARCHAR2(64);
    city_population  TEST_FUNCTION_1_population;
BEGIN
    null;
END TEST_FUNCTION_1;



------------------- TEST_FUNCTION_2 -------------------

CREATE FUNCTION TEST_FUNCTION_2 (
    NUM NUMBER ) RETURN BOOLEAN
IS
    TYPE TEST_FUNCTION_2_population IS TABLE OF NUMBER INDEX BY VARCHAR2(64);
    city_population  TEST_FUNCTION_2_population;
BEGIN
    city_population('Village')   := 2000;
END TEST_FUNCTION_2;




------------------- TEST_FUNCTION_3 -------------------

CREATE FUNCTION TEST_FUNCTION_3 (
    NUM NUMBER ) RETURN BOOLEAN
IS
    TYPE TEST_FUNCTION_3_population IS TABLE OF NUMBER INDEX BY VARCHAR2(64);
    city_population  TEST_FUNCTION_3_population;
BEGIN
    DBMS_Output.PUT_LINE( city_population('Village') );
END TEST_FUNCTION_3;



------------------- TEST_FUNCTION_4 -------------------

CREATE FUNCTION TEST_FUNCTION_4 (
    NUM NUMBER ) RETURN BOOLEAN
IS
    FUNCTION Base (
            NUM NUMBER) RETURN BOOLEAN
    IS
        TYPE TEST_FUNCTION_4_Base_population IS TABLE OF NUMBER INDEX BY VARCHAR2(64);
        city_population  TEST_FUNCTION_4_Base_population;
    BEGIN
            city_population('Village')   := 2000;
            DBMS_Output.PUT_LINE( city_population('Village') );
    END Base;
BEGIN
    null;
END TEST_FUNCTION_4;



------------------- TEST_FUNCTION_5 -------------------

--CREATE FUNCTION TEST_FUNCTION_5 (
--    NUM NUMBER ) RETURN BOOLEAN
--IS
--
--BEGIN
--    null;
--END TEST_FUNCTION_5;






-----------------------------------------------------------------------------
------------------------------ PROCEDURES -----------------------------------
-----------------------------------------------------------------------------


----------------------- TEST_PROCEDURE_1 -----------------------

CREATE PROCEDURE TEST_PROCEDURE_1 (
    NUM NUMBER)
IS
    TYPE TEST_PROCEDURE_1_population IS TABLE OF NUMBER INDEX BY VARCHAR2(64);
    city_population  TEST_PROCEDURE_1_population;
BEGIN
    null;
END TEST_PROCEDURE_1;



----------------------- TEST_PROCEDURE_2 -----------------------

CREATE PROCEDURE TEST_PROCEDURE_2 (
    NUM NUMBER)
IS
    TYPE TEST_PROCEDURE_2_population IS TABLE OF NUMBER INDEX BY VARCHAR2(64);
    city_population  TEST_PROCEDURE_2_population;
BEGIN
    city_population('Village')   := 2000;
END TEST_PROCEDURE_2;



----------------------- TEST_PROCEDURE_3 -----------------------

CREATE PROCEDURE TEST_PROCEDURE_3 (
    NUM NUMBER)
IS
    TYPE TEST_FUNCTION_3_population IS TABLE OF NUMBER INDEX BY VARCHAR2(64);
    city_population  TEST_FUNCTION_3_population;
BEGIN
    DBMS_Output.PUT_LINE( city_population('Village') );
END TEST_PROCEDURE_3;



----------------------- TEST_PROCEDURE_4 -----------------------

CREATE PROCEDURE TEST_PROCEDURE_4 (
    NUM NUMBER)
IS
    PROCEDURE Base (
            NUM NUMBER)
    IS
        TYPE TEST_PROCEDURE_4_Base_population IS TABLE OF NUMBER INDEX BY VARCHAR2(64);
        city_population  TEST_PROCEDURE_4_Base_population;
    BEGIN
            city_population('Village')   := 2000;
            DBMS_Output.PUT_LINE( city_population('Village') );
    END Base;
BEGIN
    null;
END TEST_PROCEDURE_4;




----------------------- TEST_PROCEDURE_5 -----------------------

--CREATE PROCEDURE TEST_PROCEDURE_5 (
--    NUM NUMBER)
--IS
--
--BEGIN
--    null;
--END TEST_PROCEDURE_5;






-----------------------------------------------------------------------------
---------------------------PACKAGE PROCEDURES -------------------------------
-----------------------------------------------------------------------------

CREATE OR REPLACE PACKAGE BODY ORA.PACKAGE_NAME_2 IS


------------------- TEST_PACKAGE_PROCEDURE_1 -------------------

PROCEDURE TEST_PACKAGE_PROCEDURE_1 (
    NUM NUMBER )
IS
    TYPE TEST_PACKAGE_PROCEDURE_1_population IS TABLE OF NUMBER INDEX BY VARCHAR2(64);
    city_population  TEST_PACKAGE_PROCEDURE_1_population;
BEGIN
    null;
END TEST_PACKAGE_PROCEDURE_1;



------------------- TEST_PACKAGE_PROCEDURE_2 -------------------

PROCEDURE TEST_PACKAGE_PROCEDURE_2 (
    NUM NUMBER )
IS
    TYPE TEST_PACKAGE_PROCEDURE_2_population IS TABLE OF NUMBER INDEX BY VARCHAR2(64);
    city_population  TEST_PACKAGE_PROCEDURE_2_population;
BEGIN
    city_population('Village')   := 2000;
END TEST_PACKAGE_PROCEDURE_2;



------------------- TEST_PACKAGE_PROCEDURE_3 -------------------

PROCEDURE TEST_PACKAGE_PROCEDURE_3 (
    NUM NUMBER )
IS
    TYPE TEST_PACKAGE_PROCEDURE_3_population IS TABLE OF NUMBER INDEX BY VARCHAR2(64);
    city_population  TEST_PACKAGE_PROCEDURE_3_population;
BEGIN
    DBMS_Output.PUT_LINE( city_population('Village') );
END TEST_PACKAGE_PROCEDURE_3;



------------------- TEST_PACKAGE_PROCEDURE_4 -------------------

PROCEDURE TEST_PACKAGE_PROCEDURE_4 (
    NUM NUMBER )
IS
    PROCEDURE Base (
        NUM NUMBER )
    IS
        TYPE TEST_PACKAGE_PROCEDURE_4_Base_population IS TABLE OF NUMBER INDEX BY VARCHAR2(64);
        city_population  TEST_PACKAGE_PROCEDURE_4_Base_population;
    BEGIN
        city_population('Village')   := 2000;
        DBMS_Output.PUT_LINE( city_population('Village') );
    END Base;
BEGIN
    null;
END TEST_PACKAGE_PROCEDURE_4;



------------------- TEST_PACKAGE_PROCEDURE_5 -------------------

--PROCEDURE TEST_PACKAGE_PROCEDURE_5 (
--    NUM NUMBER )
--IS
--
--BEGIN
--    null;
--END TEST_PACKAGE_PROCEDURE_5;




end PACKAGE_NAME_2;