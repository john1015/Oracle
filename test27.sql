--2024-06-11
--176page => 집합연산
/*
	INTERSECT => 교집합
	A	B
	1	3
	2	4
	3	6
	4	7
	5	8   ==> 3,4
		
	UNION => 합집합
	A	B
	1	3
	2	4
	3	6
	4	7
	5	8   ==> 1,2,3,4,5,6,7,8 => 중복제거
	UNION ALL 
	A	B
	1	3
	2	4
	3	6
	4	7
	5	8   ==> 1,2,3,4,5,3,4,6,7,8 => 중복포함
	MINUS => 차집합
	A	B => A-B
	1	3
	2	4
	3	6
	4	7
	5	8   ==> 1,2

	B	A => B-A
	3	1
	4	2
	6	3
	7	4
	8	5   ==> 6,7,8
*/
/*
CREATE TABLE A(
	num NUMBER
);
INSERT INTO A VALUES(1);
INSERT INTO A VALUES(2);
INSERT INTO A VALUES(3);
INSERT INTO A VALUES(4);
INSERT INTO A VALUES(5);

COMMIT;

CREATE TABLE B(
	num NUMBER
);

INSERT INTO B VALUES(3);
INSERT INTO B VALUES(4);
INSERT INTO B VALUES(6);
INSERT INTO B VALUES(7);
INSERT INTO B VALUES(8);

COMMIT;
*/

SELECT num
FROM A
INTERSECT
SELECT num
FROM B;

SELECT num
FROM A
UNION
SELECT num
FROM B;

SELECT num
FROM A
UNION ALL
SELECT num
FROM B;

SELECT num
FROM A
MINUS
SELECT num
FROM B;

SELECT num
FROM B
INTERSECT
SELECT num
FROM A;

-- 도서를 주문하지 않은 고객의 이름
SELECT name 
FROM customer
MINUS
SELECT name
FROM customer
WHERE custid IN (SELECT custid FROM orders);
-- 집합연산자 통합 => 조인
--  FULL OUTER JOIN