-- 2024-06-11 JOIN => SUBQuery (170page)
-- DDL / DML
/*
	JOIN => 테이블을 연결해서 필요한 데이터 추출
					       -----------------------
	SubQuery => SQL문장여러개를 한개의 SQL로 연결 (SQL문장)
		=> 자바에서 오라클 연결할 때 => 한번 실행을 해서 속도를 최적화
		=> 테이블이 다른 경우에서 가능
	JOIN
	------
		= 한개의 SQL 명령어에 의해서 여러개의 테이블에 저장된 데이터를 한번에 조회하는 기능
		   ---------------------		  -------------------------------------------------------
		= 두개이상의 테이블을 결합
		   EMP				DEPT
		----------			    ------------
		ename  job			     daname   loc
					+
				EMP + DEPT
		-------------------------------------------------
			ename  job  dname  loc    ==> SELECT는 가상의 테이블
		-------------------------------------------------
		1. 종류
		   INNER JOIN : 교집합 (같은 값일때 데이터 추출)
			= 같은 값이 있는 경우에 처리 (동등 조인) ==> EQUI_JOIN (사용하는 연산자 =)
			     *** 조인은 SELECT에서만 사용이 가능 , 서브쿼리는 모든 DML에서 사용이 가능
			     *** 실무 : CRUD (SELECT , INSERT , UPDATE , DELETE)
			     		  => 데이터형 / 제약조건 / View / Sequence / Index
			     		  => 요청 : 게시판 , 댓글 , 페이징 기법
			     ***1) Oracle JOIN
				    SELECT A.col , B.col => 구분한다 (기본) => 컬럼명이 다른 경우는 생략이 가능
				    FROM A,B
				    WHERE A.col = B.col
						     ----
				    ** 다른 컬럼은 구분할 필요가 없고 같은 이름의 컬럼일 경우에는 구분
					구분 : 테이블명.컬럼
						 별칭.컬럼
					테이블 별칭
					   => FROM A a;
							    -- 별칭 => 테이블명이 긴 경우에 주로 사용
			     ***2) ANSI JOIN => 표준 조인 => 모든 데이터베이스에서 사용이 가능
										  ---------------- MySQL / MariaDB => 중형 디비
										  ---------------- DB2 / 사이베이스 => 대용량 데이터베이스
										  ---------------- 몽고디비 / 카산드라 => NoSQL
				    SELECT A.col , B.col
				    FROM A JOIN B
				    ON A.col = B.col;
			    ------------------------ 컬럼명이 다를수도 있다
			     3) NATURAL JOIN : 자연조인 => 자동으로 같은 컬럼을 찾아서 결합을 한다
									  -----
				    SELECT col1 , col2 ... => 컬럼을 구분하지 않는다
				    FROM A NATURAL JOIN B;
			     4) JOIN USING 
				    SELECT col1 , col2 ... => 컬럼 구분 X
				    FROM A JOIN B USING(같은 컬럼명);
			    ------------------------ 컬럼명이 동일
			= 포함된 값이 있는 경우에 처리 (비동등 조인) ==> NON_EQUI_JOIN (=외의 연산자) => AND , BETWEEN
			   조건문
			   ------- =을 사용하지 않는다
			   WHERE sal BETWEEN losal AND hisal
			   ON sal BETWEEN losal AND hisal
			*** 조건문이 여러개인 경우
				=> AND => 조인 조건 AND 다른 조건
		   OUTER JOIN = (JOIN : INTERSECT , OUTER JOIN : INTERSECT + MINUS)
		   -------------- NULL값을 포함 / 관리자 페이지
			= LEFT OUTER JOIN
				10	10
				20	20
				30	30
				40	
			   1) Oracle JOIN
				SELECT A.col , B.col
				FROM A,B
				WHERE A.col = B.col(+);  => LEFT

				SELECT A.col , B.col
				FROM A,B
				WHERE A.col(+) = B.col;  => RIGHT
			   2) ANSI JOIN
			= RIGHT OUTER JOIN
				10	10
				20	20
				30	30
				  	40
				SELECT A.col , B.col
				FROM A LEFT OUTER JOIN B
				ON A.col = B.col;  => LEFT

				SELECT A.col , B.col
				FROM A RIGHT OUTER JOIN B
				ON A.col = B.col;  => RIGHT
			= INNER JOIN에서 처리 못하는 데이터 추출을 보완 => OUTER JOIN
			= 테이블이 정규화를 이용하기 때문에 많이 나눠진다
				=> 수정 / 삭제 / 추가를 편하게 만든다
				댓글형 게시판
				----------------
				  게시판 + 댓글 => 동시에 처리 => 게시판 입력과 동시에 댓글까지 추가
				  -------     ----- => 처리가 편리하게 기능별로 분리(정규화)
		170page => 부속질의 (서브쿼리)
		=> JOIN : 데이터 연결
		=> SubQuery : SQL문장을 연결해서 사용
		    사용위치
			= SELECT (SELECT ~) => 스칼라 서브쿼리 => 컬럼대신 사용이 가능 => JOIN대신 사용할수 있다
			= FROM (SELECT ~) => 인라인 뷰 => 테이블 대신 사용 => 보안이 뛰어나다
						    => 페이징 기법
			= WHERE 컬럼명 = (SELECT ~) => 서브쿼리
						    ------------
							= 단일행 서브쿼리
							= 다중행 서브쿼리
*/
-- 예) 사원 (EMP)중에 급여가 전체 급ㅇ여평균보다 많이 받는 사원의 이름 , 급여 추출
SELECT ROUND(AVG(sal)) FROM emp;

SELECT ename , sal
FROM emp
WHERE sal > 2073;


SELECT ename , sal
FROM emp
WHERE sal > (SELECT ROUND(AVG(sal))
		    FROM emp);
-- 서브쿼리 = 결과값을 받아서 MainQuery 실행
-- 2. KING과 같은 부서에서 근무하는 사원 출력 (이름 , 부서번호 , 직위)
-- 1) KING 부서 확인
SELECT deptno
FROM emp
WHERE ename = 'KING';
-- 2) 부서의 사원 출력
SELECT ename
FROM emp
WHERE deptno =10;
--3) 서브쿼리
SELECT ename
FROM emp
WHERE deptno = (SELECT deptno
			FROM emp
			WHERE ename = 'KING') AND ename NOT IN 'KING';
-- 다른 테이블 연결리 가능
-- DALLAS에서 근무하는 사원의 이름 , 직위 , 부서번호
SELECT ename , job , deptno
FROM emp
WHERE deptno = (SELECT deptno
			  FROM dept
			   WHERE loc = 'DALLAS');

-- SCOTT와 급여를 받는 사원의 이름 , 직위 ,급여 출력

SELECT ename , job , sal
FROM emp
WHERE sal = (SELECT sal
		    FROM emp
		    WHERE ename = 'SCOTT') AND ename NOT IN 'SCOTT';
-- 책중에 가장 비싼 책의 이름 가격

SELECT bookname , price
FROM book
WHERE price = (SELECT MAX(price)
		       FROM BOOK);

SELECT MAX(price) FROM book;
SELECT price FROM book;
/*
	다중행 서브쿼리 => 컬럼은 1개 => 데이터가 여러개 출력
	10 => 단일행
	10,20,30 => 다중행

	IN ==> 포함된 값 전체처리 => IN(10,20,30)
	---------------------------------------------------------- MAX , MIN값을 구해서하는게 더편리
	ANY/SOME
	      <ANY(10,20,30) ==> 30 => MAX값
	      >ANY(10,20,30) ==> 10 =< MIN값
	ALL
		<ALL(10,20,30) ==> 10 ==> MIN값
		>ALL(10,20,30) ==> 30 ==> MAX값
	-------------------------------------------------
*/
-- 부서에있는 모든 사원의 이름 , 부서번호를 출력

SELECT ename , deptno
FROM emp
WHERE deptno IN (SELECT DISTINCT deptno
			   FROM emp);

SELECT ename , deptno
FROM emp
WHERE deptno <ANY (SELECT DISTINCT deptno
			   FROM emp);

SELECT ename , deptno
FROM emp
WHERE deptno >ANY (SELECT DISTINCT deptno
			   FROM emp);

SELECT ename , deptno
FROM emp
WHERE deptno < (SELECT MAX(deptno)
			   FROM emp);

SELECT ename , deptno
FROM emp
WHERE deptno <SOME (SELECT DISTINCT deptno
			   FROM emp);

SELECT ename , deptno
FROM emp
WHERE deptno > SOME(SELECT DISTINCT deptno
			   FROM emp);
-- MAX 보다 큰
SELECT ename , deptno
FROM emp
WHERE deptno > ALL(SELECT DISTINCT deptno
			   FROM emp);
--MIN 보다 작은
SELECT ename , deptno
FROM emp
WHERE deptno < ALL(SELECT DISTINCT deptno
			   FROM emp);



