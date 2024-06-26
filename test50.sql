-- 2024-06-26
-- ����Ŭ ���� ����
/*
	���� => SQL���� ���� ����
	���� => ����
	======== ������Ʈ

	=> SQL : ����ȭ�� ���� ���
				  ====== SELECT
	=> ����Ŭ : ����Ʈ , ȸ�� , �б� ... �����͸� ������ �������� �����ϴ� ������ : static
	=> �����ͺ��̽� ���� �ý��� (����Ŭ)
	     ================= CRUD (������ ����) => �߰� , ���� , ���� , �˻�
	     SQL
		= DQL : SELECT => ������ �˻�
			    ����)
				SELECT * | column1 , column2 ...
				FROM table_name
				[
					WHERE ���ǹ� (�÷��� ������ ��)
					GROUP BY �׷��÷� | �����Լ�
					HAVING �����Լ�
					ORDER BY �÷���(ASC | DESC)
				]
			    = ������ => WHERE����
				=> ��������� ( + - * / )
				    => ����ó�� => �ڵ����� ���������� ����
					  '1' + '2' => 3 => TO_NUMBER('1')
				    => �����ϰ� ����� ó��
					 ==============
					 + : ���ڿ� ������ ���� �ʴ´� => 'a'+1 (�����߻�) => 'a'||1
					 / : ����/���� = �Ǽ�
				    => ROW���� ��� => SELECT�ڿ� �ַ� ���(WHERE�ڿ��� ������� �ʴ´�)
				=> �񱳿����� => WHERE���� �ڿ� ��� => TRUE/FALSE
				    = ���� , <>(!=) �����ʴ� , <(�۴�) , > (ũ��) , <= (�۰ų� ����) , >= (ũ�ų� ����)
					*** ���ڳ� ��¥�� �񱳰� �����ϴ�
				=> �� ������ AND (���Ŀ����� , ���� �ΰ��� ���ÿ� TRUE) , OR(���Ŀ����� , TRUE�� �Ѱ� �̻�)
					*** || (���ڿ� ����), & (�Է°�)
				=> �����ͺ��̽����� ����ϴ� ������
					NOT : ���������� = NOT IN , NOT BETWEEN , NOT LIKE
					NULL => ����ó���� �ȵȴ�
						      IS NULL , IS NOT NULL
					IN : OR�� ������ �ִ� ��� => ���� ���ǰ˻�
					LIKE : % => ���� ���� ������ ���� ���
						 _  => ���� �Ѱ� => �˻��ÿ� �ַ� ���
						�ֱ� : REGXP_LIKE()
					BETWEEN ~ AND : �Ⱓ , ���� => ������ ������

			    = �����Լ�

				���� �Լ�
					= LENGTH : ������ ����
					= SUBSTR : ���ڸ� �ڸ��� ���
					= RPAD : => IDã�� , ��й�ȣ ã��
					========= ������ �ڹ� String ���� ó���� ����
				���� �Լ�
					= ROUND : �ݿø� �Լ�
					= CEIL : �ø� �Լ�
					======== ������ �ڹ� Math�� ó��
				��¥ �Լ�
					= SYSDATE : �ý����� ��¥ , �ð�
				��ȯ �Լ�
					= TO_CHAR : ���ڿ� ��ȯ
					   ��¥ => YYYY,MM,DD , HH24 ,MI ,SS
					   ���� => 9,999,999
				��Ÿ �Լ�
					= NVL : NULL���� ��ü
				���� �Լ�
					= COUNT : ROW�� ����
					= AVG , SUM , MAX

			    = JOIN : �ΰ��̻��� ���̺��� �ʿ��� �����͸� ����
					INNER JOIN => INTERSECT(������)

						Oracle JOIN
						    SELECT A.column , B.column
						    FROM A,B
						    WHERE A.column = B.column

						ANSI JOIN
						    SELECT A.column , B.column
						    FROM A JOIN B
						    ON A.column = B.column

					OUTER JOIN => INNER JOIN + MINUS

						Oracle JOIN
						    SELECT A.column , B.column
						    FROM A,B
						    WHERE A.column = B.column(+) => LEFT OUTER JOIN

						    SELECT A.column , B.column
						    FROM A,B
						    WHERE A.column(+) = B.column => RIGHT OUTER JOIN

						ANSI JOIN
						    SELECT A.column , B.column
						    FROM A LEFT OUTER JOIN B
						    ON A.column = B.column

						    SELECT A.column , B.column
						    FROM A RIGHT OUTER JOIN B
						    ON A.column = B.column

			    = �������� : SQL���� �ΰ��̻��� ���� => �Ѱ��� ����

				MainQuery = (SubQuery)
				 ����	|	    ======= ����
				 	|		| 
					========
				�Ϲ� ��������  
					SELECT ~~ 
					FROM table_name
					WHERE �÷��� ������ (SELECT ~)
				
				��Į�� ��������
					�÷� ��� ���
					SELECT �÷��� , (SELECT ~)
					FROM table_name

				�ζ��� ��
					���̺� ��� ���
					SELECT ~
					FROM (SELECT ~~)
					=> rownum => ����Ŭ���� �����ϴ� ���� �÷�
								INSERT�� �ڵ����� ROW��ȣ�� �߰�
							  => rownum�� ���� ���� => �ζ��κ並 �̿��Ѵ�
								���̺��� �̹� rownum ����
					
		= DML : INSERT => ������ �߰� , UPDATE => ������ ���� , DELETE => ������ ����
			    INSERT
				=> ��ü �߰�
					INSERT INTO table_name VALUES(��...)
				=> ���ϴ� �÷����� �߰� => DEFAULT , NULL����� �÷��� ����
					INSERT INTO table_name(�÷�,,,) VALUES(��...)
			    UPDATE
				UPDATE table_name SET
				�÷��� = �� , �÷��� = �� ...
				[WHERE ���ǹ�]
			    DELETE
				DELETE FROM table_name
				[WHERE ���ǹ�]
			    =========================== �ݵ�� COMMIT�� ����ؾ� ������ �ȴ�
				*** �ڹٴ� �⺻�� AutoCommit()
		   => ����Ŭ�� �ִ� �����ʹ� ������ ����
		   => �ǽð� ������ ó��
		= ������� (���� ����)
				   |	  | ���̺�
				�����ͺ��̽� (XE)
			DDL
			  => ���� (CREATE) , ���� (ALTER) , ���� (DROP) , �̸����� (RENAME) , �����͸� ���� (TRUNCATE)
				TABLE , VIEW , SEQUENCE ,FUNCTION , PROCEDURE , TRIGGER
				***= TABLE ���� => ��������
					CREATE TABLE table_name(30byte)
					(
						�÷��� �������� [��������] ,  ==> NOT NULL , DEFAULT
						�÷��� �������� [��������] ,
						�÷��� �������� [��������] ,
						[��������] ,  ==> PRIMARY KEY , FOREGIN KEY , CHECK , UNIQUE
						[��������]  
					);
					=> ��������
						���� : CHAR(1~2000byte) => ���ڼ��� ������ �����͸� ���� (���� / ����)
							=> ���� ����Ʈ
							VARCHAR2(1~4000byte) =>������ �޸�
							CLOB : 4�Ⱑ => �ٰŸ� , ȸ��Ұ� ...
						���� : NUMBER => NUMBER(8,2) => ����,�Ǽ�
						��¥ : DATE 
					=> ���� ���� => �̻����� ���� => UPDATE , DELETE (������ �ʴ� �����Ͱ� �ս�)
						= NOT NULL : ������ ���� �߰�
						= UNIQUE : �ߺ����� ������ (���� : NULL�� ���) ==> ��üŰ
						= �⺻Ű => ���̺��� ROW�� ������ => ���� : �Ѱ��̻��� �⺻Ű�� ������ �ִ�
								PRIMARY KEY = NOT NULL + UNIQUE
						= �ܷ�Ű (����Ű) = �ٸ� ���̺��� ���� ����
								FOREGN KEY
						= ������ �����͸� �߰��� ���� : CHECK
					=> ���� : DROP
							DROP TABLE table_name
					=> �÷��� ���� : ALTER
						ALTER TABLE table_name ADD �÷��� ��������
						ALTER TABLE table_name MODIFY �÷��� ��������
						ALTER TABLE table_name DROP COLUMN �÷���
				***= VIEW ���� => ������ ���� => ������ �ݺ� => SQL������ ����
					CREATE [OR REPLACE] VIEW view_name
					AS
					   SELECT ~~ => JOIN/SubQuery => ������ ����
				***= SEQUENCE : �ڵ� ������ȣ
					CREATE SEQUENCE seq��
					   START WITH 1
					   INCREMENT BY 1
					   NOCACHE
					   NOCYCLE
				============================== �ݵ�� ����
				= FUNCTION
				= PROCEDURE
				= TRIGGER
		= DCL : ���Ѻο� => system(������ ����) , hr(����� ����) 
						  | GRANT(���Ѻο�) , REVOKE(���� ����)
			   GRANT CREATE VIEW TO hr
							 ===
			   REVOKE CREATE VIEW FROM hr
							  ====
			   *** �Լ� ��� / �������� ���� => ���� : ��Ī  =>  �÷��� "" | �÷��� AS ��Ī
		= TCL : �ϰ� ó��(Ʈ�����)
			   COMMIT(���� ����) , ROLLBACK (��ɹ� ��ü ���)
		   *** ���� : �������� ���
				========= ������ �߻��� �����ϰ� ���� ��ɹ����� �̵�
		   ��) 
			�԰� => INSERT => ���� �߻�
			��� => INSERT
			======================= �ΰ��� ���ÿ� ������ �ȵȴ�
			  �԰� => INSERT
			  ��� => INSERT => ���� �߻�
			======================= �԰� ���� ���� , ��� ������ �ȵȴ�
			=> ���߿� �Ѱ��� �����߻��� �ϸ� ���ÿ� ����� ���
*/ 
/*
CREATE TABLE card(
	no NUMBER , 
	id VARCHAR2(20)  CONSTRAINT card_id_nn NOT NULL ,
	price NUMBER , 
	CONSTRAINT card_no_pk PRIMARY KEY(no)
);
CREATE TABLE point(
	pno NUMBER ,
	cno NUMBER , 
	point NUMBER DEFAULT 0,
	CONSTRAINT point_pno_pk PRIMARY KEY(pno) , 
	CONSTRAINT point_cno_fk FOREIGN KEY(cno) 
	REFERENCES card(no)
);
*/

-- INSERT INTO card VALUES(1,'hong',10000);
-- INSERT INTO point VALUES(1,1,100);
-- COMMIT;
-- INSERT INTO 