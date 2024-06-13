-- 2024-06-13
-- View => 235 page
/*
CREATE VIEW emp_view
AS 
SELECT * FROM emp;
*/

/*
	뷰 : 테이블의 일종 (가상 테이블)
		= 보안이 뛰어나다
		= SQL문장을 간결하게 만들 수 있다
		= 뷰는 반드시 한개 이상의 테이블을 참조한다
		= 테이블과 동일하게 사용할 수 있다
		= 기존의 데이터를 재사용 할 수 있다
	= 뷰의 종류
	    = 단순 뷰 : 테이블 한개를 참조 => DML이 가능하다 (INSERT , UPDATE , DELETE)
			    *** 주의점 : INSERT , UPDATE , DELETE를 수행하면 View가 변경되는것이 아니라 참조하는 테이블이 변경된다
	    = 복합 뷰 : 테이블 2개 이상 연결해서 사용 => JOIN , SUBQUERY => DML사용이 안된다
	    = 인라인 뷰 : 테이블 대신 => SELECT 
	------------------------------------------------------------------------------------------------------------------------------------------------
	뷰 => 옵션
		1. WITH CHECK OPTION => DML이 가능 => DEFAULT
		2. READ ONLY OPTION => READ ONLY => 뷰 사용시에 주로 처리
	    => 생성
		CREATE VIEW view_name
		AS
		SELECT ~ ==> 실제로 뷰에 저장됨
		뷰 확인 : SELECT text FROM user_views
						      ------------- 뷰를 저장하는 오라클에서 제공하는 테이블
		=> user_tables : 테이블
		=> user_constraint : 제약조건
		=> user_views : 뷰 저장
		=> user_indexs : 인덱스 저장 => 자동 저장 => pk , uk
		=> user_triggers , user_procedures , user_functions
		------------------------------------------------------ 대문자로 저장이 된다
	    => 수정
		CREATE OR REPLACE View view_name
		AS
		SELECT ~~

	    => 삭제
		DROP VIEW view_name
*/
/*
CREATE TABLE myDEPT
AS 
SELECT * FROM dept;
*/

-- select * from mydept;
-- View 생성 => 단순 뷰
/*
CREATE VIEW dept_view
AS
SELECT * FROM myDept;
*/

/*
INSERT INTO dept_view VALUES(50,'영업부','서울');
COMMIT;
*/

/*
CREATE OR REPLACE VIEW dept_view2
AS 
SELECT * FROM emp;
*/

-- DROP VIEW dept_view;
/*
CREATE VIEW dept_view
AS
SELECT * FROM myDept WITH READ ONLY ;
*/
INSERT INTO dept_view VALUES(50,'영업부','서울');
COMMIT;