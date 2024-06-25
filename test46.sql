--2024-06-25
-- Function / Procedure
/*
	FUNCTION  : 함수 => 리턴형 (결과값 1개) => 사용 : SELECT => 라이브러리(내장함수)
	=> ROW단위 (단일행 함수)
	SELECT 함수() ....
	형식)
		CREATE [OR REPLACE] FUNCTION func_name(매개변수 ..) RETURN 데이터형
		IS|AS
		  변수 선언
		BEGIN
		  구현
			RETURN 값;
		END;
		/
		=> 복잡한 쿼리 문장 : JOIN / SUBQUERY
*/
-- JOIN
-- 1차 프로젝트 : SQL문장에 활용 => 최대한 SQL문장을 구현 => MVC구조 => 주력
-- 2차 프로젝트 : Spring기능을 익히는데 주력(보안 , 스케쥴) + Front-End (VueJS)
-- 3차 프로젝트 : 최신 기술 => 지원 자격 조건

SET LINESIZE 300

SELECT empno , ename , job , hiredate , dname ,loc
FROM emp,dept
WHERE emp.deptno = dept.deptno;

-- SUBQUERY
SELECT empno , ename , job , hiredate ,(select dname from dept where emp.deptno = deptno) dname , (select loc from dept where emp.deptno = deptno) loc 
FROM emp;

-- 함수
CREATE OR REPLACE FUNCTION getDname(vDeptno emp.deptno%TYPE) RETURN VARCHAR2
IS
 vDname dept.dname%TYPE;
BEGIN
	SELECT dname INTO vDname
	FROM dept
	WHERE deptno = vDeptno;
	RETURN vDname;
END;
/

CREATE OR REPLACE FUNCTION getLoc(vDeptno emp.deptno%TYPE) RETURN VARCHAR2
IS
 vLoc dept.loc%TYPE;
BEGIN
	SELECT loc INTO vLoc
	FROM dept
	WHERE deptno = vDeptno;
	RETURN vLoc;
END;
/


select empno , ename , getDname(deptno) "dname" , getLoc(deptno) "loc"
from emp;

-- 삭제
DROP FUNCTION getDname;
DROP FUNCTION getLoc;