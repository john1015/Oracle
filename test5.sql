-- 129 page => 테이블의 컬럼 설명 / 데이터
/*
	BOOK / Customer / Orders
	책정보  회원정보   책구매 현황
	-----------------------------------
	EMP  	/ 	 DEPT  ==> 오라클에서 제공하는 연습 테이블
	사원정보		부서정보 => 명령문 => 데이터 추출
	EMP => 8개 컬럼
	  = empno : 사번 => 구분자 (중복이 없다) => 한명에 대한 정보 => empno를 이용한다
				   PRIMARY KEY (모든 테이블은 무결성 원칙 => 한개이상을 가지고 있다)
	 = ename  : 이름
	 = job : 직위
	 = mgr : 사수 사번
	 = hiredate : 입사일 
	 = sal : 급여
	 = comm : 성과급
	 = deptno : 부서번호 => 조인
	DEPT => 3개 컬럼
	 = deptno : 구분자 (중복이 없다) => 부서검색 (상세)
	 = dname : 부서명
	 = loc : 근무지

	*** SQL의 작성시 주의점
	1. 명령문이 종료가 되면 ;
	2. 문자열 : '문자열'
	3. 날짜 : 'YY/MM/DD'
	4. 컬럼명은 길거나 / 잘 모르는 경우 => 별칭
	 컬럼명 as 별칭 / 컬럼명 "별칭" = 인용문장
					 ---------
	5. 키워드는 대문자로 나머지 소문자
	   -------------------    --------------- 컬럼명 , 테이블명 => 자바 구현이 편하다
	6. SELECT ~
	   FROM ~
	   WHERE ~ ;
	7. 계정 / => 사용자 계정
	    system : 사용권한 / 해제 ...	 
	    hr : 사용자 계정 => 필요한 테이블
	---------------------------------------------------------------------------------------------
	142page
	----------
	SQL(구조화된 질의 언어 => 명령문으로만 되어 있다)
	----
	       = DQL : 테이블로부터 데이터 추출 : SELECT
	       = DML : 데이터 조작 : INSERT , UPDATE , DELETE
	       = DDL : 정의 언어(테이블 생성 , 뷰 생성 , 자동증가 번호 , 인덱스...)
			CREATE / ALTER / DROP / RENAME / TRUNCATE
	       = DCL : 제어언어 (권한부여 , 권한 해제) ==> system으로 처리
			GRANT / REVOKE
	       = TCL : 트랜잭션 언어 (일괄처리 => 저장 , 명령문 취소)
			COMMIT / ROLLBACK
	    => 재사용 PL / SQL => 함수
		FUNCTION / PROCEDURE / TRIGGER

	1. DQL => 테이블로부터 데이터 추출
	  = 명령문
		= 전체 데이터를 가지고 온다 (*)
		= 필요한 데이터만 가지고 온다 (column_list)
		*** SELECT
			1) 컬럼으로 사용 => 스칼라 서브쿼리 => 조안 대신 사용
			2) 조건으로 사용 => 서브쿼리
			3) 테이블 대신 사용이 가능 => 인라인 뷰
				=> 가공해서 데이터를 가지고 올 수 있다 => 내장 함수
		SELECT * | column1,column2 ...
		FROM table_name(view_name , SELECT ~(인라인 뷰))
		--------------------------------------------------------------- 필수
		[
			WHERE 조건문 => 연산자 
			GROUP BY 그룹 컬럼
			HAVING 그룹 조건
			ORDER BY 컬럼명 (ASC | DESC) => 정렬 (올림 / 내림)
					=> ASC는 생략이 가능
		]
		SELECT FROM WHERE
		SELECT FROM GROUP BY
		SELECT FROM WHERE ORDER BY
		==> 데이터 추출하는 방법
			1. 형식 (문법) => 명령문 순서
			2. 연산자 
			3. 내장함수
			------------------------ SUBQUERY / JOIN
		1. 중복없는 데이터 추출
			=> DISTINCT
		2. 별칭
			=> 컬럼명 뒤에  "별칭"
		3. 문자열 결합
			=> ||
		4. 문자열 => 반드시 ' '
		5. 문장이 종료 => ;
*/
-- emp의 전체 데이터 출력
-- SELECT * FROM emp ;
-- 원하는 데이터만 추출 => column_list 를 이용한다 사번 / 이름 / 직위 / 입사일 / 급여
-- SELECT empno , ename , job , hiredate , sal FROM emp;
-- 모르는 컬럼은 별칭을 부여한다 - 한글사용시 ansi로 저장
-- SELECT empno "사번" , ename "이름" , job "직위" , hiredate "입사일" , sal "급여" FROM emp;
-- SELECT empno as 사번 , ename as 이름 , job as 직위 , hiredate as 입사일 , sal as 급여 FROM emp;
-- EMP테이블에 있는 부서를 출력 => deptno
--SELECT deptno FROM emp;
-- 중복 제거
-- SELECT DISTINCT deptno FROM emp;
-- 문자열 결합 : || => ' '를 사용한다
SELECT ename ||'사원의 직위는'|| job || '입니다' from emp;
