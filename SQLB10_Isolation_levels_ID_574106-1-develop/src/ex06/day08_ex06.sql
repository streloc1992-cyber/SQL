-- Session #1

BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;

SELECT SUM(rating) AS total_rating
FROM pizzeria;


-- Session #2

BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;

INSERT INTO pizzeria (id, name, rating)
VALUES (11, 'Kazan Pizza 2', 4);

COMMIT;

SELECT SUM(rating) AS total_rating
FROM pizzeria;


-- Session #1

SELECT SUM(rating) AS total_rating
FROM pizzeria;

COMMIT;

SELECT SUM(rating) AS total_rating
FROM pizzeria;