-- 2024-06-10
-- JOIN (INNER JOIN) => 교집합 (같은 값이나 , 포함된 값)
-- 단점은 NULL값을 처리하지 못한다 => NULL값인 경우애도 처리 (OUTER JOIN)
-- 테이블 => 원자값 , 중복제거 => 테이블이 여러개로 분산 => 연결해서 데이터를 가지고 온다 => 조인
/*
	=> 정규화 : 5정규화 => 3정규화
	hobby
	운동 , 낚시 , 등산 , 게임 , 독서
	hobby
		운동
		낚시
		등산
		게임
		독서 => 수정 / 삭제 / 추가
*/
-- 같은 테이블에서 데이터 추출 => SELF JOIN => 반드시 별칭을 사용
-- 사수 => 이름(사번) => 사수명 확인
-- LEFT OUTER JOIN
-- 같은 테이블에서 조인이 가능하다
-- 컬럼명이 동일하지 않는 경우도 있다 => 반드시 데이터값이 동일한 내용이 있어야 한다
-- 테이블이 나눠진 경우에는 보통 => 같은 컬러명을 참조한다
-- id => 모든 정보를 읽어온다
-- 테이블은 반드시 => 회원가입부터 제작
SELECT e1.ename "본인" , e2.ename "사수명"
FROM emp e1 ,emp e2
WHERE e1.mgr = e2.empno(+);

-- 고객과 고객이 주문한 데이터를 고객별로 정렬해서 출력
-- customer / orders
select * from customer c , orders o where c.custid = o.custid order by c.custid asc;

-- 고객별로 주문한 모든 도서의 총판매액 , 고객별 정렬
select name , SUM(saleprice)
from customer c , orders o
where c.custid = o.custid
group by name
order by name;
-- 167page
-- 고객의 이름과 고객이 주문한 도서와 금액을 출력하시오
-- customer       orders             book
select name , bookname , price
from customer c , orders o , book b
where c.custid = o.custid and o.bookid = b. bookid;
-- 168page
-- 20000이상인 도서만
select name , bookname , price
from customer c , orders o , book b
where c.custid = o.custid and o.bookid = b. bookid and price >= 20000;

