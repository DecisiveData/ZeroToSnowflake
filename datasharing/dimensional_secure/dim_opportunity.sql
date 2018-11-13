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