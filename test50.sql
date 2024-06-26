-- 2024-06-26
-- 오라클 최종 정리
/*
	형식 => SQL문장 자주 구현
	형식 => 응용
	======== 프로젝트

	=> SQL : 구조화된 질의 언어
				  ====== SELECT
	=> 오라클 : 사이트 , 회사 , 학교 ... 데이터를 공유할 목적으로 저장하는 데이터 : static
	=> 데이터베이스 관리 시스템 (오라클)
	     ================= CRUD (데이터 제어) => 추가 , 수정 , 삭제 , 검색
	     SQL
		= DQL : SELECT => 데이터 검색
			    형식)
				SELECT * | column1 , column2 ...
				FROM table_name
				[
					WHERE 조건문 (컬럼명 연산자 값)
					GROUP BY 그룹컬럼 | 내장함수
					HAVING 집합함수
					ORDER BY 컬럼명(ASC | DESC)
				]
			    = 연산자 => WHERE문장
				=> 산술연산자 ( + - * / )
				    => 연산처리 => 자동으로 숫자형으로 변경
					  '1' + '2' => 3 => TO_NUMBER('1')
				    => 순수하게 산술만 처리
					 ==============
					 + : 문자열 결합을 하지 않는다 => 'a'+1 (오류발생) => 'a'||1
					 / : 정수/정수 = 실수
				    => ROW단위 통계 => SELECT뒤에 주로 사용(WHERE뒤에는 사용하지 않는다)
				=> 비교연산자 => WHERE문장 뒤에 사용 => TRUE/FALSE
				    = 같다 , <>(!=) 같지않다 , <(작다) , > (크다) , <= (작거나 같다) , >= (크거나 같다)
					*** 문자나 날짜도 비교가 가능하다
				=> 논리 연산자 AND (직렬연산자 , 조건 두개가 동시에 TRUE) , OR(병렬연산자 , TRUE가 한개 이상)
					*** || (문자열 결합), & (입력값)
				=> 데이터베이스에만 사용하는 연산자
					NOT : 부정연산자 = NOT IN , NOT BETWEEN , NOT LIKE
					NULL => 연산처리가 안된다
						      IS NULL , IS NOT NULL
					IN : OR가 여러개 있는 경우 => 다중 조건검색
					LIKE : % => 문자 개수 제한이 없는 경우
						 _  => 문자 한개 => 검색시에 주로 사용
						최근 : REGXP_LIKE()
					BETWEEN ~ AND : 기간 , 범위 => 페이지 나누기

			    = 내장함수

				문자 함수
					= LENGTH : 문자의 개수
					= SUBSTR : 문자를 자르는 경우
					= RPAD : => ID찾기 , 비밀번호 찾기
					========= 나머지 자바 String 으로 처리가 가능
				숫자 함수
					= ROUND : 반올림 함수
					= CEIL : 올림 함수
					======== 나머지 자바 Math로 처리
				날짜 함수
					= SYSDATE : 시스템의 날짜 , 시간
				변환 함수
					= TO_CHAR : 문자열 변환
					   날짜 => YYYY,MM,DD , HH24 ,MI ,SS
					   숫자 => 9,999,999
				기타 함수
					= NVL : NULL값을 대체
				집합 함수
					= COUNT : ROW의 개수
					= AVG , SUM , MAX

			    = JOIN : 두개이상의 테이블에서 필요한 데이터를 추출
					INNER JOIN => INTERSECT(교집합)

						Oracle JOIN
						    SELECT A.column , B.column
						    FROM A,B
						    WHERE A.column = B.column

						ANSI JOIN
						    SELECT A.column , B.column
						    FROM A JOIN B
						    ON A.column = B.column

					OUTER JOIN => INNER JOIN + MINUS

						Oracle JOIN
						    SELECT A.column , B.column
						    FROM A,B
						    WHERE A.column = B.column(+) => LEFT OUTER JOIN

						    SELECT A.column , B.column
						    FROM A,B
						    WHERE A.column(+) = B.column => RIGHT OUTER JOIN

						ANSI JOIN
						    SELECT A.column , B.column
						    FROM A LEFT OUTER JOIN B
						    ON A.column = B.column

						    SELECT A.column , B.column
						    FROM A RIGHT OUTER JOIN B
						    ON A.column = B.column

			    = 서브쿼리 : SQL문장 두개이상의 문장 => 한개로 통합

				MainQuery = (SubQuery)
				 전송	|	    ======= 실행
				 	|		| 
					========
				일반 서브쿼리  
					SELECT ~~ 
					FROM table_name
					WHERE 컬럼명 연산자 (SELECT ~)
				
				스칼라 서브쿼리
					컬럼 대신 사용
					SELECT 컬럼명 , (SELECT ~)
					FROM table_name

				인라인 뷰
					테이블 대신 사용
					SELECT ~
					FROM (SELECT ~~)
					=> rownum => 오라클에서 지원하는 가상 컬럼
								INSERT시 자동으로 ROW번호가 추가
							  => rownum의 순서 변경 => 인라인뷰를 이용한다
								테이블은 이미 rownum 지정
					
		= DML : INSERT => 데이터 추가 , UPDATE => 데이터 수정 , DELETE => 데이터 삭제
			    INSERT
				=> 전체 추가
					INSERT INTO table_name VALUES(값...)
				=> 원하는 컬럼값만 추가 => DEFAULT , NULL허용한 컬럼은 제외
					INSERT INTO table_name(컬럼,,,) VALUES(값...)
			    UPDATE
				UPDATE table_name SET
				컬럼명 = 값 , 컬럼명 = 값 ...
				[WHERE 조건문]
			    DELETE
				DELETE FROM table_name
				[WHERE 조건문]
			    =========================== 반드시 COMMIT을 사용해야 저장이 된다
				*** 자바는 기본이 AutoCommit()
		   => 오라클에 있는 데이터는 영구적 저장
		   => 실시간 데이터 처리
		= 저장공간 (폴더 파일)
				   |	  | 테이블
				데이터베이스 (XE)
			DDL
			  => 생성 (CREATE) , 수정 (ALTER) , 삭제 (DROP) , 이름변경 (RENAME) , 데이터만 삭제 (TRUNCATE)
				TABLE , VIEW , SEQUENCE ,FUNCTION , PROCEDURE , TRIGGER
				***= TABLE 생성 => 제약조건
					CREATE TABLE table_name(30byte)
					(
						컬럼명 데이터형 [제약조건] ,  ==> NOT NULL , DEFAULT
						컬럼명 데이터형 [제약조건] ,
						컬럼명 데이터형 [제약조건] ,
						[제약조건] ,  ==> PRIMARY KEY , FOREGIN KEY , CHECK , UNIQUE
						[제약조건]  
					);
					=> 데이터형
						문자 : CHAR(1~2000byte) => 글자수가 동일한 데이터만 저장 (남자 / 여자)
							=> 고정 바이트
							VARCHAR2(1~4000byte) =>가변형 메모리
							CLOB : 4기가 => 줄거리 , 회사소개 ...
						숫자 : NUMBER => NUMBER(8,2) => 정수,실수
						날짜 : DATE 
					=> 제약 조건 => 이상현상 방지 => UPDATE , DELETE (원하지 않는 데이터가 손실)
						= NOT NULL : 무조건 값을 추가
						= UNIQUE : 중복없는 데이터 (단점 : NULL값 허용) ==> 대체키
						= 기본키 => 테이블에서 ROW의 구분자 => 권장 : 한개이상의 기본키를 가지고 있다
								PRIMARY KEY = NOT NULL + UNIQUE
						= 외래키 (참조키) = 다른 테이블의 값을 참조
								FOREGN KEY
						= 지정된 데이터만 추가가 가능 : CHECK
					=> 삭제 : DROP
							DROP TABLE table_name
					=> 컬럼을 변경 : ALTER
						ALTER TABLE table_name ADD 컬럼명 데이터형
						ALTER TABLE table_name MODIFY 컬럼명 데이터형
						ALTER TABLE table_name DROP COLUMN 컬럼명
				***= VIEW 생성 => 복잡한 쿼리 => 여러번 반복 => SQL문장을 저장
					CREATE [OR REPLACE] VIEW view_name
					AS
					   SELECT ~~ => JOIN/SubQuery => 재사용이 가능
				***= SEQUENCE : 자동 증가번호
					CREATE SEQUENCE seq명
					   START WITH 1
					   INCREMENT BY 1
					   NOCACHE
					   NOCYCLE
				============================== 반드시 정리
				= FUNCTION
				= PROCEDURE
				= TRIGGER
		= DCL : 권한부여 => system(관리자 계정) , hr(사용자 계정) 
						  | GRANT(권한부여) , REVOKE(권한 해제)
			   GRANT CREATE VIEW TO hr
							 ===
			   REVOKE CREATE VIEW FROM hr
							  ====
			   *** 함수 사용 / 서브쿼리 사용시 => 권장 : 별칭  =>  컬럼명 "" | 컬럼명 AS 별칭
		= TCL : 일괄 처리(트랜잭션)
			   COMMIT(정상 저장) , ROLLBACK (명령문 전체 취소)
		   *** 단점 : 비절차적 언어
				========= 에러가 발생시 무시하고 다음 명령문으로 이동
		   예) 
			입고 => INSERT => 에러 발생
			재고 => INSERT
			======================= 두개가 동시에 실행이 안된다
			  입고 => INSERT
			  재고 => INSERT => 에러 발생
			======================= 입고 정상 수행 , 재고 실행이 안된다
			=> 둘중에 한개가 에러발생을 하면 동시에 명령을 취소
*/ 
/*
CREATE TABLE card(
	no NUMBER , 
	id VARCHAR2(20)  CONSTRAINT card_id_nn NOT NULL ,
	price NUMBER , 
	CONSTRAINT card_no_pk PRIMARY KEY(no)
);
CREATE TABLE point(
	pno NUMBER ,
	cno NUMBER , 
	point NUMBER DEFAULT 0,
	CONSTRAINT point_pno_pk PRIMARY KEY(pno) , 
	CONSTRAINT point_cno_fk FOREIGN KEY(cno) 
	REFERENCES card(no)
);
*/

-- INSERT INTO card VALUES(1,'hong',10000);
-- INSERT INTO point VALUES(1,1,100);
-- COMMIT;
-- INSERT INTO 