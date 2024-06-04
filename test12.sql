-- 2024-06-04
-- 숫자 함수 / 날짜 함수 / 변환 함수 / 기타 함수
/*
	웹에서 많이 사용하는 숫자함수만 정리
	1. MOD => 나머지 => %
	2. CEIL => 올림 => 총페이지
	3. ROUND => 반올림
	4. TRUNC => 버림
	---------------------------------------------- 날짜 => 숫자
*/
-- MOD(숫자 , 숫자) => MOD(10,2) => 10%2
-- emp사원중에 사번이 짝수인 사원
-- SELECT * FROM emp WHERE MOD(empno , 2)=0;
-- SELECT * FROM emp WHERE MOD(SUBSTR(hiredate,1,2),2)=0;

-- CEIL(숫자 = 실수)
-- SELECT CEIL(10.5) FROM DUAL;
-- SELECT CEIL(10.0) FROM DUAL;
-- zipcode => 20개 출력
-- SELECT CEIL(COUNT(*)/20.0) FROM zipcode;

-- ROUND() 반올림
-- ROUND(실수 , 자리수)
-- 10.23456 , 2 => 10.23
-- SELECT ROUND(10.23456 , 2) , ROUND(10.23756,2) FROM DUAL;

/*
	TRUNC(실수 , 자리수) => 무조건 버림
*/
-- SELECT TRUNC(10.23456 , 2) , TRUNC(10.23756,2) FROM DUAL;

-- SELECT ROUND(AVG(sal)) FROM emp;