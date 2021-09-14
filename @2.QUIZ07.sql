--사원번호를 입력하면 해당 사원의 급여를 30% 확률로  20%삭감시켜준다 
--이때 사번 , 이름 , 급여, 부서번호를 출력하는 PL/SQL 코드를 작성하세요 
--SQL> -- @D:\dev\PLSQL\QUIZ07.sql
--SQL> -- 사원 번호  : 7788
--ㅠㅠ! 급여가 20% 삭감되었습니다. 

ACCEPT VNO PROMPT '사원번호 :'

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
		DBMS_OUTPUT.PUT_LINE(V);
		IF V <= 3 THEN
			UPDATE EMP
			SET SAL = SAL*0.8
			WHERE EMPNO = C2.EMPNO;
			DBMS_OUTPUT.PUT_LINE('ㅠㅠ! 급여가 20% 삭감되었습니다. ');

		ELSE
			DBMS_OUTPUT.PUT_LINE('꽝! 변동이 없네요 ');

		END IF;
	END LOOP;

	FOR C2 IN C1 LOOP
		DBMS_OUTPUT.PUT_LINE(C2.EMPNO||'		'||C2.ENAME||'		'||C2.SAL||'		'||C2.DEPTNO);
	END LOOP;
END;
