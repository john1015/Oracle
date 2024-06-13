-- 2024-06-13
-- View => 235 page
/*
CREATE VIEW emp_view
AS 
SELECT * FROM emp;
*/

/*
	�� : ���̺��� ���� (���� ���̺�)
		= ������ �پ��
		= SQL������ �����ϰ� ���� �� �ִ�
		= ��� �ݵ�� �Ѱ� �̻��� ���̺��� �����Ѵ�
		= ���̺�� �����ϰ� ����� �� �ִ�
		= ������ �����͸� ���� �� �� �ִ�
	= ���� ����
	    = �ܼ� �� : ���̺� �Ѱ��� ���� => DML�� �����ϴ� (INSERT , UPDATE , DELETE)
			    *** ������ : INSERT , UPDATE , DELETE�� �����ϸ� View�� ����Ǵ°��� �ƴ϶� �����ϴ� ���̺��� ����ȴ�
	    = ���� �� : ���̺� 2�� �̻� �����ؼ� ��� => JOIN , SUBQUERY => DML����� �ȵȴ�
	    = �ζ��� �� : ���̺� ��� => SELECT 
	------------------------------------------------------------------------------------------------------------------------------------------------
	�� => �ɼ�
		1. WITH CHECK OPTION => DML�� ���� => DEFAULT
		2. READ ONLY OPTION => READ ONLY => �� ���ÿ� �ַ� ó��
	    => ����
		CREATE VIEW view_name
		AS
		SELECT ~ ==> ������ �信 �����
		�� Ȯ�� : SELECT text FROM user_views
						      ------------- �並 �����ϴ� ����Ŭ���� �����ϴ� ���̺�
		=> user_tables : ���̺�
		=> user_constraint : ��������
		=> user_views : �� ����
		=> user_indexs : �ε��� ���� => �ڵ� ���� => pk , uk
		=> user_triggers , user_procedures , user_functions
		------------------------------------------------------ �빮�ڷ� ������ �ȴ�
	    => ����
		CREATE OR REPLACE View view_name
		AS
		SELECT ~~

	    => ����
		DROP VIEW view_name
*/
/*
CREATE TABLE myDEPT
AS 
SELECT * FROM dept;
*/

-- select * from mydept;
-- View ���� => �ܼ� ��
/*
CREATE VIEW dept_view
AS
SELECT * FROM myDept;
*/

/*
INSERT INTO dept_view VALUES(50,'������','����');
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
INSERT INTO dept_view VALUES(50,'������','����');
COMMIT;