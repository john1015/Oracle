-- 2024-06-24
/*
	1. 인덱스 (INDEX)
	= 검색속도 향상
	= 메모리가 많이 필욜 한다
	*** 인덱스를 사용하여 항상 검색 속도가 빨라지는 것은 아니다
	=> 저장된 데이터가 작은 경우 / DML 자주 사용되는 곳(INSERT UPDATE DELETE)
							= 게시판 , 댓글 , 장바구니
	인덱스는 자동으로 생성 : PRIMARY KEY , UNIQUE 설정 시에는 자동으로 생성

 	인덱스 생성
	=> 시기
	1) 구별되는 값이 많은 경우(PRIMARY KEY)
	2) WHERE를 이용하여 자주 검색되는 컬럼이 있는 경우 => name , subject , price ...
	3) JOIN에서 주로 사용되는 컬럼
	4) NULL값을 포함하는 컬럼이 많이 있는 경우
		=> 인덱스를 만들지 않는 부분
			=> INSERT / UPDATE / DELETE => 인덱스를 만들 경우에 성능 저하

	247page
	----------
	1. 데이터를 쉽고 빠르게 찾을 수 있게 만든 데이터 구조 => 인덱스
	2. B-tree
			루트
			------
			   |
		--------------------------------- 내부 루트
		|		     |			|
	    -------		  ------	    ------ 리프 루트

	1  2  3  4  5  6  7
		  ---


					4   =========> 루트
				   ---------

			2				6  =====> 내부 루트
			|				|
		  ---------			  ---------
		  |	    |			  |  	    |
		 1	   3			  5        7    ===> B-tree => 리프 루트
							
	252page 인덱스 생성
	 	=> primary key/ unique => 자동 생성
		=> 생성
		 	CREATE INDEX명 ON 테이블명(컬럼명) => 컬럼명(ASC) , 컬럼명(DESC)
		 	CREATE INDEX명 ON 테이블명(컬럼명 , 컬럼명) 
		=> 삭제
			DROP INSEX 인덱스 명
		=> 정렬
			ORDER BY ASC
					=> 힌트
						/*+ */
						--+
			=> SELECT /* + INDEX_ASC(테이블명 PK/UK)  */ 컬럼명
			ORDER BY DESC
			=> SELECT /* + INDEX_DESC(테이블명 PK/UK)  */ 컬럼명
*/
/*
DROP INDEX idx_emp_sal;
CREATE index idx_emp_sal ON emp(sal DESC);
SET LINESIZE 300
select empno , ename , job , sal from emp where sal>0;
*/
/*
CREATE INDEX idx_emp_ename ON emp(ename DESC);
SELECT empno, ename , job , sal
FROM emp
WHERE ename>='A';
*/
/*
DROP INDEX idx_emp_ename;
-- PRIMARY KEY => 자동으로 인덱스가 설정
SELECT no,goods_name
FROM goods_all;
*/
--CREATE INDEX idx_book_pp ON book(publisher,price DESC);
/*
	254page
	   인덱스 재구성 / 삭제
	   ------------------ 추가 / 삭제 / 수정 => 인덱스를 다시 제작 => 인덱스는 DML에서 사용빈도가 없다
	  ALTER INDEX index명 REBUILD
	  DROP INDEX index명
*/
-- CREATE INDEX idx_emp_job ON emp(job);
-- ALTER INDEX idx_emp_job REBUILD;
-- DROP INDEX idx_emp_job;
/*
	1. 인덱스 사용 목적
		=> 쉽고 빠르게 검색결과를 가지고 올 수 있는 데이터 구조(B-tree)
		=> SQL문장 처리속도가 빠르다
		     -------------------------------- 최적화
		=> 검색어를 많이 사용되는 컬럼이 있는 경우(제목) => 정렬
		=> JOIN에서 비교되는 컬럼 (deptno,id) => id는 자동 설정 => PRIMARY KEY 
		=> INSERT , UPDATE , DELETE가 많은 경우에는 사용시에 속도가 저하 => REBUILD
		=> 데이터가 1000개 이상 => 검색시에 INDEX를 이용하면 좋다
	2. 생성
	  CREATE INDEX index명 ON 테이블(컬럼명)
			       -------- 중복할 수 없다 ==> user_indexs (테이블)
	3. 갱신
	  ALTER INDEX index명 REBUILD => INSERT / UPDATE / DELETE => 인덱스 재구성
	4. 삭제
	  DROP INDEX index명
	5. 정렬시
	  => INDEX_ASC(테이블명 PK명)
	  => INDEX_DESC(테이블명 PK명) ==> ORDER BY보다 속도가 향상	

	=> DQL / DML
		SELECT : 데이터 검색
		INSERT : 데이터 추가
		DELETE : 데이터 삭제
		UPDATE : 데이터 수정
	=> DDL => 설계 (table , view , sequence) => 제약조건
	=> TCL : COMMIT / ROLLBACK
		=> 자바는 AutoCommit() => executeUpdate() => commit을 포함
	=> 252 ~ 254page
	오라클을 공부할때는 형식이나 sql문장으로 자주 연습해야 좋다
	응용 => 자바

*/
