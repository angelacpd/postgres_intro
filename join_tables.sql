SELECT bank_number, bank_name FROM bank;
SELECT bank_number_agency, agency_number, agency_name FROM agency;
SELECT client_number, client_name FROM client;
SELECT id, transaction_name FROM transaction_type;
SELECT bank_number_acc, agency_number_acc, account_number, client_number_acc, client_number_acc FROM account;
SELECT bank_number, agency_number, account_number, account_digit, client_number, val FROM client_transactions;

SELECT count(1) FROM bank; -- 151
SELECT count(1) FROM agency; -- 296

-- List of agencies that have banks
SELECT bank.bank_number, bank.bank_name, agency.agency_number, agency.agency_name
FROM bank
JOIN agency ON agency.bank_number_agency = bank.bank_number;

-- List of banks that have agencies
SELECT bank.bank_number
FROM bank
JOIN agency ON agency.bank_number_agency = bank.bank_number
GROUP BY bank.bank_number;

-- Number of banks that have agencies: 9
SELECT count(distinct bank.bank_number)
FROM bank
JOIN agency ON agency.bank_number_agency = bank.bank_number;

-- Returns all the banks that have a relationship with agencies and all
-- the banks that don't have a relationship with agencies.
SELECT bank.bank_number, bank.bank_name, agency.agency_number, agency.agency_name
FROM bank
LEFT JOIN agency ON agency.bank_number_agency = bank.bank_number;

SELECT agency.agency_number, agency.agency_name, bank.bank_number, bank.bank_name 
FROM agency
RIGHT JOIN bank ON bank.bank_number = agency.bank_number_agency;

-- 296 rows
SELECT agency.agency_number, agency.agency_name, bank.bank_number, bank.bank_name 
FROM agency
LEFT JOIN bank ON bank.bank_number = agency.bank_number_agency;

SELECT bank.bank_number, bank.bank_name, agency.agency_number, agency.agency_name
FROM bank
FULL JOIN agency ON agency.bank_number_agency = bank.bank_number;

-- Cross join
CREATE TABLE IF NOT EXISTS test_a (id serial primary key, valor varchar(10));
CREATE TABLE IF NOT EXISTS test_b (id serial primary key, valor varchar(10));

INSERT INTO test_a (valor) VALUES ('test_1');
INSERT INTO test_a (valor) VALUES ('test_2');
INSERT INTO test_a (valor) VALUES ('test_3');
INSERT INTO test_a (valor) VALUES ('test_4');

INSERT INTO test_b (valor) VALUES ('test_a');
INSERT INTO test_b (valor) VALUES ('test_b');
INSERT INTO test_b (valor) VALUES ('test_c');
INSERT INTO test_b (valor) VALUES ('test_d');

SELECT tbla.valor, tblb.valor
FROM test_a tbla
CROSS JOIN test_b tblb;

DROP TABLE IF EXISTS test_a;
DROP TABLE IF EXISTS test_b;

SELECT  bank.bank_name,
		agency.agency_name,
		account.account_number,
		account.account_digit,
		client.client_name
FROM bank
JOIN agency ON agency.bank_number_agency = bank.bank_number
JOIN account
	-- ON account.bank_number = agency.bank_number_agency
	ON account.bank_number_acc = bank.bank_number
	AND account.agency_number_acc = agency.agency_number
JOIN client
	ON client.client_number = account.client_number_acc