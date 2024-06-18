CREATE OR REPLACE PACKAGE ORA.PACKAGE_1 IS

module_   CONSTANT  VARCHAR2(6)      := 'ORACLE';
name      CONSTANT  VARCHAR2(30)     := 'NAME';
type      CONSTANT  VARCHAR2(30)     := 'TYPE';
const_1   CONSTANT  CHAR(30)         := 'TEXT';
const_2   CONSTANT  NUMBER(30,5)     := 321.123;
const_3   CONSTANT  NUMERIC(30,5)    := 123.123;
const_4   CONSTANT  BOOLEAN(30)      := TRUE;

end Cf_Rep_Customer_API;



CREATE OR REPLACE PACKAGE BODY ORA.PACKAGE_2 IS

separator_       CONSTANT VARCHAR2(1)   := Client_SYS.field_separator_;
suffix_          CONSTANT VARCHAR2(30)  := '_ORA';
ctx_length_      CONSTANT NUMBER        := 4000;
list_separator_  CONSTANT VARCHAR2(1)   := ';';
private_const_1  CONSTANT CHAR(30)      := 'TEXT';
private_const_   CONSTANT NUMBER(30,5)  := 321.123;
private_const_3  CONSTANT NUMERIC(30,5) := 123.123;
private_const_4  CONSTANT BOOLEAN(30)   := TRUE;

end DOMAIN_SYS;

   create PROCEDURE Base (
      customer_ IN VARCHAR2,
      methodname_ IN VARCHAR2 )
   IS
       text_ VARCHAR2(10);
       local_separator_ VARCHAR2(1);
   BEGIN

      text_ := PACKAGE_1.lu_type_;
      local_separator_ := PACKAGE_1.separator_;
      text_ :=  local_separator_ || PACKAGE_1.separator_;
      text_ := local_separator_ || PACKAGE_1.No_package_constant;
      Error_SYS.procedure_(PACKAGE_1.lu_name_);


      while(PACKAGE_1.const_4) loop
        PACKAGE_1.const_4 := false;
      end loop;

      while(PACKAGE_1.NON_EXIST_const_4) loop
        PACKAGE_1.const_4 := true;
      end loop;

   END Base;