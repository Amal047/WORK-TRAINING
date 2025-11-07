-- Transaction 1
BEGIN;

SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
--Change isolation level

SELECT balance FROM accounts WHERE acc_id = 1;
-- Returns 1000
UPDATE accounts SET balance = balance - 200 WHERE acc_id = 1;
-- Not commited yet

-- Transaction 2
BEGIN;

SELECT balance FROM accounts WHERE acc_id = 1;
-- What this returns depends on isolation level

COMMIT;

COMMIT;

ROLLBACK;

--Preventing Lost Updates (Using Locks)

BEGIN;

SELECT balance FROM accounts WHERE acc_id = 1 FOR UPDATE;
-- Locks the row, preventing others from reading or updating it
-- Suppose result = 1000

UPDATE accounts SET balance = balance - 200 WHERE acc_id = 1;
-- Now balance = 800 (but not committed yet)

BEGIN;

SELECT balance FROM accounts WHERE acc_id = 1 FOR UPDATE;

COMMIT;

COMMIT;

SELECT * FROM accounts;