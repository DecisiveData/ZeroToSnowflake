CREATE OR REPLACE VIEW "DIM_LEAD" COPY GRANTS AS
SELECT
    --Dimension Keys
     LEA.ID                         AS "Lead Id"
    --Facts
    ,LEA.LAST_NAME                  AS "Last Name"
    ,LEA.FIRST_NAME                 AS "First Name"
    ,LEA.NAME                       AS "Name"
    ,LEA.TITLE                      AS "Title"
    ,LEA.COMPANY                    AS "Company"
    ,LEA.PHONE                      AS "Phone"
    ,LEA.EMAIL                      AS "Email"
    ,LEA.LEAD_SOURCE                AS "Lead Source"
    ,LEA.STATUS                     AS "Status"
    ,LEA.INDUSTRY                   AS "Industry"
    ,LEA.RATING                     AS "Rating"
    ,LEA.IS_CONVERTED               AS "Is Converted"
    ,LEA.IS_UNREAD_BY_OWNER         AS "Is Unread by Owner"
FROM
    LEAD LEA
WHERE
    LEA.IS_DELETED = FALSE
;