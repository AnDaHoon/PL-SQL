
ACCEPT VNO PROMPT '�����ȣ: :'

DECLARE
	VEMPNO			EMP.EMPNO%TYPE :=  &VNO;

	-- ���̺���%ROWTYPE
	-- ���̺��� �ִ� ��� �������� �������� �ʾƵ� ����� �� �ִ�.
	VEMP EMP%ROWTYPE;

BEGIN
	SELECT *
		INTO VEMP
	FROM EMP
	WHERE EMPNO = VEMPNO;
	DBMS_OUTPUT.PUT_LINE(VEMP.EMPNO||'		'||VEMP.JOB||'		'||VEMP.SAL||'		'||VEMP.DEPTNO);
END;
/