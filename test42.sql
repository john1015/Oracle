-- 2024-06-24
/*
	1. �ε��� (INDEX)
	= �˻��ӵ� ���
	= �޸𸮰� ���� �ʿ� �Ѵ�
	*** �ε����� ����Ͽ� �׻� �˻� �ӵ��� �������� ���� �ƴϴ�
	=> ����� �����Ͱ� ���� ��� / DML ���� ���Ǵ� ��(INSERT UPDATE DELETE)
							= �Խ��� , ��� , ��ٱ���
	�ε����� �ڵ����� ���� : PRIMARY KEY , UNIQUE ���� �ÿ��� �ڵ����� ����

 	�ε��� ����
	=> �ñ�
	1) �����Ǵ� ���� ���� ���(PRIMARY KEY)
	2) WHERE�� �̿��Ͽ� ���� �˻��Ǵ� �÷��� �ִ� ��� => name , subject , price ...
	3) JOIN���� �ַ� ���Ǵ� �÷�
	4) NULL���� �����ϴ� �÷��� ���� �ִ� ���
		=> �ε����� ������ �ʴ� �κ�
			=> INSERT / UPDATE / DELETE => �ε����� ���� ��쿡 ���� ����

	247page
	----------
	1. �����͸� ���� ������ ã�� �� �ְ� ���� ������ ���� => �ε���
	2. B-tree
			��Ʈ
			------
			   |
		--------------------------------- ���� ��Ʈ
		|		     |			|
	    -------		  ------	    ------ ���� ��Ʈ

	1  2  3  4  5  6  7
		  ---


					4   =========> ��Ʈ
				   ---------

			2				6  =====> ���� ��Ʈ
			|				|
		  ---------			  ---------
		  |	    |			  |  	    |
		 1	   3			  5        7    ===> B-tree => ���� ��Ʈ
							
	252page �ε��� ����
	 	=> primary key/ unique => �ڵ� ����
		=> ����
		 	CREATE INDEX�� ON ���̺��(�÷���) => �÷���(ASC) , �÷���(DESC)
		 	CREATE INDEX�� ON ���̺��(�÷��� , �÷���) 
		=> ����
			DROP INSEX �ε��� ��
		=> ����
			ORDER BY ASC
					=> ��Ʈ
						/*+ */
						--+
			=> SELECT /* + INDEX_ASC(���̺�� PK/UK)  */ �÷���
			ORDER BY DESC
			=> SELECT /* + INDEX_DESC(���̺�� PK/UK)  */ �÷���
*/
/*
DROP INDEX idx_emp_sal;
CREATE index idx_emp_sal ON emp(sal DESC);
SET LINESIZE 300
select empno , ename , job , sal from emp where sal>0;
*/
/*
CREATE INDEX idx_emp_ename ON emp(ename DESC);
SELECT empno, ename , job , sal
FROM emp
WHERE ename>='A';
*/
/*
DROP INDEX idx_emp_ename;
-- PRIMARY KEY => �ڵ����� �ε����� ����
SELECT no,goods_name
FROM goods_all;
*/
--CREATE INDEX idx_book_pp ON book(publisher,price DESC);
/*
	254page
	   �ε��� �籸�� / ����
	   ------------------ �߰� / ���� / ���� => �ε����� �ٽ� ���� => �ε����� DML���� ���󵵰� ����
	  ALTER INDEX index�� REBUILD
	  DROP INDEX index��
*/
-- CREATE INDEX idx_emp_job ON emp(job);
-- ALTER INDEX idx_emp_job REBUILD;
-- DROP INDEX idx_emp_job;
/*
	1. �ε��� ��� ����
		=> ���� ������ �˻������ ������ �� �� �ִ� ������ ����(B-tree)
		=> SQL���� ó���ӵ��� ������
		     -------------------------------- ����ȭ
		=> �˻�� ���� ���Ǵ� �÷��� �ִ� ���(����) => ����
		=> JOIN���� �񱳵Ǵ� �÷� (deptno,id) => id�� �ڵ� ���� => PRIMARY KEY 
		=> INSERT , UPDATE , DELETE�� ���� ��쿡�� ���ÿ� �ӵ��� ���� => REBUILD
		=> �����Ͱ� 1000�� �̻� => �˻��ÿ� INDEX�� �̿��ϸ� ����
	2. ����
	  CREATE INDEX index�� ON ���̺�(�÷���)
			       -------- �ߺ��� �� ���� ==> user_indexs (���̺�)
	3. ����
	  ALTER INDEX index�� REBUILD => INSERT / UPDATE / DELETE => �ε��� �籸��
	4. ����
	  DROP INDEX index��
	5. ���Ľ�
	  => INDEX_ASC(���̺�� PK��)
	  => INDEX_DESC(���̺�� PK��) ==> ORDER BY���� �ӵ��� ���	

	=> DQL / DML
		SELECT : ������ �˻�
		INSERT : ������ �߰�
		DELETE : ������ ����
		UPDATE : ������ ����
	=> DDL => ���� (table , view , sequence) => ��������
	=> TCL : COMMIT / ROLLBACK
		=> �ڹٴ� AutoCommit() => executeUpdate() => commit�� ����
	=> 252 ~ 254page
	����Ŭ�� �����Ҷ��� �����̳� sql�������� ���� �����ؾ� ����
	���� => �ڹ�

*/
