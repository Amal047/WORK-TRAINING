CREATE TABLE categories (
    category_id SERIAL PRIMARY KEY,
    name TEXT UNIQUE NOT NULL
);

CREATE TABLE books (
    book_id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    author TEXT NOT NULL,
    isbn TEXT UNIQUE NOT NULL,
    category_id INT REFERENCES categories (category_id) ON DELETE SET NULL
);

CREATE TABLE members (
    member_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    phone TEXT
);

CREATE TABLE loans (
    loan_id SERIAL PRIMARY KEY,
    member_id INT REFERENCES members (member_id) ON DELETE CASCADE,
    book_id INT REFERENCES books (book_id) ON DELETE CASCADE,
    borrowed_on DATE DEFAULT CURRENT_DATE,
    returned_on DATE
);

ALTER TABLE loans
ADD CONSTRAINT chk_return_date CHECK (
    returned_on IS NULL
    OR returned_on >= borrowed_on
);

INSERT INTO
    categories (name)
VALUES ('Fiction'),
    ('Science'),
    ('History');

SELECT * FROM categories;

INSERT INTO
    books (
        title,
        author,
        isbn,
        category_id
    )
VALUES (
        'Dune',
        'Frank Herbert',
        '9780441013593',
        1
    ),
    (
        'Brief History of Time',
        'Stephen Hawking',
        '9780553380163',
        2
    );

SELECT * FROM books;

INSERT INTO
    members (name, email, phone)
VALUES (
        'Alice',
        'alice@example.com',
        '9876543210'
    ),
    (
        'Bob',
        'bob@example.com',
        '8765432109'
    );

SELECT * FROM members;

INSERT INTO
    loans (
        member_id,
        book_id,
        borrowed_on
    )
VALUES (1, 1, '2025-11-07'),
    (2, 2, '2025-11-06');

SELECT * FROM loans;

SELECT m.name, b.title, l.borrowed_on, l.returned_on
FROM
    loans l
    --(self join)
    JOIN members m ON l.member_id = m.member_id
    JOIN books b ON l.book_id = b.book_id;

--Trying to insert Duplicate
INSERT INTO
    books (
        title,
        author,
        isbn,
        category_id
    )
VALUES (
        'Dune Messiah',
        'Frank Herbert',
        '9780441013593',
        1
    );

INSERT INTO
    loans (
        member_id,
        book_id,
        borrowed_on,
        returned_on
    )
VALUES (
        1,
        2,
        '2025-11-01',
        '2025-11-05'
    );

SELECT * FROM loans;

--Invalid row (violates check):
INSERT INTO
    loans (
        member_id,
        book_id,
        borrowed_on,
        returned_on
    )
VALUES (2, 3, '2025-11-07', NULL);

INSERT INTO
    loans (
        member_id,
        book_id,
        borrowed_on,
        returned_on
    )
VALUES (
        3,
        1,
        '2025-11-10',
        '2025-11-09'
    );