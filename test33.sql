-- 2024-06-12
-- 222 page ROWNUM => 각ROW마다 자동으로 설정 => 1 ....
/*
SELECT empno , ename , job , hiredate , sal , rownum
FROM emp;
*/
-- 사용용도 : 페이지 나누기 , 인기순위 TOP10 ,  => 상세보기 => 이전 / 다음
-- 1. 5개만 출력
SELECT empno , ename , job , hiredate , sal , rownum
FROM emp
WHERE rownum <=5;

--2. 급여가 많은사람 순으로 5명 , rownum의 순서 변경 -> 인라인뷰 => rownum 은 TOP-N -> 중간에서 추출은 불가능
SELECT empno , ename , job , hiredate , sal , rownum
FROM  (SELECT empno ,ename , job , hiredate , sal  FROM emp ORDER BY sal DESC )
WHERE rownum <=5;

/*
	메인쿼리 = 서브쿼리
				=> 실행
			<=  실행 결과를 메인쿼리로 전송
	=> 결과값을 받아서 메인쿼리 실행
	-----------------------------------------
	서브쿼리 종류 : 225page => 조인(데이터 통합) , 서브쿼리(SQL문장 통합)
	----------
	일반 서브쿼리 = WHERE뒤에 조건에 해당되는 값
		= 단일행 서브쿼리 (결과값 1개)
			=> 대입후 사용
		= 다중행 서브쿼리 (결과값 여러개)
			=> 동시에 처리 => in(select ~~)
			=> 최대값 => <ANY(select ~~)
					     >ALL(select ~~)
			=> 최소값 => >ANY(select ~~)
					     >ALL(select ~~)
	스칼라 서브쿼리 = SELECT 안에 => 컬럼대신 사용
				  SELECT (SELECT~~) "별칭"
	인라인뷰 = SELECT ~
			FROM (SELECT ~~) => 테이블 대신 사용
		
*/
--사원 테이블 => 사번 , 이름 , 직위 , 입사일 , 부서테이블 => 부서명 , 근무지
SELECT empno , ename , job  , dname , loc
FROM emp , dept
WHERE emp.deptno = dept.deptno;
-- 서브쿼리 이용
SELECT empno , ename , job  , (SELECT dname FROM dept WHERE deptno = emp.deptno) "dname" , (SELECT loc FROM dept WHERE deptno = emp.deptno) "loc" 
FROM emp;
/*
	FROM emp => 메모리에서 값을 읽어온다
*/

SELECT empno , ename , job  , (SELECT dname FROM dept WHERE deptno = e.deptno) "dname" , (SELECT loc FROM dept WHERE deptno = e.deptno) "loc" 
FROM (SELECT * FROM emp) e;
/*
	데이터를 출력한후에 출력된 내용에서 데이터 추출
	보안이 뛰어나다 / 재사용이 좋다 => VIEW(가상테이블)
	=> SQL문장이 길어진다 => 웹 개발시에 자바로 코딩은 불편하다
						------------------------------------------''''
						문자열을 사용하지 않고 자바에서 처리 => MyBatis  (XML)
													---------------------- 선호
						SQL문장을 자동으로 해결하는 라이브러리 => JPA
						findByLikeName(String name) => WHERE name LIKE '%'+'name'+'%'
*/
