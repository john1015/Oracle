-- 2024-06-12
-- 187page DML => 데이터 추가 , 데이터 수정 , 데이터 삭제 => 저장/취소
/* 
	COMMIT / ROLLBACK => COMMIT 수행 ROLLBACK은 적용이 안된다
					   -------------------------------
					   => 공유
	데이터 추가 : INSERT
	데이터 수정 : UPDATE
	데이터 삭제 : DELETE

	제약조건 이름 저장
	user_constraints
*/
/*
CREATE TABLE myBoard(
	no NUMBER , 
	name VARCHAR2(51) CONSTRAINT mb_name_nn NOT NULL , 
	subject VARCHAR2(4000) CONSTRAINT mb_subject_nn NOT NULL  ,
	content CLOB CONSTRAINT mb_cont_nn NOT NULL ,
	pwd VARCHAR2(10) CONSTRAINT mb_pwd_nn NOT NULL ,
	regdate DATE DEFAULT SYSDATE ,
	hit NUMBER DEFAULT 0 ,
	CONSTRAINT mb_no_pk PRIMARY KEY(no)
);
*/
-- 추가
-- 전체 추가 -> DEFAULT 적용이 안된다
/*
INSERT INTO myBoard VALUES(1 , '홍길동' , 'DML->INSERT' , '데이터 추가방법' , '1234' , SYSDATE , 0);
INSERT INTO myBoard(no , name , subject , content , pwd) VALUES(2 , '심청이' ,  'DML->INSERT' , '데이터 추가방법' , '1234');
INSERT INTO myBoard(no , name , subject , content , pwd) VALUES((SELECT MAX(no)+1 FROM myBoard) , '심청이' ,  'DML->INSERT' , '데이터 추가방법' , '1234');
INSERT INTO myBoard(no , name , subject , content , pwd) VALUES((SELECT MAX(no)+1 FROM myBoard) , '심청이' ,  'DML->INSERT' , '데이터 추가방법' , '1234');
INSERT INTO myBoard(no , name , subject , content , pwd) VALUES((SELECT MAX(no)+1 FROM myBoard) , '심청이' ,  'DML->INSERT' , '데이터 추가방법' , '1234');
*/
-- UPDATE 데이터 수정
/*
	UPDATE table_name SET
	컬럼명 = 값 , 컬럼명 = 값 ...
	[WHERE 조건문]
*/
/*
UPDATE myBoard SET
name = '박문수' , subject = 'DML->UPDATE' , content='UPDATE사용법'
WHERE no = 5;

UPDATE myBoard SET
name = '이순신' , subject = 'DML->UPDATE' , content='UPDATE사용법'
WHERE no = 3;

UPDATE myBoard SET
name = '강감찬' , subject = 'DML->UPDATE' , content='UPDATE사용법'
WHERE no = 4;
*/
-- 수정


-- 삭제 => ROW단위로 삭제
/*
	DELETE FROM table_name 
	WHERE 조건문;
*/
/*
DELETE FROM myBoard
WHERE no=1;
*/
-- 조건 => PRIMARY KEY
-- DROP TABLE myBoard;
-- 저장 / 저장취소
