-- 2024-06-25
-- 프로시저 => 보안 / SQL문장을 몰라도 수행이 가능 / 트랜잭션(일괄처리)
-- 웹개발시 분석이 어렵다
-- 호불호 => 50 : 50 => DBA가 주로 제작 => 약간의 자바에서 호출
/*
	1. PL/SQL => 문법
	FUNCTION / PROCEDURE => 생성 / 삭제

	FUNCTION 생성
		CREATE OR REPLACE FUNCTION func_name(매개변수) RETURN 데이터형
		IS
		  변수 선언
		BEGIN
		  SQL로 제어
		    RETURN 변수;
		END;
		/
	FUNCTION 삭제
		DROP FUNCTION func_name;

	PROCEDURE 생성
		CREATE OR REPLACE PROCEDURE pro_name(매개변수)
		IS
		  변수 선언
		BEGIN
		  필요한 SQL문장 작성
		END;
		/

	PROCEDURE 삭제
		DROP PROCEDURE pro_name;

	=> 에러 확인 : show error

	=> 기타
		%TYPE , SYS_REFCURSOR
		IF / IF~ELSE / FOR
		=> 값을 대입 :=    =========> 284page
*/