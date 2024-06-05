-- 2024-06-05 3장 정리 => SELECT문장 / 연산자 / 내장함수 => 검색
/*
	145page
	주의점 => 문장이 끝나면 ;
			단, 자바에서는 ; 을 사용하면 안된다 => 자동으로 추가
		    		    		    		    	      ------------------ ; , COMMIT
		    	공백 => 키워드 뒤에는 공백을 사용해야 된다
				    ------------------------------------------ 오류발생이 많다
		    		    웹프로그래머 => 모든SQL을 자바에서 전송
							    -----------------------------
							    SQL문장이 자바에서는 문자열로 되어있다
			테이블명 / 컬럼명이 긴 경우 : 별칭을 사용 => 조인
		    	1) COMMIT을 미리 설정하지 않는다 => ROLLBACK이 수행이 안된다
			   ---------- 먼저 데이터 확인 (정상적이면 => COMMIT)
			   => 프로젝트 / 웹 연습 => 크롤링한 데이터
			

	SELECT : 데이터 검색
		1. 형식
		    = SELECT문장 형식
		 	------- 오라클에서 실행시 for => WHERE if , JOIN은 2차 for
		        SELECT [DISTINCT]  * | column1 , column2 ... (* => 모든컬럼의 데이터값 읽기)
				   ------------ 중복 제거 => HashSet
			FROM table_name : 관련된 데이터만 모아서 관리 (사원정보 / 부서정보)
			------------------------------------------------------------------------------- 필수
			[
				** 사용자 요청값 => 검색 , 상세보기
				WHERE 조건문 => true/false => 연산자
				GROUP BY 그룹컬럼 / 내장함수
		    		HAVING 그룹에 대한 조건
		    		--------------------------------------------------------- 나눠서 통계(부서별 , 년도별 , 직위별)
				ORDER BY 컬럼 / 내장함수 ASC / DESC => 정렬
								     -----   ------
								     올림    내림차순
		    		
			]

		    = 데이터형(오라클)
		2. 연산자 => WHERE
		3. 데이터조작 => 내장함수
		4. 그룹별 정리 => GROUP BY => 157page => 다음주 => 서브쿼리
		---------------------------------------- 문법 형식에 주력
		5. 테이블 연결 => JOIN ==> 응용 => SQL문장이 길어진다 => 정규화(중복 최소화)
					 INNER JOIN
					    ----------------------------------------------------------------------
					    *** = EQUI_JOIN : 교집합 => INTERSECT
					    = NON_EQUI_JOIN => 포함된 데이터값
					    ---------------------------------------------------------------------- 비교시 컬럼명이 틀릴수 있다
					    = NATURAL_JOIN => 자동으로 값을 찾아준다
					    = JOIN ~ USING
					    ---------------------------------------------------------------------- 컬럼명이 동일
					 OUTER JOIN
					    = LEFT OUTER JOIN ===> INTERSECT + MINUS
					    = RIGHT OUTER JOIN
		6. SQL문장 연결 => 서브쿼리
					    = 서브쿼리 : 조건 => 다른 테이블을 이용해서 => WHERE
					    = 스칼라 서브쿼리 => 컬럼대신 => SELECT
					    = 인라인 뷰 => 테이블 대신 => FROM
*/
-- 회원가입
CREATE TABLE member (
	id VARCHAR2(20) PRIMARY KEY ,
	pwd VARCHAR2(10) NOT NULL ,
	name VARCHAR2(51)NOT NULL ,
	sex CHAR(6) CHECK(sex IN('남자','여자')) ,
	birthday VARCHAR2(10),
	post VARCHAR2(7) NOT NULL ,
	addr1 VARCHAR2(150) NOT NULL ,
	addr2 VARCHAR2(150),
	phone VARCHAR2(13) UNIQUE ,
	email VARCHAR2(100) UNIQUE ,
	content CLOB,
	regdate DATE DEFAULT SYSDATE	
);