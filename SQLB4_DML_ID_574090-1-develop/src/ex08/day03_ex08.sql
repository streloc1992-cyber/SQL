INSERT INTO menu (id, pizzeria_id, pizza_name, price)
VALUES (
    COALESCE((SELECT MAX(id) FROM menu), 0) + 1,
    (SELECT id FROM pizzeria WHERE name = 'Dominos'),
    'sicilian pizza',
    900
);

SELECT * FROM menu WHERE pizza_name = 'sicilian pizza';