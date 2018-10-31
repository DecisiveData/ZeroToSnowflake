CREATE OR REPLACE VIEW "FACT_LEAD" COPY GRANTS AS
SELECT
    --Dimension Keys
     LEA.ID                         AS "Lead Id"
    ,LEA.OWNER_ID                   AS "Owner Id"
    ,LEA.CONVERTED_ACCOUNT_ID       AS "Account Id"
    ,LEA.CONVERTED_CONTACT_ID       AS "Contact Id"
    ,LEA.CONVERTED_OPPORTUNITY_ID   AS "Opportunity Id"
    ,LEA.CONVERTED_DATE             AS "Converted Date"
    --Facts
    ,CASE LEA.IS_CONVERTED
        WHEN TRUE THEN 1 ELSE 0 END AS "Converted"
    ,CASE LEA.IS_UNREAD_BY_OWNER
        WHEN TRUE THEN 1 ELSE 0 END AS "Unread by Owner"
FROM
    LEAD LEA
WHERE
    LEA.IS_DELETED = FALSE
;