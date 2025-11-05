--SELECT EVERYTHING
SELECT * FROM table_name

--SELECT SPECIFIC 
SELECT name, role FROM table_name;

--SELECT (row filtering)
SELECT * FROM table_name
WHERE role = 'Manager';

--SELECT WITH CONDITION
SELECT * FROM table_name
WHERE CONDITION;

--ORDER BY
SELECT * FROM employees
ORDER BY salary DESC;

--LIMIT
SELECT * FROM employees
LIMIT 3;

--ALIASIS
SELECT name AS employee_name, salary AS pay
FROM employees;

--Aggregate Functions
SELECT COUNT(*), AVG(salary), MAX(salary), MIN(salary)
FROM employees;

--GROUP BY
SELECT role, AVG(salary) AS avg_salary
FROM employees
GROUP BY role;

--Combine Conditions
SELECT * FROM table_name
WHERE CONDITION AND CONDITION;