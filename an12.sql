-- ����
-- ����Է�: 7788
-- �����ȣ, �̸�, ����, ������ ���

ACCEPT VNO PROMPT '����Է�:'

DECLARE
	VEMPNO NUMBER;
	VENAME VARCHAR2(20);
	VJOB VARCHAR2(20);
	VCOMM NUMBER;
	VSAL NUMBER;
	VANNSAL NUMBER;


BEGIN
	SELECT empno, ename, job, NVL(comm,0) comm, sal, sal*12+NVL(comm,0) annsal 
		INTO VEMPNO, VENAME, VJOB, VCOMM, VSAL, VANNSAL
	FROM emp
	WHERE empno = &VNO;
	DBMS_OUTPUT.PUT_LINE('�����ȣ		�̸�		����			����		�޿�		����');
	DBMS_OUTPUT.PUT_LINE('-----		-----	---------	-----	-----	-----');
	DBMS_OUTPUT.PUT_LINE(VEMPNO||'		'||VENAME||'	'||VJOB||'		'||VCOMM||'		'||VSAL||'	'||VANNSAL);
END;
/