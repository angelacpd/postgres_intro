SELECT bank_number, bank_name, bank_active FROM bank;
SELECT bank_number_agency, agency_number FROM agency;
SELECT client_number, client_name, client_email FROM client;
SELECT id, transaction_name FROM transaction_type;
SELECT bank_number_acc, agency_number_acc, account_number, client_number_acc FROM account;
SELECT bank_number, agency_number, client_number FROM client_transactions;

SELECT * FROM information_schema.columns WHERE table_name = 'bank'; 
SELECT column_name, data_type FROM information_schema.columns WHERE table_name = 'bank'; 

-- AVG
-- COUNT (having)
-- MAX
-- MIN
-- SUM

SELECT val FROM client_transactions;

SELECT AVG(val) FROM client_transactions;

SELECT COUNT(client_number) FROM client;

SELECT COUNT(client_number), client_email
FROM client
WHERE client_email ILIKE '%gmail.com'
GROUP BY client_email;

SELECT MAX(client_number)
FROM client;

SELECT MIN(client_number)
FROM client;

SELECT MAX(val)
FROM client_transactions;

SELECT MIN(val)
FROM client_transactions;

SELECT MAX(val), transaction_type_id
FROM client_transactions
GROUP BY transaction_type_id;

SELECT MIN(val), transaction_type_id
FROM client_transactions
GROUP BY transaction_type_id;

SELECT column_name, data_type FROM information_schema.columns WHERE table_name = 'client_transactions';

SELECT COUNT(id), transaction_type_id
FROM client_transactions
GROUP BY transaction_type_id
HAVING COUNT(id) > 150;

SELECT SUM(val)
FROM client_transactions;

SELECT SUM(val), transaction_type_id
FROM client_transactions
GROUP BY transaction_type_id;

SELECT SUM(val), transaction_type_id
FROM client_transactions
GROUP BY transaction_type_id
ORDER BY transaction_type_id ASC;

SELECT SUM(val), transaction_type_id
FROM client_transactions
GROUP BY transaction_type_id
ORDER BY transaction_type_id DESC;