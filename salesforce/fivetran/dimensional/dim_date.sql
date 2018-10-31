CREATE OR REPLACE VIEW "DIM_DATE" COPY GRANTS AS
WITH CONFIGURATION AS (
SELECT
     $1 AS SeedDate
    ,$2 AS ExtraYearCount
    ,$3 AS FiscalStartMonth
FROM
    VALUES(
      '2018-01-01'::date    --Any date after Jan 1, 1900 + ExtraYearCount works
      ,2                    --Number of extra years to generate beyond the current year
      ,1                    --Month that the Fiscal Year begins (1-12). Assumption that the Fiscal Years begins on day 1.
    ) 
), GENERATE_ROWS AS (
SELECT
    C.ExtraYearCount
    ,C.FiscalStartMonth
    ,DATEADD(
        day
      ,-1 + ROW_NUMBER() OVER (ORDER BY SEQ4()) --ROW_NUMBER() is guaranteed to be incremental int values
      ,C.SeedDate
    ) AS Date
FROM
                CONFIGURATION C
    CROSS JOIN  TABLE(GENERATOR(rowcount => 366 * (YEAR(CURRENT_TIMESTAMP)-1900))) --1900 is just a slight speed optimization. 366 rather than 365 so that we generate enough rows for leap years
), SELECT_DATES AS (
    SELECT
        Date
        ,FiscalStartMonth
    FROM
        GENERATE_ROWS
    WHERE
        Date <= LAST_DAY(DATEADD(year, ExtraYearCount, CURRENT_TIMESTAMP), year)
)
SELECT
    --Key
    Date                                            AS Date
    --Attributes
    ,YEAR(Date)*10000 + MONTH(Date)*100 + DAY(Date) AS DateId
    ,YEAR(Date)::varchar                            AS Year
    ,QUARTER(Date)                                  AS QuarterNo
    ,'Q' || QuarterNo::varchar                      AS Quarter
    ,MONTH(Date)                                    AS MonthNo
    ,MONTHNAME(Date)                                AS Month
    ,WEEKOFYEAR(Date)                               AS WeekOfYearNo
    ,RIGHT('0' || WeekOfYearNo, 2)                  AS WeekOfYear
    ,FIRST_VALUE(Date) OVER (
        PARTITION BY
            DATEDIFF(week, CURRENT_DATE(), Date)
        ORDER BY
            Date
    )                                               AS WeekStart
    ,YEAROFWEEK(Date)::varchar                      AS YearOfWeek
    ,DAYNAME(Date)                                  AS Day
    ,DAY(Date)                                      AS DayOfMonthNo
    ,RIGHT('0' || DayOfMonthNo, 2)                  AS DayOfMonth
    ,DAYOFYEAR(Date)                                AS DayOfYearNo
    ,RIGHT('00' || DayOfYearNo, 3)                  AS DayOfYear
    ,DAYOFWEEK(Date)::varchar                       AS DayOfWeek
    ,CASE
        WHEN DAYNAME(Date) IN ('Sat','Sun')
            THEN 'Weekend'
            ELSE 'Weekday'
    END                                             AS PartOfWeek
    ,LAST_VALUE(DayOfMonthNo) OVER (
        PARTITION BY Year, MonthNo
        ORDER BY Date
    )                                               AS DaysInMonth
    ,DATEDIFF(day, CURRENT_DATE(), Date)            AS RelativeDayNo
    ,DATEDIFF(week, CURRENT_DATE(), Date)           AS RelativeWeekNo
    ,DATEDIFF(month, CURRENT_DATE(), Date)          AS RelativeMonthNo
    ,DATEDIFF(quarter, CURRENT_DATE(), Date)        AS RelativeQuarterNo
    ,DATEDIFF(year, CURRENT_DATE(), Date)           AS RelativeYearNo
    ,CASE
        WHEN RelativeDayNo < 0 THEN 'Day ' || RelativeDayNo::varchar
        WHEN RelativeDayNo = 0 THEN 'Current Day'
        WHEN RelativeDayNo > 0 THEN 'Day +' || RelativeDayNo::varchar
    END AS RelativeDay
    ,CASE
        WHEN RelativeWeekNo < 0 THEN 'Week ' || RelativeWeekNo::varchar
        WHEN RelativeWeekNo = 0 THEN 'Current Week'
        WHEN RelativeWeekNo > 0 THEN 'Week +' || RelativeWeekNo::varchar
    END AS RelativeWeek
    ,CASE
        WHEN RelativeMonthNo < 0 THEN 'Month ' || RelativeMonthNo::varchar
        WHEN RelativeMonthNo = 0 THEN 'Current Month'
        WHEN RelativeMonthNo > 0 THEN 'Month +' || RelativeMonthNo::varchar
    END AS RelativeMonth
    ,CASE
        WHEN RelativeQuarterNo < 0 THEN 'Quarter ' || RelativeQuarterNo::varchar
        WHEN RelativeQuarterNo = 0 THEN 'Current Quarter'
        WHEN RelativeQuarterNo > 0 THEN 'Quarter +' || RelativeQuarterNo::varchar
    END AS RelativeQuarter
    ,CASE
        WHEN RelativeYearNo < 0 THEN 'Year ' || RelativeYearNo::varchar
        WHEN RelativeYearNo = 0 THEN 'Current Year'
        WHEN RelativeYearNo > 0 THEN 'Year +' || RelativeYearNo::varchar
    END AS RelativeYear
FROM
    SELECT_DATES
;