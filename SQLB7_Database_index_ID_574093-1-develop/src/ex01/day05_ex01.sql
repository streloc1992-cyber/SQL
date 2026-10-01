SELECT 
    m.pizza_name,
    pz.name AS pizzeria_name
FROM menu m
JOIN pizzeria pz ON m.pizzeria_id = pz.id;

EXPLAIN ANALYZE
SELECT 
    m.pizza_name,
    pz.name AS pizzeria_name
FROM menu m
JOIN pizzeria pz ON m.pizzeria_id = pz.id
WHERE m.pizzeria_id = 1;