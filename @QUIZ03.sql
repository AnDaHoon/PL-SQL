--����ڷκ��� ���ڸ� �Է¹޾� Ȧ������ ¦������ �Ǻ�
--�Է�:100
--100�� ¦���Դϴ�. 
--�Է�:101
--101�� Ȧ���Դϴ�. 
ACCEPT VNO PROMPT '�Է�:'


BEGIN
	IF MOD(&VNO,2) = 0 THEN
		DBMS_OUTPUT.PUT_LINE('¦���Դϴ�.');
	ELSE 
		DBMS_OUTPUT.PUT_LINE('Ȧ���Դϴ�.');
	END IF;
END;
/
