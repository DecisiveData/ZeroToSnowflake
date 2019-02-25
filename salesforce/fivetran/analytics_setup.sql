--CREATE A SYSTEM USER FOR ANALYTICS TOOLS
USE ROLE SECURITYADMIN;
CREATE USER IF NOT EXISTS ANALYTICS_READ_USER
	PASSWORD 			 = $$ChangeMe!$$
    MUST_CHANGE_PASSWORD = TRUE
;
ALTER USER ANALYTICS_READ_USER SET
    COMMENT              = $$Used as a system account by analytical tools to run queries$$
    LOGIN_NAME           = ANALYTICS_READ_USER
    DISPLAY_NAME         = ANALYTICS_READ_USER
    DEFAULT_ROLE         = ANALYTICS_READ_ROLE
	DEFAULT_WAREHOUSE    = ANALYTICS_WH
    DEFAULT_NAMESPACE    = PUBLIC
;
--ALTER USER ANALYTICS_READ_USER SET PASSWORD = ''

--CREATE ANALYTICS READ ROLE
USE ROLE SECURITYADMIN;
CREATE ROLE IF NOT EXISTS ANALYTICS_READ_ROLE;
ALTER ROLE ANALYTICS_READ_ROLE SET
    COMMENT = $$Read access to all schemas, tables, & views accessible for analytics$$
;
GRANT ROLE ANALYTICS_READ_ROLE TO USER ANALYTICS_READ_USER;

--CREATE ANALYTICS QUERY WAREHOUSE
USE ROLE SYSADMIN;
CREATE WAREHOUSE IF NOT EXISTS ANALYTICS_WH WITH
    INITIALLY_SUSPENDED                 = TRUE
;
ALTER WAREHOUSE ANALYTICS_WH SET
    WAREHOUSE_SIZE                      = XSMALL
    AUTO_SUSPEND                        = 60
    AUTO_RESUME                         = TRUE
    MAX_CONCURRENCY_LEVEL               = 8
    STATEMENT_QUEUED_TIMEOUT_IN_SECONDS = 0
    STATEMENT_TIMEOUT_IN_SECONDS        = 172800
    COMMENT                             = $$Use to query data for analytical purposes$$
;
GRANT USAGE, OPERATE ON WAREHOUSE ANALYTICS_WH TO ROLE ANALYTICS_READ_ROLE;

--GRANT USAGE ON DATABASE
USE ROLE ACCOUNTADMIN;
GRANT USAGE ON DATABASE PC_FIVETRAN_DB TO ROLE ANALYTICS_READ_ROLE;

--GRANT USAGE ON SCHEMA, SELECT ON TABLES
USE DATABASE PC_FIVETRAN_DB;
GRANT USAGE ON SCHEMA PUBLIC TO ROLE ANALYTICS_READ_ROLE;
GRANT SELECT ON ALL TABLES IN SCHEMA PUBLIC TO ROLE ANALYTICS_READ_ROLE;
GRANT SELECT ON FUTURE TABLES IN SCHEMA PUBLIC TO ROLE ANALYTICS_READ_ROLE;
GRANT USAGE ON SCHEMA salesforce_z2s TO ROLE ANALYTICS_READ_ROLE;
GRANT SELECT ON ALL TABLES IN SCHEMA salesforce_z2s TO ROLE ANALYTICS_READ_ROLE;
GRANT SELECT ON FUTURE TABLES IN SCHEMA salesforce_z2s TO ROLE ANALYTICS_READ_ROLE;