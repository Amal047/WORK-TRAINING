--JOIN
SELECT columns
FROM table1
JOIN_TYPE table2
ON table1.column = table2.column;

--INNER JOIN
SELECT columns
FROM table1
INNER JOIN table2 ON table1.column = table2.column;

--MULTIPLE INNER JOIN
SELECT columns
FROM table1
INNER JOIN table2 ON table1.column = table2.column
INNER JOIN table3 ON table2.column = table3.column;

--LEFT JOIN
SELECT columns
FROM table1
LEFT JOIN table2
ON table1.column = table2.column;

--RIGHT JOIN
SELECT columns
FROM table1
RIGHT JOIN table2
ON table1.column = table2.column;

--FULL OUTER JOIN
SELECT columns
FROM table1
FULL OUTER JOIN table2
on table1.column = table2.column;

--FILTER MACHED AND UNMACHED ROWS
SELECT *
FROM table1
FULL OUTER JOIN table2
ON table1.column = table2.column
WHERE CONDITION; -- use AND and OR for combaining multiple conditions

--CROSS JOIN
SELECT columns
FROM table1
CROSS JOIN table2;

--SELF JOIN
SELECT a.column, b.column
FROM table_name a
JOIN table_name b
ON a.common_field = b.related_field;
