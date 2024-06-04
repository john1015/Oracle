-- 2024-06-04 내장함수 => 209page
/*
	내장함수 : 오라클에서 지원하는 함수
	---------- 리턴형을 가지고 있는 함수
	---------- 사용처 : SELECT뒤에 , WHERE뒤에 , ORDER BY 뒤에 , GROUP BY 뒤에
	| 사용지 정의 함수 : FUNCTION
	 CREATE FUNCTION max(매개변수) RETURN NUMBER => 사용자 정의 함수
	| 함수 => 리턴형 / 함수명 / 매개변수 / 기능
		     ----------------------------------------
	=> ROW단위 처리 => 한줄씩 처리 : 단일행 함수
		문자함수
			***=> LENGTH() : 문자 개수
				LENGTH('abc') => 3
				LENGTH('홍길동') => 3 => 문자제한 => 비밀번호 8~12
			=> LENGTHB() : 바이트 수
				LENGTHB('abc') => 3
				LENGTHB('홍길동') => 9 => 한글은 한글자당 3byte
				=> CHAR(10) , VARCHAR2(10)
			=> UPPER() : 대문자
				UPPER('abc') => ABC
			=> LOWER() : 소문자
				LOWER('ABC') => abc
			=> INITCAP() : 이니셜
				INITCAP('abc') => Abc => 첫글자만 대문자
			=> 연습용 테이블 : DUAL => 수학 , 함수 ...
			-------------------------
			***=> SUBSTR : substring
			***=> INSTR : indexOf
			=> LTRIM / RTRIM / TRIM : rim
			=> LPAD / ***RPAD
			=> ***REPLACE : replace
			=> CONCAT : 문자열 결합 => ||
		숫자함수
		날짜함수
		변환함수
		기타함수
	=> COLUMN단위 처리 => COLUMN전체 처리 : 집합 함수


*/
-- SET LINESIZE 300;
-- SELECT LENGTH('abc'), LENGTH('홍길동'),LENGTHB('abc'), LENGTHB('홍길동')
-- FROM DUAL;
-- SELECT ename , LENGTH(ename)
-- FROM emp;
-- SELECT ename , length(ename) FROM emp WHERE length(ename)=6;
-- SELECT * FROM emp WHERE ename = UPPER('scott');
-- UPPER , LOWER , INITCAP
-- SELECT ename ,UPPER(ename) , lower(ename), INITCAP(ename) FROM emp;

/*
	SUBSTR : 문자를 자르는 경우에 사용 => 자바 (substring)
	Hello Java
	12345678910 => 문자 번호가 1번 , (프로그램언어는 0번부터 시작)
	SUBSTR(문자열 , 시작번호 , 문자개수)
*/
-- SELECT SUBSTR('Hello Oracle',1,5) FROM DUAL;
-- 사원이 입사한 달을 출력
-- SELECT ename , hiredate "입사일" , SUBSTR(hiredate,4,2) "입사한 달"FROM emp; 
-- 요일
-- SELECT ename , hiredate "입사일" , SUBSTR(hiredate,4,2) "입사한 달" , TO_CHAR(hiredate,'DY') "요일" FROM emp; 
--81년에 입사한 사원의 모든 정보
--SELECT ename ,hiredate FROM emp WHERE SUBSTR(hiredate,1,2)=81;
-- 12월에 입사한 사원
--SELECT ename , hiredate FROM emp WHERE substr(hiredate ,4,2)=12;
-- 일
--SELECT ename , SUBSTR(hiredate , 7,2) from emp ;
/*
	ABCDEFG
	12345 6 7
		-2-1
*/
--select ename , SUBSTR(hiredate , -2,2) from emp ;
/*
	LPAD / ***RPAD => 아이디 찾기 / 비밀번호(이메일 전송) => JavaMail  ad****
	LPAD : ****글자 , RPAD : 글자**** L = left  R = right
	LPAD(문자열,글자수,대체문자)
		------- ------- ----------
		'ABC' , 7 , '#' => ####ABC
*/
--SELECT LPAD('ABCDEFG',10,'#') FROM DUAL;
-- ABCDE
--KING ==> ****K
--SELECT LPAD(SUBSTR(ename,1,1) , LENGTH(ename),'*') from emp;
--SELECT RPAD(SUBSTR(ename,1,1) , LENGTH(ename),'*') from emp;
/*
	LTRIM / RTRIM / TRIM => trim() => 좌우의 공백 제거
	=> 지정된 문자를 제거
	TRIM() : 좌우
	LTRIM() : 왼쪽만 => LTRIM(문자열 , 제거할 문자)
							 ------------- 설정이 없는 경우 공백제거
				    LTRIM('AAABBBCCAAA','A') => BBBCCAAA
				    LTRIM('AAABBBCCAAA') => AAABBBCCAAA => 공백제거
	RTRIM() : 오른쪽만
				    RTRIM('AAABBBCCAAA','A') => AAABBBCC
*/
-- SELECT LTRIM('   AAABBBCCCAAA   ') "LTRIM" , RTRIM('   AAABBBCCCAAA   ') "RTRIM" , TRIM(' ' FROM '   AAABBBCCCAAA   ') "TRIM" FROM DUAL;
/*
	CONCAT => || => 문자열 결합
	----------------
	오라클은 ||
	MySQL은CONCAT
	String sql = "SELECT * FROM table_name WHERE 컬럼명 LIKE '%'||?||'%'"
	String sql = "SELECT * FROM table_name WHERE 컬럼명 LIKE CONCAT('%',?,'%')"
	CONCAT(문자열 , 문자열)
	CONCAT('Hrllo','Oracle') => Hello Oracle
	'Hello'||'Oracle' => +는 덧셈으로만 사용
*/
-- select concat('이름은 ',ename) from emp;

/*
	REPLACE => 변경
	REPLACE(문자열 , 변경할 문자 , 변경 문자)
	
*/
-- SELECT ename , REPLACE(ename , 'A','B') "변경" from emp;
-- select replace('Hello Java' , 'Java' , 'Oracle') from dual;
/*
	INSTR => indexOf() => 위치 번호
	INSTR(문자열 , 찾는문자 , 시작위치 , 몇번째인지)
	INSTR("Hello Java" , 'a' , 1,1) => 2

*/
 -- select ename , INSTR(ename , 'A' , 1 , 2) from emp;
select INSTR('Hello Java' , 'a' , 1 , 1) , INSTR('Hello Java' , 'a' , 1 , 2) from dual;