-- 2024-06-13
-- �������� => ��Į�� �������� (�÷� ��� ���) => �ٸ� ���̺�� ������ ����
/*
	���� ��ſ� ����� �����ϴ�
*/

-- emp : ename , job , hiredate , dept : dname , loc
-- ����
select enaem , job , hiredate , sal , dname , loc
from emp , dept
where emp.deptno  = dept.deptno;
-- ��Į�� ���������� ������ : �ݵ�� �������� ������ �´�
-- ��������
select ename , job , hiredate , sal , (select dname from dept where deptno = emp.deptno) as dname , (select loc from dept where deptno = emp.deptno) as loc
from emp;
select * from orders;
select orderid , (select name from customer where custid = orders.custid) "name" , 
			(select bookname from book where bookid = orders.bookid) "bookname" ,
				saleprice
from orders;
-- �������� / ��ٱ��� ��ǰ ���� => ��ǰ�� ��ȣ�� ����
-- �ζ��� �� => ���̺� ��� ���
/*
	SELECT ~~
	FROM (SELECT ~~)
	=> ������ / Top-N (�α����)
	������ )
	 SELECT ename , job , hiredate , sal
	 FROM (SELECT ename , job , sal , comm , deptno  FROM emp); ==> ���� (hiredate�� ����)
*/
/*
SELECT empno ,ename , job ,hiredate , sal
FROM (SELECT ename , job , sal , comm , deptno FROM emp);
*/
-- rownum ����Ŭ���� �����ϴ� ���� �÷� => ��� ���̺� ����
-- row�� ����� ����
SELECT empno , ename , job , hiredate , sal ,rownum
FROM emp;
-- ROWNUM ����

SELECT empno , ename , job , hiredate , sal ,rownum
FROM (SELECT empno , ename , job , hiredate , sal FROM emp ORDER BY sal ASC) WHERE rownum <= 5;

SELECT empno , ename , job , hiredate , sal ,rownum
FROM (SELECT empno , ename , job , hiredate , sal FROM emp ORDER BY sal DESC) WHERE rownum <= 5;

-- rownum => Top-N
-- �޿��� ���� ������ 1~5
-- �޿��� ���������� 6�� ~ 10��
-- �޿��� ���� ������ 11~14
/*
SELECT empno , ename , job , hiredate , sal ,rownum
FROM (SELECT empno , ename , job , hiredate , sal FROM emp ORDER BY sal ASC) ;

SELECT empno , ename , job , hiredate , sal ,rownum
FROM (SELECT empno , ename , job , hiredate , sal FROM emp ORDER BY sal ASC) WHERE rownum BETWEEN 1 AND 5;

SELECT empno , ename , job , hiredate , sal ,rownum
FROM (SELECT empno , ename , job , hiredate , sal FROM emp ORDER BY sal ASC) WHERE rownum >= 6 AND ROWNUM<=10;

SELECT empno , ename , job , hiredate , sal ,rownum
FROM (SELECT empno , ename , job , hiredate , sal FROM emp ORDER BY sal ASC) WHERE rownum BETWEEN 11 AND 14;
*/
/*
select empno , ename , job , hiredate , sal , num
from (select empno , ename , job , hiredate , sal , rownum as num from (select empno , ename , job , hiredate , sal from emp order by sal asc)) 
where num between 1 and 5;

select empno , ename , job , hiredate , sal , num
from (select empno , ename , job , hiredate , sal , rownum as num from (select empno , ename , job , hiredate , sal from emp order by sal asc)) 
where num between 6 and 10;

select empno , ename , job , hiredate , sal , num
from (select empno , ename , job , hiredate , sal , rownum as num from (select empno , ename , job , hiredate , sal from emp order by sal asc)) 
where num between 11 and 14;
*/

SELECT no , goods_name , num
FROM (SELECT no,goods_name,rownum as num FROM (SELECT no,goods_name FROM goods_all ORDER BY no ASC)) 
WHERE num BETWEEN 1 AND 12;

SELECT no , goods_name , num
FROM (SELECT no,goods_name,rownum as num FROM (SELECT no,goods_name FROM goods_all ORDER BY no ASC)) 
WHERE num BETWEEN 13 AND 24;