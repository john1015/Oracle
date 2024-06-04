-- 2024-06-04
-- ���� �Լ� => COLUMN������ ó��
/*
	*** COUNT : �α��� ó�� , ���̵� �ߺ�ó�� , �˻� ...
	    = COUNT(*) => NULL�� ���� => ROW�� ����(����� ����)
	    = COUNT(�÷�) => NULL�� ����
		mgr =1 / comm = 10
		COUNT(mgr) = 13 / COUNT(comm) = 4
	       => �����Ͱ� �ִ� ��� ===> ���� ����
		     �����Ͱ� ���� ��� ===> 0�� ����
	*** MAX : �ߺ����� ������
	MIN
	*** SUM : ��ٱ����� �� �ݾ� , ��ǰ ���� ����
	*** AVG : ����� ���� => �ѱ��ž� ���
	*** RANK : ����
	     RANK()
		1
		2
		2
		4
	     DENSE_RANK()
		1
		2
		2
		3
		
*/
--SELECT empno  FROM emp WHERE empno=&sabun;
--SELECT count(*)  FROM emp WHERE empno=&sabun;
-- select count(*) , count(mgr) , count(comm) from emp;
-- �����Լ��� �÷��̳� ���� �Լ��� ������ �� ���� (���� : GROUP BY�� ��쿡�� �÷� ����� ����)
/*
SELECT deptno , COUNT(*) "�����" , MAX(sal) "�ִ� �޿�" , MIN(sal) "�ּұ޿�" , SUM(sal) "�޿� ����" , AVG(sal) "�޿� ���" 
FROM emp 
GROUP BY deptno; */
-- RANK�� �����Լ��� �ƴϴ� ...
-- select ename , job , hiredate , sal , RANK() OVER(ORDER BY sal DESC) "RANK"  FROM emp;
-- select ename , job , hiredate , sal , DENSE_RANK() OVER(ORDER BY sal DESC) "RANK"  FROM emp;