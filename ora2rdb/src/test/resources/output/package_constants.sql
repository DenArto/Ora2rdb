CREATE OR ALTER PACKAGE PACKAGE_1 AS BEGIN

CONSTANT module_     VARCHAR(6)      = 'ORACLE';
CONSTANT name        VARCHAR(30)     = 'NAME';
CONSTANT type        VARCHAR(30)     = 'TYPE';
CONSTANT const_1     CHAR(30)         = 'TEXT';
CONSTANT const_2     NUMERIC(30,5)     = 321.123;
CONSTANT const_3     NUMERIC(30,5)    = 123.123;
CONSTANT const_4     BOOLEAN(30)      = TRUE;

end ;



SET TERM ^ ;

RECREATE   PACKAGE BODY PACKAGE_2 AS BEGIN

CONSTANT separator_        VARCHAR(1)   = Client_SYS.field_separator_;
CONSTANT suffix_           VARCHAR(30)  = '_ORA';
CONSTANT ctx_length_       NUMERIC(18, 4)        = 4000;
CONSTANT list_separator_   VARCHAR(1)   = ';';
CONSTANT private_const_1   CHAR(30)      = 'TEXT';
CONSTANT private_const_    NUMERIC(30,5)  = 321.123;
CONSTANT private_const_3   NUMERIC(30,5) = 123.123;
CONSTANT private_const_4   BOOLEAN(30)   = TRUE;

end ;

SET TERM ; ^

   SET TERM ^ ;

create PROCEDURE Base (
      customer_  VARCHAR(250),
      methodname_  VARCHAR(250) )
   AS
       DECLARE text_ VARCHAR(10);
       DECLARE local_separator_ VARCHAR(1);
   BEGIN

      text_ = PACKAGE_1.lu_type_;
      local_separator_ = PACKAGE_1:separator_;
      text_ =  :local_separator_ || PACKAGE_1:separator_;
      text_ = :local_separator_ || PACKAGE_1.No_package_constant;
      Error_SYS.procedure_(PACKAGE_1.lu_name_);


      while((PACKAGE_1:const_4)) DO
      BEGIN
        PACKAGE_1.const_4 = false;
      END

      while((PACKAGE_1.NON_EXIST_const_4)) DO
      BEGIN
        PACKAGE_1.const_4 = true;
      END

   END ^

SET TERM ; ^