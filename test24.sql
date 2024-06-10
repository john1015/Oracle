-- 2024-06-10
-- OUTER JOIN => INNER JOIN + MINUS
/*
	LEFT OUTER JOIN
	1. Oracle JOIN
	    SELECT A.col , B.bol
	    FROM A , B
	    WHERE A.col = B.col(+);

	    SELECT A.col , B.bol
	    FROM A , B
	    WHERE A.col(+) = B.col;

	2. ANSI JOIN
	    SELECT A.col , B.bol
	    FROM A LEFT OUTER JOIN B
	    ON A.col = B.col;

	    SELECT A.col , B.bol
	    FROM A RIGHT OUTER JOIN B
	    ON A.col = B.col;
	
	FULL OUTER JOIN
	1. Oracle JOIN�� ����
	2. ANSI JOIN
	    SELECT A.col , B.bol
	    FROM A FULL OUTER JOIN B
	    ON A.col = B.col;
	** NULL���� ��� ó���� ����
	    A 	    B
	   10     10
	   20     20
	   30     30
		   40  => A RIGHT OUTER JOIN B

	   10     10
	   20     20
	   30     30
	   40         => A LEFT OUTER JOIN B

	   10     10
	   20     20
	   30     30
           40     50  => A FULL OUTER JOIN B
*/
/*
-- RIGHT OUTER JOIN
SELECT '------------- Oracle JOIN -------- ' FROM DUAL;

SELECT ename , job , emp.deptno
FROM emp , dept
WHERE emp.deptno(+) = dept.deptno;

SELECT '------------- ANSI JOIN -------- ' FROM DUAL;

SELECT ename , job , emp.deptno
FROM emp RIGHT OUTER JOIN dept
ON emp.deptno = dept.deptno;
*/

/*
-- SELF JOIN
SELECT e1.ename "����" , e2.ename "�����" 
FROM emp e1  , emp e2 
WHERE e1.mgr = e2.empno(+);

SELECT e1.ename "����" , e2.ename "�����" 
FROM emp e1  LEFT OUTER JOIN emp e2 
ON e1.mgr = e2.empno;

SELECT e1.ename "����" , e2.ename "�����" 
FROM emp e1  RIGHT OUTER JOIN emp e2 
ON e1.mgr = e2.empno;

SELECT e1.ename "����" , e2.ename "�����" 
FROM emp e1  FULL OUTER JOIN emp e2 
ON e1.mgr = e2.empno;
*/
-- ���� , ���Ű��� => ���Ÿ� �������� ���� �����ؼ� ���

SELECT name , saleprice
FROM customer c , orders o
WHERE c.custid = o.custid(+) ;

SELECT name , saleprice
FROM customer c LEFT OUTER JOIN orders o
ON c.custid = o.custid ;
-- 169page => ��ǥ