-- 2024-06-04
-- 집합 함수 => COLUMN단위로 처리
/*
	*** COUNT : 로그인 처리 , 아이디 중복처리 , 검색 ...
	    = COUNT(*) => NULL을 포함 => ROW의 개수(저장된 개수)
	    = COUNT(컬럼) => NULL을 제외
		mgr =1 / comm = 10
		COUNT(mgr) = 13 / COUNT(comm) = 4
	       => 데이터가 있는 경우 ===> 개수 리턴
		     데이터가 없는 경우 ===> 0값 리턴
	*** MAX : 중복없는 데이터
	MIN
	*** SUM : 장바구니의 총 금액 , 물품 구매 개수
	*** AVG : 등급제 적용 => 총구매액 평균
	*** RANK : 순위
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
-- 집합함수는 컬럼이나 단일 함수를 동반할 수 없다 (가능 : GROUP BY일 경우에는 컬럼 사용이 가능)
/*
SELECT deptno , COUNT(*) "사원수" , MAX(sal) "최대 급여" , MIN(sal) "최소급여" , SUM(sal) "급여 총합" , AVG(sal) "급여 평균" 
FROM emp 
GROUP BY deptno; */
-- RANK는 집합함수가 아니다 ...
-- select ename , job , hiredate , sal , RANK() OVER(ORDER BY sal DESC) "RANK"  FROM emp;
-- select ename , job , hiredate , sal , DENSE_RANK() OVER(ORDER BY sal DESC) "RANK"  FROM emp;