SELECT bank_number, bank_name, bank_active
FROM bank;

CREATE OR REPLACE VIEW vw_banks AS (
	SELECT bank_number, bank_name, bank_active
	FROM bank 
);

SELECT bank_number, bank_name, bank_active
FROM vw_banks;

CREATE OR REPLACE VIEW vw_banks_2 (bnumber, bname, bactive) AS (
	SELECT bank_number, bank_name, bank_active
	FROM bank 
);

SELECT bnumber, bname, bactive
FROM vw_banks_2;

INSERT INTO vw_banks_2 (bnumber, bname, bactive)
VALUES (51, 'Banco Boa Ideia', TRUE);

SELECT bnumber, bname, bactive
FROM vw_banks_2
WHERE bnumber = 51;

SELECT bank_number, bank_name, bank_active
FROM bank
WHERE bank_number = 51;

UPDATE vw_banks_2 
SET bactive = False 
WHERE bnumber = 51;

DELETE FROM vw_banks_2
WHERE bnumber = 51

CREATE OR REPLACE TEMPORARY VIEW vw_agency AS (
	SELECT agency_name FROM agency
);

SELECT agency_name FROM vw_agency;

CREATE OR REPLACE VIEW vw_active_banks AS (
	SELECT bank_number, bank_name, bank_active
	FROM bank
	WHERE bank_active IS TRUE
) WITH LOCAL CHECK OPTION;

-- Return an error because of the local check option if bank_active is FALSE.
INSERT INTO vw_active_banks (bank_number, bank_name, bank_active)
VALUES (51, 'Banco Boa Ideia', TRUE);

UPDATE vw_active_banks
SET bank_active = False 
WHERE bank_number = 51;

DROP VIEW IF EXISTS vw_banks_with_a;

CREATE OR REPLACE VIEW vw_banks_with_a AS (
	SELECT bank_number, bank_name, bank_active
	FROM vw_active_banks
	WHERE bank_name ILIKE 'a%'
) WITH LOCAL CHECK OPTION;

SELECT bank_number, bank_name, bank_active 
FROM vw_banks_with_a;

INSERT INTO vw_banks_with_a (bank_number, bank_name, bank_active)
VALUES (664, 'Beta Omega', true);

INSERT INTO vw_banks_with_a (bank_number, bank_name, bank_active)
VALUES (663, 'Alpha Beta', false);