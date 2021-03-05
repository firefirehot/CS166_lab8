DROP FUNCTION IF EXISTS func_name() CASCADE;
DROP EXTENSION IF EXISTS plpgsql; 
DROP LANGUAGE IF EXISTS plpgsql;

CREATE SEQUENCE part_number_seq START WITH 50000;

CREATE LANGUAGE plpgsql;
CREATE OR REPLACE FUNCTION func_name()
	RETURNS "trigger" AS
	$BODY$
	BEGIN

	New.part_number:=nextval('part_number_seq');
	RETURN NEW;	
	END
	$BODY$
	LANGUAGE plpgsql VOLATILE;
CREATE TRIGGER name BEFORE INSERT ON part_nyc 
FOR EACH ROW
EXECUTE PROCEDURE func_name ()