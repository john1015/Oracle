-- 2024-06-03
-- 연산자 :논리연산자 => AND  , OR
/*
	AND => 범위, 기간 포함
	OR => 범위 포함에 없는 경우

	=> WHERE / HAVING => 조건문
	=> WHERE 컬럼명 연산자 값 AND 컬럼명 연산자 값
	=> WHERE 컬럼명 연산자 값 OR 컬럼명 연산자 값
	=> 자바와 동일
	   자바 : && => 입력창으로 변경
		    || => 문자열 결합
*/
-- 사원중에 급여가 1500 ~ 2500 사이의 급여를 받는 사원의 모든 정보를 출력
SELECT * FROM emp WHERE sal >=1500 AND sal <= 2500;
-- 사원중에 부서번호가 20이거나 30사원의 모든 정보
SELECT * FROM emp WHERE deptno = 20 OR deptno = 30;
-- 사원의 이름중에 C와 K사이에 있는 모든 사원의 정보를 출력
SELECT * FROM emp WHERE ename >= 'C' AND ename <= 'K';
-- 사원중에 1981년에 입사한 사원의 모든 정보를 출력
SELECT * FROM emp WHERE hiredate>='1981/01/01' AND hiredate <='1981/12/31';
SELECT * FROM emp WHERE hiredate Like '81%'; 
--------------------------------------------------------좀더 간결해서 좋음 (권장)
-- BETWEEN ~ AND => hiredate>='1981/01/01' AND hiredate <='1981/12/31'
-- 포함이 된다 BETWEEN 1500 AND 300 => 1500 포함 , 3000 포함
-- 지정된 값 사이의 값을 추출
-- 사원의 급여가 2000 이상 3000이하 사이의 급여를 받는 모든 사원의 정보를 출력
SELECT * FROM emp WHERE sal >= 2000 AND sal <= 3000;
SELECT * FROM emp WHERE sal BETWEEN 2000 AND 3000;

-- IN => OR가 여러개 있는 경우 => 대체하는 연산자
/*
	SELECT * 
	FROM emp
	WHERE empno=7698 OR empno=7782 OR empno = 7566 OR empno = 7902 OR empno = 7788;

	SELECT *
	FROM emp
	WHERE empno IN(7698,7782,7566,7902,7788); 
	------------------------------------------------------- 2개 이상일때 (권장)
*/
-- NULL 연산자 => NULL은 데이터가 없는 컬럼 => 연산이 안된다
-- IS NULL => comm = null(x) => comm is null => null 인 경우
-- IS NOT NULL => comm! = null => comm is NOT NULL => null 이 아닌 경우
SELECT * FROM emp WHERE mgr IS NULL;

-- 성과급을 받는 사원의 모든 정보
SELECT * FROM emp WHERE comm IS NOT NULL AND comm <> 0;
SELECT * FROM emp WHERE comm IS NULL OR comm = 0;

-- LIKE : 검색 할 때
/*
	& => 문자열의 개수를 모르는 경우 ==> 문자열의 개수는 상관X
	_ => 문자열의 개수를 알고 있는 경우 ==> 문자 한개

	___K => 4글자
	%K => 글자수는 알 수 없다
	=> REGEXP_LIKE() => 함수형으로 변경
	     --------정규식 [A-Z]
	=> 대문자 알파벳 시작
		'A%' OR 'B%' ... OR 'Z%'
		[A-Z]

		*** A로 시작하는 이름 => 'A%'  => 자동 완성기
		A로 끝나는 이름 => '%A'
		A를 포함하고 있는 이름 => '%A%'
		A가 3번째 있는 이름 => '__A%'
		---------------------------- 5글자 => '__A__' 글자수가 지정(_) 지정이 없는 경우 (%)		
*/
--사원중에 A로 시작하는 모든 사원의 정보를 출력
SELECT * FROM emp WHERE ename LIKE 'A%';
SELECT * FROM emp WHERE ename LIKE 'Z%';
-- 사원중에 EN / IN으로 끝나는 사원
SELECT * FROM emp WHERE ename LIKE '%EN' OR ename LIKE '%IN';
SELECT * FROM emp WHERE REGEXP_LIKE(ename,'EN|IN');
-- A를 포함하는 이름을 가진 사원의 모든 정보
SELECT * FROM emp WHERE ename LIKE '%A%';
-- zipcode에서 dong에서 서교를 포함하는 모든 우편번호를 출력
-- SELECT * FROM zipcode WHERE dong like '%서교%';
-- 사원의 이름중에 5글자 => 가운데 O인 사원의 모든 정보를 출력
SELECT * FROM emp WHERE ename like '__O__';
SELECT * FROM emp WHERE ename like '__R___';
SELECT * FROM emp WHERE ename like '%R%';

