--Bad (Unnormalized) Table
CREATE TABLE loan_records (
    member_name TEXT,
    member_email TEXT,
    book1_title TEXT,
    book1_author TEXT,
    book2_title TEXT,
    book2_author TEXT,
    borrow_date DATE,
    return_date DATE
);

--First Normal Form (1NF)
CREATE TABLE loan_records_1nf (
    loan_id SERIAL PRIMARY KEY, -- unique identifier for each row
    member_name TEXT NOT NULL,
    member_email TEXT NOT NULL,
    book_title TEXT NOT NULL,
    book_author TEXT NOT NULL,
    borrow_date DATE NOT NULL,
    return_date DATE
);

--Second Normal Form (2NF)
CREATE TABLE members (
    member_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL
);

CREATE TABLE books (
    book_id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    author TEXT NOT NULL
);

CREATE TABLE loans_2nf (
    loan_id SERIAL PRIMARY KEY,
    member_id INT REFERENCES members (member_id),
    book_id INT REFERENCES books (book_id),
    borrow_date DATE,
    return_date DATE
);

--Third Normal Form (3NF)
CREATE TABLE categories (
    category_id SERIAL PRIMARY KEY,
    name TEXT UNIQUE NOT NULL
);

CREATE TABLE books (
    book_id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    author TEXT NOT NULL,
    category_id INT REFERENCES categories (category_id)
);

CREATE TABLE members (
    member_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL
);

CREATE TABLE loans (
    loan_id SERIAL PRIMARY KEY,
    member_id INT REFERENCES members (member_id),
    book_id INT REFERENCES books (book_id),
    borrow_date DATE,
    return_date DATE
);

--Verify With Example Data
-- non normalize table
CREATE TABLE employee_details (
    emp_id INT PRIMARY KEY,
    emp_name TEXT,
    dept_id INT,
    dept_name TEXT,
    dept_location TEXT
);

--normalize(3nf)
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name TEXT NOT NULL,
    dept_id INT REFERENCES departments (dept_id)
);

CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name TEXT NOT NULL,
    dept_location TEXT NOT NULL
);

INSERT INTO
    departments (
        dept_id,
        dept_name,
        dept_location
    )
VALUES (10, 'HR', 'Building A'),
    (20, 'IT', 'Building B'),
    (30, 'Finance', 'Building C');

INSERT INTO
    employees (emp_id, emp_name, dept_id)
VALUES (1, 'Alice', 10),
    (2, 'Bob', 10),
    (3, 'Carol', 20),
    (4, 'David', 30);

SELECT e.emp_id, e.emp_name, d.dept_name, d.dept_location
FROM employees e
    JOIN departments d ON e.dept_id = d.dept_id;