-- 2024-06-13
-- 1차 정리
/*
	SQL => 문자열 (키워드 , 형식 , 순서) => 로직
	    DQL
		= 검색
		= SELECT
			= 연산자 / 내장함수 / JOIN / SUBQUERY
			= 형식)
				SELECT * | column1 ...
				FROM table_name | view_name | (SELECT ~ )
				[
					WHERE 조건문 => 연산자
					GROUP BY 그룹 컬럼 | 내장 함수
					HAVING 집합함수
					ORDER BY 컬럼명 | 내장함수 (ASC | DESC)
				]
				JOIN : 두개이상의 테이블을 연결해서 필요한 데이터 추출
				
				SELECT A.col , B.col
				FROM A , B
				WHERE A.col = B.col   ==>  EQUI_JOIN (INNER JOIN)

				SELECT A.col , B.col
				FROM A JOIN B
				ON A.col = B.col   ==>  EQUI_JOIN (INNER JOIN)

----------------------------------------------------------------------------------------------------------------------------------

				SELECT A.col , B.col
				FROM A , B
				WHERE A.col = B.col(+)   ==>  LEFT (OUTER JOIN)

				SELECT A.col , B.col
				FROM A LEFT OUTER JOIN B
				ON A.col = B.col   ==>  LEFT (OUTER JOIN)

				SELECT A.col , B.col
				FROM A , B
				WHERE A.col(+) = B.col   ==>  RIGHT (OUTER JOIN)

				SELECT A.col , B.col
				FROM A RIGHT OUTER JOIN B
				ON A.col = B.col   ==>  RIGHT (OUTER JOIN)

----------------------------------------------------------------------------------------------------------------------------------
				
				서브쿼리 : SQL문장 여러개 한개로 작성
				= 중첩 서브쿼리 => WHERE뒤에
				= 스칼라 서브쿼리 => SELECT뒤에 => 컬럼 대신
				= 인라인 뷰 => FROM뒤에 => 테이블 대신
	
-----------------------------------------------------------------------------------------------------------------------------------

	    DML
		= 조작언어
		= INSERT : 추가
			INSERT INTO table_name VALUES(값 ....) => DEFAULT를 포함해서 값을 순차적으로 추가
			INSERT INTO table_name (컬럼명 ....) VALUES (값 ....)
			=> 오라클에서는 COMMIT
			=> 자바에선는 AUTOCOMMIT
		= UPDATE : 수정
			UPDATE table_name SET
			컬럼명=값 , 컬럼명 = 값 ....
			[WHERE 조건문]
		= DELETE : 삭제
			DELETE FROM table_name
			[WHERE 조건문]
			=> 오라클에서는 COMMIT
			=> 자바에선는 AUTOCOMMIT
	    DDL
		= 정의 언어
		= TABLE / VIEW / SEQUENCE / INDEX / FUNCTION / PROCEDURE / TRIGGER
							  -------------------------------------------------------
		= CREATE
			테이블 제작 => 제약조건 (PRIMARY KEY , FOREGIN KEY , UNIQUE , NOT NULL , CHECK)
			데이터형 => 문자 : CHAR / VARCHAR2 / CLOB
			      		  숫자형 : NUMBER
					  날짜 : DATE
				1) TABLE : 데이터를 저장하는 공간
					CREATE TABLE table_name(
						컬럼명 데이터형 [제약조건] ,  ==> NOT NULL , DEFAULT (먼저 사용)
						컬럼명 데이터형 [제약조건] ,
						컬럼명 데이터형 [제약조건] ,
						[제약조건] ,  => CHECK , PRIMARY KEY , FOREIGN KEY , UNIQUE
						[제약조건] ,
						[제약조건] 
					)
				2) VIEW : 가상테이블
					CREATE VIEW view_name
					AS
					   SELECT ~
					CREATE OR REPLACE VIEW view_name
					AS
					   SELECT ~  => JOIN / SUBQUERY를 이용 => 복합뷰
				3) SEQUENCE : 자동 증가 번호
					CREATE SEQUENCE seq명
					START WITH 1 => 시작
					INCREMENT BY 1 => 증가
					NOCHCHE
					NOCYCLE
						=> 현재 값 => currval
						=> 다음 값 => nextval
		= DROP
			DROP TABLE table_name;
			DROP VIEW view_name
			DROP SEQUENCE seq_name
		= RENAME
			RENAME old_name TO new_name
		= TRUNCATE
			TRUNCATE TABLE table_name
	    DCL
		= 권한 부여 => GRANT CREATE VIEW TO 계정명(hr)
				      ---------		     ----
		= 권한 해제 => REVOKE CREATE VIEW FROM 계정명(hr)
				      ----------		      --------
		오라클 계정
		--------------------
		  = SYSTEM
		     ***** 비밀번호가 5번 오류발생 => 자동으로 계정잠금
		  = SYSDBA : system 계정에서 비밀번호를 잃어버린 경우
		-------------------- 관리자 권한
		  = 사용자 계정(hr)
	    TCL
		= COMMIT => 자바는 AUTOCOMMIT
		= ROLLBACK => 명령문 취소
		자바 => 트랜잭션 (일괄 처리) 
		try{
			getConnection();
			conn.setAutocommit(false);
			SQL 문장 -------> 오류 발생
			  입고
			  재고 ----> 오류
			conn.commit();
		} catch (Exception ex){
			conn.rollback();
		} finally {
			disConnection();
		}

	----------------------------------------------------------------------------------
	1조 : 일정관리
		예매관련 : 영화 / 맛집
	2조 : 도서 => 장바구니
	3조 : 인사관리 => 쇼핑몰
	----------------------------------------------------------------------------------
	벤치 => 테이블 설계
		
*/