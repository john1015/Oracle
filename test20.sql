-- 2024-06-10
-- => GROUP BY => 집계함수 사용법
-- JOIN => LOGIN 처리(실무 프로젝트)
/*
	GROUP : 그룹별 통계 => SELECT문장에 포함
	SELECT * | coulmn1 ...
	FROM  table_name
	[
		WHERE 조건절 => 집합함수 사용이 불가능
		GROUP BY 그룹설정 => 컬럼에 같은 값 => 컬럼설정 | 함수 => 예) 부서별 , 입사년도 , 직위 ...
		HAVING 그룹에 대한 조건 => 집합함수 사용이 가능
		ORDER BY 컬럼 | 함수 => ASC | DESC => ASC는 생략이 가능
				------------ 컬럼의 번호 => 오라클은 번호가 1번부터 시작
						1	   2		3
				SELECT empno , ename , deptno
				SELECT * => 오라클에서 테이블에 저장된 순서
						1	   2	    3	    4	      5		 6	  7	    8
					   empno , ename , job , mgr , hiredate , sal , comm , deptno
	]
	=> 집합함수의 종류
	     ---------- 컬럼단위로 통계
	    1. COUNT => ROW의 개수 확인 => 로그인 , 아이디 중복 , 검색결과 , 장바구니
	    2. MAX , MIN => coulmn중에 최대값 , 최소값
	       ------ 가장 증가 번호
	    3. SUM / AVG => 컬럼의 합 / 평균
	       ------ 구매 내역의 총합
	    4. RANK() / DENSE_RANK() => 순위 결정
	    5. => COLUMN단위의 통계 O => ROW단위 통계는 없음 X
		--------------------------------------------------------
			name       kor       eng      math
		--------------------------------------------------------
			홍길동      90         90         90		=> 기본은 산술연산자를 이용한다
		--------------------------------------------------------
			심청이      80         80         80
		--------------------------------------------------------
			박문수      70         70         70
		--------------------------------------------------------
			               240       240       240   => SUM(컬럼명) => SUM(kor)
			               80         80         80
			=> CUBE / ROLLUP => ROW/COLUMN을 동시에 총계 => 사용시에는 반드시 GROUP BY
		   ***집합 함수의 단점 => 일반 컬럼 , 단일행함수하고 동시에 사용이 불가능
						    -------------------------- 반드시 GROUP BY를 이용해서 사용한다
						    => 집합 함수는 독립적으로 사용이 가능
			예) SELECT deptno , AVG(sal) , SUM(sal) => 오류
					--------
			     SELECT  AVG(sal) , SUM(sal) => 가능
			     SELECT deptno , AVG(sal) , SUM(sal) 
					--------
			     FROM   emp
			     GROUP BY deptno   
					    ---------
			     SELECT deptno , job , AVG(sal) , SUM(sal)
						    ----
			     FROM emp
			     GROUP BY deptno ==> 오류

			     SELECT deptno , job , AVG(sal) , SUM(sal)
						    ----
			     FROM emp
			     GROUP BY deptno,job ==> 정상

			     순서
			     		SELECT 	------- 5
			     		FROM 	------- 1
			     		WHERE 	------- 2
			     		GROUP BY 	 ------ 3
			     		HAVING 	------- 4
			     		ORDER BY 	 ------ 6
			     ----------------------------------------

*/
-- 급여의 합 / 급여의 평균
/*
SELECT SUM(sal) , AVG(sal)
FROM emp;
*/
-- 10 번 부서의 급여의 합 / 평균
/*
select sum(sal) , avg(sal) from emp where deptno = 10;
select sum(sal) , avg(sal) from emp where deptno = 20;
select sum(sal) , avg(sal) from emp where deptno = 30;*/
select deptno , sum(sal) , avg(sal) from emp group by deptno order by 1 asc;
-- 직귀 별로 사원수 , 급여평균 , 급여 합 , 최대값 , 최소값

select job , count(*) , AVG(sal) , SUM(sal) , MAX(sal) , MIN(sal) from emp group by job;
-- 입사년도별로 사원수 , 급여평균 , 급여합 , 최대값 , 최소값
select TO_CHAR(hiredate,'YYYY') , count(*) , AVG(sal) , SUM(sal) , MAX(sal) , MIN(sal) from emp group by TO_CHAR(hiredate,'YYYY') order by TO_CHAR(hiredate,'YYYY');
-- 입사요일별 사원수 , 급여평균 , 급여합 , 최대 , 최소값
select TO_CHAR(hiredate,'DY') , count(*) , AVG(sal) , SUM(sal) , MAX(sal) , MIN(sal) from emp group by TO_CHAR(hiredate,'DY');
-- 구매 => 어떤요일에 구매가 많은지

/*

	Orders : 구매현황
	ORDERID                                               NOT NULL NUMBER(2)
 	CUSTID                                                         NUMBER(2)
 	BOOKID                                                         NUMBER(2)
 	SALEPRICE                                                      NUMBER(8)
 	ORDERDATE                                                      DATE

	Book : 책정보 저장
	BOOKID                                                NOT NULL NUMBER(2)
 	BOOKNAME                                                       VARCHAR2(40)
 	PUBLISHER                                                      VARCHAR2(40)
 	PRICE                                                          NUMBER(8)

   	
	Customer : 회원 정보
	CUSTID                                                NOT NULL NUMBER(2)
 	NAME                                                           VARCHAR2(40)
 	ADDRESS                                                        VARCHAR2(50)
 	PHONE                                                          VARCHAR2(20)
*/
-- 고객이 주문한 도서의 총 판매액 => 쇼핑몰
select TO_CHAR(sum(saleprice),'L9,999,999') as 총매출 from orders;
-- 2번 고객의 주문 도서의 총 판매액
select TO_CHAR(sum(saleprice),'L9,999,999') as Total from orders where custid = 2;
-- 2번 고객의 정보
select name,address,phone from customer where custid=2;

-- 총 판매액 , 평균 , 최소 , 최대 , 구매인원
select sum(saleprice) , avg(saleprice) , min(saleprice), max(saleprice), count(*) from orders;
-- 고객별 ,총 판매액 , 평균 , 최소 , 최대 => group by
select custid , sum(saleprice) , avg(saleprice) , min(saleprice), max(saleprice) from orders group by custid order by 1 asc;

-- having을 이용해서 처리 => group by가 있는 경우에만 사용이 가능 => 집합함수를 이용할 수 있다
-- where문장에서는 집합합수 이용이 불가능하다 => where문장에서 집합함수를 이용한다면 => 서브쿼리를 이용한다
/*
	데이터 검색 : select
	1. 형식 / 순서
	2. 연산자 종류
	3. 내장 함수
	4. GROUP별 처리 => 통계(집계)
	5. 테이블 연결 => 조인 (두개이상의 테이블에서 필요한 데이터 추출)
	6. SQL문장 연결 => SQL문장 여러개 => 한개 통합 => 서브쿼리(부속질의)
	데이터 추가 : INSERT => 2개
	데이터 수정 / 데이터 삭제 : UPDATE , DELETE => 1개
	---------------------------------------------------------------------------------- CRUD
	테이블 생성 : 제약조건 , 가상테이블 생성 (View) , 자동 증가번호 생성(SEQUENCE) , 속도 최적화(INDEX)
	=> 재사용 기법 : 함수(FUNCTION,PROCEDURE) => 자동 처리 (TRIGGER)
*/
-- HAVING => GROUP BY 에서만 사용하는 그룹조건
SELECT deptno , COUNT(*) , SUM(sal) , AVG(sal)
FROM EMP
GROUP BY deptno
ORDER BY deptno ASC;
-- 부서별로 전체 급여평균보다 많이 받는 부서만 출력
SELECT deptno , COUNT(*) , SUM(sal) , AVG(sal)
FROM EMP
GROUP BY deptno
HAVING AVG(sal)>2073
ORDER BY deptno ASC;

SELECT deptno , COUNT(*) , SUM(sal) , AVG(sal)
FROM EMP
GROUP BY deptno
HAVING COUNT(*)>3
ORDER BY deptno ASC;

--가격이 8000이상이고 , 2권이상 구매한 고객을 출력
SELECT custid , COUNT(*)
FROM orders
WHERE saleprice>= 8000
GROUP BY custid
HAVING COUNT(*)>=2;
/*
	주의사항
	GROUP BY => 컬럼단위로 묶어서 사용이 가능하다
			     ----------
	=> SELECT - FROM - WHERE - GROUP BY - HAVING - ORDER BY
		5	      1		  2		 3		  4		6
*/
