-- 2024-06-24
/*
	267page => �����ͺ��̽� ���α׷��� => JDBC => ��
			  ----------------------------
			  PL/SQL => ������ ���� ���
			  ---- ���ν����� ����� ���
				---------- �ڹٿ��� => �޼ҵ�
				= �������� �ִ� �Լ� => SUBSTR , TRIM ... => SELETE�ڿ� ���
					FUNCTION
				= �������� ���µ� ����� ���� => INSERT , UPDATE ... => �ܵ�ȣ���� �����ϴ�
					PROCEDURE
				--------------------------------- �ڹٿ��� ȣ��
				= �ڵ�ȭ ó�� : Ʈ����(TRIGGER)
				--------------------------------- ����Ŭ ��ü ó�� => �м��ϱ� ��ƴ�
				   => �԰� => ���(�ڵ�ȭ)
				   => ��� => ���(�ڵ�ȭ)
				   => ��� => ������ ��� Ƚ��(�ڵ�ȭ)
				-----------------------------------------------------------------------------------------------------
					���ν��� => ��� ������ ����� ����

				PL / SQL ���� => ȣ��ȣ (��ü) => 50:50 (���� ����ϴ� ��ü => ERP) => {}�� ������� �ʴ���
				----------												  --- ���̽�
				FOR
				FOR =>
					FOR
						FOR => �鿩����
					���̽� / C / Java
							������Ʈ => ������
						�Լ�
				=> �鿩����
				=> Spring FRamework : ���� ���� : XML
				=> Spring Boot : ���� ���� : yml(�鿩����) => MSA

				DECLARE => CREATE PROCEDURE , CREATE FINCTION , CREATE TRIGGER
				=> ���� (���� ����)
				BEGIN
				=> SQL�������� ����
				END
				/

				= ����
					1) �Ϲ� ����(��Į�� ����)
						������ �������� ; 
						no NUMBER;
						name VARCHAR2(50)
					2) TYPE : ���� ���̺��� �÷��� ���� �ִ� ���������� �о� �ö� => ****** ���� ���� ���
						empno , emp.empno%TYPE
								  ----------- ���� ���������� ������ �´�
						     ���̺��.�÷���%TYPE
					3) ���̺� �����ϴ� ��� �÷��� ������	
						%ROWTYPE
						emp emp%	ROWTYPE
					4) ����� ���� �������� => RECORD => JOIN , SUBQUERY���� �ַ� ���
					-------------------------------------------------------------------- ROW �Ѱ��� ���� ������
					5) �������� ROW�� �о� ���� ��� : CURSOR
											  ----------- ResultSet
				= ������
				= ���
*/
/*
SET SERVEROUTPUT ON;
DECLARE
 -- ���� ����
  pEmpno NUMBER(4);
  pEname VARCHAR2(20);
  pJob VARCHAR2(20);
  pHiredate DATE;
  pSal NUMBER(7,2);
BEGIN 
-- INTO�� SELECT���� ����� �����͸� ������ ����ÿ� ���
  SELECT empno , ename , job , hiredate , sal INTO pEmpno , pEname , pJob , pHiredate , pSal
  FROM emp
  WHERE empno =&sabun;
-- ���
DBMS_OUTPUT.PUT_LINE('----------------- ��� ------------------');
DBMS_OUTPUT.PUT_LINE('��� : '||pEmpno);
DBMS_OUTPUT.PUT_LINE('�̸� : '||pEname);
DBMS_OUTPUT.PUT_LINE('���� : '||pJob);
DBMS_OUTPUT.PUT_LINE('�Ի��� : '||pHiredate);
DBMS_OUTPUT.PUT_LINE('�޿� : '||pSal);


END;
/
*/
/*
-- %TYPE : ���� �÷��� ���������� �о� �´� => ���̺�.�÷�%TYPE => ���� ���� ���
DECLARE 
 -- ����� ���� ����
 pEmpno emp.empno%TYPE;
 PEname emp.ename%TYPE;
 pJob emp.job%TYPE;
 pHiredate emp.hiredate%TYPE;
 pSal emp.sal%TYPE;
BEGIN
 -- SQL�������� ���� 
  SELECT empno , ename , job , hiredate , sal INTO pEmpno , pEname , pJob , pHiredate , pSal
  FROM emp
  WHERE empno =&sabun;
-- ���
DBMS_OUTPUT.PUT_LINE('----------------- ��� ------------------');
DBMS_OUTPUT.PUT_LINE('��� : '||pEmpno);
DBMS_OUTPUT.PUT_LINE('�̸� : '||pEname);
DBMS_OUTPUT.PUT_LINE('���� : '||pJob);
DBMS_OUTPUT.PUT_LINE('�Ի��� : '||pHiredate);
DBMS_OUTPUT.PUT_LINE('�޿� : '||pSal);
END;
/
 */

-- %ROWTYPE =>���̺� ��ü �÷��� ���������� �о� �´�
--    ----------- ~ VO
DECLARE
 pEmp emp%ROWTYPE;
-- emp�� ������ �ִ� ��� �÷��� ���������� �о�´�
BEGIN
 SELECT * INTO pEmp
 FROM emp
 WHERE empno=7900;

-- ���
 DBMS_OUTPUT.PUT_LINE('--------------- ��� ----------------');
 DBMS_OUTPUT.PUT_LINE('��� : '|| pEmp.empno);
 DBMS_OUTPUT.PUT_LINE('�̸� : '|| pEmp.ename);
 DBMS_OUTPUT.PUT_LINE('���� : '|| pEmp.job);
END;
/

-- ����� ���� �������� => JOIN => RECORD
DECLARE
 TYPE empDept IS RECORD
 (
	empno emp.empno%TYPE ,
	ename emp.ename%TYPE , 
	job emp.job%TYPE , 
	hiredate emp.hiredate%TYPE , 
	sal emp.sal%TYPE , 
	dname dept.dname%TYPE , 
	loc dept.loc%TYPE , 
	grade salgrade.grade%TYPE
 );
-- ���� ����
ed empDept;

BEGIN
 SELECT empno,ename,job,hiredate,sal,dname,loc,grade INTO ed
 FROM emp,dept,salgrade
 WHERE emp.deptno = dept.deptno
 AND sal BETWEEN losal AND hisal
 AND empno = 7900;
-- ����Գ翡 ���� ���� ���� => ������ ����ÿ��� CURSOR (ArrayList , ResultSet)
 DBMS_OUTPUT.PUT_LINE('--------------- ��� ----------------');
 DBMS_OUTPUT.PUT_LINE('��� : '|| ed.empno);
 DBMS_OUTPUT.PUT_LINE('�̸� : '|| ed.ename);
 DBMS_OUTPUT.PUT_LINE('���� : '|| ed.job);
 DBMS_OUTPUT.PUT_LINE('�Ի��� : '|| ed.hiredate);
 DBMS_OUTPUT.PUT_LINE('�޿� : '|| ed.sal);
 DBMS_OUTPUT.PUT_LINE('�μ��� : '|| ed.dname);
 DBMS_OUTPUT.PUT_LINE('�ٹ��� : '|| ed.loc);
 DBMS_OUTPUT.PUT_LINE('ȣ�� : '|| ed.grade);
END;
/

/* 
	���̺��� ������ ���� => RECORD / CURSOR
	���̺� 1�� => ROW 1�� => �Ϲ� ���� / %TYPE / %ROWTPYE
	CURSOR => FOR ����

	���� => ��Į�� ���� (�Ϲ� ���� : ������ ��������)
		    %TYPE(���̺��� ���� �������� : ������ ���̺��.�÷���%TYPE)
		    %ROWTYPE(�Ѱ��� ���̺� ��ü �÷���� ���������� ������ �´�)
		    RECORD => (JOIN , SUBQUERY => ������ ���̺� ����)
		    ----------------------------------------------------------------- ROW�Ѱ��� ������ ����
		    ROW �������� ������ �´� : CURSOR => ������ ��� : for�� �̿�
	������
	   ������ �Լ�
	       = ���� �Լ�
		 => LENGTH : ���� ����
		      LENGTH(�÷��� | ���ڿ�)
	         => SUBSTR : ���ڸ� �ڸ���
		      SUBSTR(�÷��� | ���ڿ� , ���ڿ��� ���� �ε��� ��ȣ , �ڸ��� ����)
							-------------------------------
							�ڹ� : 0 , ����Ŭ : 1
	         => RPAD : ���ڶ�� ���ڿ� ������ ���ڸ� ��� => IDã�� , ��й�ȣ ã��
		      RPAD(�÷��� | ���ڿ� , ��°��� , ������ ����)
		      RPAD('abc',5,'#') abc##
	       = ���� �Լ�
	         => ROUND() => �ݿø�
	         => CEIL() => �ø�
	         => MOD() => % => ������
	       = ��¥ �Լ�
	         => SYSDATE : �ý����� �ð� , ��¥ �б�
	       = ��ȯ �Լ�
	         => TO_CHAR => ��¥ ��ȯ / ���� ��ȯ
					 YYYY , MM , DD , HH(HH24) , MI , SS
					  9,999,999
					 SimpleDateFormat / DecimalFormat
						MM / mm 		##,###,###
	       = ��Ÿ �Լ� 
		  => NVL : NULL���� ��ü
		------------------------------------------------------------------------------ ���� ROW����
	       = ���� �Լ�
		  => COUNT(*) => ROW�� ����
		  => MAX , MIN
		------------------------------------------------------------------------------- ���� Column����

		������
		  => ��� ������ : + , - , * , / => SELECT�ڿ� �ַ� ���
					  + : �����ϰ� ����� ���� => ���ڿ� ���� => ||
					  / : ����/���� = �Ǽ�
					  ****** '1' + '2' => TO_NUMBER�� ���� => 3 (�ڵ����� ���� ��ȯ)
		  => WHERE������ �ַ� ����ϴ� ������ (true/false)
			1. �� ������ : = , <> , < , > , <= , >=
					     => ���� , ���� , ��¥ �񱳰� ����
		  	2. �� ������ : AND , OR => (& : �Է°��� �޴� ��� , || => ���ڿ� ����)
			3. NULL 
			  * ������ ���尪�� NULL�� ��쿡�� ����ó���� �ȵȴ�
			  IS NULL , IS NOT NULL
			4. ���� ������ : NOT
			  NOT BETWEEN , NOT LIKE , NOT IN ...
			5. LIKE => �˻�
			   %�˻���% , %:������ ������ �𸣴� ��� , _: �ѱ���
			6. IN => OR�� �������� ��� => ��ǰ ������ ���� , ������ �˻��� 
			7.BETWEEN ~ AND : �Ⱓ , ����
	���
	   ���ǹ� 
	    ����)
			IF ���ǹ� THEN
			   ���� ����
			END IF;

			--------------------------

			IF ���ǹ� THEN
			   ���๮��
			ELSE
			   ���๮��
			END IF:

			---------------------------
			-> ���� ���ǹ�
			IF ���ǹ� THEN
			   ���๮��
			ELSIF ���ǹ� THEN
			   ���๮��
			ELSIF ���ǹ� THEN
			   ���๮��
			      . . .
			ELSE
			   ���๮��
			END IF;

			----------------------------
	   �ݺ��� 
	   
*/
-- ���� ���ǹ� 
DECLARE
  vEmpno NUMBER(4);
  vEname VARCHAR2(20);
  -- �ʱⰪ�� ���� => vEmpno NUMBER(4) = 0 (X) , vEmpno NUMBER(4):=0 => :=
  vJob VARCHAR2(20);
  vDname VARCHAR2(20);
  vDeptno NUMBER(2):=0;
BEGIN
  SELECT empno,ename,job,deptno INTO vEmpno , vEname , vJob , vDeptno
  FROM emp
  WHERE empno = 7900;

IF vDeptno = 10 THEN
   vDname := '���ߺ�';
END IF;

IF vDeptno = 20 THEN
   vDname := '������';
END IF;

IF vDeptno = 30 THEN
   vDname := '�ѹ���';
END IF;

DBMS_OUTPUT.PUT_LINE('---------- ��� -----------');
DBMS_OUTPUT.PUT_LINE('��� : '||vEmpno);
DBMS_OUTPUT.PUT_LINE('�̸� : '||vEname);
DBMS_OUTPUT.PUT_LINE('���� : '||vJob);
DBMS_OUTPUT.PUT_LINE('�μ� : '||vDname);


END;
/

DECLARE
  vEmpno NUMBER(4);
  vEname VARCHAR2(20);
  -- �ʱⰪ�� ���� => vEmpno NUMBER(4) = 0 (X) , vEmpno NUMBER(4):=0 => :=
  vJob VARCHAR2(20);
  vDname VARCHAR2(20);
  vDeptno NUMBER(2):=0;
BEGIN
  SELECT empno,ename,job,deptno INTO vEmpno , vEname , vJob , vDeptno
  FROM emp
  WHERE empno = 7900;
/*
IF vDeptno = 10 THEN
   vDname := '���ߺ�';
END IF;

IF vDeptno = 20 THEN
   vDname := '������';
END IF;

IF vDeptno = 30 THEN
   vDname := '�ѹ���';
END IF;
*/
-- witch ~ case => E4Net : ERP , Dream CIS , ���� , ũ������� , ���Ϳ��� , ����ĸ ....
--			  ---------------------------------------------------------------------------------

vDname:=CASE vDeptno
	      WHEN 10 THEN '���ߺ�'
	      WHEN 20 THEN '������'
	      WHEN 30 THEN '�ѹ���'
	      END;

DBMS_OUTPUT.PUT_LINE('---------- ��� -----------');
DBMS_OUTPUT.PUT_LINE('��� : '||vEmpno);
DBMS_OUTPUT.PUT_LINE('�̸� : '||vEname);
DBMS_OUTPUT.PUT_LINE('���� : '||vJob);
DBMS_OUTPUT.PUT_LINE('�μ� : '||vDname);

END;
/

-- ���� ���ǹ� : true / false�� ������ �۾� => IF ~ ELSE
/*
	��� : �ڵ�ȭ ó��
	=> ���� ��ǰ : UPDATE
	=> �ٸ� ��ǰ : INSERT
	���ϱ�
*/
DECLARE
 vEname emp.ename%TYPE;
 vComm emp.comm%TYPE;
 vSal emp.sal%TYPE;
 vTotal NUMBER(7,2) :=0;
BEGIN
 SELECT ename,comm,sal,sal+NVL(comm,0) INTO vEname , vComm , vSal , vTotal
 FROM emp
 WHERE empno = &empno;
 -- comm = null �̸� => if���� ���� ������ �Ұ��� => else������ �����Ѵ�
 IF vComm > 0 THEN
    DBMS_OUTPUT.PUT_LINE('vEname : '||'���� �޿��� '||vSal||'�̰� �������� '||vComm||'�̸� �ѱ޿��� '||vTotal||'�Դϴ�');
 ELSE
     DBMS_OUTPUT.PUT_LINE('vEname : '||'���� �޿��� '||vSal||'�̰� �������� ���� �ѱ޿��� '|| vTotal||'�Դϴ�');
 END IF;
END;
/

-- ���� ���ǹ� IF ~ ELSIF ~ ELSE(���� ����) => END IF

DECLARE
  vEmpno NUMBER(4);
  vEname VARCHAR2(20);
  -- �ʱⰪ�� ���� => vEmpno NUMBER(4) = 0 (X) , vEmpno NUMBER(4):=0 => :=
  vJob VARCHAR2(20);
  vDname VARCHAR2(20);
  vDeptno NUMBER(2):=0;
BEGIN
  SELECT empno,ename,job,deptno INTO vEmpno , vEname , vJob , vDeptno
  FROM emp
  WHERE empno = 7900;

IF vDeptno = 10 THEN
   vDname := '���ߺ�';

ELSIF vDeptno = 20 THEN
   vDname := '������';

ELSIF vDeptno = 30 THEN
   vDname := '�ѹ���';
END IF;

-- witch ~ case => E4Net : ERP , Dream CIS , ���� , ũ������� , ���Ϳ��� , ����ĸ ....
--			  ---------------------------------------------------------------------------------
/*
vDname:=CASE vDeptno
	      WHEN 10 THEN '���ߺ�'
	      WHEN 20 THEN '������'
	      WHEN 30 THEN '�ѹ���'
	      END;
*/

DBMS_OUTPUT.PUT_LINE('---------- ��� -----------');
DBMS_OUTPUT.PUT_LINE('��� : '||vEmpno);
DBMS_OUTPUT.PUT_LINE('�̸� : '||vEname);
DBMS_OUTPUT.PUT_LINE('���� : '||vJob);
DBMS_OUTPUT.PUT_LINE('�μ� : '||vDname);

END;
/


