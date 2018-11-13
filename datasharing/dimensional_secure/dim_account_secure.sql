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