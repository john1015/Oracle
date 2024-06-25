--2024-06-25
/*
	PL/SQL => ���ν����� ���鶧 ����ϴ� ��� => ����SQL�� �Ѵ�
	=> JSP������Ʈ 1��Ʈ�� ��� => ���
	=> �Լ� => ����ÿ� ��� / �ݺ��� ���� ���
	=> Function VS Procedure => �Լ�(�޼ҵ�)
		=> ������ : �������� ���翩��
	�⺻����
	DECLARE
	   ��������
	BEGIN
	   ���� => SQL
	END
	/

	=> ���� ���� => SELECT�� ������ �ƴ϶� ��� => ������ ���� ���� : INTO
	  1) ��Į�� ���� (�Ϲ� ����) => ������ �������� ��) no NUMBER(10) , name VARCHAR2(30)
	  2) %TYPE => ���� ���̺� ����� �÷��� ���������� �о� �´�
	  3) RECORD ���� => ���̺� �ִ� ��ü �÷��� ���� ���������� ������ �´�
	     ========= %ROWTYPE
			������ ���̺�� %ROWTYPE
				  ---------- ���̺� �����ϴ� ��� �÷��� �������� �б�
	  4) ����� ���� => TYPE ������ RECORD()
	     --------------- JOIN�� ��쿡 �ʿ��� �����͸� ����
	  ----------------------------- ������ 1���� ROW�� ������ �� �� �ִ�
	  5) ��ü ������ �б� => CURSOR
	=> ������ / ���
		������ => SQL�� ����� ��� �����ڸ� ����� �� �ִ�
		���
		  ���ǹ�
		   => IF
			����)
				IF ���ǹ� THEN
					���๮��
				END IF;
		   => IF ~ ELSE
			����)
				IF ���ǹ� THEN
					���๮��
				ELSE
					���๮��
				END IF;

		   �ݺ���
		   => WHILE
			����)
				WHILE ���ǹ� LOOP
					���๮��
					������
				END LOOP;
		   => FOR
			����)
				FOR ������ IN lo ... hi LOOP
					ó������
				END LOOP;
*/
-- FOR

SET SERVEROUTPUT ON;
DECLARE
BEGIN
   FOR i IN 1..10 LOOP
	IF MOD(I,2)=0 THEN
	   DBMS_OUTPUT.PUT_LINE(i);
	END IF;
   END LOOP;
END;
/

-- 1~100������ ���� , ¦���� , Ȧ���� => ������ ���� => :=
DECLARE
  total NUMBER:=0;
  even NUMBER :=0;
  odd NUMBER :=0;
BEGIN 
  -- ������
  FOR i IN 1..100 LOOP
	total:= total+i;
	IF MOD(i,2)=0 THEN
	   even:=even+i;
	ELSE
	   odd := odd+i;
	END IF;
  END LOOP;
  DBMS_OUTPUT.PUT_LINE('------ ��� ----- ');
  DBMS_OUTPUT.PUT_LINE('���� : '||total);
  DBMS_OUTPUT.PUT_LINE('¦�� : '||even);
  DBMS_OUTPUT.PUT_LINE('Ȧ�� : '||odd);
END;
/

-- ������� ���� �޾Ƽ� ������
DECLARE
   dan NUMBER:=&dan;
   result VARCHAR2(100):='';
BEGIN
   FOR i IN 1..9 LOOP
	result:=dan||' x '|| i ||' = '||dan*i;
	DBMS_OUTPUT.PUT_LINE(result);
   END LOOP;
END;
/

/*
	CURSOR : ROW �������� ��Ƽ� ���� / ���
	=> �ڹ� : ROW => ~VO
		      ROW������ => ~VO������ ���� => ArrayList
	1. Ŀ�� ����
	    = CURSOR ����
		CURSOR Ŀ���� IS
		   SELECT * FROM emp
	    = CURSOR ����
		OPEN Ŀ����
	    = ���� => FETCH
		FETCH ������ IN Ŀ����
		=> �������
		      EXIT WHEN Ŀ����%NOTFOUND
	    = CURSOR �ݱ�
		CLOSE Ŀ����
*/

DECLARE
  vemp emp%ROWTYPE;
  CURSOR cur IS
	SELECT * FROM emp;
BEGIN
-- Ŀ�� ����
  OPEN cur;
-- ����
  LOOP
     FETCH cur INTO vemp;
     EXIT WHEN cur%NOTFOUND;
     DBMS_OUTPUT.PUT_LINE(vemp.empno||' '||vemp.ename||' '||vemp.job||' '||vemp.hiredate||' '||vemp.sal);
  END LOOP;
END;
/

-- CURSOR => FOR

DECLARE 
	vemp emp%ROWTYPE;
	CURSOR cur IS
	SELECT * FROM emp;
BEGIN
	FOR vemp IN cur LOOP
		DBMS_OUTPUT.PUT_LINE(vemp.empno||' '||vemp.ename||' '||vemp.job||' '||vemp.hiredate||' '||vemp.sal);
	END LOOP;
END;
/

-- JOIN ���ִ� ��� ó��
DECLARE
   TYPE empDept IS RECORD(
	empno emp.empno%TYPE,
	ename emp.ename%TYPE,
	job emp.job%TYPE,
	dname dept.dname%TYPE,
	loc dept.loc%TYPE
);
-- ���� ����
	ed empDept;
	CURSOR cur IS 
		SELECT empno,ename,job,dname,loc 
		FROM emp,dept
		WHERE emp.deptno = dept.deptno;
BEGIN
	FOR ed IN cur LOOP
		DBMS_OUTPUT.PUT_LINE(ed.empno||' '||ed.ename||' '||ed.job||' '||ed.dname||' '||ed.loc);
	END LOOP;

END;
/