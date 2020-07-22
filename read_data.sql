SELECT bank_number, bank_name, bank_active FROM bank;
SELECT bank_number_agency, agency_number FROM agency;
SELECT client_number, client_name, client_email FROM client;
SELECT id, transaction_name FROM transaction_type;
SELECT bank_number_acc, agency_number_acc, account_number, client_number_acc FROM account;
SELECT bank_number, agency_number, client_number FROM client_transactions;