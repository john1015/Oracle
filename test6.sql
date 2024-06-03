-- 2024 - 06 - 03
-- 145 page 데이터 검색
/*
	형식을 기억한다
	=> column을 확인
		DESC table명 
		1) 컬럼명 데이터형
			     -----------
			     숫자 / 문자 / 날짜 확인
				NUMBER(4) => 정수
				NUMBER(7,2) => 실수
					       -- 소수점 자리수
				CHAR / VARCHAR2
				DATE
				검색시에 문자 / 날짜 => ' '
	SELECT [ALL|DISTINCT] | column_list
	FROM table_name
	[
		WHERE
		GROUP BY
		HAVING => GROUP BY 가 있는 경우에만 사용이 가능
		*** GROUP BY 는 독립적으로 사용이 가능
		*** HAVING은 독립적으로 사용할 수 없다
		ORDER BY 
	]
	| => 선택
	[ ] => 선택

	SELECT column명 as 별칭
 		   column명 "별칭"
	FROM table_name 별칭
		 -------------------- tabel에는 "" 안붙힘
	FROM asaasassaasassaas sa;  <- sa로 별칭 / 테이블명이 길때 / JOIN사용시에
	***** 튜플(ROW)은 순서가 없다
		=> 정렬이 안되어 있다
		=> 정렬해서 읽어온다 => ORDER BY

*/
-- EMP의 데이터를 전체 출력 (단, 급여를 많이 받는 순)
-- SELECT * FROM emp ORDER BY sal DESC;
-- SELECT * FROM emp ORDER BY 8;
-- SELECT * FROM emp ORDER BY 1;
-- SELECT * FROM emp ORDER BY 5; 
-- emp 사번 , 이름 , 직위
-- SELECT empno , ename , job FROM emp ;
-- emp사원 정보에서 직위의 종류를 출력
SELECT distinct job FROM emp;