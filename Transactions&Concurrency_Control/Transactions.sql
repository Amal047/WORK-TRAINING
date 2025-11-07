CREATE TABLE accounts (
    acc_id SERIAL PRIMARY KEY,
    acc_name TEXT NOT NULL,
    balance NUMERIC(10, 2) NOT NULL
);

INSERT INTO
    accounts (acc_name, balance)
VALUES ('Amal', 1000.00),
    ('ANIL', 500.00);

--Begin a Transaction
BEGIN;
--Start group of operations

UPDATE accounts SET balance = balance - 200 WHERE acc_id = 1;

UPDATE accounts SET balance = balance + 200 WHERE acc_id = 2;

COMMIT;
--Save all changes
ROLLBACK;
--Cancel transaction(should do before COMMIT)

SELECT * FROM accounts;