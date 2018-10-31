CREATE OR REPLACE VIEW "DIM_PRICEBOOK" COPY GRANTS AS
SELECT
    --Key
     PRB.ID             AS "Pricebook Id"
    --Attributes
    ,PRB.NAME           AS "Pricebook"
    ,PRB.IS_ACTIVE      AS "Is Active"
    ,PRB.IS_STANDARD    AS "Is Standard"
FROM
    PRICEBOOK_2 PRB
WHERE
    PRB.IS_DELETED = FALSE
;