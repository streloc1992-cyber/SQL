SELECT
    po.order_date,
    p.name
 || ' (age: ' || p.age || ')' AS person_information
FROM person_order po
NATURAL FULL JOIN (
    SELECT
        id AS person_id,
        name,
        age
    FROM person
) p
ORDER BY po.order_date ASC, person_information ASC;