-- ALTER
ALTER TABLE table_name action;

--ADD
ALTER TABLE table_name
ADD COLUMN column_name 
VARCHAR(30);

--RENAME
ALTER TABLE table_name RENAME COLUMN column_name TO new_column_name;

--CHANGE TYPE
ALTER TABLE table_name ALTER COLUMN column_name TYPE INTEGER;

--SET AND DROP DEFAULT
ALTER TABLE table_name ALTER COLUMN column_name SET DEFAULT default_value;
ALTER TABLE table_name ALTER COLUMN column_name DROP DEFAULT;

--NOT NULL
ALTER TABLE table_name ALTER COLUMN column_name SET NOT NULL;
ALTER TABLE table_name ALTER COLUMN column_name DROP NOT NULL;

--CONSTRAINT
ALTER TABLE table_name ADD CONSTRAINT constraint_name UNIQUE(column_name);
