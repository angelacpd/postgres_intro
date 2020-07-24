-- Human Resources
DROP TABLE IF EXISTS employees;

CREATE TABLE IF NOT EXISTS employees (
	id SERIAL,
	employee VARCHAR(50),
	manager INTEGER,
	PRIMARY KEY(id),
	FOREIGN KEY (manager) REFERENCES employees(id)
);

INSERT INTO employees (employee, manager) VALUES ('Ancelmo', null);
INSERT INTO employees (employee, manager) VALUES ('Beatriz', 1);
INSERT INTO employees (employee, manager) VALUES ('Magno', 1);
INSERT INTO employees (employee, manager) VALUES ('Cremilda', 2);
INSERT INTO employees (employee, manager) VALUES ('Wagner', 4);

SELECT id, employee, manager FROM employees;

SELECT id, employee, manager FROM employees WHERE manager IS NULL
UNION ALL
SELECT id, employee, manager FROM employees WHERE id = 999;  -- Example

CREATE OR REPLACE RECURSIVE VIEW vw_func(id, manager, employee) AS (
	SELECT id, manager, employee
	FROM employees 
	WHERE manager IS NULL

	UNION ALL
	
	SELECT employees.id, employees.manager, employees.employee
	FROM employees
	JOIN vw_func ON vw_func.id = employees.manager
);

SELECT id, manager, employee
FROM vw_func;