SELECT 
    COALESCE(u.name, 'not defined')     AS name,
    COALESCE(u.lastname, 'not defined') AS lastname,
    c.name                              AS currency_name,
    (b.money * COALESCE(
        (SELECT rate_to_usd FROM currency c1 
         WHERE c1.id = b.currency_id AND c1.updated <= b.updated 
         ORDER BY c1.updated DESC LIMIT 1),
        (SELECT rate_to_usd FROM currency c2 
         WHERE c2.id = b.currency_id AND c2.updated > b.updated 
         ORDER BY c2.updated ASC LIMIT 1)
    ))::numeric AS currency_in_usd
FROM balance b
LEFT JOIN "user" u ON u.id = b.user_id
JOIN (SELECT DISTINCT id, name FROM currency) c ON c.id = b.currency_id
ORDER BY 
    name DESC,
    lastname ASC,
    currency_name ASC;