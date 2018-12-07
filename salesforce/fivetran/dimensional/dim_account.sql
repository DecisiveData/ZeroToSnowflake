CREATE OR REPLACE VIEW "DIM_ACCOUNT" COPY GRANTS AS
SELECT
    --Key
    ACC.ID                  AS "Account Id"
    --Attributes
    ,ACC.NAME               AS "Account"
    ,ACC.TYPE               AS "Type"
    ,ACC.PHONE              AS "Phone"
    ,ACC.WEBSITE            AS "Website"
    ,ACC.INDUSTRY           AS "Industry"
    ,ACC.BILLING_CITY       AS "City"
    ,ACC.BILLING_STATE      AS "State"
    ,ACC.BILLING_COUNTRY    AS "Country"
FROM
    ACCOUNT ACC
WHERE
    ACC.IS_DELETED = FALSE
;