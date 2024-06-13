-- 2024-06-13
-- 224 page
/* 
	1. 서브쿼리
	    = 중첩 서브쿼리(조건값) => WHERE 뒤에
		= 단일행 서브쿼리 (서브쿼리의 실행 결과값 1개인 경우)
		= 다중행 서브쿼리 (서브쿼리의 실행 결과값이 여려개인 경우)
					  ------------------------------------------------
					  전체 적용 ==> IN
					  1개만 적용 => MAX / MIN
	    = 스칼라 서브쿼리 : 컬럼대신 사용
					SELECT 뒤에
	    = 인라인뷰 : 테이블 대신 사용 => FROM 뒤에
		MainQuery => 실행 결과 출력
				(SubQuery)
		=> SubQuery가 먼저 실행 => 결과값을 MainQuery로 전송 => 실행
	2. 뷰 : 235 page
		가상 테이블 => 기존의 1개이상의 테이블로부터 필요한 데이터를 추출해서 사용
		------------- 메모리에 저장이 된 상태가 아니기 때문에 보안이 뛰어나다 / 자바에서 소스코딩을 줄일 수 있다
		= 단일뷰 : 한개의 테이블에서 데이터 추출
		= 복합뷰 : 조인 , 서브쿼리 (두개 이상의 테이블에서 데이터 추출)
		= 인라인뷰 : 테이블 대신 => SELECT문장 사용
		** 생성 / 삭제 / 실제 저장 = > 데이터 저장이 아니라 => SELECT문장이 저장이 된다
		** 수정형식 / DML이 가능 => 참조하는 테이블에 영향이 있다
		    WITH CHECK OPTION / READ ONLY
		** hr계정은 뷰를 생성할 수 있는 권한이 없다
			=> 권한 부여를 받는다 => GRANT / REVOKE ==> DCL
	3. 시퀸스 : 자동 증가 번호 => PRIMARY KEY(구분)
						 ---------------- 특별한 경우가 아니면 => 번호
								     ------------- ID (중복체크)
	   *** 회원가입의 모든 테이블은 번호로 구분 (자동 증가번호)
		게시물 번호 / 영화 / GOODS번호 ... 
		=> 생성 / 삭제 => nextval / currval
					   ------------------
	------------------------------ 인덱스 / PL/SQL
	=> 데이터베이스 설계 (6장(설계방법) / 7장(정규화)) , 트랜잭션
	
*/
/*
	1. 서브쿼리 => 데이터를 통합 (조인) , SQL문장 통합
							   ----------------- 특히 자바에서 주로 사용
		SQL 문장 3개
		---------------
		   자바 실행 => SQL문장 한개로 실행되는 경우 / SQL문장 여러개 전송해서 한개의 기능
					=> 답변형 게시판 => 답변 하기 (SQL 4개) , 삭제하기 (7개)
	   		1) 연결
	   		2) SQL 전송
	   		3) 결과값 받기
	   		4) 해제

	   		1) 연결
	   		2) SQL 전송
	   		3) 결과값 받기
	   		4) 해제

	   		1) 연결
	   		2) SQL 전송
	   		3) 결과값 받기
	   		4) 해제
			--------------------- SQL문장을 1개로 통합 => MyBatis / JPA
										     -----------------

	   1) 225 page
		중첩질의 => WHERE뒤에 조건값을 얻어 온다

		1조 일정관리 => 영화예매 일정관리
		2조 도서관리 => 판매 (장바구니)
		3조 인사관리 => 쇼팡몰 인사 관리 - 실시간 상담(채팅) , 실적 : 10000개의 스토어 ,    일반(사원한테 채팅 , 사원-> 실적+1) , 사원 
*/
-- 단일행 서브쿼리 => 서브쿼리의 결과값이 1개
-- 1. emp(사원 정보) => 급여가 전체 사원 급여 평균보다 작게 받는 사원의 목록
SET LINESIZE 300
set timing on
-- 1) 평균
	SELECT ROUND(AVG(sal)) FROM emp;
-- 2) 대입 => 연산자
	SELECT * FROM emp WHERE sal < 2073;
-- 3) 통합
	SELECT * FROM emp WHERE sal< (SELECT ROUND(AVG(sal)) FROM emp);

-- 2. 평균 주문금액 이하로 주문된 책의 주문번호 , 금액  출력
-- 1) 주문 금액의 평균
	SELECT ROUND(AVG(saleprice)) FROM orders;
-- 2) 주문 평균이하의 책 정보
	SELECT * FROM orders WHERE saleprice <= 11800;
--3) 통합
	SELECT orderid , saleprice FROM orders WHERE saleprice <= (SELECT ROUND(AVG(saleprice)) FROM orders);
-- 문제) SCOTT가 있는 부서에서 근무하는 사원의 모든 정보를 출력한다
-- 1)
	SELECT deptno FROM emp WHERE ename = 'SCOTT';
-- 2)
	SELECT * FROM emp WHERE deptno = 20;
--3)
	SELECT * FROM emp WHERE deptno = (SELECT deptno FROM emp WHERE ename = 'SCOTT');
-- emp => A자 포함된 사원의 부서에서 근무하는 사원의 모든 정보 출력
SELECT deptno FROM emp WHERE ename LIKE '%A%';
-- 데이터가 여러개 출력 => 다중행 서브쿼리 
-- 전체 사원 목록 출력
SELECT * FROM emp WHERE deptno IN (10,20,30);
-- 부서번호중에 가장 큰 부서
SELECT * FROM emp WHERE deptno <= ANY(SELECT DISTINCT deptno FROM emp WHERE ename LIKE '%A%');
-- 가장 작은 부서
SELECT * FROM emp WHERE deptno >= ANY(SELECT DISTINCT deptno FROM emp WHERE ename LIKE '%A%');

-- ANY(10,20,30) < ANY(10,20,30) ==> <ANY는 최대값
-- ANY , ALL , SOME은 여러개중에 1개만 선택 => 최대 , 최소 => > <