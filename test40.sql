--2024 -06-14
/* 
	1. 오라클
	   1) 형식 => 응용 => 벤치마킹
		= 데이터 검색 (SELECT)
		    SELECT * | column1 , column2 ...
		    FROM table_name | view_name | (SELECT ~)
		    [
			WHERE 조건문
				   --------
				   연산자 => 결과값 true / false
						   --------------------
						   비교연산자
						    = : 상세보기
					    	    != (<>)
						    > , < , <= , >=
						    논리연산자
						     AND (기간이 포함 : 예약가능한 날) / OR (다중 조건 검색시에)
						     ---------------------------------------    ---------------------------
						     => 보완 : AND (BETWEEN) 	       OR (IN)
						     데이터베이스에서만 사용하는 연산자
						     => BETWEEN ~ AND : 페이지 나누기
						     => IN : 다중 검색 (검색 조건이 여러개 있는 경우)
						     => LIKE : 사용자 요청에 따른 검색
							  -----   '%A%' => 단어 포함
						     => NOT : 부정
						     => NULL : NULL은 값이 없는 상태 => 연산처리가 안된다
								    IS NULL / IS NOT NULL
			GROUP BY 그룸컬럼 | 내장함수
			=> 그룹별로 나눠서 처리 => 통계(관리자 계정)
			=> CUBE / ROLLUP => 가로 세로 통계
			=> 내장 함수
			     -----------
				문자함수(String)
				=> LENGTH : 문자 개수(비밀번호 처리)
				=> RPAD : ㅣ빈공백 지정된 문자추가(아이디 찾기 , 비밀번호 찾기)
													 | JavaMail
				=> SUBSTR : 문자를 자르는 경우
					=> SUBSTR(문자 / 컬럼 , 시작위치 , 개수) => 문자열의 위치번호는 1번
				숫자함수 (Math)

				=> CEIL : 올림 => 총페이지
				=> ROUND : 반올림

				날짜함수
				SYSDATE : 시스템의 날짜 / 시간 => 등록

				변환함수
				TO_CHAR => 날짜 / 숫자 (99,999,999)

				기타함수
				NVL => NULL울 대체

			HAVING 집합함수
				    ----------
				   COUNT : ROW의 개수 => 로그인 , 아이디중복 , 검색 개수 ...
									---------------------
				   MAX / SUM / AVG
						| 장바구니 총 금액, 우수고객
			ORDER BY 컬럼 | 내장함수 (ASC | DESC)
			-------------- 속도가 늦다 => INDEX
								INDEX_ASC() / INDEX_DESC()
	
			*** RANK() , DENSE_RANK()
			*** 오라클에서 지원하는 기상 컬럼 : ROWNUM / ROWID
									 --------------- 인기순위 추출 / 페이지
		    ]
		    SELECT의 핵심
			= 데이터 통합 : 조인
				= EQUI_JOIN (INNER JOIN)
				= LEFT OUTER JOIN
				= RIGHT OUTER JOIN
			= SQL문장 통합 : 서브쿼리
				= 조건값 대신 : WHERE 뒤에 => 단일 서브쿼리
				= 컬럼 대신 : SELECT 뒤에 => 스칼라 서브쿼리
				= 테이블 대신 : FROM 뒤에 => 인라인 뷰
		= 데이터 추가 (INSERT)
			INSERT INTO table_name VALUES (값....) => 날짜 / 문자 => 반드시 ''
				=> 테이블에 있는 컬럼 전체값을 첨부 => 순차적으로
				=> DEFAULT가 있는 경우에도 값 첨부
			INSERT INTO table_name (컬럼명... ) VALUES(값)
				=> DEFAULT가 많은 경우
		*** 회원가입 , 장바구니 , 예약 정보 ...
		= 데이터 수정 (UPDATE)
			UPDATE table_name SET
			컬럼명 = 값 , 컬럼명 = 값 .....
			[WHERE 조건]
		  *** 회원수정 , 장바구니 상품 개수 변경 , 예약일 변경 ...
					취소 / 구매 => 장바구니는 데이터베이스에 저장하지 않는다 / 쿠키
		= 데이터 삭제 (DELETE)
			DELETE FROM table_name
			[WHERE 조건]
		   *** 회원 탈퇴 , 구매 취소 , 예약 취소
	     ------------------------------------- CRUD
		= 테이블 제작 (데이터형 , 제약조건)  => CREATE
						   ------------ 프로그램에 맞는 데이터만 추가
			*** 어떤 데이터를 저장할지 => 클래스 생성
			=> 데이터형
			      문자형 : CHAR / VARCHAR2 / CLOB  => String
					    2000	40000       4기가
			      숫자형: NUMBER , 실수(NUMBER(7,2))=> 평점 (2,1)
			      날짜형 : DATE
			      자바 / 오라클 매칭 => DESC table_name
			=> 제약조건 : 정형화된 데이터 , 이상현상 방지
								    ---------- 수정 , 삭제시에 원하지 않는 데이터가 변경될 수 있다	
			      					    ---------- ROW마다 구분을 만든다 (PK)
					    | 실제 화면에 출력할 데이터만 저장
				NOT NULL : 반드시 저장값이 필요한 경우
						=> 필수 입력
				UNIQUE : 중복없는 데이터 저장 , NULL값을 허용ㅇ
						=> 대체키 (후보키) => email / phone
				PRIMARY KEY : 기본키 (ROW의 구분자) => NOT NULL+UNIQUE
						=> 숫자로 구분 => SEQUENCE
						=> 데이터 무결성
				FOREIGN KEY : 다른 테이블 참조 => 조인
						=> 반드시 연결 테이블에 PRIMARY KEY가 설정되어 있어야 한다
					게시판 댓글
					게시판번호 : PRIMARY KEY => 참조 댓글에서 사용
										   ---------- FOREIGN KEY
				CHECK : 지정된 데이터만 저장
					= 라디오버튼 / 콤보박스
				DEFAULT : 사용자 입력값이 없는 경우 자동 첨부되는 데이터를 지정
						등록일 : DEFAULT SYSDATE , 조회수 : DEFAULT 0
				
			=> 형식 => 저장 공간 만들기 (데이터)
				CREATE TABLE table_name (
					컬럼명 데이터형 [제약조건] ,
					컬럼명 데이터형 [제약조건] ,
					컬럼명 데이터형 [제약조건] ,
					컬럼명 데이터형 [제약조건] ,
					컬럼명 데이터형 [제약조건] ,
					[제약조건] ,
					[제약조건] 
				);
				=> 약식 => 제약조건 변경 => 테이블을 삭제후에 다시 제작
					=> 테이블에 데이터가 존재 여부
					컬럼명 데이터형 NOT NULL
					컬럼명 데이터형 PRIMARY KEY
				=> 제약조건 이름 부여 => 이후에 테이블을 조정
					=> 테이블에 데이터가 존재하지 않는 경우
					컬럼명 데이터형 CONSTRAINT 제약조건명 NOT NULL
					컬럼명 데이터형 
					CONSTRAINT 제약조건명 PRIMARY KEY(컬럼명)
					=> 한개의 테이블에 저장 => user_constraints => 중복없이 만들어야 한다
						=> 명칭 : 테이블명_컬럼_약자 (nn,pk,ck,uk,fk)

		= 테이블 삭제 : DROP => 제약조건까지 삭제
				DROP TABLE table_name => 복구가 불가능 

		= 테이블 이름 변경 : RENAME
				RENAME old_name TO new_name

		= 전체 데이터만 삭제 : TRUNCATE
				TRUNCATE TABLE table_name => 복구가 불가능

		= 테이블 수정 : ALTER
				ALTER TABLE table_name ADD 컬렴명 데이터형 [제약조건] => 컬럼추가
				ALTER TABLE table_name MODIFY 컬렴명 데이터형 [제약조건] => 컬럼수정
				ALTER TABLE table_name DROP 컬렴명 데이터형 [제약조건] => 컬럼삭제
				ALTER TABLE table_name RENAME COLUMN old_col TO new_col

	     ------------------------------------- 기본
		= 가상 테이블 제작 : VIEW : 보안 유지 , 기존 테이블 재사용 , 복잡한 SQL문장을 간결
		   ------------- DML이 가능 => 참조하는 테이블에 영향 => WITH READ ONLY : 읽기 전용
			= VIEW 생성 => 수정 -> 삭제후에 제작
				CREATE VIEW view_name
				AS
				   SELECT ~
				   ----------------------- VIEW에 저장되는 내용
		 	= 수정 동시에 VIEW 생성(******* 사용빈도가 많다) => 삭제없이 수정이 가능
				CREATE OR REPLACE VIEW view_name
				AS
				   SELECT ~
			= 삭제
				DROP VIEW view_name
			= 종류
				= 단순뷰 : 한개의 테이블 참조 (거의 사용이 없다)
				= 복합뷰 : 여러개의 테이블을 합하여 제어 => 조인 / 서브쿼리
				= 인라인뷰 : 테이블 대신 SELECT ~~
			1. VIEW / INDEX / PROCEDURE VS TRIGGER
			   ------------------------------------------------
		= 자동 증가번호 : SEQUENCE
		   형식)
			CREATE SEQUENCE 시퀀스명
				START WITH 값  ==> 초기값
				INCREMENT BY 값  => 증가값
				NOCHCHE ==> 저장이 없이 처음부터
				NOCYCLE ==> 다시 돌아오지 않게 만든다
				회원가입외에 모든 테이블에 적용
		   삭제)
			DROP SEQUENCE seq명
			**** 시퀀스명 => 테이블명_컬럼명_seq
			현재값 : currval
			증가된 값 : nextval **************

		= 속도의 최적화 : INDEX
		= 재사용 기법 : PL / SQL
	     ------------------------------------- 응용
		= 데이터 베이스 설계 (정규화) => 1정규화 ~ 3정규화 => JSP
		= 일괄 처리 방법 : Transcation
		= 보안 => Spring-Security(권한 부여)
	2. 자바
		=> JDBC => 웹 => ~VO(데이터를 모아서 전송) , ~DAO(오라클 연동)
					   ----------------------------------------------------------
					     JSP => VO , DAO
						       ---- 오라클 컬럼과 매칭
					     Spring => VO , DAO->라이브러리 
					     => CRUD / 간단한 데이터베이스 설계
*/