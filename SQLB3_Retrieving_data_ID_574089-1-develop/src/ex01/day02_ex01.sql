SELECT gs::date AS missing_date
FROM generate_series('2022-01-01'::date, '2022-01-10'::date, '1 day') AS gs
LEFT JOIN person_visits pv ON pv.visit_date = gs AND pv.person_id IN (1, 2)
WHERE pv.person_id IS NULL
ORDER BY missing_date;