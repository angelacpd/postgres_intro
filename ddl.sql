DROP TABLE IF EXISTS bank CASCADE;
DROP TABLE IF EXISTS agency CASCADE;
DROP TABLE IF EXISTS client CASCADE;
DROP TABLE IF EXISTS account CASCADE;
DROP TABLE IF EXISTS transaction_type CASCADE;
DROP TABLE IF EXISTS client_transactions CASCADE;


CREATE TABLE IF NOT EXISTS bank(
	bank_number INTEGER NOT NULL,
	bank_name VARCHAR(50) NOT NULL,
	bank_active BOOLEAN NOT NULL DEFAULT TRUE,
	created_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (bank_number)
);

CREATE TABLE IF NOT EXISTS agency(
	bank_number_agency INTEGER NOT NULL,
	agency_number INTEGER NOT NULL,
	agency_name VARCHAR(80) NOT NULL,
	agency_active BOOLEAN NOT NULL DEFAULT TRUE,
	created_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (bank_number_agency, agency_number),
	FOREIGN KEY (bank_number_agency) REFERENCES bank (bank_number)
);

CREATE TABLE IF NOT EXISTS client(
	client_number BIGSERIAL PRIMARY KEY,
	client_name VARCHAR(120) NOT NULL,
	client_email VARCHAR(250) NOT NULL,
	client_active BOOLEAN NOT NULL DEFAULT TRUE,
	created_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS account(
	bank_number_acc INTEGER NOT NULL,
	agency_number_acc INTEGER NOT NULL,
	account_number BIGINT NOT NULL,
	account_digit SMALLINT NOT NULL,
	client_number_acc BIGINT NOT NULL,
	account_active BOOLEAN NOT NULL DEFAULT TRUE,
	created_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (bank_number_acc, agency_number_acc, account_number, account_digit, client_number_acc),
	FOREIGN KEY (bank_number_acc, agency_number_acc) REFERENCES agency (bank_number_agency, agency_number),
	FOREIGN KEY (client_number_acc) REFERENCES client (client_number)
);

CREATE TABLE IF NOT EXISTS transaction_type(
	id SMALLSERIAL PRIMARY KEY,
	transaction_name VARCHAR(50) NOT NULL,
	trans_active BOOLEAN NOT NULL DEFAULT TRUE,
	created_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS client_transactions(
	id BIGSERIAL PRIMARY KEY,
	bank_number INTEGER NOT NULL,
	agency_number INTEGER NOT NULL,
	account_number BIGINT NOT NULL,
	account_digit SMALLINT NOT NULL,
	client_number BIGINT NOT NULL,
	transaction_type_id SMALLINT NOT NULL,
	val NUMERIC(15,2) NOT NULL,
	created_date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY (bank_number, agency_number, account_number, account_digit, client_number) REFERENCES account (bank_number_acc, agency_number_acc, account_number, account_digit, client_number_acc)
);