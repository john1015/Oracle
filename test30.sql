-- 2024-06-11
-- 187page DML
/*
	DML : 데이터 조작언어 ==> ROW단위 => 데이터복구가 가능(ROLLBACK)
		 = INSERT : 데이터 추가
		    1. 전체 데이터 추가 / 나눠서 저장이 가능
		    2. 전체 데이터 등록
		    	INSERT INTO table_name VALUES(값 ....)
					  -------------- * => DESC => 컬럼의 순서 => 순서로 값을 지정
							      => DEFAULT는 적용하지 못한다
		    3. 부분적으로 등록 :  NULL허용 , DEFAULT를 적용이 가능
			INSERT INTO table_name(컬럼명 , 컬럼명 , ...) VALUES(값 ...)
							   ------------------		 ------ 일치
		 = UPDATE : 데이터 수정
			UPDATE table_name SET
			컬럼명 = 값 , 컬럼명 = 값 ...
			[WHERE 조건문]
		 = DELETE : 데이터 삭제
			DELETE FROM table_name
			[WHERE 조건]
		***** 오라클에서는 반드시 COMMIT을 수행(반영)
			자바는 AUTO COMMIT을 가지고 있다 => DML문장 전송하면 자동으로 COMMIT을 수행
*/

-- INSERT ALL
-- 테이블의 구조만 복사 => 값을 제외
/*
CREATE TABLE emp_10
AS
SELECT empno , ename , job , hiredate , sal FROM emp
WHERE 1=2;

CREATE TABLE emp_20
AS
SELECT empno , ename , job , hiredate , sal FROM emp
WHERE 1=2;

CREATE TABLE emp_30
AS
SELECT empno , ename , job , hiredate , sal FROM emp
WHERE 1=2;
*/ 
/*
INSERT ALL 
WHEN deptno =10 THEN
INTO emp_10 VALUES(empno , ename , job , hiredate , sal)
WHEN deptno =20 THEN
INTO emp_20 VALUES(empno , ename , job , hiredate , sal)
WHEN deptno =30 THEN
INTO emp_30 VALUES(empno , ename , job , hiredate , sal)
SELECT * FROM emp;
*/
-- 187PAGE
CREATE TABLE member_test(
	id VARCHAR2(20) , 
	pwd VARCHAR2(10) CONSTRAINT mt_pwd_nn NOT NULL , 
	name VARCHAR2(51) CONSTRAINT mt_name_nn NOT NULL,
	sex VARCHAR2(6),
	email VARCHAR2(100) , 
	phone VARCHAR2(15) ,
	regdate DATE DEFAULT SYSDATE , 
	CONSTRAINT mt_id_pk PRIMARY KEY(id) ,
	CONSTRAINT mt_sex_ck CHECK(sex IN('남자' , '여자')),
	CONSTRAINT mt_email_uk UNIQUE(email) 
);
-- 전체 데이터 추가
/*
INSERT INTO member_test VALUES('hong' , '1234' , '홍길동' , '남자' , 'hong@co.kr' , '010-1111-1111' , SYSDATE);
INSERT INTO member_test (id , pwd ,  name , sex , email , phone) VALUES ('hong1' , '1234' , '홍길동' , '남자' , 'hong1@co.kr' , '010-1111-1111');
*/
INSERT INTO member_test VALUES('SHIM' , '1234' , '심청이' , '여자' , 'shim@co.kr' , '010-1111-1111' , SYSDATE);
INSERT INTO member_test VALUES('JUNG' , '1234' , '정유엽' , '남자' , 'jung@co.kr' , '010-1111-1111' , SYSDATE);
INSERT INTO member_test VALUES('KANG' , '1234' , '강감찬' , '남자' , 'kang@co.kr' , '010-1111-1111' , SYSDATE);