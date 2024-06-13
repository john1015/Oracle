-- 2024-06-13
-- 서브쿼리 => 스칼라 서브쿼리 (컬럼 대신 사용) => 다른 테이블과 연결이 가능
/*
	조인 대신에 사용이 가능하다
*/

-- emp : ename , job , hiredate , dept : dname , loc
-- 조인
select enaem , job , hiredate , sal , dname , loc
from emp , dept
where emp.deptno  = dept.deptno;
-- 스칼라 서브쿼리의 주의점 : 반드시 단일행을 가지고 온다
-- 서브쿼리
select ename , job , hiredate , sal , (select dname from dept where deptno = emp.deptno) as dname , (select loc from dept where deptno = emp.deptno) as loc
from emp;
select * from orders;
select orderid , (select name from customer where custid = orders.custid) "name" , 
			(select bookname from book where bookid = orders.bookid) "bookname" ,
				saleprice
from orders;
-- 예약정보 / 장바구니 상품 정보 => 상품의 번호만 저장
-- 인라인 뷰 => 테이블 대신 사용
/*
	SELECT ~~
	FROM (SELECT ~~)
	=> 페이지 / Top-N (인기순위)
	주의점 )
	 SELECT ename , job , hiredate , sal
	 FROM (SELECT ename , job , sal , comm , deptno  FROM emp); ==> 오류 (hiredate가 없음)
*/
/*
SELECT empno ,ename , job ,hiredate , sal
FROM (SELECT ename , job , sal , comm , deptno FROM emp);
*/
-- rownum 오라클에서 제공하는 가상 컬럼 => 모든 테이블에 존재
-- row에 저장된 순서
SELECT empno , ename , job , hiredate , sal ,rownum
FROM emp;
-- ROWNUM 변경

SELECT empno , ename , job , hiredate , sal ,rownum
FROM (SELECT empno , ename , job , hiredate , sal FROM emp ORDER BY sal ASC) WHERE rownum <= 5;

SELECT empno , ename , job , hiredate , sal ,rownum
FROM (SELECT empno , ename , job , hiredate , sal FROM emp ORDER BY sal DESC) WHERE rownum <= 5;

-- rownum => Top-N
-- 급여가 낮은 순서로 1~5
-- 급여가 낮은순서로 6번 ~ 10번
-- 급여가 늦은 순서로 11~14
/*
SELECT empno , ename , job , hiredate , sal ,rownum
FROM (SELECT empno , ename , job , hiredate , sal FROM emp ORDER BY sal ASC) ;

SELECT empno , ename , job , hiredate , sal ,rownum
FROM (SELECT empno , ename , job , hiredate , sal FROM emp ORDER BY sal ASC) WHERE rownum BETWEEN 1 AND 5;

SELECT empno , ename , job , hiredate , sal ,rownum
FROM (SELECT empno , ename , job , hiredate , sal FROM emp ORDER BY sal ASC) WHERE rownum >= 6 AND ROWNUM<=10;

SELECT empno , ename , job , hiredate , sal ,rownum
FROM (SELECT empno , ename , job , hiredate , sal FROM emp ORDER BY sal ASC) WHERE rownum BETWEEN 11 AND 14;
*/
/*
select empno , ename , job , hiredate , sal , num
from (select empno , ename , job , hiredate , sal , rownum as num from (select empno , ename , job , hiredate , sal from emp order by sal asc)) 
where num between 1 and 5;

select empno , ename , job , hiredate , sal , num
from (select empno , ename , job , hiredate , sal , rownum as num from (select empno , ename , job , hiredate , sal from emp order by sal asc)) 
where num between 6 and 10;

select empno , ename , job , hiredate , sal , num
from (select empno , ename , job , hiredate , sal , rownum as num from (select empno , ename , job , hiredate , sal from emp order by sal asc)) 
where num between 11 and 14;
*/

SELECT no , goods_name , num
FROM (SELECT no,goods_name,rownum as num FROM (SELECT no,goods_name FROM goods_all ORDER BY no ASC)) 
WHERE num BETWEEN 1 AND 12;

SELECT no , goods_name , num
FROM (SELECT no,goods_name,rownum as num FROM (SELECT no,goods_name FROM goods_all ORDER BY no ASC)) 
WHERE num BETWEEN 13 AND 24;