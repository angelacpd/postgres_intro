CREATE TABLE IF NOT EXISTS test(
	cpf VARCHAR(11) NOT NULL,
	client_name VARCHAR(50) NOT NULL,
	created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (cpf)
);

INSERT INTO test (cpf, client_name, created_at)
VALUES ('23489045731', 'Jose da Silva', '2020-07-22 12:00:00') ON CONFLICT (cpf) DO NOTHING;

UPDATE test SET client_name = 'Zilda Arns' WHERE cpf = '23489045731';

SELECT * FROM test;  -- Avoid using SELECT * because it loads the entire table

INSERT INTO test (cpf, client_name, created_at)
VALUES ('05489045731', 'Guga Kuerten', '2020-07-22 13:00:00') ON CONFLICT (cpf) DO NOTHING;

SELECT * FROM test;

DELETE FROM test
WHERE cpf = '23489045731';

SELECT * FROM test;