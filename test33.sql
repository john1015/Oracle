-- 2024-06-12
-- 222 page ROWNUM => ��ROW���� �ڵ����� ���� => 1 ....
/*
SELECT empno , ename , job , hiredate , sal , rownum
FROM emp;
*/
-- ���뵵 : ������ ������ , �α���� TOP10 ,  => �󼼺��� => ���� / ����
-- 1. 5���� ���
SELECT empno , ename , job , hiredate , sal , rownum
FROM emp
WHERE rownum <=5;

--2. �޿��� ������� ������ 5�� , rownum�� ���� ���� -> �ζ��κ� => rownum �� TOP-N -> �߰����� ������ �Ұ���
SELECT empno , ename , job , hiredate , sal , rownum
FROM  (SELECT empno ,ename , job , hiredate , sal  FROM emp ORDER BY sal DESC )
WHERE rownum <=5;

/*
	�������� = ��������
				=> ����
			<=  ���� ����� ���������� ����
	=> ������� �޾Ƽ� �������� ����
	-----------------------------------------
	�������� ���� : 225page => ����(������ ����) , ��������(SQL���� ����)
	----------
	�Ϲ� �������� = WHERE�ڿ� ���ǿ� �ش�Ǵ� ��
		= ������ �������� (����� 1��)
			=> ������ ���
		= ������ �������� (����� ������)
			=> ���ÿ� ó�� => in(select ~~)
			=> �ִ밪 => <ANY(select ~~)
					     >ALL(select ~~)
			=> �ּҰ� => >ANY(select ~~)
					     >ALL(select ~~)
	��Į�� �������� = SELECT �ȿ� => �÷���� ���
				  SELECT (SELECT~~) "��Ī"
	�ζ��κ� = SELECT ~
			FROM (SELECT ~~) => ���̺� ��� ���
		
*/
--��� ���̺� => ��� , �̸� , ���� , �Ի��� , �μ����̺� => �μ��� , �ٹ���
SELECT empno , ename , job  , dname , loc
FROM emp , dept
WHERE emp.deptno = dept.deptno;
-- �������� �̿�
SELECT empno , ename , job  , (SELECT dname FROM dept WHERE deptno = emp.deptno) "dname" , (SELECT loc FROM dept WHERE deptno = emp.deptno) "loc" 
FROM emp;
/*
	FROM emp => �޸𸮿��� ���� �о�´�
*/

SELECT empno , ename , job  , (SELECT dname FROM dept WHERE deptno = e.deptno) "dname" , (SELECT loc FROM dept WHERE deptno = e.deptno) "loc" 
FROM (SELECT * FROM emp) e;
/*
	�����͸� ������Ŀ� ��µ� ���뿡�� ������ ����
	������ �پ�� / ������ ���� => VIEW(�������̺�)
	=> SQL������ ������� => �� ���߽ÿ� �ڹٷ� �ڵ��� �����ϴ�
						------------------------------------------''''
						���ڿ��� ������� �ʰ� �ڹٿ��� ó�� => MyBatis  (XML)
													---------------------- ��ȣ
						SQL������ �ڵ����� �ذ��ϴ� ���̺귯�� => JPA
						findByLikeName(String name) => WHERE name LIKE '%'+'name'+'%'
*/
