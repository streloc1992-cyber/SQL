SELECT MAX(id) FROM menu;

INSERT INTO menu (id, pizzeria_id, pizza_name, price)
VALUES (19, 2, 'greek pizza', 800);

SELECT * FROM menu WHERE pizza_name = 'greek pizza';