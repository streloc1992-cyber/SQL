WITH female_visits AS (
    SELECT pz.name AS pizzeria_name
    FROM person_visits pv
    JOIN person p ON pv.person_id = p.id 
    JOIN pizzeria pz ON pv.pizzeria_id = pz.id
    WHERE p.gender = 'female'
    ),
male_visits AS (
    SELECT pz.name AS pizzeria_name
    FROM person_visits pv
    JOIN person p ON pv.person_id = p.id 
    JOIN pizzeria pz ON pv.pizzeria_id = pz.id
    WHERE p.gender = 'male'
    )
SELECT pizzeria_name
FROM (
    (SELECT pizzeria_name FROM female_visits
    EXCEPT ALL
    SELECT pizzeria_name FROM male_visits)
    UNION ALL
    (SELECT pizzeria_name FROM male_visits
    EXCEPT ALL
    SELECT pizzeria_name FROM female_visits)
) AS result
ORDER BY pizzeria_name;