--INSERT
INSERT INTO table_name (column1, column2, column3, ...)
VALUES (value1, value2, value3, ...);

--INSERT MULTIPLE ROW
INSERT INTO table_name (column1, column2, ...)
VALUES 
(value1, value2),
(value3, value4);

--RETURNING Clause
INSERT INTO table_name (column1, column2, column3, ...)
VALUES (value1, value2, value3, ...)
RETURNING * ;