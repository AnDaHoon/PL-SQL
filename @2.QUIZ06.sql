--�����ȣ�� �Է��ϸ� �ش� ����� �޿��� 20% Ȯ����  10%�λ�����ش� 
--�̶� ��� , �̸� , �޿�, �μ���ȣ�� ����ϴ� PL/SQL �ڵ带 �ۼ��ϼ��� 
--SQL> -- @D:\dev\PLSQL\QUIZ06.sql
--SQL> -- ��� ��ȣ  : 7788
--����! �޿��� 10% �λ�Ǿ����ϴ�. 



ACCEPT VNO PROMPT '�����ȣ :'

DECLARE
	V NUMBER;

	CURSOR C1 IS
	SELECT EMPNO, ENAME, SAL, DEPTNO
	FROM EMP
	WHERE EMPNO = &VNO;

	C2 C1%ROWTYPE;

BEGIN
	FOR C2 IN C1 LOOP

		V := ROUND(DBMS_RANDOM.VALUE(1,10));
		IF V <= 2 THEN
			UPDATE EMP
			SET SAL = SAL*1.1
			WHERE EMPNO = C2.EMPNO;
			
			DBMS_OUTPUT.PUT_LINE('����! �޿��� 10% �λ� �Ǿ����ϴ�.');
		ELSE
			DBMS_OUTPUT.PUT_LINE('��');
		END IF;


	END LOOP;

	FOR C2 IN C1 LOOP
		DBMS_OUTPUT.PUT_LINE(C2.EMPNO||'		'||C2.ENAME||'		'||C2.SAL||'		'||C2.DEPTNO);
	END LOOP;
END;
/