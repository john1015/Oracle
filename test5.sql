-- 129 page => ���̺��� �÷� ���� / ������
/*
	BOOK / Customer / Orders
	å����  ȸ������   å���� ��Ȳ
	-----------------------------------
	EMP  	/ 	 DEPT  ==> ����Ŭ���� �����ϴ� ���� ���̺�
	�������		�μ����� => ���ɹ� => ������ ����
	EMP => 8�� �÷�
	  = empno : ��� => ������ (�ߺ��� ����) => �Ѹ��� ���� ���� => empno�� �̿��Ѵ�
				   PRIMARY KEY (��� ���̺��� ���Ἲ ��Ģ => �Ѱ��̻��� ������ �ִ�)
	 = ename  : �̸�
	 = job : ����
	 = mgr : ��� ���
	 = hiredate : �Ի��� 
	 = sal : �޿�
	 = comm : ������
	 = deptno : �μ���ȣ => ����
	DEPT => 3�� �÷�
	 = deptno : ������ (�ߺ��� ����) => �μ��˻� (��)
	 = dname : �μ���
	 = loc : �ٹ���

	*** SQL�� �ۼ��� ������
	1. ���ɹ��� ���ᰡ �Ǹ� ;
	2. ���ڿ� : '���ڿ�'
	3. ��¥ : 'YY/MM/DD'
	4. �÷����� ��ų� / �� �𸣴� ��� => ��Ī
	 �÷��� as ��Ī / �÷��� "��Ī" = �ο빮��
					 ---------
	5. Ű����� �빮�ڷ� ������ �ҹ���
	   -------------------    --------------- �÷��� , ���̺��� => �ڹ� ������ ���ϴ�
	6. SELECT ~
	   FROM ~
	   WHERE ~ ;
	7. ���� / => ����� ����
	    system : ������ / ���� ...	 
	    hr : ����� ���� => �ʿ��� ���̺�
	---------------------------------------------------------------------------------------------
	142page
	----------
	SQL(����ȭ�� ���� ��� => ���ɹ����θ� �Ǿ� �ִ�)
	----
	       = DQL : ���̺��κ��� ������ ���� : SELECT
	       = DML : ������ ���� : INSERT , UPDATE , DELETE
	       = DDL : ���� ���(���̺� ���� , �� ���� , �ڵ����� ��ȣ , �ε���...)
			CREATE / ALTER / DROP / RENAME / TRUNCATE
	       = DCL : ������ (���Ѻο� , ���� ����) ==> system���� ó��
			GRANT / REVOKE
	       = TCL : Ʈ����� ��� (�ϰ�ó�� => ���� , ���ɹ� ���)
			COMMIT / ROLLBACK
	    => ���� PL / SQL => �Լ�
		FUNCTION / PROCEDURE / TRIGGER

	1. DQL => ���̺��κ��� ������ ����
	  = ���ɹ�
		= ��ü �����͸� ������ �´� (*)
		= �ʿ��� �����͸� ������ �´� (column_list)
		*** SELECT
			1) �÷����� ��� => ��Į�� �������� => ���� ��� ���
			2) �������� ��� => ��������
			3) ���̺� ��� ����� ���� => �ζ��� ��
				=> �����ؼ� �����͸� ������ �� �� �ִ� => ���� �Լ�
		SELECT * | column1,column2 ...
		FROM table_name(view_name , SELECT ~(�ζ��� ��))
		--------------------------------------------------------------- �ʼ�
		[
			WHERE ���ǹ� => ������ 
			GROUP BY �׷� �÷�
			HAVING �׷� ����
			ORDER BY �÷��� (ASC | DESC) => ���� (�ø� / ����)
					=> ASC�� ������ ����
		]
		SELECT FROM WHERE
		SELECT FROM GROUP BY
		SELECT FROM WHERE ORDER BY
		==> ������ �����ϴ� ���
			1. ���� (����) => ���ɹ� ����
			2. ������ 
			3. �����Լ�
			------------------------ SUBQUERY / JOIN
		1. �ߺ����� ������ ����
			=> DISTINCT
		2. ��Ī
			=> �÷��� �ڿ�  "��Ī"
		3. ���ڿ� ����
			=> ||
		4. ���ڿ� => �ݵ�� ' '
		5. ������ ���� => ;
*/
-- emp�� ��ü ������ ���
-- SELECT * FROM emp ;
-- ���ϴ� �����͸� ���� => column_list �� �̿��Ѵ� ��� / �̸� / ���� / �Ի��� / �޿�
-- SELECT empno , ename , job , hiredate , sal FROM emp;
-- �𸣴� �÷��� ��Ī�� �ο��Ѵ� - �ѱۻ��� ansi�� ����
-- SELECT empno "���" , ename "�̸�" , job "����" , hiredate "�Ի���" , sal "�޿�" FROM emp;
-- SELECT empno as ��� , ename as �̸� , job as ���� , hiredate as �Ի��� , sal as �޿� FROM emp;
-- EMP���̺��� �ִ� �μ��� ��� => deptno
--SELECT deptno FROM emp;
-- �ߺ� ����
-- SELECT DISTINCT deptno FROM emp;
-- ���ڿ� ���� : || => ' '�� ����Ѵ�
SELECT ename ||'����� ������'|| job || '�Դϴ�' from emp;