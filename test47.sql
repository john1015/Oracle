-- 2024-06-25
-- 프로시저 => 실제 처리하는 기능 => INSERT, UPDATE, DELETE, SELECT => PL (프로시저를 만드는 언어)
/*
	프로시저는 기능을 가지고 있다
	단점) 리턴형을 가지고 있지 않다

	=> 리턴형을 사용하지 않고 결과값을 넘겨주는 방법 = 오라클 (C언어) => 포인터 이용
		=> 자바 : Call By Reference
		=> IN => SQL에 값을 대입 시에 사용 => INSERT, UPDATE, DELETE
		=> OUT => 실행 결과값을 보내준다 (포인터)
		=> IN OUT => IN / OUT 동시에 사용
		=> 생략 시에 IN 변수다
		=> ROW를 여러개 보내는 경우 : REF_CURSOR
	=> 형식)
	CREATE [OR REPLACE] PROCEDURE pro_name(매개 변수)
	IS | AS
	  변수 선언
	BEGIN
	  사용자 요청에 따라 구현 => SQL
	END;
	/

	=> Error 확인
	show error;
	컴파일 에러와 동시에 프로시저가 생성되었습니다
*/
/*
DROP TABLE student;

CREATE TABLE student(
	hakbun NUMBER,
	name VARCHAR2(51) CONSTRAINT std_name_nn NOT NULL,
	kor NUMBER,
	eng NUMBER,
	math NUMBER,
	CONSTRAINT std_hak_pk PRIMARY KEY(hakbun)
);

CREATE SEQUENCE std_hak_seq
	START WITH 1
	INCREMENT BY 1
	NOCACHE
	NOCYCLE;
*/
-- 추가
CREATE OR REPLACE PROCEDURE studentInsert(
	vName student.name%TYPE,
	vKor student.kor%TYPE,
	vEng student.eng%TYPE,
	vMath student.math%TYPE
)
IS
BEGIN
  INSERT INTO student VALUES(std_hak_seq.nextval,vName,vKor,vEng,vMath);
  COMMIT;
END;
/
/*
	SQL 문장이 보이지 않는다 => 보안 / 필요 시에는 트랜잭션 처리
	단점 : 분석하기 어려울 수 있다
	프로시저 => 내장 함수 => 메뉴얼 => ERP (관리 => 테이블 형태로 만들어진다)
*/
-- 삭제
CREATE OR REPLACE PROCEDURE studentDelete(vHakbun student.hakbun%TYPE)
IS
BEGIN
  DELETE FROM student
  WHERE hakbun=vHakbun;
  COMMIT;
END;
/

-- 수정
CREATE OR REPLACE PROCEDURE studentUpdate(
	vHak student.hakbun%TYPE,
	vName student.name%TYPE,
	vKor student.kor%TYPE,
	vEng student.eng%TYPE,
	vMath student.math%TYPE)
IS
BEGIN
  UPDATE student SET
  name=vName,
  kor=vKor,
  eng=vEng,
  math=vMath
  WHERE hakbun=vHak;
  COMMIT;
END;
/

-- 찾기 = OUT
CREATE OR REPLACE PROCEDURE studentFind(
	vHak student.hakbun%TYPE,
	pResult OUT SYS_REFCURSOR
)
IS
BEGIN
  -- pResult에 select에서 실행된 데이터를 CURSOR에 첨부
  OPEN pResult FOR
	SELECT * FROM student
	WHERE hakbun=vHak;
END;
/

-- 목록 = OUT => SELECT
CREATE OR REPLACE PROCEDURE studentAllData(
	pResult OUT SYS_REFCURSOR
)
IS
BEGIN
  OPEN pResult FOR
	SELECT * FROM student;
END;
/

-- 평균
CREATE OR REPLACE FUNCTION stdAvg(vHak student.hakbun%TYPE) RETURN NUMBER
IS
  vAvg NUMBER;
BEGIN
  SELECT ROUND((kor+eng+math)/3,2) INTO vAvg
  FROM student
  WHERE hakbun=vHak;
  RETURN vAvg;
END;
/

-- 총점
CREATE OR REPLACE FUNCTION stdTotal(vHak student.hakbun%TYPE) RETURN NUMBER
IS
  vTotal NUMBER;
BEGIN
  SELECT kor+eng+math INTO vTotal
  FROM student
  WHERE hakbun=vHak;
  RETURN vTotal;
END;
/

-- 함수 호출 => SELECT
-- 프로시저 호출 => CALL 프로시저명
SELECT hakbun,name,kor,eng,math,stdAvg(hakbun),stdTotal(hakbun)
FROM student;







