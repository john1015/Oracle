-- 2024-06-24

-- PL / SQL => �ݺ��� , CURSOR
/*
	�ݺ���
	1) �⺻ �ݺ���
	    ����)
		LOOP
		  �ݺ� ó������
		EXIT ���� => ����
		END LOOP
	2) WHILE
	   ����)
		WHILE ���� LOOP
		   �ݺ� ó�� ����
		END LOOP
	*** 3) FOR
	   ����)
		FOR ���� IN [REVERSE] lo..hi LOOP ==> 1...9
				  ---------- ���� ���
		   ó�� ����
		END LOOP

		��)
			FOR i IN 1..9 => 1 ~ 9
			FOR i IN REVERSE 1..9 => 9 ~ 1
*/
-- �⺻ LOOP => 1~ 10
DECLARE
  sno NUMBER:=1;
  eno NUMBER:=10;
BEGIN
  LOOP
     DBMS_OUTPUT.PUT_LINE(sno);
     sno:=sno+1;  -- sno++
     EXIT WHEN sno > eno;
  END LOOP;
END;
/

-- WHILE

DECLARE
  no NUMBER:=1;
BEGIN
  WHILE no <=10 LOOP
       DBMS_OUTPUT.PUT_LINE(no);
       -- ������
       no:=no+1;
   END LOOP;

END;
/

-- FOR
DECLARE 
  
BEGIN
  FOR i IN 1..10 LOOP
    DBMS_OUTPUT.PUT_LINE(I);
  END LOOP;

END;
/

DECLARE 
  
BEGIN
  FOR i IN REVERSE 1..10 LOOP
    DBMS_OUTPUT.PUT_LINE(I);
  END LOOP;

END;
/