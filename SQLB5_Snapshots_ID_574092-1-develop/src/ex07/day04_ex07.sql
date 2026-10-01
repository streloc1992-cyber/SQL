INSERT INTO person_visits (id, person_id, pizzeria_id, visit_date)
VALUES (
    (SELECT COALESCE(MAX(id), 0) + 1 FROM person_visits),
    (SELECT id FROM person WHERE name = 'Dmitriy'),
    (SELECT id FROM pizzeria WHERE name = 'Best Pizza'), 
    '2022-01-08'
);

REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;

SELECT pv.*, p.name AS person_name, pz.name AS pizzeria_name
FROM person_visits pv
JOIN person p ON pv.person_id = p.id
JOIN pizzeria pz ON pv.pizzeria_id = pz.id
WHERE p.name = 'Dmitriy' 
  AND pv.visit_date = '2022-01-08';

SELECT * FROM mv_dmitriy_visits_and_eats;