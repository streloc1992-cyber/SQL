DELETE FROM person_order
WHERE order_date = '2022-02-25';

DELETE FROM menu
WHERE pizza_name = 'greek pizza';

SELECT COUNT(*) AS orders_on_feb25
FROM person_order
WHERE order_date = '2022-02-25';

SELECT * FROM menu WHERE pizza_name = 'greek pizza';