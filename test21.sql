-- 2024 - 06 - 10 => JOIN / SUBQUERY
/*
	1. 정규화를 이용한다
		=> 테이블을 나눠서 저장
		1 정규화 => 원자값만 저장한다
				  -------- 한개의 값만 가질 수 있다
					     예) 취미 => 등산 , 낚시 => 테이블을 나눠서 저장
				  id / hobby
				aaa  등산
				aaa  낚시
		2 정규화 => 중복을 제거 => 이상현상(수정 , 삭제)
			--------			------
			정보(개인)			(취미정보)
				|				|
				------ 매핑 테이블 ------
			customer			  book
			개인정보			 책정보
				|				|
				------- 구매 정보 -------
					 orders
	=> 정규화를 이용해서 테이블을 제작 => 여러개의 테이블이 나온다 => 연결해서 데이터를 추출하는 기법 => 조인
	
*/
-- 사원 정보 전체 , 부서정보 전체 => deptno : 한개만 설정
select empno , ename , job , mgr , hiredate , sal , comm, emp.deptno , dname , loc
from emp , dept
where emp.deptno = dept.deptno;

select *
from emp , dept
where emp.deptno = dept.deptno;

select *
from emp e, dept d
where e.deptno = d.deptno;

-- ansi  JOIN

select empno , ename , job ,e.deptno , dname ,loc
from emp e JOIN dept d
ON e.deptno = d.deptno;

-- natural join => 컬럼명만 사용한다
select empno , ename , job , deptno , dname ,loc
from emp  NATURAL JOIN dept;

-- JOIN ~ USING
select empno , ename , job , deptno , dname , loc
from emp JOIN dept USING(deptno);

-- 조건이 있는 경우 => AND => 사용조건 (JOIN조건) AND (다른조건)
-- 이름이 KING인 사원의 이름 , 입사일 , 부서명 , 근무지
--				   -------------------- emp ----------------- dept => 두개의 테이블을 연결해서 데이터 추출 => join
select ename , hiredate , dname , loc
from emp , dept
where emp.deptno = dept.deptno
and ename = 'KING';

--ansi
select ename , hiredate , dname , loc
from emp join dept
on emp.deptno = dept.deptno
and ename = 'KING';

-- , => JOIN , WHERE => ON 으로 변경
-- orders
select * from orders;

select ORDERID , name , bookname , SALEPRICE, ORDERDATE
from orders o , customer c , book b
where o.custid = c.custid  and o.bookid = b.bookid; 

--ansi join

select ORDERID , name , bookname , SALEPRICE, ORDERDATE
from orders o join customer c 
on o.custid = c.custid  
join book b 
on o.bookid = b.bookid; 

-- 실무 => MySQL / MariaDB => 내장함수 , 데이터형이 조금 다르다
-- EQUI_JOIN => 연산자 (=)

/*
CREATE TABLE salgrade(
	grade NUMBER ,
	losal NUMBER ,
	hisal NUMBER
);
INSERT INTO salgrade VALUES(1 , 700 , 1200);
INSERT INTO salgrade VALUES(2 , 1201 , 1400);
INSERT INTO salgrade VALUES(3 , 1401 , 2000);
INSERT INTO salgrade VALUES(4 , 2001 , 3000);
INSERT INTO salgrade VALUES(5 , 3001 , 6000);
COMMIT;
*/
-- NON-EQUI_JOIN  => 비교연산자 , 논리연산자 , BETWEEN ~ AND( = 외 연산자 사용) => 포함
-- 동등 조인 (EQUI_JOIN)/ 비동등 조인(NON-EQUI_JOIN)
-- 급여 => 호봉 출력
SELECT ename , hiredate , sal , grade
FROM emp , salgrade
WHERE sal BETWEEN losal AND hisal;

SELECT ename , hiredate , sal , grade
FROM emp join salgrade
on sal BETWEEN losal AND hisal;

-- emp(ename,job,hiredate,sal) , dept(dname,loc) , salgrade(grade) => 2중 조인
select ename , job , hiredate , sal , dname , loc , grade
from emp,dept,salgrade
where emp.deptno = dept.deptno
and sal between losal and hisal;

select ename , job , hiredate , sal , dname , loc , grade
from emp join dept
on emp.deptno = dept.deptno
join salgrade
on sal between losal and hisal;