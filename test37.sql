-- 2024-06-13
-- ���պ� : �ΰ� �̻��� ���̺��� �����ؼ� ��� => �ҽ��� ������ ����

CREATE OR REPLACE VIEW emp_view
AS
SELECT empno , ename , job , hiredate , sal , dname , loc , grade
FROM emp,dept,sal,grade
WHERE emp.deptno = dept.deptno
AND sal BETWEEN losal AND hisal;

SELECT text FROM user_views WHERE view_name='EMP_VIEW';
DROP VIEW emp_view;