CREATE OR REPLACE FUNCTION func_sum(INTEGER, INTEGER)
RETURNS INTEGER
SECURITY DEFINER
-- RETURNS NULL ON NULL INPUT
CALLED ON NULL INPUT
LANGUAGE SQL
AS $$
	SELECT COALESCE($1,100) + COALESCE($2,0);
$$;

SELECT func_sum(null, 76);
SELECT func_sum(4, 76);

-- COALESCE Returns the first non null value of a list
SELECT COALESCE(null,'angela');
SELECT COALESCE(null, 'angela', 'daniel');
SELECT COALESCE(null, null, 'daniel', 'angela');

-------------------------------------------------------------
CREATE OR REPLACE FUNCTION banks_add(p_number INTEGER, p_name VARCHAR, p_active BOOLEAN)
RETURNS INTEGER
SECURITY INVOKER
LANGUAGE PLPGSQL
CALLED ON NULL INPUT
AS $$
DECLARE var_id INTEGER;
BEGIN 
	IF p_number IS NULL OR p_name IS NULL OR p_active IS NULL THEN
		RETURN 0;
	END IF;

	SELECT INTO var_id bank_number
	FROM bank
	WHERE bank_number = p_number;
	
	IF var_id IS NULL THEN
		INSERT INTO bank(bank_number, bank_name, bank_active)
		VALUES (p_number, p_name, p_active);
	ELSE
		RETURN var_id;
	END IF;
	
	SELECT INTO var_id bank_number
	FROM bank
	WHERE bank_number = p_number;
	
	RETURN var_id;
END; $$;

SELECT banks_add(990, 'Another Bank', TRUE);

SELECT bank_number, bank_name, bank_active FROM bank WHERE bank_number = 990;