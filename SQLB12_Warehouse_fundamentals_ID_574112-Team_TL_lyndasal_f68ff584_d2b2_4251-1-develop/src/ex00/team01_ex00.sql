WITH latest_currency AS (
    SELECT DISTINCT ON (id)
        id,
        name,
        rate_to_usd
    FROM currency
    ORDER BY id, updated DESC
),
balance_with_rates AS (
    SELECT
        b.user_id,
        b.type,
        b.money,
        COALESCE(c.name, 'not defined') AS c_name,
        COALESCE(c.rate_to_usd, 1)      AS c_rate
    FROM balance b
    LEFT JOIN latest_currency c
        ON b.currency_id = c.id
)
SELECT
    COALESCE(u.name,     'not defined') AS name,
    COALESCE(u.lastname, 'not defined') AS lastname,
    br.type,
    SUM(br.money)                        AS volume,
    br.c_name                            AS currency_name,
    br.c_rate                            AS last_rate_to_usd,
    SUM(br.money * br.c_rate)            AS total_volume_in_usd
FROM balance_with_rates br
LEFT JOIN "user" u
    ON br.user_id = u.id
GROUP BY
    u.id, u.name, u.lastname,
    br.user_id, br.type,
    br.c_name, br.c_rate
ORDER BY
    u.name DESC NULLS LAST,
    u.lastname ASC,
    br.type ASC,
    br.c_name ASC;