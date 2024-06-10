-- 2024-06-10
-- => GROUP BY => �����Լ� ����
-- JOIN => LOGIN ó��(�ǹ� ������Ʈ)
/*
	GROUP : �׷캰 ��� => SELECT���忡 ����
	SELECT * | coulmn1 ...
	FROM  table_name
	[
		WHERE ������ => �����Լ� ����� �Ұ���
		GROUP BY �׷켳�� => �÷��� ���� �� => �÷����� | �Լ� => ��) �μ��� , �Ի�⵵ , ���� ...
		HAVING �׷쿡 ���� ���� => �����Լ� ����� ����
		ORDER BY �÷� | �Լ� => ASC | DESC => ASC�� ������ ����
				------------ �÷��� ��ȣ => ����Ŭ�� ��ȣ�� 1������ ����
						1	   2		3
				SELECT empno , ename , deptno
				SELECT * => ����Ŭ���� ���̺� ����� ����
						1	   2	    3	    4	      5		 6	  7	    8
					   empno , ename , job , mgr , hiredate , sal , comm , deptno
	]
	=> �����Լ��� ����
	     ---------- �÷������� ���
	    1. COUNT => ROW�� ���� Ȯ�� => �α��� , ���̵� �ߺ� , �˻���� , ��ٱ���
	    2. MAX , MIN => coulmn�߿� �ִ밪 , �ּҰ�
	       ------ ���� ���� ��ȣ
	    3. SUM / AVG => �÷��� �� / ���
	       ------ ���� ������ ����
	    4. RANK() / DENSE_RANK() => ���� ����
	    5. => COLUMN������ ��� O => ROW���� ���� ���� X
		--------------------------------------------------------
			name       kor       eng      math
		--------------------------------------------------------
			ȫ�浿      90         90         90		=> �⺻�� ��������ڸ� �̿��Ѵ�
		--------------------------------------------------------
			��û��      80         80         80
		--------------------------------------------------------
			�ڹ���      70         70         70
		--------------------------------------------------------
			               240       240       240   => SUM(�÷���) => SUM(kor)
			               80         80         80
			=> CUBE / ROLLUP => ROW/COLUMN�� ���ÿ� �Ѱ� => ���ÿ��� �ݵ�� GROUP BY
		   ***���� �Լ��� ���� => �Ϲ� �÷� , �������Լ��ϰ� ���ÿ� ����� �Ұ���
						    -------------------------- �ݵ�� GROUP BY�� �̿��ؼ� ����Ѵ�
						    => ���� �Լ��� ���������� ����� ����
			��) SELECT deptno , AVG(sal) , SUM(sal) => ����
					--------
			     SELECT  AVG(sal) , SUM(sal) => ����
			     SELECT deptno , AVG(sal) , SUM(sal) 
					--------
			     FROM   emp
			     GROUP BY deptno   
					    ---------
			     SELECT deptno , job , AVG(sal) , SUM(sal)
						    ----
			     FROM emp
			     GROUP BY deptno ==> ����

			     SELECT deptno , job , AVG(sal) , SUM(sal)
						    ----
			     FROM emp
			     GROUP BY deptno,job ==> ����

			     ����
			     		SELECT 	------- 5
			     		FROM 	------- 1
			     		WHERE 	------- 2
			     		GROUP BY 	 ------ 3
			     		HAVING 	------- 4
			     		ORDER BY 	 ------ 6
			     ----------------------------------------

*/
-- �޿��� �� / �޿��� ���
/*
SELECT SUM(sal) , AVG(sal)
FROM emp;
*/
-- 10 �� �μ��� �޿��� �� / ���
/*
select sum(sal) , avg(sal) from emp where deptno = 10;
select sum(sal) , avg(sal) from emp where deptno = 20;
select sum(sal) , avg(sal) from emp where deptno = 30;*/
select deptno , sum(sal) , avg(sal) from emp group by deptno order by 1 asc;
-- ���� ���� ����� , �޿���� , �޿� �� , �ִ밪 , �ּҰ�

select job , count(*) , AVG(sal) , SUM(sal) , MAX(sal) , MIN(sal) from emp group by job;
-- �Ի�⵵���� ����� , �޿���� , �޿��� , �ִ밪 , �ּҰ�
select TO_CHAR(hiredate,'YYYY') , count(*) , AVG(sal) , SUM(sal) , MAX(sal) , MIN(sal) from emp group by TO_CHAR(hiredate,'YYYY') order by TO_CHAR(hiredate,'YYYY');
-- �Ի���Ϻ� ����� , �޿���� , �޿��� , �ִ� , �ּҰ�
select TO_CHAR(hiredate,'DY') , count(*) , AVG(sal) , SUM(sal) , MAX(sal) , MIN(sal) from emp group by TO_CHAR(hiredate,'DY');
-- ���� => ����Ͽ� ���Ű� ������

/*

	Orders : ������Ȳ
	ORDERID                                               NOT NULL NUMBER(2)
 	CUSTID                                                         NUMBER(2)
 	BOOKID                                                         NUMBER(2)
 	SALEPRICE                                                      NUMBER(8)
 	ORDERDATE                                                      DATE

	Book : å���� ����
	BOOKID                                                NOT NULL NUMBER(2)
 	BOOKNAME                                                       VARCHAR2(40)
 	PUBLISHER                                                      VARCHAR2(40)
 	PRICE                                                          NUMBER(8)

   	
	Customer : ȸ�� ����
	CUSTID                                                NOT NULL NUMBER(2)
 	NAME                                                           VARCHAR2(40)
 	ADDRESS                                                        VARCHAR2(50)
 	PHONE                                                          VARCHAR2(20)
*/
-- ���� �ֹ��� ������ �� �Ǹž� => ���θ�
select TO_CHAR(sum(saleprice),'L9,999,999') as �Ѹ��� from orders;
-- 2�� ���� �ֹ� ������ �� �Ǹž�
select TO_CHAR(sum(saleprice),'L9,999,999') as Total from orders where custid = 2;
-- 2�� ���� ����
select name,address,phone from customer where custid=2;

-- �� �Ǹž� , ��� , �ּ� , �ִ� , �����ο�
select sum(saleprice) , avg(saleprice) , min(saleprice), max(saleprice), count(*) from orders;
-- ���� ,�� �Ǹž� , ��� , �ּ� , �ִ� => group by
select custid , sum(saleprice) , avg(saleprice) , min(saleprice), max(saleprice) from orders group by custid order by 1 asc;

-- having�� �̿��ؼ� ó�� => group by�� �ִ� ��쿡�� ����� ���� => �����Լ��� �̿��� �� �ִ�
-- where���忡���� �����ռ� �̿��� �Ұ����ϴ� => where���忡�� �����Լ��� �̿��Ѵٸ� => ���������� �̿��Ѵ�
/*
	������ �˻� : select
	1. ���� / ����
	2. ������ ����
	3. ���� �Լ�
	4. GROUP�� ó�� => ���(����)
	5. ���̺� ���� => ���� (�ΰ��̻��� ���̺��� �ʿ��� ������ ����)
	6. SQL���� ���� => SQL���� ������ => �Ѱ� ���� => ��������(�μ�����)
	������ �߰� : INSERT => 2��
	������ ���� / ������ ���� : UPDATE , DELETE => 1��
	---------------------------------------------------------------------------------- CRUD
	���̺� ���� : �������� , �������̺� ���� (View) , �ڵ� ������ȣ ����(SEQUENCE) , �ӵ� ����ȭ(INDEX)
	=> ���� ��� : �Լ�(FUNCTION,PROCEDURE) => �ڵ� ó�� (TRIGGER)
*/
-- HAVING => GROUP BY ������ ����ϴ� �׷�����
SELECT deptno , COUNT(*) , SUM(sal) , AVG(sal)
FROM EMP
GROUP BY deptno
ORDER BY deptno ASC;
-- �μ����� ��ü �޿���պ��� ���� �޴� �μ��� ���
SELECT deptno , COUNT(*) , SUM(sal) , AVG(sal)
FROM EMP
GROUP BY deptno
HAVING AVG(sal)>2073
ORDER BY deptno ASC;

SELECT deptno , COUNT(*) , SUM(sal) , AVG(sal)
FROM EMP
GROUP BY deptno
HAVING COUNT(*)>3
ORDER BY deptno ASC;

--������ 8000�̻��̰� , 2���̻� ������ ���� ���
SELECT custid , COUNT(*)
FROM orders
WHERE saleprice>= 8000
GROUP BY custid
HAVING COUNT(*)>=2;
/*
	���ǻ���
	GROUP BY => �÷������� ��� ����� �����ϴ�
			     ----------
	=> SELECT - FROM - WHERE - GROUP BY - HAVING - ORDER BY
		5	      1		  2		 3		  4		6
*/
