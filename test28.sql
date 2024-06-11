-- 2024-06-11 179page 데이터 정의 언어
/*
	=> 한번 수행하면 복구가 불가능하다
	DDL : 데이터 저장공간 생성 table
		 가상 메모리 생성 = view
		 자동 증가번호 = sequence
		 속도 최적화 = index
		 재사용 = function / procedure / trigger
		 명령어 => COLUMN단위
			CREATE : 생성
				= CREATE TABLE
				= CREATE INDEX
				= CREATE FUNCTION
				= CREATE VIEW

			ALTER : 수정
				= ALTER TABLE table_name
				
				   추가 => ADD
				   수정 => MODIFY
				   삭제 => DROP
				   이름변경 => RENAME COLUMN

			DROP : 전체 삭제
				= DROP TABLE table_name

			RENAME : 테이블명 변경
				= RENAME old_name TO new_name

			TRUNCATE : 데이터 잘라내기
				= TRUNCATE TABLE table_name
			--------------------------------------------------------------- DML (INSERT , UPDATE , DELETE) => 복구가 가능
												    DDL => 복구가 불가능
			6~7월 => R기본 8 = 1 , 9=2 , 10=3 ~4일 최종정리 (이력서)
								  ----- 지원
			자바 : 데이터형(클래스) 변수명 String name
			오라클 : 컬럼명 데이터형 name VARCHAR2

		1) 데이터형
		문자형
			= CHAR(1~2000byte) => 오라클은 한글 한글자당 => 3byte
				=> 고정 바이트
				=> 글자수가 동일한 경우 (남자/여자 , y/n)
				=> 메모리 누수현상이 크다
				     ------------------
					CHAR(2000) => 'A'(1byte) => 메모리 크기는 2000 byte
					1			2000
					-----------------------------
					'A' \0 .......
					-----------------------------

			= VARCHAR2 (1~4000byte) => 문자열의 default => 오라클에만 존재
								=> VARVHAR / TEXT
				= 가변형
				= 글자에 따라 메모리를 할당
					VARCHAR2(100) => 'A'(1byte) => 저장하는 메모리 공간이 1byte만 할당
			= CLOB (4기가) => 가변형 => 문자열 저장 => 줄거리 / 맛집 소개 ...
			   --------------------- 단점 : 백업시에 저장이 안됨 => .sql / (.csv)
			----------------------------------------------------------------- 자바 : String매칭
		숫자형 
		   NUMBER(38) => int / long
		   NUMBER(4) => 0~9999
		   NUMBER => 8자리 저장 => NUMBER(8,2)
									---- 숫자는 8개를 사용이 가능
									12345678.80 => x
									132456.78 => o
		 => 소수점 설정 => 무조건 실수를 사용하는 것은 아니다
		 => 자바에서 연결 => 데이터

		날짜형
			DATE : default
			TIMESTAMP : 기록 경기 => 올림픽
			---------------------------------------------------- java.util.Date / java.sql.Date
	
		기타형 : 동영상 , 로고 , 증명사진
			BFILE : file형태로 저장
			BLOB : 2진파일
		--------------------------------------------------- java.io.InputStream

		2) 컬럼명 식별자 => 테이블명
			= 같은 데이터베이스(XE)에서 동일한 테이블명을 사용할 수 없다
			    *** 테이블명과 컬럼명은 같을수도 있다
			= 문자로 시작한다 (알파벳 / 한글) => 권장 (한글은 가급적이면 사용하지 않는다)
				= 운영체제마다 한글 인식이 다르다
			= 알파벳은 대소문자가 있다(오라클에서는 대소문자를 구분하지 않는다)
				= 실제 저장은 대문자로 되어 있다 (테이블 정보 검색 => 대문자사용을 해야 된다)
			= 테이블명은 30자를 사용할 수 있다 (한글은 10글자)
			= 숫자 사용이 가능 (단, 앞에 사용 금지)
			= 키워드는 사용할 수 없다 (SELECT , INSERT ...)
			= 특수문자 사용이 가능 ( _ ) => 대소문자 구분이 없다
				FileName = File_Name

		3) 제약조건 : 이상현상을 방지 , 정형화된 데이터 저장 (프로그램에 필요한 데이터만 저장)
				  ---------- 수정 / 삭제시에 원하지 않는 데이터가 변경 , 삭제
		 	id  		name		sex
		      aaa		hong		man
		      aaa             shim		woman
			DELETE FROM member WHERE id = 'aaa';
		    = NOT NULL : 반드시 데이터값이 존재 => 회원가입 (필수입력 ※)
		    = UNIQUE : 중복이 없는 데이터만 추가 => NULL을 허용 => 대체키 (전화 , 이메일)
		    	=> GIT / AWS 
		    = PRIMARY KEY : 기본키 (NOT NULL + UNIQUE) => ID => 구분자
			=> 모든 테이블은 기본키가 한개 이상 존재해야 한다
		    = FOREIGN KEY : 참조키 => 참조하는 컬럼의 값만 지정 (다른 테이블과 조인 , 연결시 사용)
		    = CHECK : 지정된 데이터값만 입력이 가능하게 만든다
				   부서명 , 직위 , 성별 ... (라디오 버튼 , 콤보 박스)
		    = 제약조건은 아니다
			DEFAULT : 사용자가 입력을 하지 않은 경우에 자동 첨부
			=> 등록일

		4) 형식
		    = 기존의 테이블 복사 (조인..)
			CREATE TABLE emp_copy
			AS
			SELECT ~
			=> 값은 없이 TABLE 구조만 복사 

		    = 제약조건을 약식으로
		    = 제약조건에 이름 부여 (*************)

		5) 수정/삭제


			
*/
-- 테이블 복사
/*
CREATE TABLE emp_copy
AS
SELECT * FROM emp;
*/
-- 값없이 복사 => 컬럼만 복사
/*
CREATE TABLE emp_copy1
AS
SELECT * FROM emp
WHERE 1=2;
*/
-- 100=200    'A'='B'  ... 조건이 FALSE인것 아무거나 붙이기
/*
CREATE TABLE emp_copy2
AS
SELECT empno , ename , job , hiredate , sal , dname , loc , grade
FROM emp,dept , salgrade
WHERE emp.deptno = dept.deptno
AND sal BETWEEN losal AND hisal;
*/
-- 컬럼 추가 => ADD
-- ALTER TABLE emp_copy ADD dname VARCHAR2(20);
-- 컬럼 이름 변경 => RENAME
-- ALTER TABLE emp_copy ADD loaaaaaaaaaaaaaaa VARCHAR2(20);
-- ALTER TABLE emp_copy RENAME COLUMN loaaaaaaaaaaaaaaa TO loc;
-- 컬럼 변경 => MODIFY (제약조건 변경 , 글자수 조절)
-- ALTER TABLE emp_copy MODIFY loc VARCHAR2(100);
-- 컬럼 삭제 => DROP COLUMN
-- ALTER TABLE emp_copy DROP COLUMN dname;
-- RENAME = 테이블명 변경
-- RENAME emp_copy TO ec;
-- 데이터 잘라내기 : TRUNCATE
-- TRUNCATE TABLE ec;
-- 테이블 삭제 DROP
-- DROP TABLE ec;
-- DROP TABLE emp_copy1;
-- DROP TABLE emp_copy2;