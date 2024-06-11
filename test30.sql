-- 2024-06-11
-- 187page DML
/*
	DML : ������ ���۾�� ==> ROW���� => �����ͺ����� ����(ROLLBACK)
		 = INSERT : ������ �߰�
		    1. ��ü ������ �߰� / ������ ������ ����
		    2. ��ü ������ ���
		    	INSERT INTO table_name VALUES(�� ....)
					  -------------- * => DESC => �÷��� ���� => ������ ���� ����
							      => DEFAULT�� �������� ���Ѵ�
		    3. �κ������� ��� :  NULL��� , DEFAULT�� ������ ����
			INSERT INTO table_name(�÷��� , �÷��� , ...) VALUES(�� ...)
							   ------------------		 ------ ��ġ
		 = UPDATE : ������ ����
			UPDATE table_name SET
			�÷��� = �� , �÷��� = �� ...
			[WHERE ���ǹ�]
		 = DELETE : ������ ����
			DELETE FROM table_name
			[WHERE ����]
		***** ����Ŭ������ �ݵ�� COMMIT�� ����(�ݿ�)
			�ڹٴ� AUTO COMMIT�� ������ �ִ� => DML���� �����ϸ� �ڵ����� COMMIT�� ����
*/

-- INSERT ALL
-- ���̺��� ������ ���� => ���� ����
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
	CONSTRAINT mt_sex_ck CHECK(sex IN('����' , '����')),
	CONSTRAINT mt_email_uk UNIQUE(email) 
);
-- ��ü ������ �߰�
/*
INSERT INTO member_test VALUES('hong' , '1234' , 'ȫ�浿' , '����' , 'hong@co.kr' , '010-1111-1111' , SYSDATE);
INSERT INTO member_test (id , pwd ,  name , sex , email , phone) VALUES ('hong1' , '1234' , 'ȫ�浿' , '����' , 'hong1@co.kr' , '010-1111-1111');
*/
INSERT INTO member_test VALUES('SHIM' , '1234' , '��û��' , '����' , 'shim@co.kr' , '010-1111-1111' , SYSDATE);
INSERT INTO member_test VALUES('JUNG' , '1234' , '������' , '����' , 'jung@co.kr' , '010-1111-1111' , SYSDATE);
INSERT INTO member_test VALUES('KANG' , '1234' , '������' , '����' , 'kang@co.kr' , '010-1111-1111' , SYSDATE);