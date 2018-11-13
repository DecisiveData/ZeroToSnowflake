-- SETUP TIMETRAVEL ROLE
USE ROLE SECURITYADMIN;
CREATE ROLE IF NOT EXISTS TIMETRAVEL_ROLE;
ALTER ROLE TIMETRAVEL_ROLE SET
    COMMENT = $$Owns the TIMETRAVEL environment$$
;
GRANT ROLE TIMETRAVEL_ROLE TO USER <YOUR_USER>;

-- SETUP TIMETRAVEL WH & DB
USE ROLE SYSADMIN;
CREATE WAREHOUSE IF NOT EXISTS TIMETRAVEL_WH;
ALTER WAREHOUSE TIMETRAVEL_WH SET
    WAREHOUSE_SIZE                      = XSMALL
    AUTO_SUSPEND                        = 60
    AUTO_RESUME                         = TRUE
    COMMENT                             = $$For loading & querying data from the TIMETRAVEL environment$$
;
GRANT OWNERSHIP ON WAREHOUSE TIMETRAVEL_WH TO ROLE TIMETRAVEL_ROLE;
CREATE DATABASE IF NOT EXISTS TIMETRAVEL;
ALTER DATABASE TIMETRAVEL SET
    DATA_RETENTION_TIME_IN_DAYS = 1
    COMMENT = $$Database for TIMETRAVEL environment$$
;
GRANT OWNERSHIP ON SCHEMA TIMETRAVEL.PUBLIC TO ROLE TIMETRAVEL_ROLE;
GRANT OWNERSHIP ON DATABASE TIMETRAVEL TO ROLE TIMETRAVEL_ROLE;

--BEGIN TIMETRAVEL DEMO
USE ROLE TIMETRAVEL_ROLE;
USE WAREHOUSE TIMETRAVEL_WH;
USE DATABASE TIMETRAVEL;
USE SCHEMA PUBLIC;
CREATE OR REPLACE TABLE SONG AS
SELECT
     $1 AS LyricId
    ,$2 AS Lyric
FROM
    VALUES
         (1, 'O say can you see, by the dawn\'s early light,')
        ,(2, 'What so proudly we hailed at the twilight\'s last gleaming,')
        ,(3, 'Whose broad stripes and bright stars through the perilous fight,')
        ,(4, 'O\'er the ramparts we watched, were so gallantly streaming?')
;
SET FIRST_VERSE_INSERT = CURRENT_TIMESTAMP();
SELECT $FIRST_VERSE_INSERT;

INSERT INTO SONG VALUES
         (5, 'And the rockets\' red glare, the bombs bursting in air,')
        ,(6, 'Gave proof through the night that our flag was still there;')
        ,(7, 'O say does that star-spangled banner yet wave')
        ,(8, 'O\'er the land of the free and the home of the brave?')
;
SET SECOND_VERSE_QUERY_ID = LAST_QUERY_ID();
SELECT $SECOND_VERSE_QUERY_ID;

SELECT * FROM SONG;
SELECT * FROM SONG BEFORE   (statement  => $SECOND_VERSE_QUERY_ID);
SELECT * FROM SONG AT       (timestamp  => $FIRST_VERSE_INSERT);

--REMOVE TIMETRAVEL DEMO
/*
USE ROLE TIMETRAVEL_ROLE;
DROP DATABASE TIMETRAVEL;
DROP WAREHOUSE TIMETRAVEL_WH;
USE ROLE SECURITYADMIN;
DROP ROLE TIMETRAVEL_ROLE;
*/