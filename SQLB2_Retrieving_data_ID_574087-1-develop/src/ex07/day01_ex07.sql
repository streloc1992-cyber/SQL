SELECT 
    po.order_date, 
    p.name || ' (age: ' || age || ')' AS person_information 
FROM person_order po
FULL JOIN person p ON p.id = po.person_id
ORDER BY po.order_date ASC, person_information ASC;