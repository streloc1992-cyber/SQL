SELECT pz.name AS pizzeria_name
FROM pizzeria pz
WHERE EXISTS (
    SELECT 1
    FROM person_order po
    JOIN menu m ON po.menu_id = m.id
    JOIN person p ON po.person_id = p.id
    WHERE m.pizzeria_id = pz.id AND p.gender = 'female'
)
AND NOT EXISTS (
    SELECT 1
    FROM person_order po
    JOIN menu m ON po.menu_id = m.id
    JOIN person p ON po.person_id = p.id
    WHERE m.pizzeria_id = pz.id AND p.gender = 'male'
)
UNION
SELECT pz.name AS pizzeria_name
FROM pizzeria pz
WHERE EXISTS (
    SELECT 1
    FROM person_order po
    JOIN menu m ON po.menu_id = m.id
    JOIN person p ON po.person_id = p.id
    WHERE m.pizzeria_id = pz.id AND p.gender = 'male'
)
AND NOT EXISTS (
    SELECT 1
    FROM person_order po
    JOIN menu m ON po.menu_id = m.id
    JOIN person p ON po.person_id = p.id
    WHERE m.pizzeria_id = pz.id AND p.gender = 'female'
)
ORDER BY pizzeria_name;