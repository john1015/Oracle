-- 2024-06-24

-- PL / SQL => 반복문 , CURSOR
/*
	반복문
	1) 기본 반복문
	    형식)
		LOOP
		  반복 처리문장
		EXIT 조건 => 종료
		END LOOP
	2) WHILE
	   형식)
		WHILE 조건 LOOP
		   반복 처리 문장
		END LOOP
	*** 3) FOR
	   형식)
		FOR 변수 IN [REVERSE] lo..hi LOOP ==> 1...9
				  ---------- 역순 출력
		   처리 문장
		END LOOP

		예)
			FOR i IN 1..9 => 1 ~ 9
			FOR i IN REVERSE 1..9 => 9 ~ 1
*/
-- 기본 LOOP => 1~ 10
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
       -- 증가식
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