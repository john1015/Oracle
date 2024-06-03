-- 2024-06-03
/*
	자바 오라클 HTML / CSS JAVASCRIPT
	------------------------------------------- + 통합 (Spring)
       연결(JDBC)  JSP AJAX(JUQUEY) 

	Spring-Boot / HTML /CSS / JavaScript (React) + Python => 추천 (KNN) ANN 예측 .....
	-------------	   ------------------------------------
	서버		   클라이언트
	
*/

-- 비교연산자 (= , <> , < ,> <= ,>=) => WHERE뒤에 조건문으로 활용
-- = 상세보기 , 로그인 ... 문자/숫자/날짜 ==> =를 이용해서 비교한다
-- 1. 급여가 1500인 사원의 모든 정보
-- SELECT * FROM emp  WHERE sal=1500;
-- 2 급여가 3000인 사원의 이름 , 급여 , 직위
-- SELECT ename , sal , job FROM emp WHERE sal =3000;
-- <> => 같지 않다
-- 3. 사원중에 직위가 사원이 아닌 사원의 모든 출력
-- SELECT * FROM emp WHERE job<>'CLERK';
-- 4. 사원중에 부서가 10번이 아닌 사원의 모든 정보
/*
	데이터베이스의 단점 
	=> 같은 내용을 출력 => 여러개의 sql문장이 있다
					  --------------------------- 프로그램은 1가지 경우의 수 => 외우기
	=> 요청시에 필요한 데이터 추출
	    -------------------------------
	    => 최적화
SELECT * FROM emp WHERE deptno!=10;
SELECT * FROM emp WHERE deptno^=10;
SELECT * FROM emp WHERE deptno<>10;
SELECT * FROM emp WHERE deptno NOT IN (10);
SELECT * FROM emp WHERE deptno NOT LIKE '10%';
SELECT * FROM emp WHERE NOT deptno=10;
SELECT * FROM emp WHERE SUBSTR(deptno,1,1)=1;
*/
-- > 크다
-- 사원중에 급여가 2500보다 많이받는 사원의 이름 , 급여
SELECT ename , sal FROM emp WHERE sal>2500;
-- < 작다
SELECT ename , sal FROM emp WHERE sal<2500;
-- >= 크거나 같다
SELECT ename , sal FROM emp WHERE sal >= 3000;
-- <= 작거나 같다
SELECT ename , sal FROM emp WHERE sal <= 1500;
-- WHERE : if 문장이다 ,SELECT : for 문 => table => ArrayList => ROW => class Sawon
-- 오라클 => 강제로 지우지 않는 이상 지워지지 않는다
-- SQL문장을 사용하기 전까지 데이터를 확인 할 수 없다 
