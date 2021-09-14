-- ����ó��
-- 1. PREDEFINE EXCEPTION
-- 2. NONPREDEFINE EXCEPTION
-- 3. USER DEFINED EXCEPTION
-- 4.  OTHERS

ACCEPT VNO PROMPT '����Է�:'

DECLARE
	VEMPNO NUMBER := &VNO;
	VENAME VARCHAR2(20);
	VSAL NUMBER;
	VEX1 EXCEPTION; -- 2. NONPREDEFINE EXCEPTION
	VEX2 EXCEPTION; -- 3. USER DEFINED EXCEPTION

	-- PRAGMA: �����Ϸ� ������
	--PRAGMA EXCEPTION_INIT(�̸�, ������ȣ);
	PRAGMA EXCEPTION_INIT(VEX1, -06502);

	VMSG := VARCHAR2(2000); -- 4.  OTHERS
	VCODE := VARCHAR2(100); -- 4.  OTHERS

BEGIN
	-- VSAL := 'SCOTT'; -- 2. NONPREDEFINE EXCEPTION 
	SELECT EMPNO, ENAME, SAL
		INTO VEMPNO, VENAME, VSAL
	FROM EMP
	WHERE EMPNO = VEMPNO;
	--WHERE DEPTNO = 10; -- TOO_MANY_ROWS Ȯ�� WHERE

	IF VSAL < 3000 THEN -- 3. USER DEFINED EXCEPTION
		-- ���ܹ߻�
		RAISE VEX2;
	END IF;
	
	DBMS_OUTPUT.PUT_LINE(VEMPNO||'		'||VENAME||'		'||VSAL);

EXCEPTION
-- 1. PREDEFINE EXCEPTION
	-- WHEN	���ܸ� THEN
		-- ó���� ����;
		-- ó���� ����;
	WHEN NO_DATA_FOUND THEN -- �����Ͱ� ������ �߻��Ѵ�.
		DBMS_OUTPUT.PUT_LINE('�׷� ����� �������� �ʽ��ϴ�.');
	WHEN TOO_MANY_ROWS THEN -- SELECT���� ����� 1�� �̻��� ���� �����ϴ� ��� �߻��Ѵ�.
		DBMS_OUTPUT.PUT_LINE('�ش� ����� �� �̻��Դϴ�.');
	WHEN INVALID_CURSOR THEN -- CURSOR�� OPEN, FETCH�� ���� ��������� �߻��Ѵ�.
		DBMS_OUTPUT.PUT_LINE('�ش� ����� �� �̻��Դϴ�.');
	WHEN DUP_VAL_ON_INDEX THEN -- UNIQUE ������ ���� �÷��� �ߺ��Ǵ� �����Ͱ� INSERT �� �� �߻��Ѵ�.
		DBMS_OUTPUT.PUT_LINE('PK, UK ������ �����ϴ� �÷��� �ߺ��� ���� ������ �ʽ��ϴ�.');

-- 2. NONPREDEFINE EXCEPTION
	WHEN VEX1 THEN
		DBMS_OUTPUT.PUT_LINE('���ں����� ���ڸ� �Ҵ��� �� �����ϴ�.');

-- 3. USER DEFINED EXCEPTION
	WHEN VEX2 THEN
		DBMS_OUTPUT.PUT_LINE('�޿� 3000�̸��� ������� �ʽ��ϴ�.');

-- 4.  ��� ���ܿ� ���� ó��, �ֻ��� EXCEPTION
	WHEN OTHERS THEN
		ROLLBACK; -- ����ġ ���� �������� �ѹ��� �Ѵ�.
		VMSG := SQLERRM; -- �����޼����� ������ �Ѱ���
		VCODE := SQLCODE; -- SQL���� ��ȣ�� ������ �Ѱ���
		-- �������̺��� �������� ����, ����ð��� INSERT����
		INSERT INTO ERRTBL
		VALUES(ERR_SQL.NEXTVAL, VCODE, VMSG, SYSDATE); 
		COMMIT;
		DBMS_OUTPUT.PUT_LINE('����ġ ���� ���� �߻�');
		DBMS_OUTPUT.PUT_LINE('�����ڿ��� �����ϼ���');
		DBMS_OUTPUT.PUT_LINE('������ȣ: XXXX');
END;
/

