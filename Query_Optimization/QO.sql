EXPLAIN SELECT * FROM orders WHERE customer_id = 3;

EXPLAIN ANALYZE SELECT * FROM orders WHERE customer_id = 3;

--CTE
WITH
    sales_total AS (
        SELECT customer_id, SUM(amount) AS total
        FROM orders
        GROUP BY
            customer_id
    )
SELECT *
FROM sales_total
WHERE
    total > 100;

--limit
SELECT * FROM orders ORDER BY amount DESC LIMIT 2;

--deleted rows and updates planner stats
VACUUM ANALYZE;