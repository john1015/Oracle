 --2024-06-11
-- 서브쿼리 : 웹 프로그램 => SQL문장이 여러개인 경우 => SQL문장을 결합해서 한번에 수행
/*
	서브쿼리의 종류
	   = 일반 서브쿼리 => 조건문 처리 => WHERE
		1) 단일행 서브쿼리 (가장 많이 사용된다) => 비교연산자
		    컬럼은 자바의 변수와 동일 => 값이 1개만 설정이 가능
		    WHERE sal = 3000,2000,... => X
			       ------------
		    171page
		2) 다중행 서브쿼리 => 비교연산자 ( = , < , > ...)
		    => 동시에 처리 => IN()
		    => ANY / ALL => 값을 한개만 지정 => MAX / MIN
		    	 > ANY(MIN) 
		         < ANY(MAX)
			 > ALL(MAX)
			 < ALL(MIN)
			 ------------------------------ SELECT MAX() , MIN()이 더 편리
	   = 스칼라 서브쿼리 => Chapter 4장 => 컬럼 대신
	   = 인라인뷰 => Chapter 4장 => 테이블 대신
*/

-- 도서를 구매한 적이 있는 고객의 이름을 출력

SELECT name
FROM customer
WHERE custid IN (SELECT custid
			 FROM orders);
-- 2중 서브쿼리
-- 대한 미디어에서 출판한 도서를 구매한 고객의 이름을 출력
-- custid => customer / orders
SELECT name
FROM customer
WHERE custid IN (SELECT custid
			 FROM orders
			 WHERE bookid IN(SELECT bookid
						   FROM book
						   WHERE publisher = '대한미디어'));