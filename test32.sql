-- 2024-06-12
-- 187page DML => ������ �߰� , ������ ���� , ������ ���� => ����/���
/* 
	COMMIT / ROLLBACK => COMMIT ���� ROLLBACK�� ������ �ȵȴ�
					   -------------------------------
					   => ����
	������ �߰� : INSERT
	������ ���� : UPDATE
	������ ���� : DELETE

	�������� �̸� ����
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
-- �߰�
-- ��ü �߰� -> DEFAULT ������ �ȵȴ�
/*
INSERT INTO myBoard VALUES(1 , 'ȫ�浿' , 'DML->INSERT' , '������ �߰����' , '1234' , SYSDATE , 0);
INSERT INTO myBoard(no , name , subject , content , pwd) VALUES(2 , '��û��' ,  'DML->INSERT' , '������ �߰����' , '1234');
INSERT INTO myBoard(no , name , subject , content , pwd) VALUES((SELECT MAX(no)+1 FROM myBoard) , '��û��' ,  'DML->INSERT' , '������ �߰����' , '1234');
INSERT INTO myBoard(no , name , subject , content , pwd) VALUES((SELECT MAX(no)+1 FROM myBoard) , '��û��' ,  'DML->INSERT' , '������ �߰����' , '1234');
INSERT INTO myBoard(no , name , subject , content , pwd) VALUES((SELECT MAX(no)+1 FROM myBoard) , '��û��' ,  'DML->INSERT' , '������ �߰����' , '1234');
*/
-- UPDATE ������ ����
/*
	UPDATE table_name SET
	�÷��� = �� , �÷��� = �� ...
	[WHERE ���ǹ�]
*/
/*
UPDATE myBoard SET
name = '�ڹ���' , subject = 'DML->UPDATE' , content='UPDATE����'
WHERE no = 5;

UPDATE myBoard SET
name = '�̼���' , subject = 'DML->UPDATE' , content='UPDATE����'
WHERE no = 3;

UPDATE myBoard SET
name = '������' , subject = 'DML->UPDATE' , content='UPDATE����'
WHERE no = 4;
*/
-- ����


-- ���� => ROW������ ����
/*
	DELETE FROM table_name 
	WHERE ���ǹ�;
*/
/*
DELETE FROM myBoard
WHERE no=1;
*/
-- ���� => PRIMARY KEY
-- DROP TABLE myBoard;
-- ���� / �������
