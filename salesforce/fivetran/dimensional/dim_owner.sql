CREATE OR REPLACE VIEW "DIM_OWNER" COPY GRANTS AS
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