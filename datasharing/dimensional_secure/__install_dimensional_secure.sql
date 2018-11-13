USE ROLE PC_FIVETRAN_ROLE;
USE WAREHOUSE PC_FIVETRAN_WH;
USE DATABASE PC_FIVETRAN_DB;
USE SCHEMA SALESFORCE_Z2S;
CREATE OR REPLACE SECURE VIEW "DIM_ACCOUNT_SECURE" COPY GRANTS AS
SELECT
    --Key
    ACC.ID          AS "Account Id"
    --Attributes
    ,ACC.NAME       AS "Account"
    ,ACC.TYPE       AS "Type"
    ,ACC.PHONE      AS "Phone"
    ,ACC.WEBSITE    AS "Website"
    ,ACC.INDUSTRY   AS "Industry"
FROM
    ACCOUNT ACC
WHERE
    ACC.IS_DELETED = FALSE
;

CREATE OR REPLACE SECURE VIEW "DIM_OPPORTUNITY_SECURE" COPY GRANTS AS
SELECT
    --Key
    OPP.ID                      AS "Opportunity Id"
    --Attributes
    ,OPP.NAME                   AS "Opportunity"
    ,OPP.STAGE_NAME             AS "Stage"
    ,OPP.TYPE                   AS "Type"
    ,OPP.LEAD_SOURCE            AS "Lead Source"
    ,OPP.IS_CLOSED              AS "Is Closed"
    ,OPP.IS_WON                 AS "Is Won"
    ,OPP.FORECAST_CATEGORY_NAME AS "Forecast Category"
FROM
    OPPORTUNITY OPP
WHERE
    OPP.IS_DELETED = FALSE
;

CREATE OR REPLACE SECURE VIEW "DIM_OWNER_SECURE" COPY GRANTS AS
SELECT
    --Key
    USR.ID              AS "User Id"
    --Attributes
    ,USR.USERNAME       AS "Username"
    ,USR.LAST_NAME      AS "Last Name"
    ,USR.FIRST_NAME     AS "First Name"
    ,USR.NAME           AS "Name"
    ,USR.COMPANY_NAME   AS "Company"
    ,USR.EMAIL          AS "Email"
FROM
    USER USR
;

CREATE OR REPLACE SECURE VIEW "FACT_OPPORTUNITY_SECURE" COPY GRANTS AS
SELECT
    --Dimension Keys
    OPP.ID                      AS "Opportunity Id"
    ,OPP.ACCOUNT_ID             AS "Account Id"
    ,OPP.OWNER_ID               AS "Owner Id"
    ,OPP.PRICEBOOK_2_ID         AS "Pricebook Id"
    ,OPP.CLOSE_DATE             AS "Close Date"
    --Facts
    ,OPP.AMOUNT                 AS "Amount"
    ,OPP.PROBABILITY            AS "Probability"
    ,OPP.EXPECTED_REVENUE       AS "Expected Revenue"
FROM
    OPPORTUNITY OPP
WHERE
    OPP.IS_DELETED = FALSE
;