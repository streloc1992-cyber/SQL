CREATE INDEX idx_person_name ON person (UPPER(name));

EXPLAIN ANALYZE
SELECT name, UPPER(name) AS upper_name
FROM person
WHERE UPPER(name) LIKE 'A%';

SET enable_seqscan = OFF;

EXPLAIN ANALYZE
SELECT *
FROM person
WHERE UPPER(name) = 'DMITRIY';

SET enable_seqscan = ON;