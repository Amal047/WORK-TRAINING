--WINDOW FUNCTION SYNTAX
function_name(expression) 
OVER (
    [PARTITION BY column]
    [ORDER BY column]
)

--EXAMPLE
order_id	customer_id	amount
101	            1	    200
102	            1	    400
103	            2	    350
104	            2	    300
105	            3	    150

Query
SELECT 
  customer_id,
  order_id,
  amount,
  SUM(amount) OVER (PARTITION BY customer_id) AS total_spent
FROM orders;

Result
customer_id	order_id	amount	total_spent
1	        101	        200	        600
1	        102	        400	        600
2	        103	        350	        650
2	        104	        300	        650
3	        105	        150	        150

SELECT 
  customer_id,
  order_id,
  amount,
  SUM(amount) OVER (PARTITION BY customer_id ORDER BY order_id) AS running_total
FROM orders;

Result
customer_id	order_id	amount	running_total
1	         101	    200	    200
1	         102	    400	    600
2	         103	    350	    350
2	         104	    300	    650
3	         105	    150	    150

--DIFFERENCE BETWEEN GROUP BY AND WINDOW FUNCTION
order_id	customer_id	amount
101	            1	    200
102	            1	    400
103	            2	    350
104	            2	    300
105	            3	    150

--Using GROUP BY
SELECT 
  customer_id,
  SUM(amount) AS total_spent
FROM orders
GROUP BY customer_id;


Result:
customer_id	total_spent
    1	        600
    2	        650
    3	        150

--Using a Window Function Instead
SELECT 
  order_id,
  customer_id,
  amount,
  SUM(amount) OVER (PARTITION BY customer_id) AS total_spent
FROM orders;

Result:
order_id	customer_id	amount	total_spent
101	            1	    200	    600
102	            1	    400	    600
103	            2	    350	    650
104	            2	    300	    650
105	            3	    150	    150