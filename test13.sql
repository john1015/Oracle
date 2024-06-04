-- 2024- 06- 04
-- 날짜 함수
/*
	***SYSDATE : 시스템의 날짜 시간 => 날짜 등록하지 않는다
	----------
	***MONTHS_BETWEEN : 기간의 월수
	ADD_MONTHS : => 만기일
	NEXT_DAY : 오늘후에 돌아오는 요일
	LAST_DAY : 날짜 입력 => 해당 월 마지막 일
	=> LONG => ***ROUND() , ***TRUNC()
*/
-- 오늘 날짜 출력
--SELECT SYSDATE FROM DUAL;
-- 어제 , 내일 ... 3일전 ...
--SELECT SYSDATE-1 "어제" , SYSDATE "오늘" , SYSDATE+1 "내일" FROM DUAL;
-- MONTHS_BETWEEN => 기간의 개월수 => 연차 계산 / 퇴직금 ...
--SELECT ename , ROUND(ROUND(MONTHS_BETWEEN(SYSDATE,hiredate))/12) from emp;
-- ADD_MONTH : 지정한 개월후의 날짜 가지고 오기
-- SELECT SYSDATE , ADD_MONTHS(SYSDATE,5) FROM DUAL;
-- SELECT ADD_MONTHS('24/04/11',7) FROM DUAL;
-- NEXT_DAY => 요일의 날짜 읽기
-- NEXT_DAY(SYSDATE , '화') ==> 21/06/11
SELECT SYSDATE , NEXT_DAY(SYSDATE , '수') FROM DUAL;
-- LAST_DAY => 월 => 마지막날
SELECT LAST_DAY('24/04/01') FROM DUAL;