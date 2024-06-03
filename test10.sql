-- 2024-06-03
-- ����Ŭ ������
/*
	��������� => SELECT �ڿ� �ַ� ���
	����Ŭ�� ���� : �����δ����δ� ��� (��,��� ..)
			     ROW�����д� ��踦 �� �� ����
	��������ڸ� �����ϰ� �������� ������� true/false
	=> �񱳿����� / �������� / NOT / IN /BETWEEN / LIKE / IS NULL ...
*/

/*
CREATE TABLE student(
	hakbun NUMBER,
	name VARCHAR2(52),
	kor NUMBER(3),
	eng NUMBER(3),
	math NUMBER(3) 
);
INSERT INTO student VALUES(1,'ȫ�浿',89,78,67);
INSERT INTO student VALUES(2,'������',80,70,60);
INSERT INTO student VALUES(3,'�ڹ���',90,95,88);
INSERT INTO student VALUES(4,'�̼���',67,89,67);
INSERT INTO student VALUES(5,'������',78,78,78);

COMMIT;
*/
-- %�� �������� �ʴ´� => MOD�Լ��� �̿��Ѵ�
SELECT hakbun , name , kor , eng , math , (kor+eng+math) "total" , (kor+eng+math)/3 "avg" FROM student;

/*
	1) �����ͺ��̽� => �ݵ�� �÷Ÿ� / ���������� Ȯ��
	2) SQL������ ����
	  ��ü ������ ��� ==> *
	   ***���ϴ� ������ ��� ==> column ���
	   SELECT : ������ �˻� ��ɾ� => ������ �б�
	����) 
		5. SELECT [DISTINCT] * |column1 , column2 ...
		1. FROM  table_name (view_name , SELECT~) ==> �ʼ�
		[
		2. 	WHERE ���ǹ� => ������
		3. 	GROUP BY �׷��÷� => �׷캰�� ��� , ȸ�� => ���� ���
					---------- ���� ���� ������ �ִ�(deptno , job , hiredate)
		4.	HAVING �׷쿡 ���� ����
		6.	ORDER BY �÷��� (ASC|DESC) => ����
		]
		=> ���ϴ� �÷��� ���� ������ ����
		=> ������
		=> ���� �Լ� (������ �Լ�)
		=> �׷캰 ó�� (�����Լ�)
		***=> JOIN(���̺���) => ������ ����
		***=> SubQuery => SQL  ������ �Ѱ��� �����
		----------------------------------------------------- SELECT
		=> DDL => ���̺� ���� , �ڵ�������ȣ , �������̺� , �ε��� ...
			***=> ������ ���̽� ���� / ����ȭ(1,2,3)
		=> ������ ÷�� , ���� , ���� => DML
		=> ���� ���
			***=> PL/SQL
		***=> �ϰ�ó�� : Ʈ�����
*/