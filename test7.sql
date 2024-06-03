-- 2024 -06 -03
-- 149 page => 연산자
/*
	산술연산자 : 4칙 연산만 가능
			 + ,- ,* , / ==> % (사용하지 않는다) : MOD()함수
			=> + 산술만 가능
			=> / : 0으로 나눌수 없다
				 정수 / 정수 = 실수 => 5/2 => 2.5
			=> 문자형+정수 = 값
			     --------
			      '10'+1 = 11
			    ------ 문자열을 자동으로 정수형으로 변경
			    Integer.parseInt("10") => 10
			    TO_NUMBER("10") => 10
			 ----------------------------------------------------------- SELECT뒤에 주로 사용
	비교연산자 : = (같다) |  != , ^ , <> (같지않다) ==> 권장사항 <>
			  < (작다) , > (크다) , <= (작거나 같다) , >= (크거나 같다) => WHERE뒤에 주오 사용 => True / False
	논리연산자 : AND , OR
			|| => 문자열 결합
			&& => Scanner
			(조건) AND (조건)
			  |		   |
			true		true
			 ---------------- true => 나머지는 false
			(조건) OR (조건)
			   |	         |
			  -------------- true 가 1개이상이면 true
	대입연산자 : =
			WHERE 뒤에서 사용 => 같다
			WHERE 밖에서 사용 => 대입 => UPDATE
	BETWEEN ~ AND
	----------------------> 범위나 기간이 포함
	 sal BETWEEN 1000 AND 2000
	 => WHERE sal >= 1000 AND sal <= 2000
			     -----		      -----
	IN : OR가 많은 경우에 사용
		WHERE deptno = 10 OR deptno = 20 OR deptno = 30
		=> WHERE deptno IN(10,20,30)
	NULL : NULL(값이 없는 상태) => 연산처리가 안된다
		 IS NULL : null값이면
		 IS NOT NULL : null값이 아니면...
	LIKE : 유사문자열 찾기
		시작하는 문자열 : A% , ABC% ... => startsWith
			     --------
				% : 문자 개수와 관련 없다
		끝나는 문자열 : %A , %ABC ... => endsWith
		포함된 문자열 : %A% , %ABC% ... => contains
		글자수 : ____T => 5글자 끝나는 문자 T 
		--------
		 _ : 한 글자 _C_ ...
	NOT : !(자바) => NOT 반대 효과
		NOT IN , NOT BETWEEN , NOT LIKE
		-----------------------------------------
	산술연산자와 다른 연산자 => WHERE 뒤에 붙는다
	---------------------------------------------------------
	SELECT ~
	FROM table_name
	WHERE 컬럼명 연산자 값
		   --------------------
		   사원중에 사번이 7788인 사원의 모든 정보를 추출
							      ------------ *
		   SELECT *
		   FROM emp
		   WHERE empno = 7788;

		   사원중에 부서번호가 10인 사원의 이름 , 직위 , 입사일 , 부서번호
		   SELECT ename , job , hiredate , deptno
		   FROM emp
		   WHERE deptno = 10

		   사원중에 입사일이 81/05/01 사원의 모든 정보 추출
		   		   		   		   ------------
		   while(rs.next()){
		        rs.getInt(1); ....
		    }
				     ----------- MuBatis =>
		   SELECT * => 상세보기(가급적이면 사용하지 않는다) => 조인시에는 *를 사용하면 안된다
			    --- 순서가 존재한다 (테이블 생성시 내용)
		   FROM emp
 		   WHERE hiredate = 81/05/01; ==> 오류
		   WHERE hiredate = '80/05/01'; ==> 문자 / 날짜 => ' '

		   사원정보 데이터에서 사원의 이름이 KING인 사원의 모든 정보를 출력
		   SELECT *
		   FROM emp
		   WHERE ename = 'king'; ==> 오류 
		   WHERE ename = 'KING'; ==> 문자열은 ' ' 사용 , 실제 저장된 데이터는 대소문자 구분
*/
-- SELECT * FROM emp where empno = &sabun;
-- 사원정보 테이블(emp) 에서 실제 받는 급여,이름를 출력 => NULL값이 있는 경우 연산은 모든 결과값이 NULL이다
-- SELECT ename , (sal+NVL(comm,0)) "실제급여" FROM emp;
-- 사원정보 테이블(emp) 에서 연봉을 출력 => 이름 , 급여 , 연봉
-- SELECT ename , sal , sal*12 FROM emp;
-- SELECT 5/2 , 5-3 , 5+3 , 5*3 FROM DUAL;
-- DUAL 테이블은 임시테이블 => 데이터가 없다 => 계산연산
SELECT '100'+'100' , '100'*'100','100'/'10','100'-'10' FROM DUAL;
-- 자동으로 문자열을 정수형으로 변경후에 처리 'A'+1 => 오류 '숫자'여야함 , trim() 처리도 해준다