

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


CREATE GLOBAL TEMPORARY TABLE CITY_POPULATION (
	I1 VARCHAR(64),
	VAL NUMERIC(18, 4),
	CONSTRAINT PK_CITY_POPULATION PRIMARY KEY (I1)
);

CREATE GLOBAL TEMPORARY TABLE CITY_POPULATION1 (
	I1 VARCHAR(64),
	VAL NUMERIC(18, 4),
	CONSTRAINT PK_CITY_POPULATION1 PRIMARY KEY (I1)
);

CREATE GLOBAL TEMPORARY TABLE CITY_POPULATION2 (
	I1 VARCHAR(64),
	VAL NUMERIC(18, 4),
	CONSTRAINT PK_CITY_POPULATION2 PRIMARY KEY (I1)
);

CREATE GLOBAL TEMPORARY TABLE CITY_POPULATION3 (
	I1 VARCHAR(64),
	VAL NUMERIC(18, 4),
	CONSTRAINT PK_CITY_POPULATION3 PRIMARY KEY (I1)
);

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

FUNCTION TEST_PACKAGE_FUNCTION_1 (
        NUM NUMERIC(18, 4)) RETURNS BOOLEAN
AS
    /*TYPE TEST_PACKAGE_FUNCTION_1_population IS TABLE OF NUMERIC(18, 4) INDEX BY VARCHAR(64);*/
    /*city_population  TEST_PACKAGE_FUNCTION_1_population;*/
BEGIN
    null;
END 



------------------- TEST_PACKAGE_FUNCTION_2 -------------------

FUNCTION TEST_PACKAGE_FUNCTION_2 (
        NUM NUMERIC(18, 4)) RETURNS BOOLEAN
AS
    /*TYPE TEST_PACKAGE_FUNCTION_2_population IS TABLE OF NUMERIC(18, 4) INDEX BY VARCHAR(64);*/
    /*city_population  TEST_PACKAGE_FUNCTION_2_population;*/
BEGIN
    UPDATE OR INSERT INTO CITY_POPULATION1 VALUES ('Village', 2000);
END 



------------------- TEST_PACKAGE_FUNCTION_3 -------------------

FUNCTION TEST_PACKAGE_FUNCTION_3 (
        NUM NUMERIC(18, 4)) RETURNS BOOLEAN
AS
    /*TYPE TEST_PACKAGE_FUNCTION_3_population IS TABLE OF NUMERIC(18, 4) INDEX BY VARCHAR(64);*/
    /*city_population  TEST_PACKAGE_FUNCTION_3_population;*/
BEGIN
 DBMS_Output.PUT_LINE( (SELECT VAL FROM CITY_POPULATION2 WHERE I1 = 'Village') );
END 



------------------- TEST_PACKAGE_FUNCTION_4 -------------------

FUNCTION TEST_PACKAGE_FUNCTION_4 (
        NUM NUMERIC(18, 4)) RETURNS BOOLEAN
AS
    FUNCTION Base (
            NUM NUMERIC(18, 4)) RETURNS BOOLEAN
    AS
        /*TYPE TEST_PACKAGE_FUNCTION_4_Base_population IS TABLE OF NUMERIC(18, 4) INDEX BY VARCHAR(64);*/
        /*city_population  TEST_PACKAGE_FUNCTION_4_Base_population;*/
    BEGIN
            UPDATE OR INSERT INTO CITY_POPULATION3 VALUES ('Village', 2000);
            DBMS_Output.PUT_LINE( (SELECT VAL FROM CITY_POPULATION3 WHERE I1 = 'Village') );
    END 

BEGIN
    null;
END 



------------------- TEST_PACKAGE_FUNCTION_5 -------------------

--FUNCTION TEST_PACKAGE_FUNCTION_5 (
--        NUM NUMBER) RETURN BOOLEAN
--IS
--
--BEGIN
--    null;
--END TEST_PACKAGE_FUNCTION_5;





end ;

SET TERM ; ^





-----------------------------------------------------------------------------
------------------------------- FUNCTIONS -----------------------------------
-----------------------------------------------------------------------------


------------------- TEST_FUNCTION_1 -------------------

CREATE GLOBAL TEMPORARY TABLE CITY_POPULATION4 (
	I1 VARCHAR(64),
	VAL NUMERIC(18, 4),
	CONSTRAINT PK_CITY_POPULATION4 PRIMARY KEY (I1)
);

SET TERM ^ ;

CREATE FUNCTION TEST_FUNCTION_1 (
    NUM NUMERIC(18, 4) ) RETURNS BOOLEAN
AS
    /*TYPE TEST_FUNCTION_1_population IS TABLE OF NUMERIC(18, 4) INDEX BY VARCHAR(64);*/
    /*city_population  TEST_FUNCTION_1_population;*/
BEGIN
    null;
END ^

SET TERM ; ^



------------------- TEST_FUNCTION_2 -------------------

CREATE GLOBAL TEMPORARY TABLE CITY_POPULATION5 (
	I1 VARCHAR(64),
	VAL NUMERIC(18, 4),
	CONSTRAINT PK_CITY_POPULATION5 PRIMARY KEY (I1)
);

SET TERM ^ ;

CREATE FUNCTION TEST_FUNCTION_2 (
    NUM NUMERIC(18, 4) ) RETURNS BOOLEAN
AS
    /*TYPE TEST_FUNCTION_2_population IS TABLE OF NUMERIC(18, 4) INDEX BY VARCHAR(64);*/
    /*city_population  TEST_FUNCTION_2_population;*/
BEGIN
    UPDATE OR INSERT INTO CITY_POPULATION5 VALUES ('Village', 2000);
END ^

SET TERM ; ^




------------------- TEST_FUNCTION_3 -------------------

CREATE GLOBAL TEMPORARY TABLE CITY_POPULATION6 (
	I1 VARCHAR(64),
	VAL NUMERIC(18, 4),
	CONSTRAINT PK_CITY_POPULATION6 PRIMARY KEY (I1)
);

SET TERM ^ ;

CREATE FUNCTION TEST_FUNCTION_3 (
    NUM NUMERIC(18, 4) ) RETURNS BOOLEAN
AS
    /*TYPE TEST_FUNCTION_3_population IS TABLE OF NUMERIC(18, 4) INDEX BY VARCHAR(64);*/
    /*city_population  TEST_FUNCTION_3_population;*/
BEGIN
    DBMS_Output.PUT_LINE( (SELECT VAL FROM CITY_POPULATION6 WHERE I1 = 'Village') );
END ^

SET TERM ; ^



------------------- TEST_FUNCTION_4 -------------------

CREATE GLOBAL TEMPORARY TABLE CITY_POPULATION7 (
	I1 VARCHAR(64),
	VAL NUMERIC(18, 4),
	CONSTRAINT PK_CITY_POPULATION7 PRIMARY KEY (I1)
);

SET TERM ^ ;

CREATE FUNCTION TEST_FUNCTION_4 (
    NUM NUMERIC(18, 4) ) RETURNS BOOLEAN
AS
    FUNCTION Base (
            NUM NUMERIC(18, 4)) RETURNS BOOLEAN
    AS
        /*TYPE TEST_FUNCTION_4_Base_population IS TABLE OF NUMERIC(18, 4) INDEX BY VARCHAR(64);*/
        /*city_population  TEST_FUNCTION_4_Base_population;*/
    BEGIN
            UPDATE OR INSERT INTO CITY_POPULATION7 VALUES ('Village', 2000);
            DBMS_Output.PUT_LINE( (SELECT VAL FROM CITY_POPULATION7 WHERE I1 = 'Village') );
    END 
BEGIN
    null;
END ^

SET TERM ; ^



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

CREATE GLOBAL TEMPORARY TABLE CITY_POPULATION8 (
	I1 VARCHAR(64),
	VAL NUMERIC(18, 4),
	CONSTRAINT PK_CITY_POPULATION8 PRIMARY KEY (I1)
);

SET TERM ^ ;

CREATE PROCEDURE TEST_PROCEDURE_1 (
    NUM NUMERIC(18, 4))
AS
    /*TYPE TEST_PROCEDURE_1_population IS TABLE OF NUMERIC(18, 4) INDEX BY VARCHAR(64);*/
    /*city_population  TEST_PROCEDURE_1_population;*/
BEGIN
    null;
END ^

SET TERM ; ^



----------------------- TEST_PROCEDURE_2 -----------------------

CREATE GLOBAL TEMPORARY TABLE CITY_POPULATION9 (
	I1 VARCHAR(64),
	VAL NUMERIC(18, 4),
	CONSTRAINT PK_CITY_POPULATION9 PRIMARY KEY (I1)
);

SET TERM ^ ;

CREATE PROCEDURE TEST_PROCEDURE_2 (
    NUM NUMERIC(18, 4))
AS
    /*TYPE TEST_PROCEDURE_2_population IS TABLE OF NUMERIC(18, 4) INDEX BY VARCHAR(64);*/
    /*city_population  TEST_PROCEDURE_2_population;*/
BEGIN
    UPDATE OR INSERT INTO CITY_POPULATION9 VALUES ('Village', 2000);
END ^

SET TERM ; ^



----------------------- TEST_PROCEDURE_3 -----------------------

CREATE GLOBAL TEMPORARY TABLE CITY_POPULATION10 (
	I1 VARCHAR(64),
	VAL NUMERIC(18, 4),
	CONSTRAINT PK_CITY_POPULATION10 PRIMARY KEY (I1)
);

SET TERM ^ ;

CREATE PROCEDURE TEST_PROCEDURE_3 (
    NUM NUMERIC(18, 4))
AS
    /*TYPE TEST_FUNCTION_3_population IS TABLE OF NUMERIC(18, 4) INDEX BY VARCHAR(64);*/
    /*city_population  TEST_FUNCTION_3_population;*/
BEGIN
    DBMS_Output.PUT_LINE( (SELECT VAL FROM CITY_POPULATION10 WHERE I1 = 'Village') );
END ^

SET TERM ; ^



----------------------- TEST_PROCEDURE_4 -----------------------

CREATE GLOBAL TEMPORARY TABLE CITY_POPULATION11 (
	I1 VARCHAR(64),
	VAL NUMERIC(18, 4),
	CONSTRAINT PK_CITY_POPULATION11 PRIMARY KEY (I1)
);

SET TERM ^ ;

CREATE PROCEDURE TEST_PROCEDURE_4 (
    NUM NUMERIC(18, 4))
AS
    PROCEDURE Base (
            NUM NUMERIC(18, 4))
    AS
        /*TYPE TEST_PROCEDURE_4_Base_population IS TABLE OF NUMERIC(18, 4) INDEX BY VARCHAR(64);*/
        /*city_population  TEST_PROCEDURE_4_Base_population;*/
    BEGIN
            UPDATE OR INSERT INTO CITY_POPULATION11 VALUES ('Village', 2000);
            DBMS_Output.PUT_LINE( (SELECT VAL FROM CITY_POPULATION11 WHERE I1 = 'Village') );
    END 
BEGIN
    null;
END ^

SET TERM ; ^




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

CREATE GLOBAL TEMPORARY TABLE CITY_POPULATION12 (
	I1 VARCHAR(64),
	VAL NUMERIC(18, 4),
	CONSTRAINT PK_CITY_POPULATION12 PRIMARY KEY (I1)
);

CREATE GLOBAL TEMPORARY TABLE CITY_POPULATION13 (
	I1 VARCHAR(64),
	VAL NUMERIC(18, 4),
	CONSTRAINT PK_CITY_POPULATION13 PRIMARY KEY (I1)
);

CREATE GLOBAL TEMPORARY TABLE CITY_POPULATION14 (
	I1 VARCHAR(64),
	VAL NUMERIC(18, 4),
	CONSTRAINT PK_CITY_POPULATION14 PRIMARY KEY (I1)
);

CREATE GLOBAL TEMPORARY TABLE CITY_POPULATION15 (
	I1 VARCHAR(64),
	VAL NUMERIC(18, 4),
	CONSTRAINT PK_CITY_POPULATION15 PRIMARY KEY (I1)
);

SET TERM ^ ;

RECREATE   PACKAGE BODY PACKAGE_NAME_2 AS BEGIN


------------------- TEST_PACKAGE_PROCEDURE_1 -------------------

PROCEDURE TEST_PACKAGE_PROCEDURE_1 (
    NUM NUMERIC(18, 4) )
AS
    /*TYPE TEST_PACKAGE_PROCEDURE_1_population IS TABLE OF NUMERIC(18, 4) INDEX BY VARCHAR(64);*/
    /*city_population  TEST_PACKAGE_PROCEDURE_1_population;*/
BEGIN
    null;
END 



------------------- TEST_PACKAGE_PROCEDURE_2 -------------------

PROCEDURE TEST_PACKAGE_PROCEDURE_2 (
    NUM NUMERIC(18, 4) )
AS
    /*TYPE TEST_PACKAGE_PROCEDURE_2_population IS TABLE OF NUMERIC(18, 4) INDEX BY VARCHAR(64);*/
    /*city_population  TEST_PACKAGE_PROCEDURE_2_population;*/
BEGIN
    UPDATE OR INSERT INTO CITY_POPULATION13 VALUES ('Village', 2000);
END 



------------------- TEST_PACKAGE_PROCEDURE_3 -------------------

PROCEDURE TEST_PACKAGE_PROCEDURE_3 (
    NUM NUMERIC(18, 4) )
AS
    /*TYPE TEST_PACKAGE_PROCEDURE_3_population IS TABLE OF NUMERIC(18, 4) INDEX BY VARCHAR(64);*/
    /*city_population  TEST_PACKAGE_PROCEDURE_3_population;*/
BEGIN
    DBMS_Output.PUT_LINE( (SELECT VAL FROM CITY_POPULATION14 WHERE I1 = 'Village') );
END 



------------------- TEST_PACKAGE_PROCEDURE_4 -------------------

PROCEDURE TEST_PACKAGE_PROCEDURE_4 (
    NUM NUMERIC(18, 4) )
AS
    PROCEDURE Base (
        NUM NUMERIC(18, 4) )
    AS
        /*TYPE TEST_PACKAGE_PROCEDURE_4_Base_population IS TABLE OF NUMERIC(18, 4) INDEX BY VARCHAR(64);*/
        /*city_population  TEST_PACKAGE_PROCEDURE_4_Base_population;*/
    BEGIN
        UPDATE OR INSERT INTO CITY_POPULATION15 VALUES ('Village', 2000);
        DBMS_Output.PUT_LINE( (SELECT VAL FROM CITY_POPULATION15 WHERE I1 = 'Village') );
    END 
BEGIN
    null;
END 



------------------- TEST_PACKAGE_PROCEDURE_5 -------------------

--PROCEDURE TEST_PACKAGE_PROCEDURE_5 (
--    NUM NUMBER )
--IS
--
--BEGIN
--    null;
--END TEST_PACKAGE_PROCEDURE_5;




end ;

SET TERM ; ^