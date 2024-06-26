-- 2024-06-26 Ʈ���� => PL/SQL
/*
	1. �ڵ� �̺�Ʈ ó��
	   => �̸� ������ ���ǿ� �´� ��쿡 �ڵ����� SQL������ ����
	   => �ǹ����� ���� ������� �ʴ´� (�����߻��� �����α׷����� ó���ϱ� ��ƴ�)
	   => �԰� (INSERT) => �ڵ����� ��� �ϼ�
	   => ��� => ��� ����
	2. ����
	   CREATE| ORREPLACE TRIGGER tri_name
	   BEFORE|AFTER (INSERT|UPDATE|DELETE) ON table_name
	   TRIGGER => ����
	   ���� => TRIGGER
	   =>AFTER

	*** INSERT | UPDATE | DELETE�� ���� (SELECT�� ����)
	*** TRIGGER�� �ڵ� COMMIT(COMMIT�� ������� �ʴ´�)
	*** :NEW => ���ο� �����Ͱ� ���ö�
	*** :OLD => ������ �ִµ�����

	FOR EACH ROW *** ��ü ROW�� ���� ó��

	DECLARE
	BEGIN
	END;
	/

	3. ����
		DROP TRIGGER trigger_name
	4. ����
		ALTER TRIGGER tri_name_(���󵵰� ����) => OR REPLACE
	5. �ַ� ���ó
		=> �� / ���ƿ�
		=> �԰� / ��� => ��� �ڵ�ȭ ó��
*/
/*
CREATE TABLE ��ǰ(
	ǰ�� NUMBER,
	��ǰ�� VARCHAR2(30),
	�ܰ� NUMBER
);
CREATE TABLE �԰�(
	ǰ�� NUMBER,
	���� NUMBER,
	�ݾ� NUMBER
);
CREATE TABLE ��� (
	ǰ�� NUMBER,
	���� NUMBER,
	�ݾ� NUMBER
);
CREATE TABLE ���(
	ǰ�� NUMBER,
	���� NUMBER,
	�ݾ� NUMBER,
	�����ݾ� NUMBER
);
*/
--��ǰ
/*
INSERT INTO ��ǰ VALUES(100,'�����',1500);
INSERT INTO ��ǰ VALUES(200,'���ڱ�',1000);
INSERT INTO ��ǰ VALUES(300,'������',2000);
INSERT INTO ��ǰ VALUES(400,'¯��',500);
INSERT INTO ��ǰ VALUES(500,'������',2500);
COMMIT;
*/
-- �԰� => ��� �ڵ�ȭ ó��

CREATE OR REPLACE TRIGGER input_trigger
AFTER INSERT ON �԰�
FOR EACH ROW
DECLARE
  v_cnt NUMBER:=0;
BEGIN
	SELECT COUNT(*) INTO v_cnt
	FROM ���
	WHERE ǰ��=:NEW.ǰ��;
	
	IF v_cnt=0 THEN -- ��� �Ż�ǰ�� ���� ���
	  INSERT INTO ��� VALUES(:NEW.ǰ�� , :NEW.���� , :NEW.�ݾ�, :NEW.����*:NEW.�ݾ�);
	ELSE -- ��� ��ǰ�� �̹� ����
	  UPDATE ��� SET
	    ���� = ����+:NEW.���� , 
	    �����ݾ� = �����ݾ�+(:NEW.���� * :NEW.�ݾ�)
	    WHERE ǰ�� = :NEW.ǰ��;
-- ������ : AUTOCOMMIT
	END IF;
END;
/

--�԰�

--INSERT INTO �԰� VALUES(100,5,1500);
--COMMIT;

-- INSERT INTO �԰� VALUES(200,10,1000);
-- COMMIT;
-- SELECT * FROM �԰�;
-- SELECT * FROM ���;
-- Ʈ���� : ������� => ���̺� �ΰ��� ���ÿ� ó��

-- ���
CREATE OR REPLACE TRIGGER output_trigger
AFTER INSERT ON ���
FOR EACH ROW
DECLARE
   v_cnt NUMBER := 0;
BEGIN
   -- ���� Ȯ�� => ���Ǵ� ǰ���� ����
  SELECT COUNT(*) INTO v_cnt
  FROM ���
  WHERE ǰ�� = : NEW.ǰ��; -- ��� INSERT�� => ������ ǰ���� �о� �´�
	IF :NEW.���� = v_cnt THEN
	DELETE FROM ���
	WHERE ǰ�� = :NEW.ǰ��;
	ELSE 
	UPDATE ��� SET
	���� = :NEW.���� , 
	�����ݾ� = :NEW.�����ݾ� = (:NEW.���� * :NEW.�ݾ�)
	WHERE ǰ�� =:NEW.ǰ��;
	END IF;
END;
/

INSERT INTO ��� VALUES (100,5,1500);
COMMIT;
SELECT * FROM ���;
SELECT * FROM ���;
