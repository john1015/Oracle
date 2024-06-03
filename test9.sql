-- 2024-06-03
-- ������ :�������� => AND  , OR
/*
	AND => ����, �Ⱓ ����
	OR => ���� ���Կ� ���� ���

	=> WHERE / HAVING => ���ǹ�
	=> WHERE �÷��� ������ �� AND �÷��� ������ ��
	=> WHERE �÷��� ������ �� OR �÷��� ������ ��
	=> �ڹٿ� ����
	   �ڹ� : && => �Է�â���� ����
		    || => ���ڿ� ����
*/
-- ����߿� �޿��� 1500 ~ 2500 ������ �޿��� �޴� ����� ��� ������ ���
SELECT * FROM emp WHERE sal >=1500 AND sal <= 2500;
-- ����߿� �μ���ȣ�� 20�̰ų� 30����� ��� ����
SELECT * FROM emp WHERE deptno = 20 OR deptno = 30;
-- ����� �̸��߿� C�� K���̿� �ִ� ��� ����� ������ ���
SELECT * FROM emp WHERE ename >= 'C' AND ename <= 'K';
-- ����߿� 1981�⿡ �Ի��� ����� ��� ������ ���
SELECT * FROM emp WHERE hiredate>='1981/01/01' AND hiredate <='1981/12/31';
SELECT * FROM emp WHERE hiredate Like '81%'; 
--------------------------------------------------------���� �����ؼ� ���� (����)
-- BETWEEN ~ AND => hiredate>='1981/01/01' AND hiredate <='1981/12/31'
-- ������ �ȴ� BETWEEN 1500 AND 300 => 1500 ���� , 3000 ����
-- ������ �� ������ ���� ����
-- ����� �޿��� 2000 �̻� 3000���� ������ �޿��� �޴� ��� ����� ������ ���
SELECT * FROM emp WHERE sal >= 2000 AND sal <= 3000;
SELECT * FROM emp WHERE sal BETWEEN 2000 AND 3000;

-- IN => OR�� ������ �ִ� ��� => ��ü�ϴ� ������
/*
	SELECT * 
	FROM emp
	WHERE empno=7698 OR empno=7782 OR empno = 7566 OR empno = 7902 OR empno = 7788;

	SELECT *
	FROM emp
	WHERE empno IN(7698,7782,7566,7902,7788); 
	------------------------------------------------------- 2�� �̻��϶� (����)
*/
-- NULL ������ => NULL�� �����Ͱ� ���� �÷� => ������ �ȵȴ�
-- IS NULL => comm = null(x) => comm is null => null �� ���
-- IS NOT NULL => comm! = null => comm is NOT NULL => null �� �ƴ� ���
SELECT * FROM emp WHERE mgr IS NULL;

-- �������� �޴� ����� ��� ����
SELECT * FROM emp WHERE comm IS NOT NULL AND comm <> 0;
SELECT * FROM emp WHERE comm IS NULL OR comm = 0;

-- LIKE : �˻� �� ��
/*
	& => ���ڿ��� ������ �𸣴� ��� ==> ���ڿ��� ������ ���X
	_ => ���ڿ��� ������ �˰� �ִ� ��� ==> ���� �Ѱ�

	___K => 4����
	%K => ���ڼ��� �� �� ����
	=> REGEXP_LIKE() => �Լ������� ����
	     --------���Խ� [A-Z]
	=> �빮�� ���ĺ� ����
		'A%' OR 'B%' ... OR 'Z%'
		[A-Z]

		*** A�� �����ϴ� �̸� => 'A%'  => �ڵ� �ϼ���
		A�� ������ �̸� => '%A'
		A�� �����ϰ� �ִ� �̸� => '%A%'
		A�� 3��° �ִ� �̸� => '__A%'
		---------------------------- 5���� => '__A__' ���ڼ��� ����(_) ������ ���� ��� (%)		
*/
--����߿� A�� �����ϴ� ��� ����� ������ ���
SELECT * FROM emp WHERE ename LIKE 'A%';
SELECT * FROM emp WHERE ename LIKE 'Z%';
-- ����߿� EN / IN���� ������ ���
SELECT * FROM emp WHERE ename LIKE '%EN' OR ename LIKE '%IN';
SELECT * FROM emp WHERE REGEXP_LIKE(ename,'EN|IN');
-- A�� �����ϴ� �̸��� ���� ����� ��� ����
SELECT * FROM emp WHERE ename LIKE '%A%';
-- zipcode���� dong���� ������ �����ϴ� ��� �����ȣ�� ���
-- SELECT * FROM zipcode WHERE dong like '%����%';
-- ����� �̸��߿� 5���� => ��� O�� ����� ��� ������ ���
SELECT * FROM emp WHERE ename like '__O__';
SELECT * FROM emp WHERE ename like '__R___';
SELECT * FROM emp WHERE ename like '%R%';

