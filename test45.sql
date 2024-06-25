--2024-06-25
/*
	PL/SQL => 프로시저를 만들때 사용하는 언어 => 제어SQL로 한다
	=> JSP프로젝트 1파트만 사용 => 댓글
	=> 함수 => 재사용시에 사용 / 반복이 많은 경우
	=> Function VS Procedure => 함수(메소드)
		=> 차이점 : 리턴형의 존재여부
	기본문법
	DECLARE
	   변수선언
	BEGIN
	   구현 => SQL
	END
	/

	=> 변수 선언 => SELECT는 변수가 아니라 출력 => 변수에 값을 저장 : INTO
	  1) 스칼라 변수 (일반 변수) => 변수명 데이터형 예) no NUMBER(10) , name VARCHAR2(30)
	  2) %TYPE => 실제 테이블에 저장된 컬럼의 데이터형을 읽어 온다
	  3) RECORD 단위 => 테이블에 있는 전체 컬럼에 대한 데이터형을 가지고 온다
	     ========= %ROWTYPE
			변수명 테이블명 %ROWTYPE
				  ---------- 테이블에 존재하는 모든 컬럼의 데이터형 읽기
	  4) 사용자 정의 => TYPE 변수명 RECORD()
	     --------------- JOIN일 경우에 필요한 데이터만 설정
	  ----------------------------- 단점은 1개의 ROW만 가지고 올 수 있다
	  5) 전체 데이터 읽기 => CURSOR
	=> 연산자 / 제어문
		연산자 => SQL때 사용한 모든 연산자를 사용할 수 있다
		제어문
		  조건문
		   => IF
			형식)
				IF 조건문 THEN
					실행문장
				END IF;
		   => IF ~ ELSE
			형식)
				IF 조건문 THEN
					실행문장
				ELSE
					실행문장
				END IF;

		   반복문
		   => WHILE
			형식)
				WHILE 조건문 LOOP
					실행문장
					증가식
				END LOOP;
		   => FOR
			형식)
				FOR 변수명 IN lo ... hi LOOP
					처리문장
				END LOOP;
*/
-- FOR

SET SERVEROUTPUT ON;
DECLARE
BEGIN
   FOR i IN 1..10 LOOP
	IF MOD(I,2)=0 THEN
	   DBMS_OUTPUT.PUT_LINE(i);
	END IF;
   END LOOP;
END;
/

-- 1~100사이의 총합 , 짝수합 , 홀수합 => 변수값 설정 => :=
DECLARE
  total NUMBER:=0;
  even NUMBER :=0;
  odd NUMBER :=0;
BEGIN 
  -- 구현부
  FOR i IN 1..100 LOOP
	total:= total+i;
	IF MOD(i,2)=0 THEN
	   even:=even+i;
	ELSE
	   odd := odd+i;
	END IF;
  END LOOP;
  DBMS_OUTPUT.PUT_LINE('------ 결과 ----- ');
  DBMS_OUTPUT.PUT_LINE('총합 : '||total);
  DBMS_OUTPUT.PUT_LINE('짝수 : '||even);
  DBMS_OUTPUT.PUT_LINE('홀수 : '||odd);
END;
/

-- 사용자의 값을 받아서 구구단
DECLARE
   dan NUMBER:=&dan;
   result VARCHAR2(100):='';
BEGIN
   FOR i IN 1..9 LOOP
	result:=dan||' x '|| i ||' = '||dan*i;
	DBMS_OUTPUT.PUT_LINE(result);
   END LOOP;
END;
/

/*
	CURSOR : ROW 여러개를 모아서 전송 / 출력
	=> 자바 : ROW => ~VO
		      ROW여러개 => ~VO여러개 저장 => ArrayList
	1. 커서 사용법
	    = CURSOR 설정
		CURSOR 커서명 IS
		   SELECT * FROM emp
	    = CURSOR 열기
		OPEN 커서명
	    = 인출 => FETCH
		FETCH 변수명 IN 커서명
		=> 종료시점
		      EXIT WHEN 커서명%NOTFOUND
	    = CURSOR 닫기
		CLOSE 커서명
*/

DECLARE
  vemp emp%ROWTYPE;
  CURSOR cur IS
	SELECT * FROM emp;
BEGIN
-- 커서 열기
  OPEN cur;
-- 인출
  LOOP
     FETCH cur INTO vemp;
     EXIT WHEN cur%NOTFOUND;
     DBMS_OUTPUT.PUT_LINE(vemp.empno||' '||vemp.ename||' '||vemp.job||' '||vemp.hiredate||' '||vemp.sal);
  END LOOP;
END;
/

-- CURSOR => FOR

DECLARE 
	vemp emp%ROWTYPE;
	CURSOR cur IS
	SELECT * FROM emp;
BEGIN
	FOR vemp IN cur LOOP
		DBMS_OUTPUT.PUT_LINE(vemp.empno||' '||vemp.ename||' '||vemp.job||' '||vemp.hiredate||' '||vemp.sal);
	END LOOP;
END;
/

-- JOIN 이있는 경우 처리
DECLARE
   TYPE empDept IS RECORD(
	empno emp.empno%TYPE,
	ename emp.ename%TYPE,
	job emp.job%TYPE,
	dname dept.dname%TYPE,
	loc dept.loc%TYPE
);
-- 변수 선언
	ed empDept;
	CURSOR cur IS 
		SELECT empno,ename,job,dname,loc 
		FROM emp,dept
		WHERE emp.deptno = dept.deptno;
BEGIN
	FOR ed IN cur LOOP
		DBMS_OUTPUT.PUT_LINE(ed.empno||' '||ed.ename||' '||ed.job||' '||ed.dname||' '||ed.loc);
	END LOOP;

END;
/