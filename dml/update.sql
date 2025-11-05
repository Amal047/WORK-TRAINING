--SINGLE COLUMN UPDATE WITH REFRENCE
UPDATE table_name 
SET column_name = value 
WHERE refColumn_Name = value

--MULTI COLUMN UPDATE WITH REFRENCE
UPDATE table_name
SET column_name = value + value
WHERE column_name = value;

--UPDATE WITHOUT REFRENCE
UPDATE table_name
SET value = value + addvalue;

--RETURNING CLAUSE
UPDATE table_name
SET value = value + addvalue
WHERE CONDITION
RETURNING *;
