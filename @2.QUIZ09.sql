DECLARE
    TYPE va_type IS VARRAY(6) OF NUMBER(2);
    vva_test va_type;
	temp NUMBER;
	temp2 NUMBER ;
BEGIN


	vva_test := va_type(ROUND(DBMS_RANDOM.VALUE(1,45)), ROUND(DBMS_RANDOM.VALUE(1,45)), ROUND(DBMS_RANDOM.VALUE(1,45)), 
	ROUND(DBMS_RANDOM.VALUE(1,45)), ROUND(DBMS_RANDOM.VALUE(1,45)), ROUND(DBMS_RANDOM.VALUE(1,45)));
    temp2 := 1;
	FOR i IN 1..6 LOOP
		temp := vva_test(i);
		temp2 := temp2 + 1;
		FOR j IN temp2..6 LOOP
			IF temp = vva_test(j) THEN
				vva_test(i) := ROUND(DBMS_RANDOM.VALUE(1,45));
			END IF;
		END LOOP;
	END LOOP;

	DBMS_OUTPUT.PUT_LINE(vva_test(1)||'	'||vva_test(2)||'	'||vva_test(3)||'	'||vva_test(4)||'	'||vva_test(5)||'	'||vva_test(6));
  
END;



