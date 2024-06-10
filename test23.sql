-- 2024 - 06- 10
/*
	1. 종류
	   INNER JOIN : 여러개의 테이블에서 필요한 컬럼값을 추출
			      -----------------
				=> 테이블이 같은 컬럼을 갖고 있는 경우에는 구분
				     => 테이블명.컬럼명
			 	     => 별칭명.컬럼명
			 	     => 애매한 정의 오류발생
			 	     FROM table_name 별칭
			 	 => 교집합 (같은 값인 경우에만 처리, 포함된 값인 경우에 처리)
			 	     => 단점 : NULL이 있는 경우에는 처리를 못한다
				 => 테이블이 나눠진 경우에 데이터 추출 (정규화) 
				       PRIMARY KEY   <====> FOREIGN KEY
				       ---------------------------------------------
			 	     	인사관리
			 	        ----------
			 	     	    개인정보 / 사원정보
			 	     		ID		ID
					일정관리
			 	     	----------
			 	     		회원정보 / 일정정보
			 	     		     ID	    ID
				 	     도서관리
			 	     	     ----------
			 	     		도서정보 / 회원정보
			 	     		      대출(판매) => 매핑테이블 => 장바구니

						댓글형 개시판
			 	     		----------------
			 	     		    게시판 / 댓글
			 	     		    게시판번호  게시물번호 참조
							PK		    FK

						    사원정보 / 부서정보
							FK	       PK  => deptno 
	      EQUI_JOIN => JOIN은 SELECT에서만 사용이 가능
				   SUBQUERY는 DML전체에서 사용이 가능 (INSERT , SELECT , UPDATE , DELETE)
				   ------------- JOIN보다 사용빈도가 많다
						    테이블 대신 , 컬럼대신 , 조건문 대신
		= Oracle JOIN : 오라클에서만 사용이 가능
		    형식)
				SELECT A.col,B.col ...
				FROM A,B
				WHERE A.col = B.col
						------
		= ANSI JOIN : 표쥰 JOIN => 다른 데이터베이스에서 사용이 가능(MuSQL , MariaDB ...)
		    형식)
				SELECT A.col,B.col ...
				FROM A JOIN B
				ON A.col = B.col
					   ------
		--------------------------- 같은 컬럼을 가지고 있다
		= NATURAL JOIN : 자연 조인 => 조건이 없이 자동으로 처리
		    형식)
				SELECT col1,col2 ... => 구분하면 오류 발생
				FROM A NATURAL JOIN B
		= JOIN ~ USING : 비교할 컬럼 지정
		    형식)
				SELECT col1,col2 ...
				FROM A JOIN B USING(같은 컬럼명)
		---------------------------
	      NON_EQUI_JOIN : 포함이 된 경우 => 논리연산자 / BETWEEN ~ AND
	      ***** 테이블 두개에서 같은 값이 있는 경우에 => ROW 전체를 가지고 올 수 있다
		    형식)
				SELECT col1 , col2 ...
				FROM A , B
				WHERE A.col BETWEEN B.col1 AND B.col2

				SELECT col1 , col2 ...
				FROM A JOIN B
				ON A.col BETWEEN B.col1 AND B.col2
		****** JOIN이 2개인 경우
				SELECT col1 , col2 ...
				FROM A , B , C
				WHERE A.col = B.col AND A.col = C.col;

				SELECT col1 , col2 ...
				FROM A JOIN B
				ON A.col = B.col 
			        JOIN C 
				ON A.col = C.col;
		--------------------------------------------------------------------------------------------------
		****** 조인 조건 외에 다른 조건이 있는 경우 => AND
	  OUTER JOIN
*/
-- 사용자 입력을 받아서 해당 사원의 사원정보와 부서정보를 출력
/*
SELECT *
FROM emp,dept
WHERE emp.deptno = dept.deptno -- 조인조건
AND empno = &sabun;
*/
-- 사원 정보 / 부서 정보 출력 => A를 포함하고 있는 사원
/*
SELECT ename,job,hiredate,dname,loc,emp.deptno -- 오류발생
from emp,dept
where emp.deptno = dept.deptno and ename like '%A%';

SELECT ename,job,hiredate,dname,loc,emp.deptno -- 오류발생
from emp join dept
on emp.deptno = dept.deptno and ename like '%A%';
*/

select orderid , name , bookname , saleprice , orderdate
from orders o , book b , customer c
where  o.bookid = b.bookid and c.custid = o.custid;

/*
	1. 테이블 => 어떤 컬럼 => 컬럼값 확인
	2. 테이블이 나워졌는지 확인 => X => O -> 조인 (서브쿼리)
	3. 사용자 요청에 대한 조건 => WHERE
	    => SELECT는 중요하지 않다 => 컬럼 나열
	    => WHERE
	    => 필요시에는 정렬 ORDER BY
	    => SELECT - FROM - WHERE - ORDER BY (GROUP BY는 통계/집계)
		=> 집합함수는 많이 존재 => COUNT / MAX	    

*/
