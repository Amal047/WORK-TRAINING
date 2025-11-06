--CTE
WITH cte_name AS (
    SELECT ...
    FROM ...
    WHERE ...
)
SELECT *
FROM cte_name;



--EXAMPLE
customers
customer_id	name
1	Alice
2	Bob
3	Charlie
4	David
orders
order_id	customer_id	order_date	amount
101	1	2025-11-01	200
102	2	2025-11-02	350
103	3	2025-11-02	150
104	1	2025-11-03	400
105	4	2025-11-04	100
106	2	2025-11-04	300

🎯 Goal:
Generate a report showing:
Each customers total spending
Their average order value
Their rank based on total spending

CTE Query
-- Step 1: Calculate total and average amount per customer
WITH customer_stats AS (
    SELECT 
        o.customer_id,
        SUM(o.amount) AS total_spent,
        AVG(o.amount) AS avg_order_value,
        COUNT(o.order_id) AS total_orders
    FROM orders o
    GROUP BY o.customer_id
),

-- Step 2: Rank customers by total spending
ranked_customers AS (
    SELECT 
        c.customer_id,
        c.name,
        s.total_spent,
        s.avg_order_value,
        s.total_orders,
        RANK() OVER (ORDER BY s.total_spent DESC) AS rank
    FROM customer_stats s
    JOIN customers c ON c.customer_id = s.customer_id
)

-- Step 3: Display the ranked report
SELECT 
    rank,
    name,
    total_orders,
    total_spent,
    avg_order_value
FROM ranked_customers
ORDER BY rank;

✅ Result
rank	name	total_orders	total_spent	avg_order_value
1	    Alice	    2	            600	        300.0
2	    Bob	        2	            650	        325.0
3	    Charlie	    1	            150	        150.0
4	    David	    1	            100	        100.0