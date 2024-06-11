-- 2024-06-11 JOIN => SUBQuery (170page)
-- DDL / DML
/*
	JOIN => ���̺��� �����ؼ� �ʿ��� ������ ����
					       -----------------------
	SubQuery => SQL���忩������ �Ѱ��� SQL�� ���� (SQL����)
		=> �ڹٿ��� ����Ŭ ������ �� => �ѹ� ������ �ؼ� �ӵ��� ����ȭ
		=> ���̺��� �ٸ� ��쿡�� ����
	JOIN
	------
		= �Ѱ��� SQL ��ɾ ���ؼ� �������� ���̺� ����� �����͸� �ѹ��� ��ȸ�ϴ� ���
		   ---------------------		  -------------------------------------------------------
		= �ΰ��̻��� ���̺��� ����
		   EMP				DEPT
		----------			    ------------
		ename  job			     daname   loc
					+
				EMP + DEPT
		-------------------------------------------------
			ename  job  dname  loc    ==> SELECT�� ������ ���̺�
		-------------------------------------------------
		1. ����
		   INNER JOIN : ������ (���� ���϶� ������ ����)
			= ���� ���� �ִ� ��쿡 ó�� (���� ����) ==> EQUI_JOIN (����ϴ� ������ =)
			     *** ������ SELECT������ ����� ���� , ���������� ��� DML���� ����� ����
			     *** �ǹ� : CRUD (SELECT , INSERT , UPDATE , DELETE)
			     		  => �������� / �������� / View / Sequence / Index
			     		  => ��û : �Խ��� , ��� , ����¡ ���
			     ***1) Oracle JOIN
				    SELECT A.col , B.col => �����Ѵ� (�⺻) => �÷����� �ٸ� ���� ������ ����
				    FROM A,B
				    WHERE A.col = B.col
						     ----
				    ** �ٸ� �÷��� ������ �ʿ䰡 ���� ���� �̸��� �÷��� ��쿡�� ����
					���� : ���̺��.�÷�
						 ��Ī.�÷�
					���̺� ��Ī
					   => FROM A a;
							    -- ��Ī => ���̺���� �� ��쿡 �ַ� ���
			     ***2) ANSI JOIN => ǥ�� ���� => ��� �����ͺ��̽����� ����� ����
										  ---------------- MySQL / MariaDB => ���� ���
										  ---------------- DB2 / ���̺��̽� => ��뷮 �����ͺ��̽�
										  ---------------- ������ / ī���� => NoSQL
				    SELECT A.col , B.col
				    FROM A JOIN B
				    ON A.col = B.col;
			    ------------------------ �÷����� �ٸ����� �ִ�
			     3) NATURAL JOIN : �ڿ����� => �ڵ����� ���� �÷��� ã�Ƽ� ������ �Ѵ�
									  -----
				    SELECT col1 , col2 ... => �÷��� �������� �ʴ´�
				    FROM A NATURAL JOIN B;
			     4) JOIN USING 
				    SELECT col1 , col2 ... => �÷� ���� X
				    FROM A JOIN B USING(���� �÷���);
			    ------------------------ �÷����� ����
			= ���Ե� ���� �ִ� ��쿡 ó�� (�񵿵� ����) ==> NON_EQUI_JOIN (=���� ������) => AND , BETWEEN
			   ���ǹ�
			   ------- =�� ������� �ʴ´�
			   WHERE sal BETWEEN losal AND hisal
			   ON sal BETWEEN losal AND hisal
			*** ���ǹ��� �������� ���
				=> AND => ���� ���� AND �ٸ� ����
		   OUTER JOIN = (JOIN : INTERSECT , OUTER JOIN : INTERSECT + MINUS)
		   -------------- NULL���� ���� / ������ ������
			= LEFT OUTER JOIN
				10	10
				20	20
				30	30
				40	
			   1) Oracle JOIN
				SELECT A.col , B.col
				FROM A,B
				WHERE A.col = B.col(+);  => LEFT

				SELECT A.col , B.col
				FROM A,B
				WHERE A.col(+) = B.col;  => RIGHT
			   2) ANSI JOIN
			= RIGHT OUTER JOIN
				10	10
				20	20
				30	30
				  	40
				SELECT A.col , B.col
				FROM A LEFT OUTER JOIN B
				ON A.col = B.col;  => LEFT

				SELECT A.col , B.col
				FROM A RIGHT OUTER JOIN B
				ON A.col = B.col;  => RIGHT
			= INNER JOIN���� ó�� ���ϴ� ������ ������ ���� => OUTER JOIN
			= ���̺��� ����ȭ�� �̿��ϱ� ������ ���� ��������
				=> ���� / ���� / �߰��� ���ϰ� �����
				����� �Խ���
				----------------
				  �Խ��� + ��� => ���ÿ� ó�� => �Խ��� �Է°� ���ÿ� ��۱��� �߰�
				  -------     ----- => ó���� ���ϰ� ��ɺ��� �и�(����ȭ)
		170page => �μ����� (��������)
		=> JOIN : ������ ����
		=> SubQuery : SQL������ �����ؼ� ���
		    �����ġ
			= SELECT (SELECT ~) => ��Į�� �������� => �÷���� ����� ���� => JOIN��� ����Ҽ� �ִ�
			= FROM (SELECT ~) => �ζ��� �� => ���̺� ��� ��� => ������ �پ��
						    => ����¡ ���
			= WHERE �÷��� = (SELECT ~) => ��������
						    ------------
							= ������ ��������
							= ������ ��������
*/
-- ��) ��� (EMP)�߿� �޿��� ��ü �ޤ�����պ��� ���� �޴� ����� �̸� , �޿� ����
SELECT ROUND(AVG(sal)) FROM emp;

SELECT ename , sal
FROM emp
WHERE sal > 2073;


SELECT ename , sal
FROM emp
WHERE sal > (SELECT ROUND(AVG(sal))
		    FROM emp);
-- �������� = ������� �޾Ƽ� MainQuery ����
-- 2. KING�� ���� �μ����� �ٹ��ϴ� ��� ��� (�̸� , �μ���ȣ , ����)
-- 1) KING �μ� Ȯ��
SELECT deptno
FROM emp
WHERE ename = 'KING';
-- 2) �μ��� ��� ���
SELECT ename
FROM emp
WHERE deptno =10;
--3) ��������
SELECT ename
FROM emp
WHERE deptno = (SELECT deptno
			FROM emp
			WHERE ename = 'KING') AND ename NOT IN 'KING';
-- �ٸ� ���̺� ���Ḯ ����
-- DALLAS���� �ٹ��ϴ� ����� �̸� , ���� , �μ���ȣ
SELECT ename , job , deptno
FROM emp
WHERE deptno = (SELECT deptno
			  FROM dept
			   WHERE loc = 'DALLAS');

-- SCOTT�� �޿��� �޴� ����� �̸� , ���� ,�޿� ���

SELECT ename , job , sal
FROM emp
WHERE sal = (SELECT sal
		    FROM emp
		    WHERE ename = 'SCOTT') AND ename NOT IN 'SCOTT';
-- å�߿� ���� ��� å�� �̸� ����

SELECT bookname , price
FROM book
WHERE price = (SELECT MAX(price)
		       FROM BOOK);

SELECT MAX(price) FROM book;
SELECT price FROM book;
/*
	������ �������� => �÷��� 1�� => �����Ͱ� ������ ���
	10 => ������
	10,20,30 => ������

	IN ==> ���Ե� �� ��üó�� => IN(10,20,30)
	---------------------------------------------------------- MAX , MIN���� ���ؼ��ϴ°� ����
	ANY/SOME
	      <ANY(10,20,30) ==> 30 => MAX��
	      >ANY(10,20,30) ==> 10 =< MIN��
	ALL
		<ALL(10,20,30) ==> 10 ==> MIN��
		>ALL(10,20,30) ==> 30 ==> MAX��
	-------------------------------------------------
*/
-- �μ����ִ� ��� ����� �̸� , �μ���ȣ�� ���

SELECT ename , deptno
FROM emp
WHERE deptno IN (SELECT DISTINCT deptno
			   FROM emp);

SELECT ename , deptno
FROM emp
WHERE deptno <ANY (SELECT DISTINCT deptno
			   FROM emp);

SELECT ename , deptno
FROM emp
WHERE deptno >ANY (SELECT DISTINCT deptno
			   FROM emp);

SELECT ename , deptno
FROM emp
WHERE deptno < (SELECT MAX(deptno)
			   FROM emp);

SELECT ename , deptno
FROM emp
WHERE deptno <SOME (SELECT DISTINCT deptno
			   FROM emp);

SELECT ename , deptno
FROM emp
WHERE deptno > SOME(SELECT DISTINCT deptno
			   FROM emp);
-- MAX ���� ū
SELECT ename , deptno
FROM emp
WHERE deptno > ALL(SELECT DISTINCT deptno
			   FROM emp);
--MIN ���� ����
SELECT ename , deptno
FROM emp
WHERE deptno < ALL(SELECT DISTINCT deptno
			   FROM emp);



