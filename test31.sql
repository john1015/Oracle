-- 2024-06-12 DDL / DML
-- *** 명령문 => 형식과 순서
/*
	*** 주의점 : 오라클에서 작업 (X)

	자바 ==========> 오라클
		SQL 문장 전송
		<==========
		윈도우 / 브라우저에 출력

	*** SQL 문장
	=> String으로 구성 => 단점 : 오류가 없다 = 오류 처리가 어렵다 (SELECT)
	=> 공백 / ' ' (문자 / 날짜) / 문장의 순서
	=> INSERT
	=> 소스 코딩 => OUTPUT (에러 부분 => 확인) => 디버깅 (오류 제거)
*/
/*
	SQL

	= DQL : 데이터 검색
		=> SELECT

	= DML : 데이터 조작
		=> INSERT : 데이터 추가
		=> UPDATE : 데이터 수정
		=> DELETE : 데이터 삭제

	= DDL : 데이터 정의 => 데이터 공간 / 가상 테이블 / 인덱스 / 자동 증가 번호 / 함수 / 프로시저 / 트리거
		=> CREATE : 생성
		=> ALTER : 수정
		=> DROP : 삭제
		=> RENAME : 컬럼명
		=> TRUNCATE : 데이터만 전체 삭제 => 테이블은 빈 공백으로 남아 있다

	= DCL : 데이터 제어
		=> GRANT : 권한 부여
		=> REVOKE : 권한 해제

	= TCL : 트랜잭션 (일괄 처리)
		=> COMMIT : 정상적으로 저장
		=> ROLLBACK : 비정상 종료 => 명령문 취소

	*** DQL / DML => ROW 단위
	*** DDL => COLUMN 단위
	
	DML => 문제 있는 경우에 복구가 가능 (ROLLBACK) => 웹 프로그래머가 주로 사용 => CRUD
	DDL => 자동 저장이 되어 복구가 불가능

	----------------------------------------------------------------------------------------------------

	1. DQL

	=> 자바와 오라클의 차이 => LIKE => '%'||?||'%' (오라클) => CONCAT('%',?,'%') (MySQL / MariaDB)
						=> REGEXP_LIKE(ename,?)

	SELECT * | column_list
	FROM table_name | SELECT ~
	[
		WHERE 조건문
		GROUP BY 그룹컬럼 | 함수 => 그룹별로 따로 통계를 처리할 때 사용
		HAVING 집합함수
		ORDER BY 컬럼 | 함수
	]

	= WHERE 조건문 => 연산자 활용
		1) 산술 연산자 (+, -, *, /)
			+는 덧셈만 가능, /는 정수/정수=실수, ||는 문자열 결합
		2) 비교 연산자 (=, <> (!=, ^=), <, >, <=, >=)
		3) 논리 연산자 (AND, OR)
			|| => 문자열 결합
			&& => 입력값 받기
		4) NOT : 부정 연산자 (NOT IN, NOT BETWEEN, NOT LIKE ... NOT (조건))
		5) BETWEEN ~ AND : 기간, 범위
			>= AND <= : 포함 (이상, 이하)
		6) LIKE : 포함된 단어 => 검색 시에 가장 많이 사용
			단어% => 시작 => 서제스트 (자동 완성기)
		7) NULL : 저장된 데이터가 없는 경우 => NULL
			연산 처리의 결과값은 NULL
			NULL값 확인
				=> IS NULL => NULL값이면
				=> IS NOT NULL => NULL값이 아니면
		8) IN : OR를 여러개 사용 시 대체하는 연산자

	= GROUP BY 그룹컬럼 | 함수 => 그룹별로 따로 통계를 처리할 때 사용
		함수 => 내장 함수 (ROW 단위 처리) / 사용자 정의 함수 (CREATE FUNCTION ...)
		내장 함수
			=> 문자 함수
				=> LENGTH() : 문자 개수
				=> SUBSTR () : 문자를 자르는 경우
				=> RPAD() : 문자의 개수가 맞지 않는 경우 지정된 문자로 채워준다 (오른쪽으로)
				=> REPLACE() : 문자 변경
			=> 숫자 함수
				=> MOD() : 나머지 => %
				=> ROUND() : 반올림
				=> TRUNC() : 버림
				=> CEIL() : 올림
			=> 날짜 함수
				=> SYSDATE : 시스템의 날짜 / 시간
				=> MONTHS_BETWEEN() : 기간의 개월 수
			=> 변환 함수
				=> TO_CHAR()
					*** 날짜 변환 => 분 : MI => 대소문자 구분이 없다
					*** 숫자 변환 => 999,999
			=> 기타 함수
				=> NVL() : NULL 대신 사용하는 값을 지정

	= HAVING 집합함수
		집합 함수
			=> COUNT() : ROW의 개수
			=> MAX() : ROW의 최댓값
			=> MIN() : ROW의 최솟값
			=> SUM() / AVG()

	= ORDER BY 컬럼 | 함수
		=> ASC
		=> DESC

	----------------------------------------------------------------------------------------------------

	2. DML : 데이터 조작 => 문자 / 날짜 => 반드시 ' '
		날짜 => 'YY/MM/DD'

	INSERT INTO table_name VALUES(1,'20/01/20') => 예약일 / 결재 / 생일 ...
		'20/01'20' => DATE => VARCHAR2

	= INSERT : 데이터 추가
		=> 전체 데이터 추가
		INSERT INTO table_name VALUES(값...)
			=> 숫자는 그냥 사용 / 날짜, 문자 => ' '
			=> 값... => 컬럼 개수만큼 / 컬럼 순서로
		=> 원하는 데이터 추가
		INSERT INTO table_name(컬럼1,컬럼2...) VALUES(지정된 순서로 값 첨부)
			=> 컬럼 나열 시에 DEFAULT 적용

	= UPDATE : 수정
		UPDATE table_name SET
		컬럼명=값, 컬럼명=값, 컬럼명=값 ...
		[WHERE 조건]

	= DELETE : 삭제
		DELETE FROM table_name
		[WHERE 조건]
		***** 오라클에서는 명령문을 취소 => 원상 복구
		***** 자바에서는 AUTOCOMMIT을 이용한다 => 잘못 설정하면 수정 / 삭제된다
				=> AUTOCOMMIT => 복구할 수 없다

	----------------------------------------------------------------------------------------------------

	3. DDL : 정의 언어
	
	1) 데이터형 (오라클) => 183page
	
	= 문자형
		= CHAR(1~2000byte) => 고정형 => 글자 개수가 동일 (ex) 남자/여자, y/n ...)
			=> 오라클에서 한글은 한글자당 3byte
		= VARCHAR2(1~4000byte) => 가변형 => 글자 개수에 따라 메모리 크기가 달라진다
			=> 대부분은 VARCHAR2를 이용한다
		= CLOB => 4기가 => 가변형 => 백업 시 문제 발생
		~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 자바 매칭 : String

	= 숫자형
		= NUMBER : default => NUMBER(8,2)
			=> NUMBER(38)까지 가능 => int / long
			=> NUMBER(7,2) => 정수만 사용 : 7자리
						=> 실수 사용 => 소수점 : 2자리까지, 정수 : 5자리까지
			=> 평점 => NUMBER(2,1)
		~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 자바 매칭 : int / double

	= 날짜형
		= DATE
		~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 자바 매칭 : java.util.Date

	*** 자바와 다른 점
		=> 자바 : 데이터형 변수명
		=> 오라클 : 컬럼명 데이터명

	컬럼명 / 테이블명 식별자
	*** 같은 데이터베이스(XE) 안에서는 테이블명이 중복되면 안된다
	*** 테이블 안에서는 같은 컬럼명을 사용할 수 없다
	*** 제약 조건명은 중복되면 안된다
		=> 한곳에 저장
			= user_constraints (오라클에 저장되는 테이블)
			= user_tables
			---------------------------- 대문자로 저장
		=> 테이블명_컬럼명_약식
			= PRIMARY KEY => pk
			= FOREIGN KEY => fk
			= CHECK => ck
			= UNIQUE => uk
			= NOT NULL => nn

	2) 제약 조건 : 이상 현상 방지 (무결성) => 수정, 삭제, 추가 발생하는 문제 => (182page)
		=> 이상 현상 방지 => 원하는 데이터만 정형화해서 저장
		= NOT NULL : NULL값을 허용하지 않는다 => 무조건 값을 추가
			* 필수 입력, 입력이 안된 경우 = 팝업창
		= UNIQUE : 중복이 없는 값 저장 => NULL을 허용
			* 대체키 : 주민 번호, 전화 번호, 이메일 ...
		= PRIMARY KEY : 기본키 (NOT NULL + UNIQUE)
			* 데이터 무결성 => ROW 구분자 (권장 => 반드시 테이블에 한개 이상의 기본키를 지정한다)
		= FOREIGN KEY : 참조키 (다른 테이블 연결)
			* 조인 => 참조 무결성 (여러개 사용이 가능) => UPDATE / DELETE => 제약이 있다
		= CHECK : 지정된 데이터만 추가할 수 있다
			* 장르 / 부서명 / 직위 / 성별 ...
		=> 제약 조건은 아니다 : 사용자 입력 없이 필요한 데이터 추가
			= DEFAULT => 오늘 날짜, 조회 수 ...

	3) 명령문 형식

	= CREATE => (179page)
	CREATE TABLE table_name (
		컬럼명 데이터형 [제약 조건], => 제약 조건은 여러개 사용 가능
							=> 컬럼 뒤에 제약 조건 : NOT NULL, DEFAULT
		컬럼명 데이터형 [제약 조건],
		컬럼명 데이터형 [제약 조건],
		컬럼명 데이터형 [제약 조건],
		컬럼명 데이터형 [제약 조건],
		[제약 조건], => PK, FK, CK, UK => 한번에 여러개 동시 처리
				=> PRIMARY KEY(no,id)
		[제약 조건],
		[제약 조건]
	);
	table명 / column명 / 제약 조건명
		=> 30byte 이상을 초과하면 안된다 => 5~10글자가 적당
		=> 문자로 시작한다 (한글, 알파벳 : 대소문자 구분 X) => 권장 : 운영 체제의 호환 문제로 알파벳 사용
		=> 숫자 사용이 가능 => 앞에 사용할 수 없다
		=> 키워드 사용은 할 수 없다 (SELECT, INSERT ...)
		=> 특수 문자 ( _ )

	= ALTER => (184~185page)
		=> 데이터가 있는 경우 => ALTER를 이용하여 변경
			=> 크롤링 : 조회 수, 좋아요, 예매 가능 ... => 컬럼이 없으면 추가하여 사용
		=> 데이터가 없는 경우 => DROP => 테이블 자체 변경
		= ADD : 컬럼 추가, 제약 조건
			ALTER TABLE table_name ADD 컬럼명 데이터형 [제약 조건]
		= MODIFY : 컬럼 수정, 제약 조건
			ALTER TABLE table_name MODIFY 컬럼명 데이터형 [제약 조건]
			=> 데이터형 => 크기 변경 => ex) VARCHAR2(10)~>VARCHAR2(100)
		= DROP COLUMN : 컬럼 삭제, 제약 조건
			ALTER TABLE table_name DROP COLUMN 컬럼명
		= RENAME COLUMN : 컬럼명 변경
			ALTER TABLE table_name RENAME COLUMN old_column TO new_column
			=> 리팩토링 (결과값은 그대로, 코드의 구조만 재조정)
				=> 알아보기 쉽게 변수명, 컬럼명, 테이블명, 클래스명 ... 재설정 (가독성)

	= DROP : 테이블 삭제 => (186page)
		=> 복사 후 연습
		=> 복원이 안된다 => 백업 (매일 오전 6시)
		DROP TABLE table_name

	= TRUNCATE : 데이터 삭제 (테이블 구조는 유지)
		=> 크롤링
		=> 복원이 안된다
		TRUNCATE TABLE table_name

	= RENAME : 테이블명 변경
		RENAME old_table TO new_table

	----------------------------------------------------------------------------------------------------

	1. 명세표 => 설계 => ERD

	판매전표 (테이블명)
	-----------------------
	----------------------------------------------------------------------------------------------------
	컬럼명		전표번호		판매일자		고객명		총액
	----------------------------------------------------------------------------------------------------
	제약 조건		PK			NN			NN			CK
							DEFAULT
	----------------------------------------------------------------------------------------------------
	참조 테이블
	----------------------------------------------------------------------------------------------------
	참조 컬럼
	----------------------------------------------------------------------------------------------------
	체크												>0
	----------------------------------------------------------------------------------------------------
	데이터형		VARCHAR2		DATE			VARCHAR2		NUMBER => NUMBER(8,2)
	----------------------------------------------------------------------------------------------------
	크기			13						51			
	----------------------------------------------------------------------------------------------------
*/
/*
CREATE TABLE 판매전표 (
	전표번호 VARCHAR2(13),
	판매일자 DATE DEFAULT SYSDATE CONSTRAINT 판매전표_판매일자_nn NOT NULL,
	고객명 VARCHAR2(51) CONSTRAINT 판매전표_고객명_nn NOT NULL,
	총액 NUMBER,
	CONSTRAINT 판매전표_전표번호_pk PRIMARY KEY(전표번호),
	CONSTRAINT 판매전표_총액_ck CHECK(총액>0)
);
*/
/*
	제품 (테이블명)
	-----------------------
	----------------------------------------------------------------------------------------------------
	컬럼명		제품번호		제품명		제품단가	----------------------------------------------------------------------------------------------------
	제약 조건		PK			NN			CK
	----------------------------------------------------------------------------------------------------
	참조 테이블
	----------------------------------------------------------------------------------------------------
	참조 컬럼
	----------------------------------------------------------------------------------------------------
	체크									>0
	----------------------------------------------------------------------------------------------------
	데이터형		VARCHAR2		VARCHAR2		NUMBER => NUMBER(8,2)
	----------------------------------------------------------------------------------------------------
	크기			13			51			
	----------------------------------------------------------------------------------------------------

	전표상세 (테이블명)
	-----------------------
	----------------------------------------------------------------------------------------------------
	컬럼명		전표번호		제품번호		수량		단가		금액	----------------------------------------------------------------------------------------------------
	제약 조건		PK/FK		FK			NN		NN		CK
	----------------------------------------------------------------------------------------------------
	참조 테이블	판매전표		제품
	----------------------------------------------------------------------------------------------------
	참조 컬럼		전표번호		제품번호
	----------------------------------------------------------------------------------------------------
	체크													>0
	----------------------------------------------------------------------------------------------------
	데이터형		VARCHAR2		VARCHAR2		NUMBER	NUMBER	NUMBER	----------------------------------------------------------------------------------------------------
	크기			13			100
	----------------------------------------------------------------------------------------------------

	CONSTRAINT 테이블명_컬럼명_pk PRIMARY KEY(컬럼명)
	CONSTRAINT 테이블명_컬럼명_fk FOREIGN KEY(컬럼명) REFERENCES 참조테이블명(참조컬럼명)
	CONSTRAINT 테이블명_컬럼명_ck CHECK(컬럼명,체크)
	CONSTRAINT 테이블명_컬럼명_uk UNIQUE(컬럼명)
	CONSTRAINT 테이블명_컬럼명_nn NOT NULL
*/
/*
CREATE TABLE 제품 (
	제품번호 VARCHAR2(13),
	제품명 VARCHAR2(51) CONSTRAINT 제품_제품명_nn NOT NULL,
	제품단가 NUMBER,
	CONSTRAINT 제품_제품번호_pk PRIMARY KEY(제품번호),
	CONSTRAINT 제품_제품단가_ck CHECK(제품단가>0)
);
*/
-- 개념적 설계
-- 데이터형 추가 => 논리적 설계
-- 데이터형 크기 => 물리적 설계
/*
CREATE TABLE 전표상세 (
	전표번호 VARCHAR2(13),
	제품번호 VARCHAR2(100),
	수량 NUMBER CONSTRAINT 전표상세_수량_nn NOT NULL,
	단가 NUMBER CONSTRAINT 전표상세_단가_nn NOT NULL,
	금액 NUMBER,
	CONSTRAINT 전표상세_전표번호_pk PRIMARY KEY(전표번호),
	CONSTRAINT 전표상세_전표번호_fk FOREIGN KEY(전표번호)
	REFERENCES 판매전표(전표번호),
	CONSTRAINT 전표상세_제품번호_fk FOREIGN KEY(제품번호)
	REFERENCES 제품(제품번호),
	CONSTRAINT 전표상세_금액_ck CHECK(금액>0)
);
*/
-- 제약 조건 확인 => 명령문 => user_constraints에 저장됨 => 제약 조건의 이름이 중복되면 X => 테이블명, 컬럼명 설정
-- SELECT *
-- FROM user_constraints
-- WHERE table_name='전표상세';
/*
 OWNER                                              VARCHAR2(128)
 CONSTRAINT_NAME                           NOT NULL VARCHAR2(128)
 CONSTRAINT_TYPE                                    VARCHAR2(1)
 TABLE_NAME                                NOT NULL VARCHAR2(128)
 SEARCH_CONDITION                                   LONG
 SEARCH_CONDITION_VC                                VARCHAR2(4000)
 R_OWNER                                            VARCHAR2(128)
 R_CONSTRAINT_NAME                                  VARCHAR2(128)
 DELETE_RULE                                        VARCHAR2(9)
 STATUS                                             VARCHAR2(8)
 DEFERRABLE                                         VARCHAR2(14)
 DEFERRED                                           VARCHAR2(9)
 VALIDATED                                          VARCHAR2(13)
 GENERATED                                          VARCHAR2(14)
 BAD                                                VARCHAR2(3)
 RELY                                               VARCHAR2(4)
 LAST_CHANGE                                        DATE
 INDEX_OWNER                                        VARCHAR2(128)
 INDEX_NAME                                         VARCHAR2(128)
 INVALID                                            VARCHAR2(7)
 VIEW_RELATED                                       VARCHAR2(14)
 ORIGIN_CON_ID                                      NUMBER
*/
SET linesize 300
-- SELECT CONSTRAINT_TYPE,CONSTRAINT_NAME
-- FROM user_constraints
-- WHERE table_name='전표상세';
/*
	CONSTRAINT TYPE

	P : PRIMARY KEY
	R : FOREIGN KEY
	C : CHECK, NOT NULL
	U : UNIQUE
*/
-- SELECT CONSTRAINT_TYPE,CONSTRAINT_NAME
-- FROM user_constraints
-- WHERE table_name='MEMBER';

-- fk로 인하여 => 전표상세를 먼저 지우고 그 다음에 판매전표, 제품을 지워야 한다
/*
DROP TABLE 전표상세;
DROP TABLE 판매전표;
DROP TABLE 제품;

CREATE TABLE 판매전표 (
	전표번호 VARCHAR2(13),
	판매일자 DATE,
	고객명 VARCHAR2(51),
	총액 NUMBER
);

-- 테이블에 데이터가 있는 경우 => ALTER
ALTER TABLE 판매전표 ADD CONSTRAINT 판매전표_전표번호_pk PRIMARY KEY(전표번호);
ALTER TABLE 판매전표 MODIFY 판매일자 DEFAULT SYSDATE CONSTRAINT 판매전표_판매일자_nn NOT NULL;
ALTER TABLE 판매전표 MODIFY 고객명 CONSTRAINT 판매전표_고객명_nn NOT NULL;
ALTER TABLE 판매전표 ADD CONSTRAINT 판매전표_총액_ck CHECK(총액>0);

CREATE TABLE 제품 (
	제품번호 VARCHAR2(13),
	제품명 VARCHAR2(51),
	제품단가 NUMBER
);

ALTER TABLE 제품 ADD CONSTRAINT 제품_제품번호_pk PRIMARY KEY(제품번호);
ALTER TABLE 제품 MODIFY 제품명 CONSTRAINT 제품_제품명_nn NOT NULL;
ALTER TABLE 제품 ADD CONSTRAINT 제품_제품단가_ck CHECK(제품단가>0);

CREATE TABLE 전표상세 (
	전표번호 VARCHAR2(13),
	제품번호 VARCHAR2(100),
	수량 NUMBER,
	단가 NUMBER,
	금액 NUMBER
);

ALTER TABLE 전표상세 ADD CONSTRAINT 전표상세_전표번호_pk PRIMARY KEY(전표번호);
ALTER TABLE 전표상세 MODIFY 수량 CONSTRAINT 전표상세_수량_nn NOT NULL;
ALTER TABLE 전표상세 MODIFY 단가 CONSTRAINT 전표상세_단가_nn NOT NULL;
ALTER TABLE 전표상세 ADD CONSTRAINT 전표상세_금액_ck CHECK(금액>0);
ALTER TABLE 전표상세 ADD CONSTRAINT 전표상세_전표번호_fk FOREIGN KEY(전표번호)
REFERENCES 판매전표(전표번호);
ALTER TABLE 전표상세 ADD CONSTRAINT 전표상세_제품번호_fk FOREIGN KEY(제품번호)
REFERENCES 제품(제품번호);

*/
/*
	ALTER를 이용해서 변경
	1. NOT NULL , DEFAULT => MODIFY
*/
-- ALTER를 이용하여 제약 조건을 첨부
-- ALTER => 컬럼 추가, 수정, 삭제, 이름 변경
-- ALTER => 제약 조건 추가, 수정, 삭제 가능
-- DROP 테이블 제거


















 