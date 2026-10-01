CREATE OR REPLACE FUNCTION fnc_fibonacci(pstop INTEGER DEFAULT 10)
RETURNS TABLE (fibonacci_number INTEGER) AS $$
BEGIN
    RETURN QUERY
    WITH RECURSIVE fibonacci(a, b) AS (
        SELECT 0, 1
        UNION ALL
        SELECT b, a + b
        FROM fibonacci
        WHERE b < pstop
    )
    SELECT a FROM fibonacci WHERE a < pstop;
END;
$$ LANGUAGE plpgsql;

SELECT * FROM fnc_fibonacci(100);
SELECT * FROM fnc_fibonacci();