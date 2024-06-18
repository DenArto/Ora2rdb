--------------------------------------------------------
--  DDL for Sequence DEPARTMENTS_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "DEPARTMENTS_SEQ"           ;
ALTER SEQUENCE "DEPARTMENTS_SEQ" RESTART WITH 280;
--------------------------------------------------------
--  DDL for Sequence EMPLOYEES_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "EMPLOYEES_SEQ"           ;
ALTER SEQUENCE "EMPLOYEES_SEQ" RESTART WITH 207;
--------------------------------------------------------
--  DDL for Sequence LOCATIONS_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "LOCATIONS_SEQ"           ;
ALTER SEQUENCE "LOCATIONS_SEQ" RESTART WITH 3300;
--------------------------------------------------------
--  DDL for Table COUNTRIES
--------------------------------------------------------

  CREATE TABLE "COUNTRIES" 
   (	"COUNTRY_ID" CHAR(2 ) NOT NULL, 
	"COUNTRY_NAME" VARCHAR(40 ), 
	"REGION_ID" NUMERIC(18, 4)
   )  ;

   COMMENT ON COLUMN "COUNTRIES"."COUNTRY_ID" IS 'Primary key of countries table.';
   COMMENT ON COLUMN "COUNTRIES"."COUNTRY_NAME" IS 'Country name';
   COMMENT ON COLUMN "COUNTRIES"."REGION_ID" IS 'Region ID for the country. Foreign key to region_id column in the departments table.';
   COMMENT ON TABLE "COUNTRIES"  IS 'country table. Contains 25 rows. References with locations table.';
--------------------------------------------------------
--  DDL for Table DEPARTMENTS
--------------------------------------------------------

  CREATE TABLE "DEPARTMENTS" 
   (	"DEPARTMENT_ID" NUMERIC(4,0) NOT NULL, 
	"DEPARTMENT_NAME" VARCHAR(30 ) NOT NULL, 
	"MANAGER_ID" NUMERIC(6,0), 
	"LOCATION_ID" NUMERIC(4,0)
   ) ;

   COMMENT ON COLUMN "DEPARTMENTS"."DEPARTMENT_ID" IS 'Primary key column of departments table.';
   COMMENT ON COLUMN "DEPARTMENTS"."DEPARTMENT_NAME" IS 'A not null column that shows name of a department. Administration,
Marketing, Purchasing, Human Resources, Shipping, IT, Executive, Public
Relations, Sales, Finance, and Accounting. ';
   COMMENT ON COLUMN "DEPARTMENTS"."MANAGER_ID" IS 'Manager_id of a department. Foreign key to employee_id column of employees table. The manager_id column of the employee table references this column.';
   COMMENT ON COLUMN "DEPARTMENTS"."LOCATION_ID" IS 'Location id where a department is located. Foreign key to location_id column of locations table.';
   COMMENT ON TABLE "DEPARTMENTS"  IS 'Departments table that shows details of departments where employees
work. Contains 27 rows; references with locations, employees, and job_history tables.';
--------------------------------------------------------
--  DDL for Table EMPLOYEES
--------------------------------------------------------

  CREATE TABLE "EMPLOYEES" 
   (	"EMPLOYEE_ID" NUMERIC(6,0) NOT NULL, 
	"FIRST_NAME" VARCHAR(20 ), 
	"LAST_NAME" VARCHAR(25 ) NOT NULL, 
	"EMAIL" VARCHAR(25 ) NOT NULL, 
	"PHONE_NUMBER" VARCHAR(20 ), 
	"HIRE_DATE" DATE NOT NULL, 
	"JOB_ID" VARCHAR(10 ) NOT NULL, 
	"SALARY" NUMERIC(8,2), 
	"COMMISSION_PCT" NUMERIC(2,2), 
	"MANAGER_ID" NUMERIC(6,0), 
	"DEPARTMENT_ID" NUMERIC(4,0)
   ) ;

   COMMENT ON COLUMN "EMPLOYEES"."EMPLOYEE_ID" IS 'Primary key of employees table.';
   COMMENT ON COLUMN "EMPLOYEES"."FIRST_NAME" IS 'First name of the employee. A not null column.';
   COMMENT ON COLUMN "EMPLOYEES"."LAST_NAME" IS 'Last name of the employee. A not null column.';
   COMMENT ON COLUMN "EMPLOYEES"."EMAIL" IS 'Email id of the employee';
   COMMENT ON COLUMN "EMPLOYEES"."PHONE_NUMBER" IS 'Phone number of the employee; includes country code and area code';
   COMMENT ON COLUMN "EMPLOYEES"."HIRE_DATE" IS 'Date when the employee started on this job. A not null column.';
   COMMENT ON COLUMN "EMPLOYEES"."JOB_ID" IS 'Current job of the employee; foreign key to job_id column of the
jobs table. A not null column.';
   COMMENT ON COLUMN "EMPLOYEES"."SALARY" IS 'Monthly salary of the employee. Must be greater
than zero (enforced by constraint emp_salary_min)';
   COMMENT ON COLUMN "EMPLOYEES"."COMMISSION_PCT" IS 'Commission percentage of the employee; Only employees in sales
department elgible for commission percentage';
   COMMENT ON COLUMN "EMPLOYEES"."MANAGER_ID" IS 'Manager id of the employee; has same domain as manager_id in
departments table. Foreign key to employee_id column of employees table.
(useful for reflexive joins and CONNECT BY query)';
   COMMENT ON COLUMN "EMPLOYEES"."DEPARTMENT_ID" IS 'Department id where employee works; foreign key to department_id
column of the departments table';
   COMMENT ON TABLE "EMPLOYEES"  IS 'employees table. Contains 107 rows. References with departments,
jobs, job_history tables. Contains a self reference.';
--------------------------------------------------------
--  DDL for Table JOB_HISTORY
--------------------------------------------------------

  CREATE TABLE "JOB_HISTORY" 
   (	"EMPLOYEE_ID" NUMERIC(6,0) NOT NULL, 
	"START_DATE" DATE NOT NULL, 
	"END_DATE" DATE NOT NULL, 
	"JOB_ID" VARCHAR(10 ) NOT NULL, 
	"DEPARTMENT_ID" NUMERIC(4,0)
   ) ;

   COMMENT ON COLUMN "JOB_HISTORY"."EMPLOYEE_ID" IS 'A not null column in the complex primary key employee_id+start_date.
Foreign key to employee_id column of the employee table';
   COMMENT ON COLUMN "JOB_HISTORY"."START_DATE" IS 'A not null column in the complex primary key employee_id+start_date.
Must be less than the end_date of the job_history table. (enforced by
constraint jhist_date_interval)';
   COMMENT ON COLUMN "JOB_HISTORY"."END_DATE" IS 'Last day of the employee in this job role. A not null column. Must be
greater than the start_date of the job_history table.
(enforced by constraint jhist_date_interval)';
   COMMENT ON COLUMN "JOB_HISTORY"."JOB_ID" IS 'Job role in which the employee worked in the past; foreign key to
job_id column in the jobs table. A not null column.';
   COMMENT ON COLUMN "JOB_HISTORY"."DEPARTMENT_ID" IS 'Department id in which the employee worked in the past; foreign key to deparment_id column in the departments table';
   COMMENT ON TABLE "JOB_HISTORY"  IS 'Table that stores job history of the employees. If an employee
changes departments within the job or changes jobs within the department,
new rows get inserted into this table with old job information of the
employee. Contains a complex primary key: employee_id+start_date.
Contains 25 rows. References with jobs, employees, and departments tables.';
--------------------------------------------------------
--  DDL for Table JOBS
--------------------------------------------------------

  CREATE TABLE "JOBS" 
   (	"JOB_ID" VARCHAR(10 ) NOT NULL, 
	"JOB_TITLE" VARCHAR(35 ) NOT NULL, 
	"MIN_SALARY" NUMERIC(6,0), 
	"MAX_SALARY" NUMERIC(6,0)
   ) ;

   COMMENT ON COLUMN "JOBS"."JOB_ID" IS 'Primary key of jobs table.';
   COMMENT ON COLUMN "JOBS"."JOB_TITLE" IS 'A not null column that shows job title, e.g. AD_VP, FI_ACCOUNTANT';
   COMMENT ON COLUMN "JOBS"."MIN_SALARY" IS 'Minimum salary for a job title.';
   COMMENT ON COLUMN "JOBS"."MAX_SALARY" IS 'Maximum salary for a job title';
   COMMENT ON TABLE "JOBS"  IS 'jobs table with job titles and salary ranges. Contains 19 rows.
References with employees and job_history table.';
--------------------------------------------------------
--  DDL for Table LOCATIONS
--------------------------------------------------------

  CREATE TABLE "LOCATIONS" 
   (	"LOCATION_ID" NUMERIC(4,0) NOT NULL, 
	"STREET_ADDRESS" VARCHAR(40 ), 
	"POSTAL_CODE" VARCHAR(12 ), 
	"CITY" VARCHAR(30 ) NOT NULL, 
	"STATE_PROVINCE" VARCHAR(25 ), 
	"COUNTRY_ID" CHAR(2 )
   ) ;

   COMMENT ON COLUMN "LOCATIONS"."LOCATION_ID" IS 'Primary key of locations table';
   COMMENT ON COLUMN "LOCATIONS"."STREET_ADDRESS" IS 'Street address of an office, warehouse, or production site of a company.
Contains building number and street name';
   COMMENT ON COLUMN "LOCATIONS"."POSTAL_CODE" IS 'Postal code of the location of an office, warehouse, or production site
of a company. ';
   COMMENT ON COLUMN "LOCATIONS"."CITY" IS 'A not null column that shows city where an office, warehouse, or
production site of a company is located. ';
   COMMENT ON COLUMN "LOCATIONS"."STATE_PROVINCE" IS 'State or Province where an office, warehouse, or production site of a
company is located.';
   COMMENT ON COLUMN "LOCATIONS"."COUNTRY_ID" IS 'Country where an office, warehouse, or production site of a company is
located. Foreign key to country_id column of the countries table.';
   COMMENT ON TABLE "LOCATIONS"  IS 'Locations table that contains specific address of a specific office,
warehouse, and/or production site of a company. Does not store addresses /
locations of customers. Contains 23 rows; references with the
departments and countries tables. ';
--------------------------------------------------------
--  DDL for Table REGIONS
--------------------------------------------------------

  CREATE TABLE "REGIONS" 
   (	"REGION_ID" NUMERIC(18, 4) NOT NULL, 
	"REGION_NAME" VARCHAR(25 )
   ) ;
--------------------------------------------------------
--  DDL for View EMP_DETAILS_VIEW
--------------------------------------------------------

  CREATE OR ALTER  VIEW "EMP_DETAILS_VIEW" ("EMPLOYEE_ID", "JOB_ID", "MANAGER_ID", "DEPARTMENT_ID", "LOCATION_ID", "COUNTRY_ID", "FIRST_NAME", "LAST_NAME", "SALARY", "COMMISSION_PCT", "DEPARTMENT_NAME", "JOB_TITLE", "CITY", "STATE_PROVINCE", "COUNTRY_NAME", "REGION_NAME") AS 
  SELECT
  e.employee_id,
  e.job_id,
  e.manager_id,
  e.department_id,
  d.location_id,
  l.country_id,
  e.first_name,
  e.last_name,
  e.salary,
  e.commission_pct,
  d.department_name,
  j.job_title,
  l.city,
  l.state_province,
  c.country_name,
  r.region_name
FROM
  employees e,
  departments d,
  jobs j,
  locations l,
  countries c,
  regions r
WHERE e.department_id = d.department_id
  AND d.location_id = l.location_id
  AND l.country_id = c.country_id
  AND c.region_id = r.region_id
  AND j.job_id = e.job_id
;
--------------------------------------------------------
--  DDL for Index LOC_STATE_PROVINCE_IX
--------------------------------------------------------

  CREATE INDEX "LOC_STATE_PROVINCE_IX" ON "LOCATIONS" ("STATE_PROVINCE") 
  ;
--------------------------------------------------------
--  DDL for Index LOC_ID_PK
--------------------------------------------------------

  
--------------------------------------------------------
--  DDL for Index EMP_DEPARTMENT_IX
--------------------------------------------------------

  CREATE INDEX "EMP_DEPARTMENT_IX" ON "EMPLOYEES" ("DEPARTMENT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index EMP_EMAIL_UK
--------------------------------------------------------

  
--------------------------------------------------------
--  DDL for Index EMP_NAME_IX
--------------------------------------------------------

  CREATE INDEX "EMP_NAME_IX" ON "EMPLOYEES" ("LAST_NAME", "FIRST_NAME") 
  ;
--------------------------------------------------------
--  DDL for Index EMP_MANAGER_IX
--------------------------------------------------------

  CREATE INDEX "EMP_MANAGER_IX" ON "EMPLOYEES" ("MANAGER_ID") 
  ;
--------------------------------------------------------
--  DDL for Index DEPT_LOCATION_IX
--------------------------------------------------------

  CREATE INDEX "DEPT_LOCATION_IX" ON "DEPARTMENTS" ("LOCATION_ID") 
  ;
--------------------------------------------------------
--  DDL for Index REG_ID_PK
--------------------------------------------------------

  
--------------------------------------------------------
--  DDL for Index JHIST_EMP_ID_ST_DATE_PK
--------------------------------------------------------

  
--------------------------------------------------------
--  DDL for Index JHIST_DEPARTMENT_IX
--------------------------------------------------------

  CREATE INDEX "JHIST_DEPARTMENT_IX" ON "JOB_HISTORY" ("DEPARTMENT_ID") 
  ;
--------------------------------------------------------
--  DDL for Index EMP_EMP_ID_PK
--------------------------------------------------------

  
--------------------------------------------------------
--  DDL for Index DEPT_ID_PK
--------------------------------------------------------

  
--------------------------------------------------------
--  DDL for Index COUNTRY_C_ID_PK
--------------------------------------------------------

  
--------------------------------------------------------
--  DDL for Index JHIST_JOB_IX
--------------------------------------------------------

  CREATE INDEX "JHIST_JOB_IX" ON "JOB_HISTORY" ("JOB_ID") 
  ;
--------------------------------------------------------
--  DDL for Index JHIST_EMPLOYEE_IX
--------------------------------------------------------

  CREATE INDEX "JHIST_EMPLOYEE_IX" ON "JOB_HISTORY" ("EMPLOYEE_ID") 
  ;
--------------------------------------------------------
--  DDL for Index LOC_COUNTRY_IX
--------------------------------------------------------

  CREATE INDEX "LOC_COUNTRY_IX" ON "LOCATIONS" ("COUNTRY_ID") 
  ;
--------------------------------------------------------
--  DDL for Index EMP_JOB_IX
--------------------------------------------------------

  CREATE INDEX "EMP_JOB_IX" ON "EMPLOYEES" ("JOB_ID") 
  ;
--------------------------------------------------------
--  DDL for Index LOC_CITY_IX
--------------------------------------------------------

  CREATE INDEX "LOC_CITY_IX" ON "LOCATIONS" ("CITY") 
  ;
--------------------------------------------------------
--  DDL for Index JOB_ID_PK
--------------------------------------------------------

  
--------------------------------------------------------
--  Constraints for Table REGIONS
--------------------------------------------------------

  ALTER TABLE "REGIONS" ADD CONSTRAINT "REG_ID_PK" PRIMARY KEY ("REGION_ID") ;
  
--------------------------------------------------------
--  Constraints for Table LOCATIONS
--------------------------------------------------------

  ALTER TABLE "LOCATIONS" ADD CONSTRAINT "LOC_ID_PK" PRIMARY KEY ("LOCATION_ID") ;
  
--------------------------------------------------------
--  Constraints for Table EMPLOYEES
--------------------------------------------------------

  ALTER TABLE "EMPLOYEES" ADD CONSTRAINT "EMP_EMP_ID_PK" PRIMARY KEY ("EMPLOYEE_ID") ;
  ALTER TABLE "EMPLOYEES" ADD CONSTRAINT "EMP_EMAIL_UK" UNIQUE ("EMAIL") ;
  ALTER TABLE "EMPLOYEES" ADD CONSTRAINT "EMP_SALARY_MIN" CHECK (salary > 0) ;
  
  
  
  
--------------------------------------------------------
--  Constraints for Table DEPARTMENTS
--------------------------------------------------------

  ALTER TABLE "DEPARTMENTS" ADD CONSTRAINT "DEPT_ID_PK" PRIMARY KEY ("DEPARTMENT_ID") ;
  
--------------------------------------------------------
--  Constraints for Table JOB_HISTORY
--------------------------------------------------------

  ALTER TABLE "JOB_HISTORY" ADD CONSTRAINT "JHIST_EMP_ID_ST_DATE_PK" PRIMARY KEY ("EMPLOYEE_ID", "START_DATE") ;
  ALTER TABLE "JOB_HISTORY" ADD CONSTRAINT "JHIST_DATE_INTERVAL" CHECK (end_date > start_date) ;
  
  
  
  
--------------------------------------------------------
--  Constraints for Table COUNTRIES
--------------------------------------------------------

  ALTER TABLE "COUNTRIES" ADD CONSTRAINT "COUNTRY_C_ID_PK" PRIMARY KEY ("COUNTRY_ID") ;
  
--------------------------------------------------------
--  Constraints for Table JOBS
--------------------------------------------------------

  ALTER TABLE "JOBS" ADD CONSTRAINT "JOB_ID_PK" PRIMARY KEY ("JOB_ID") ;
  
--------------------------------------------------------
--  Ref Constraints for Table COUNTRIES
--------------------------------------------------------

  ALTER TABLE "COUNTRIES" ADD CONSTRAINT "COUNTR_REG_FK" FOREIGN KEY ("REGION_ID")
	  REFERENCES "REGIONS" ("REGION_ID") ;
--------------------------------------------------------
--  Ref Constraints for Table DEPARTMENTS
--------------------------------------------------------

  ALTER TABLE "DEPARTMENTS" ADD CONSTRAINT "DEPT_LOC_FK" FOREIGN KEY ("LOCATION_ID")
	  REFERENCES "LOCATIONS" ("LOCATION_ID") ;
  ALTER TABLE "DEPARTMENTS" ADD CONSTRAINT "DEPT_MGR_FK" FOREIGN KEY ("MANAGER_ID")
	  REFERENCES "EMPLOYEES" ("EMPLOYEE_ID") ;
--------------------------------------------------------
--  Ref Constraints for Table EMPLOYEES
--------------------------------------------------------

  ALTER TABLE "EMPLOYEES" ADD CONSTRAINT "EMP_DEPT_FK" FOREIGN KEY ("DEPARTMENT_ID")
	  REFERENCES "DEPARTMENTS" ("DEPARTMENT_ID") ;
  ALTER TABLE "EMPLOYEES" ADD CONSTRAINT "EMP_JOB_FK" FOREIGN KEY ("JOB_ID")
	  REFERENCES "JOBS" ("JOB_ID") ;
  ALTER TABLE "EMPLOYEES" ADD CONSTRAINT "EMP_MANAGER_FK" FOREIGN KEY ("MANAGER_ID")
	  REFERENCES "EMPLOYEES" ("EMPLOYEE_ID") ;
--------------------------------------------------------
--  Ref Constraints for Table JOB_HISTORY
--------------------------------------------------------

  ALTER TABLE "JOB_HISTORY" ADD CONSTRAINT "JHIST_DEPT_FK" FOREIGN KEY ("DEPARTMENT_ID")
	  REFERENCES "DEPARTMENTS" ("DEPARTMENT_ID") ;
  ALTER TABLE "JOB_HISTORY" ADD CONSTRAINT "JHIST_EMP_FK" FOREIGN KEY ("EMPLOYEE_ID")
	  REFERENCES "EMPLOYEES" ("EMPLOYEE_ID") ;
  ALTER TABLE "JOB_HISTORY" ADD CONSTRAINT "JHIST_JOB_FK" FOREIGN KEY ("JOB_ID")
	  REFERENCES "JOBS" ("JOB_ID") ;
--------------------------------------------------------
--  Ref Constraints for Table LOCATIONS
--------------------------------------------------------

  ALTER TABLE "LOCATIONS" ADD CONSTRAINT "LOC_C_ID_FK" FOREIGN KEY ("COUNTRY_ID")
	  REFERENCES "COUNTRIES" ("COUNTRY_ID") ;
--------------------------------------------------------
--  DDL for Procedure ADD_JOB_HISTORY
--------------------------------------------------------


  SET TERM ^ ;

CREATE OR ALTER PROCEDURE "ADD_JOB_HISTORY" 
  (  p_emp_id          TYPE OF COLUMN job_history.employee_id
   , p_start_date      TYPE OF COLUMN job_history.start_date
   , p_end_date        TYPE OF COLUMN job_history.end_date
   , p_job_id          TYPE OF COLUMN job_history.job_id
   , p_department_id   TYPE OF COLUMN job_history.department_id
   )
AS
BEGIN
  INSERT INTO job_history (employee_id, start_date, end_date,
                           job_id, department_id)
    VALUES(:p_emp_id, :p_start_date, :p_end_date, :p_job_id, :p_department_id);
END ^

SET TERM ; ^


--------------------------------------------------------
--  DDL for Procedure SECURE_DML
--------------------------------------------------------


  CREATE EXCEPTION CUSTOM_EXCEPTION 'error';

SET TERM ^ ;

CREATE OR ALTER PROCEDURE "SECURE_DML" 
AS
BEGIN
  IF (UPPER( CAST (CURRENT_TIMESTAMP AS VARCHAR(250) FORMAT 'HH24:MI')) NOT BETWEEN '08:00' AND '18:00'
        OR UPPER( CAST (CURRENT_TIMESTAMP AS VARCHAR(250) FORMAT 'DY')) IN ('SAT', 'SUN')) THEN
	EXCEPTION CUSTOM_EXCEPTION (
		'You may only make changes during normal office hours');
END ^

SET TERM ; ^


--------------------------------------------------------
--  DDL for Trigger SECURE_EMPLOYEES
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "SECURE_EMPLOYEES" 
  BEFORE INSERT OR UPDATE OR DELETE ON employees  
AS

 BEGIN
  EXECUTE PROCEDURE secure_dml;
 END ^

SET TERM ; ^

ALTER TRIGGER "SECURE_EMPLOYEES" INACTIVE;
--------------------------------------------------------
--  DDL for Trigger UPDATE_JOB_HISTORY
--------------------------------------------------------

  SET TERM ^ ;

CREATE OR ALTER TRIGGER "UPDATE_JOB_HISTORY" 
  AFTER UPDATE   ON employees  
AS

 BEGIN
IF (NEW.job_id <> OLD.job_id OR NEW.department_id <> OLD.department_id) THEN
  EXECUTE PROCEDURE add_job_history(old.employee_id, old.hire_date, CURRENT_TIMESTAMP,
                  old.job_id, old.department_id);
 END^

SET TERM ; ^

ALTER TRIGGER "UPDATE_JOB_HISTORY" ACTIVE;
