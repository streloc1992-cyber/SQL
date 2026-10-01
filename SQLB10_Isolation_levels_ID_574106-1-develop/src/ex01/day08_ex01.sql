-- Session #1
SHOW TRANSACTION ISOLATION LEVEL;

BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;

SELECT rating
FROM pizzeria
WHERE name = 'Pizza Hut';

UPDATE pizzeria
SET rating = 4
WHERE name = 'Pizza Hut';

-- Session #2
SHOW TRANSACTION ISOLATION LEVEL;

BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED;

SELECT rating
FROM pizzeria
WHERE name = 'Pizza Hut';

UPDATE pizzeria
SET rating = 3.6
WHERE name = 'Pizza Hut';

-- Session #1
COMMIT;

SELECT rating
FROM pizzeria
WHERE name = 'Pizza Hut';

-- Session #2
SELECT rating
FROM pizzeria
WHERE name = 'Pizza Hut';

COMMIT;