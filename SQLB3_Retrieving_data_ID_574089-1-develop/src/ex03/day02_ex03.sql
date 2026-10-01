WITH dates AS (
    SELECT generate_series('2022-01-01'::date, '2022-01-10'::date, '1 day')::date AS missing_date
    )
SELECT ds.missing_date
FROM dates ds
LEFT JOIN person_visits pv ON pv.visit_date = ds.missing_date 
    AND pv.person_id IN (1, 2)
WHERE pv.person_id IS NULL
ORDER BY ds.missing_date;