-- CREATE DB
CREATE DATABASE db_name;

-- CREATE TABLE
CREATE TABLE table_name (
    column_name1 SERIAL PRIMARY KEY, 
    column_name2 VARCHAR(50), 
    column_name3 NUMERIC
    );

-- CREATE VIEW
CREATE VIEW new_table_name AS
SELECT name, column_name
FROM table_name
WHERE condition;

-- CREATE INDEX
CREATE INDEX idx_<column_name> ON table_name(column_name)

-- CREATE ROLE/USER
CREATE USER username WITH PASSWORD 'your_password';

