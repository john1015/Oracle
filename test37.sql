-- 2024-06-13
-- 복합뷰 : 두개 이상의 테이블을 연결해서 사용 => 소스가 간결해 진다

CREATE OR REPLACE VIEW emp_view
AS
SELECT empno , ename , job , hiredate , sal , dname , loc , grade
FROM emp,dept,sal,grade
WHERE emp.deptno = dept.deptno
AND sal BETWEEN losal AND hisal;

SELECT text FROM user_views WHERE view_name='EMP_VIEW';
DROP VIEW emp_view;