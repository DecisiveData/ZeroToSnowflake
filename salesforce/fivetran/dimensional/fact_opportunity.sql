CREATE OR REPLACE VIEW "FACT_OPPORTUNITY" COPY GRANTS AS
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