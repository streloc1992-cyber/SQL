INSERT INTO person_order (id, person_id, menu_id, order_date)
VALUES (
    (SELECT COALESCE(MAX(id), 0) + 1 FROM person_order),
    (SELECT id FROM person WHERE name = 'Denis'),
    (SELECT id FROM menu WHERE pizza_name = 'sicilian pizza'),
    '2022-02-24'
);

INSERT INTO person_order (id, person_id, menu_id, order_date)
VALUES (
    (SELECT COALESCE(MAX(id), 0) + 1 FROM person_order),
    (SELECT id FROM person WHERE name = 'Irina'),
    (SELECT id FROM menu WHERE pizza_name = 'sicilian pizza'),
    '2022-02-24'
);

SELECT po.*, p.name AS person_name, m.pizza_name, pz.name AS pizzeria_name
FROM person_order po
JOIN person p ON po.person_id = p.id
JOIN menu m ON po.menu_id = m.id
JOIN pizzeria pz ON m.pizzeria_id = pz.id
WHERE po.order_date = '2022-02-24'
  AND m.pizza_name = 'sicilian pizza'
ORDER BY p.name;