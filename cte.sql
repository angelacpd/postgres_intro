-- Common Table Expression

SELECT bank_number, bank_name FROM bank;
SELECT bank_number_agency, agency_number, agency_name FROM agency;

-- 151 rows
WITH tbl_tmp_bank AS (
	SELECT bank_number, bank_name
	FROM bank
)
SELECT bank_number, bank_name
FROM tbl_tmp_bank;

WITH params AS (
	SELECT 213 AS bank_x
), tbl_tmp_bank AS (
	SELECT bank_number, bank_name
	FROM bank
	JOIN params ON params.bank_x = bank.bank_number
)
SELECT bank_number, bank_name
FROM tbl_tmp_bank;

-- Subselect - equivalent to the WITH above
SELECT bank.bank_number, bank.bank_name
FROM bank
JOIN (
	SELECT 213 AS bank_x
) params ON params.bank_x = bank.bank_number

WITH clients_and_transactions AS (
	SELECT client.client_name AS client_name,
			transaction_type.transaction_name AS transaction_type_name,
			client_transactions.val AS transaction_type_val
	FROM client_transactions
	JOIN client ON client.client_number = client_transactions.client_number
	JOIN transaction_type ON transaction_type.id = client_transactions.transaction_type_id
)
SELECT client_name, transaction_type_name, transaction_type_val
FROM clients_and_transactions;

-- Get the transactions from one bank only
WITH clients_and_transactions AS (
	SELECT client.client_name AS client_name,
			transaction_type.transaction_name AS transaction_type_name,
			client_transactions.val AS transaction_type_val
	FROM client_transactions
	JOIN client ON client.client_number = client_transactions.client_number
	JOIN transaction_type ON transaction_type.id = client_transactions.transaction_type_id
	JOIN bank ON bank.bank_number = client_transactions.bank_number AND bank.bank_name ILIKE '%Itaú%'
)
SELECT client_name, transaction_type_name, transaction_type_val
FROM clients_and_transactions;