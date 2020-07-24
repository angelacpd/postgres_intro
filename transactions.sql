SELECT bank_number, bank_name, bank_active FROM bank ORDER BY bank_number;

UPDATE bank SET bank_active = false WHERE bank_number = 1;

BEGIN;
UPDATE bank SET bank_active = true WHERE bank_number = 1;
SELECT bank_number, bank_name, bank_active FROM bank WHERE bank_number = 1;
ROLLBACK;

BEGIN;
UPDATE bank SET bank_active = true WHERE bank_number = 1;
COMMIT;


SELECT id, employee, manager
FROM employees;

BEGIN;
UPDATE employees SET manager = 2 WHERE id = 3;
SAVEPOINT sf_func;
UPDATE employees SET manager = NULL;
ROLLBACK TO sf_func;
UPDATE employees SET manager = 3 WHERE id = 5;
COMMIT;
