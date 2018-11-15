WITH BASE_QUERY AS (
SELECT
    $1                          AS DOC_STR
    ,SYSTEM$TYPEOF(DOC_STR)     AS DOC_STR_TYPEOF
    ,PARSE_JSON(DOC_STR)        AS DOC
    ,SYSTEM$TYPEOF(DOC)         AS DOC_TYPEOF
    ,DOC:name                   AS NAME_VAR
    ,SYSTEM$TYPEOF(NAME_VAR)    AS NAME_VAR_TYPEOF
    ,DOC:name::string           AS NAME
    ,SYSTEM$TYPEOF(NAME)        AS NAME_TYPEOF
    ,DOC:id::int                AS ID
    ,DOC:attendees              AS ATTENDEE_LIST
FROM
    VALUES
    ($${"name":"Sero to Snowflake", "id": 1, "attendees":["Bob", "Sue", "Mary"]}$$)
)

SELECT
    BQ.*
    ,AL.VALUE::string AS ATTENDEE
FROM
    BASE_QUERY BQ
    ,LATERAL FLATTEN(BQ.ATTENDEE_LIST) AL
;