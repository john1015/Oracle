-- 2024-06-24
/*
	267page => 데이터베이스 프로그래밍 => JDBC => 웹
			  ----------------------------
			  PL/SQL => 재사용이 많은 경우
			  ---- 프로시저를 만드는 언어
				---------- 자바에서 => 메소드
				= 리턴형이 있는 함수 => SUBSTR , TRIM ... => SELETE뒤에 사용
					FUNCTION
				= 리턴형은 없는데 기능을 수행 => INSERT , UPDATE ... => 단독호출이 가능하다
					PROCEDURE
				--------------------------------- 자바에서 호출
				= 자동화 처리 : 트리거(TRIGGER)
				--------------------------------- 오라클 자체 처리 => 분석하기 어렵다
				   => 입고 => 재고(자동화)
				   => 출고 => 재고(자동화)
				   => 댓글 => 맛집의 댓글 횟수(자동화)
				-----------------------------------------------------------------------------------------------------
					프로시저 => 모든 영역의 댓글을 수행

				PL / SQL 사용법 => 호불호 (압체) => 50:50 (많이 사용하는 업체 => ERP) => {}를 사용하지 않느다
				----------												  --- 파이썬
				FOR
				FOR =>
					FOR
						FOR => 들여쓰기
					파이썬 / C / Java
							컴포넌트 => 조립식
						함수
				=> 들여쓰기
				=> Spring FRamework : 설정 파일 : XML
				=> Spring Boot : 설정 파일 : yml(들여쓰기) => MSA

				DECLARE => CREATE PROCEDURE , CREATE FINCTION , CREATE TRIGGER
				=> 선언 (변수 선언)
				BEGIN
				=> SQL문장으로 구현
				END
				/

				= 변수
					1) 일반 변수(스칼라 변수)
						변수명 데이터형 ; 
						no NUMBER;
						name VARCHAR2(50)
					2) TYPE : 실제 테이블의 컬럼이 가족 있는 데이터형을 읽어 올때 => ****** 가장 많이 사용
						empno , emp.empno%TYPE
								  ----------- 실제 데이터형을 가지고 온다
						     테이블명.컬럼명%TYPE
					3) 테이블에 존재하는 모든 컬럼의 데이터	
						%ROWTYPE
						emp emp%	ROWTYPE
					4) 사용자 정의 데이터형 => RECORD => JOIN , SUBQUERY에서 주로 사용
					-------------------------------------------------------------------- ROW 한개에 대한 데이터
					5) 여러개의 ROW를 읽어 오는 경우 : CURSOR
											  ----------- ResultSet
				= 연산자
				= 제어문
*/
/*
SET SERVEROUTPUT ON;
DECLARE
 -- 변수 선언
  pEmpno NUMBER(4);
  pEname VARCHAR2(20);
  pJob VARCHAR2(20);
  pHiredate DATE;
  pSal NUMBER(7,2);
BEGIN 
-- INTO는 SELECT에서 실행된 데이터를 변수에 저장시에 사용
  SELECT empno , ename , job , hiredate , sal INTO pEmpno , pEname , pJob , pHiredate , pSal
  FROM emp
  WHERE empno =&sabun;
-- 출력
DBMS_OUTPUT.PUT_LINE('----------------- 결과 ------------------');
DBMS_OUTPUT.PUT_LINE('사번 : '||pEmpno);
DBMS_OUTPUT.PUT_LINE('이름 : '||pEname);
DBMS_OUTPUT.PUT_LINE('직위 : '||pJob);
DBMS_OUTPUT.PUT_LINE('입사일 : '||pHiredate);
DBMS_OUTPUT.PUT_LINE('급여 : '||pSal);


END;
/
*/
/*
-- %TYPE : 실제 컬럼의 데이터형을 읽어 온다 => 테이블.컬럼%TYPE => 가장 많이 사용
DECLARE 
 -- 사용할 변수 설정
 pEmpno emp.empno%TYPE;
 PEname emp.ename%TYPE;
 pJob emp.job%TYPE;
 pHiredate emp.hiredate%TYPE;
 pSal emp.sal%TYPE;
BEGIN
 -- SQL문장으로 제어 
  SELECT empno , ename , job , hiredate , sal INTO pEmpno , pEname , pJob , pHiredate , pSal
  FROM emp
  WHERE empno =&sabun;
-- 출력
DBMS_OUTPUT.PUT_LINE('----------------- 결과 ------------------');
DBMS_OUTPUT.PUT_LINE('사번 : '||pEmpno);
DBMS_OUTPUT.PUT_LINE('이름 : '||pEname);
DBMS_OUTPUT.PUT_LINE('직위 : '||pJob);
DBMS_OUTPUT.PUT_LINE('입사일 : '||pHiredate);
DBMS_OUTPUT.PUT_LINE('급여 : '||pSal);
END;
/
 */

-- %ROWTYPE =>테이블 전체 컬럼의 데이터형을 읽어 온다
--    ----------- ~ VO
DECLARE
 pEmp emp%ROWTYPE;
-- emp가 가지고 있는 모든 컬럼의 데이터형을 읽어온다
BEGIN
 SELECT * INTO pEmp
 FROM emp
 WHERE empno=7900;

-- 출력
 DBMS_OUTPUT.PUT_LINE('--------------- 결과 ----------------');
 DBMS_OUTPUT.PUT_LINE('사번 : '|| pEmp.empno);
 DBMS_OUTPUT.PUT_LINE('이름 : '|| pEmp.ename);
 DBMS_OUTPUT.PUT_LINE('직위 : '|| pEmp.job);
END;
/

-- 사용자 정의 데이터형 => JOIN => RECORD
DECLARE
 TYPE empDept IS RECORD
 (
	empno emp.empno%TYPE ,
	ename emp.ename%TYPE , 
	job emp.job%TYPE , 
	hiredate emp.hiredate%TYPE , 
	sal emp.sal%TYPE , 
	dname dept.dname%TYPE , 
	loc dept.loc%TYPE , 
	grade salgrade.grade%TYPE
 );
-- 변수 선언
ed empDept;

BEGIN
 SELECT empno,ename,job,hiredate,sal,dname,loc,grade INTO ed
 FROM emp,dept,salgrade
 WHERE emp.deptno = dept.deptno
 AND sal BETWEEN losal AND hisal
 AND empno = 7900;
-- 사원함녕에 대한 정보 저장 => 여러명 저장시에는 CURSOR (ArrayList , ResultSet)
 DBMS_OUTPUT.PUT_LINE('--------------- 결과 ----------------');
 DBMS_OUTPUT.PUT_LINE('사번 : '|| ed.empno);
 DBMS_OUTPUT.PUT_LINE('이름 : '|| ed.ename);
 DBMS_OUTPUT.PUT_LINE('직위 : '|| ed.job);
 DBMS_OUTPUT.PUT_LINE('입사일 : '|| ed.hiredate);
 DBMS_OUTPUT.PUT_LINE('급여 : '|| ed.sal);
 DBMS_OUTPUT.PUT_LINE('부서명 : '|| ed.dname);
 DBMS_OUTPUT.PUT_LINE('근무지 : '|| ed.loc);
 DBMS_OUTPUT.PUT_LINE('호봉 : '|| ed.grade);
END;
/

/* 
	테이블이 여러개 연결 => RECORD / CURSOR
	테이블 1개 => ROW 1개 => 일반 변수 / %TYPE / %ROWTPYE
	CURSOR => FOR 사용법

	변수 => 스칼라 변수 (일반 변수 : 변수명 데이터형)
		    %TYPE(테이블의 실제 데이터형 : 변수명 테이블명.컬럼명%TYPE)
		    %ROWTYPE(한개의 테이블 전체 컬럼명과 데이터형을 가지고 온다)
		    RECORD => (JOIN , SUBQUERY => 여러개 테이블 연결)
		    ----------------------------------------------------------------- ROW한개만 저장이 가능
		    ROW 여러개를 가지고 온다 : CURSOR => 데이터 출력 : for문 이용
	연산자
	   단일행 함수
	       = 문자 함수
		 => LENGTH : 문자 개수
		      LENGTH(컬럼명 | 문자열)
	         => SUBSTR : 문자를 자를때
		      SUBSTR(컬럼명 | 문자열 , 문자열의 시작 인덱스 번호 , 자르는 개수)
							-------------------------------
							자바 : 0 , 오라클 : 1
	         => RPAD : 모자라는 글자에 지정된 문자를 출력 => ID찾기 , 비밀번호 찾기
		      RPAD(컬럼명 | 문자열 , 출력개수 , 지정된 문자)
		      RPAD('abc',5,'#') abc##
	       = 숫자 함수
	         => ROUND() => 반올림
	         => CEIL() => 올림
	         => MOD() => % => 나머지
	       = 날짜 함수
	         => SYSDATE : 시스템의 시간 , 날짜 읽기
	       = 변환 함수
	         => TO_CHAR => 날짜 변환 / 숫자 변환
					 YYYY , MM , DD , HH(HH24) , MI , SS
					  9,999,999
					 SimpleDateFormat / DecimalFormat
						MM / mm 		##,###,###
	       = 기타 함수 
		  => NVL : NULL값을 대체
		------------------------------------------------------------------------------ 단위 ROW단위
	       = 집합 함수
		  => COUNT(*) => ROW의 개수
		  => MAX , MIN
		------------------------------------------------------------------------------- 단위 Column단위

		연산자
		  => 산술 연산자 : + , - , * , / => SELECT뒤에 주로 사용
					  + : 순수하게 산술만 가능 => 문자열 결합 => ||
					  / : 정수/정수 = 실수
					  ****** '1' + '2' => TO_NUMBER를 적용 => 3 (자동으로 숫자 변환)
		  => WHERE절에서 주로 사용하는 연산자 (true/false)
			1. 비교 연산자 : = , <> , < , > , <= , >=
					     => 숫자 , 문자 , 날짜 비교가 가능
		  	2. 논리 연산자 : AND , OR => (& : 입력값을 받는 경우 , || => 문자열 결합)
			3. NULL 
			  * 데이터 저장값이 NULL인 경우에는 연산처리가 안된다
			  IS NULL , IS NOT NULL
			4. 부정 연산자 : NOT
			  NOT BETWEEN , NOT LIKE , NOT IN ...
			5. LIKE => 검색
			   %검색어% , %:문자의 개수를 모르는 경우 , _: 한글자
			6. IN => OR가 여러개인 경우 => 상품 여러개 선택 , 여러개 검색어 
			7.BETWEEN ~ AND : 기간 , 범위
	제어문
	   조건문 
	    형식)
			IF 조건문 THEN
			   실행 문장
			END IF;

			--------------------------

			IF 조건문 THEN
			   실행문장
			ELSE
			   실행문장
			END IF:

			---------------------------
			-> 다중 조건문
			IF 조건문 THEN
			   실행문장
			ELSIF 조건문 THEN
			   실행문장
			ELSIF 조건문 THEN
			   실행문장
			      . . .
			ELSE
			   실행문장
			END IF;

			----------------------------
	   반복문 
	   
*/
-- 단일 조건문 
DECLARE
  vEmpno NUMBER(4);
  vEname VARCHAR2(20);
  -- 초기값을 설정 => vEmpno NUMBER(4) = 0 (X) , vEmpno NUMBER(4):=0 => :=
  vJob VARCHAR2(20);
  vDname VARCHAR2(20);
  vDeptno NUMBER(2):=0;
BEGIN
  SELECT empno,ename,job,deptno INTO vEmpno , vEname , vJob , vDeptno
  FROM emp
  WHERE empno = 7900;

IF vDeptno = 10 THEN
   vDname := '개발부';
END IF;

IF vDeptno = 20 THEN
   vDname := '영업부';
END IF;

IF vDeptno = 30 THEN
   vDname := '총무부';
END IF;

DBMS_OUTPUT.PUT_LINE('---------- 결과 -----------');
DBMS_OUTPUT.PUT_LINE('사번 : '||vEmpno);
DBMS_OUTPUT.PUT_LINE('이름 : '||vEname);
DBMS_OUTPUT.PUT_LINE('직위 : '||vJob);
DBMS_OUTPUT.PUT_LINE('부서 : '||vDname);


END;
/

DECLARE
  vEmpno NUMBER(4);
  vEname VARCHAR2(20);
  -- 초기값을 설정 => vEmpno NUMBER(4) = 0 (X) , vEmpno NUMBER(4):=0 => :=
  vJob VARCHAR2(20);
  vDname VARCHAR2(20);
  vDeptno NUMBER(2):=0;
BEGIN
  SELECT empno,ename,job,deptno INTO vEmpno , vEname , vJob , vDeptno
  FROM emp
  WHERE empno = 7900;
/*
IF vDeptno = 10 THEN
   vDname := '개발부';
END IF;

IF vDeptno = 20 THEN
   vDname := '영업부';
END IF;

IF vDeptno = 30 THEN
   vDname := '총무부';
END IF;
*/
-- witch ~ case => E4Net : ERP , Dream CIS , 맨텍 , 크라우드웍스 , 닥터웍스 , 디지캡 ....
--			  ---------------------------------------------------------------------------------

vDname:=CASE vDeptno
	      WHEN 10 THEN '개발부'
	      WHEN 20 THEN '영업부'
	      WHEN 30 THEN '총무부'
	      END;

DBMS_OUTPUT.PUT_LINE('---------- 결과 -----------');
DBMS_OUTPUT.PUT_LINE('사번 : '||vEmpno);
DBMS_OUTPUT.PUT_LINE('이름 : '||vEname);
DBMS_OUTPUT.PUT_LINE('직위 : '||vJob);
DBMS_OUTPUT.PUT_LINE('부서 : '||vDname);

END;
/

-- 선택 조건문 : true / false를 나눠서 작업 => IF ~ ELSE
/*
	재고 : 자동화 처리
	=> 같은 상품 : UPDATE
	=> 다른 상품 : INSERT
	찜하기
*/
DECLARE
 vEname emp.ename%TYPE;
 vComm emp.comm%TYPE;
 vSal emp.sal%TYPE;
 vTotal NUMBER(7,2) :=0;
BEGIN
 SELECT ename,comm,sal,sal+NVL(comm,0) INTO vEname , vComm , vSal , vTotal
 FROM emp
 WHERE empno = &empno;
 -- comm = null 이면 => if문의 조건 수행이 불가능 => else문장을 수행한다
 IF vComm > 0 THEN
    DBMS_OUTPUT.PUT_LINE('vEname : '||'님의 급여는 '||vSal||'이고 성과급은 '||vComm||'이면 총급여는 '||vTotal||'입니다');
 ELSE
     DBMS_OUTPUT.PUT_LINE('vEname : '||'님의 급여는 '||vSal||'이고 성과급은 없고 총급여는 '|| vTotal||'입니다');
 END IF;
END;
/

-- 다중 조건문 IF ~ ELSIF ~ ELSE(생략 가능) => END IF

DECLARE
  vEmpno NUMBER(4);
  vEname VARCHAR2(20);
  -- 초기값을 설정 => vEmpno NUMBER(4) = 0 (X) , vEmpno NUMBER(4):=0 => :=
  vJob VARCHAR2(20);
  vDname VARCHAR2(20);
  vDeptno NUMBER(2):=0;
BEGIN
  SELECT empno,ename,job,deptno INTO vEmpno , vEname , vJob , vDeptno
  FROM emp
  WHERE empno = 7900;

IF vDeptno = 10 THEN
   vDname := '개발부';

ELSIF vDeptno = 20 THEN
   vDname := '영업부';

ELSIF vDeptno = 30 THEN
   vDname := '총무부';
END IF;

-- witch ~ case => E4Net : ERP , Dream CIS , 맨텍 , 크라우드웍스 , 닥터웍스 , 디지캡 ....
--			  ---------------------------------------------------------------------------------
/*
vDname:=CASE vDeptno
	      WHEN 10 THEN '개발부'
	      WHEN 20 THEN '영업부'
	      WHEN 30 THEN '총무부'
	      END;
*/

DBMS_OUTPUT.PUT_LINE('---------- 결과 -----------');
DBMS_OUTPUT.PUT_LINE('사번 : '||vEmpno);
DBMS_OUTPUT.PUT_LINE('이름 : '||vEname);
DBMS_OUTPUT.PUT_LINE('직위 : '||vJob);
DBMS_OUTPUT.PUT_LINE('부서 : '||vDname);

END;
/


