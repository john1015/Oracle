-- 2024-06-11 179page ������ ���� ���
/*
	=> �ѹ� �����ϸ� ������ �Ұ����ϴ�
	DDL : ������ ������� ���� table
		 ���� �޸� ���� = view
		 �ڵ� ������ȣ = sequence
		 �ӵ� ����ȭ = index
		 ���� = function / procedure / trigger
		 ��ɾ� => COLUMN����
			CREATE : ����
				= CREATE TABLE
				= CREATE INDEX
				= CREATE FUNCTION
				= CREATE VIEW

			ALTER : ����
				= ALTER TABLE table_name
				
				   �߰� => ADD
				   ���� => MODIFY
				   ���� => DROP
				   �̸����� => RENAME COLUMN

			DROP : ��ü ����
				= DROP TABLE table_name

			RENAME : ���̺�� ����
				= RENAME old_name TO new_name

			TRUNCATE : ������ �߶󳻱�
				= TRUNCATE TABLE table_name
			--------------------------------------------------------------- DML (INSERT , UPDATE , DELETE) => ������ ����
												    DDL => ������ �Ұ���
			6~7�� => R�⺻ 8 = 1 , 9=2 , 10=3 ~4�� �������� (�̷¼�)
								  ----- ����
			�ڹ� : ��������(Ŭ����) ������ String name
			����Ŭ : �÷��� �������� name VARCHAR2

		1) ��������
		������
			= CHAR(1~2000byte) => ����Ŭ�� �ѱ� �ѱ��ڴ� => 3byte
				=> ���� ����Ʈ
				=> ���ڼ��� ������ ��� (����/���� , y/n)
				=> �޸� ���������� ũ��
				     ------------------
					CHAR(2000) => 'A'(1byte) => �޸� ũ��� 2000 byte
					1			2000
					-----------------------------
					'A' \0 .......
					-----------------------------

			= VARCHAR2 (1~4000byte) => ���ڿ��� default => ����Ŭ���� ����
								=> VARVHAR / TEXT
				= ������
				= ���ڿ� ���� �޸𸮸� �Ҵ�
					VARCHAR2(100) => 'A'(1byte) => �����ϴ� �޸� ������ 1byte�� �Ҵ�
			= CLOB (4�Ⱑ) => ������ => ���ڿ� ���� => �ٰŸ� / ���� �Ұ� ...
			   --------------------- ���� : ����ÿ� ������ �ȵ� => .sql / (.csv)
			----------------------------------------------------------------- �ڹ� : String��Ī
		������ 
		   NUMBER(38) => int / long
		   NUMBER(4) => 0~9999
		   NUMBER => 8�ڸ� ���� => NUMBER(8,2)
									---- ���ڴ� 8���� ����� ����
									12345678.80 => x
									132456.78 => o
		 => �Ҽ��� ���� => ������ �Ǽ��� ����ϴ� ���� �ƴϴ�
		 => �ڹٿ��� ���� => ������

		��¥��
			DATE : default
			TIMESTAMP : ��� ��� => �ø���
			---------------------------------------------------- java.util.Date / java.sql.Date
	
		��Ÿ�� : ������ , �ΰ� , �������
			BFILE : file���·� ����
			BLOB : 2������
		--------------------------------------------------- java.io.InputStream

		2) �÷��� �ĺ��� => ���̺��
			= ���� �����ͺ��̽�(XE)���� ������ ���̺���� ����� �� ����
			    *** ���̺��� �÷����� �������� �ִ�
			= ���ڷ� �����Ѵ� (���ĺ� / �ѱ�) => ���� (�ѱ��� �������̸� ������� �ʴ´�)
				= �ü������ �ѱ� �ν��� �ٸ���
			= ���ĺ��� ��ҹ��ڰ� �ִ�(����Ŭ������ ��ҹ��ڸ� �������� �ʴ´�)
				= ���� ������ �빮�ڷ� �Ǿ� �ִ� (���̺� ���� �˻� => �빮�ڻ���� �ؾ� �ȴ�)
			= ���̺���� 30�ڸ� ����� �� �ִ� (�ѱ��� 10����)
			= ���� ����� ���� (��, �տ� ��� ����)
			= Ű����� ����� �� ���� (SELECT , INSERT ...)
			= Ư������ ����� ���� ( _ ) => ��ҹ��� ������ ����
				FileName = File_Name

		3) �������� : �̻������� ���� , ����ȭ�� ������ ���� (���α׷��� �ʿ��� �����͸� ����)
				  ---------- ���� / �����ÿ� ������ �ʴ� �����Ͱ� ���� , ����
		 	id  		name		sex
		      aaa		hong		man
		      aaa             shim		woman
			DELETE FROM member WHERE id = 'aaa';
		    = NOT NULL : �ݵ�� �����Ͱ��� ���� => ȸ������ (�ʼ��Է� ��)
		    = UNIQUE : �ߺ��� ���� �����͸� �߰� => NULL�� ��� => ��üŰ (��ȭ , �̸���)
		    	=> GIT / AWS 
		    = PRIMARY KEY : �⺻Ű (NOT NULL + UNIQUE) => ID => ������
			=> ��� ���̺��� �⺻Ű�� �Ѱ� �̻� �����ؾ� �Ѵ�
		    = FOREIGN KEY : ����Ű => �����ϴ� �÷��� ���� ���� (�ٸ� ���̺�� ���� , ����� ���)
		    = CHECK : ������ �����Ͱ��� �Է��� �����ϰ� �����
				   �μ��� , ���� , ���� ... (���� ��ư , �޺� �ڽ�)
		    = ���������� �ƴϴ�
			DEFAULT : ����ڰ� �Է��� ���� ���� ��쿡 �ڵ� ÷��
			=> �����

		4) ����
		    = ������ ���̺� ���� (����..)
			CREATE TABLE emp_copy
			AS
			SELECT ~
			=> ���� ���� TABLE ������ ���� 

		    = ���������� �������
		    = �������ǿ� �̸� �ο� (*************)

		5) ����/����


			
*/
-- ���̺� ����
/*
CREATE TABLE emp_copy
AS
SELECT * FROM emp;
*/
-- ������ ���� => �÷��� ����
/*
CREATE TABLE emp_copy1
AS
SELECT * FROM emp
WHERE 1=2;
*/
-- 100=200    'A'='B'  ... ������ FALSE�ΰ� �ƹ��ų� ���̱�
/*
CREATE TABLE emp_copy2
AS
SELECT empno , ename , job , hiredate , sal , dname , loc , grade
FROM emp,dept , salgrade
WHERE emp.deptno = dept.deptno
AND sal BETWEEN losal AND hisal;
*/
-- �÷� �߰� => ADD
-- ALTER TABLE emp_copy ADD dname VARCHAR2(20);
-- �÷� �̸� ���� => RENAME
-- ALTER TABLE emp_copy ADD loaaaaaaaaaaaaaaa VARCHAR2(20);
-- ALTER TABLE emp_copy RENAME COLUMN loaaaaaaaaaaaaaaa TO loc;
-- �÷� ���� => MODIFY (�������� ���� , ���ڼ� ����)
-- ALTER TABLE emp_copy MODIFY loc VARCHAR2(100);
-- �÷� ���� => DROP COLUMN
-- ALTER TABLE emp_copy DROP COLUMN dname;
-- RENAME = ���̺�� ����
-- RENAME emp_copy TO ec;
-- ������ �߶󳻱� : TRUNCATE
-- TRUNCATE TABLE ec;
-- ���̺� ���� DROP
-- DROP TABLE ec;
-- DROP TABLE emp_copy1;
-- DROP TABLE emp_copy2;