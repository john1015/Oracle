-- 2024-05-30 오라클 1차
/*
	오라클 : 데이터를 저장하는 공간
                   ----------------- 데이터를 제어하는 기능 : 명령어 (SQL) 
        SQL : 구조화된 질의 언어 => 오라클에서는 연습 => 실제로는 자바 전송
 						---------------------	----------------------
		데이터 저장 (테이블)
		---------------
			=> 2차원 구조 (COLUMN + ROW)
                              테이블 => 클래스
			     ------------------------------------------------
				id   	pwd      name     sex      tel       ===> column (멤버변수)
			     ------------------------------------------------
				aaa    1234     홍길동   남자   1111-1111 ==> row => 객체
			     ------------------------------------------------
				bbb   1234     심청이   여자   2222-2222 ==> row => 객체
			     ------------------------------------------------
				ccc    1234     박문수   남자   3333-3333 ==> row => 객체
			     ------------------------------------------------
          = DML : (데이터 조작 언어)
		1. 데이터를 검색 : (SELECT)
			형식)
				SELECT *  | column1,column2 ...
					* => 전체 데이터 읽기
					column_list : 지정된 데이터 읽기
				FROM table명
				[
				WHERE 조건문 => 조건문을 만들기 위해서 => 연산자
				GROUP BY 그룸컬럼 => 그룹별로 모아서 관리
				HAVING 그룹 조건 => GROUP BY 가 있는 경우에만 사용
				ORDER BY 컬럼명 ASC|DESC => 정렬
				]

				------------------------------------------------------------
				=> JOIN : 테이블 여러개 연결 => 데이터 추출
				     INNER JOIN
					= EQUI_JOIN => 같은 값을 가지고 있는 경우
					  = NATURAL JOIN
					  = JOIN~USING
					= NON_EQUI_JOIN => 포함
                                     OUTER JOIN
 					= LEFT OUTER JOIN
					= RIGHT OUTER JOIN
					= FULL OUTER JOIN
				=> SubQuery : SQL문장 여러개 연결 => 자바에서 가장 많이 등장
				------------------------------------------------------------
				 
	
		2. 데이터를 추가 : (INSERT)
		3. 데이터 수정 : (UPDATE)
		4. 데이터 삭제 : (DELETE)
		5. 데이터 통합 : (MERGE)
	  = DDL : (데이터 정의 언어)
 		= 데이터 저장 장소 (TABLE)
		= 가상 저장 공간 (VIEW)
		= 자동 증가 번호 (SEQUENCE)
		= 재사용 => PL/SQL
	  = DCL : (데이터 제어 언어)
		= 권한 부여 : (GRANT) 
		= 권한 해제 : (REVOKE)
	  = TCL : (트랜잭션 제어 언어)
		= 정상적으로 저장 (COMMIT)
		= 명령문 취소 (ROLLBACK)
*/
-- 사원중에 급여 평균보다 많이 받는 사원의 목록
SELECT AVG(sal) FROM EMP;
SELECT ename,sal FROM emp WHERE sal>(SELECT AVG(sal) FROM EMP);
