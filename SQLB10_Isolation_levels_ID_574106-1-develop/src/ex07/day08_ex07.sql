-- SESSION #1
BEGIN;

UPDATE pizzeria SET rating = 4 WHERE name = 'Dominos';

UPDATE pizzeria SET rating = 4 WHERE name = 'Pizza Hut';
-- ERROR: deadlock detected

COMMIT;

SELECT sum(rating) FROM pizzeria;


-- SESSION #2
BEGIN;

UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';

UPDATE pizzeria SET rating = 3.6 WHERE name = 'Dominos';

COMMIT;