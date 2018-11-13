USE ROLE PC_FIVETRAN_ROLE;
USE WAREHOUSE PC_FIVETRAN_WH;
USE DATABASE PC_FIVETRAN_DB;
SHOW SCHEMAS;
USE SCHEMA SALESFORCE_Z2S;
SHOW TABLES;
SHOW VIEWS;

SELECT * FROM DIM_ACCOUNT;
SELECT * FROM DIM_DATE;
SELECT * FROM DIM_OPPORTUNITY;
SELECT * FROM DIM_OWNER;
SELECT * FROM DIM_PRICEBOOK;
SELECT * FROM FACT_OPPORTUNITY;
SELECT * FROM FACT_LEAD;