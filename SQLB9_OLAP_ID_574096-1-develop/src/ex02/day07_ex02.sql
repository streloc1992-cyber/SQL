WITH stats AS (
    SELECT 
        pz.name,
        COUNT(*) AS count,
        'visit' AS action_type
    FROM person_visits pv
    JOIN pizzeria pz ON pv.pizzeria_id = pz.id
    GROUP BY pz.name
    
    UNION ALL
    
    SELECT 
        pz.name,
        COUNT(*) AS count,
        'order' AS action_type
    FROM person_order po
    JOIN menu m ON po.menu_id = m.id
    JOIN pizzeria pz ON m.pizzeria_id = pz.id
    GROUP BY pz.name
),
ranked AS (
    SELECT 
        name,
        count,
        action_type,
        ROW_NUMBER() OVER (PARTITION BY action_type ORDER BY count DESC) AS rn
    FROM stats
)
SELECT name, count, action_type
FROM ranked
WHERE rn <= 3
ORDER BY action_type ASC, count DESC;