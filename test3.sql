-- 2024 - 05 - 31 오라클 2일차 => 개론

/*
	 47page 
         ---------
	   벤치마킹 ===> 사용자에 뭘 보여줄지 (요구사항 분석) ==> 데이터분석(데이터 설계)
			===> 데이터 수집 ===> 구현 ===> 테스트 ===> 배포 ===> 유지보수
	   ---------- 한개 (X) , 여러개
	   데이터 베이스 사용자
	   	= 일반 사용자 => 이미 만들어진 프로그램을 사용하는 사람 : SQL을 몰라도 된다
					피드백 => 유지보수
	   	= 웹프로그래머
			= 웹프로그래머 : 화면 UI / 데이터를 전송
			= SQL사용자 : 오라클 연동
	   	= 데이터베이스 관리자 : 데이터베이스 설계

		실무
		팀
		-----

			PM (프로젝트 관리자) => 7년 이상
			 |
		-----------------------------------
		|		|			|
	      PL	      PL		      PL => 5년이상
		|		|			|
	프로그래머	  ==> 3년
	***화면UI(HTML / CSS)
	***SQL 사용자
	신입

	JSP	===== 자바===== 오라클
			   ------ 오라클 연동 => MyBatis
			   ------ JSP 연동 => 자바
         |
  HTML/CSS

  54PAGE
  ---------
	데이터베이스 구조
		개념 스키마 : 설계만 되어 있는 상태 => 프로그램에 필요한 데이터 확인
				 회원 : 이름 , 아이디 ....
		논리 스키마 : 데이터형 설정 => name VARCHAR2(54) ....
		물리 스키마 : 실제 저장
		명세서
		-------------------------------------
		  컬럼명			ID
		  키종류			PK
		  참조테이블		X
		  참조컬럼			X
		  체크속성			X
		  데이터형			VARCHAR2
		  크기			10
		-------------------------------------
	69page
	---------
	릴레이션 : 테이블 => 실제 데이터가 저장되는 장소
		      ---------- 관련된 데이터만 모아서 저장하는 저장 장소
				   계시판 , 회원가입 , 맛집 , 레시피 => 일관성
		      ---------- 중복의 최소화
	테이블의 특징
	-----------------
	 1. 유일값을 가지고 있다 : 같은 데이터베이스 안에서는 같은 이름의 테이블을 만들수 없다
	    데이터베이스 (폴더) , 테이블 (파일)
	 2. 컬럼은 순서가 없다
	 3. 데이터는 순서가 없다
	 4. 이차원 구조를 가지고 있다
	    ----------------------------------
		no name dept  loc  ===> 컬럼 / 속성 (Attribute) => 데이터 구분
	    ----------------------------------
		1 홍길동 개발부 서울  ===> ROW , RECORD , TUPLE => 객체(인스턴스)
	    ----------------------------------
		2 심청이 자재부 부산  ===> ROW , RECORD , TUPLE => 객체(인스턴스)
	    ----------------------------------
	===> 컬럼확인
		 emp : 사원정보
		 empno : 사번 => 중복이 없는 데이터 = 숫자형
		 ename = 이름
		 job = 직위
		mgr = 사수번호
		hiredate = 입사일
		sal = 급여
		comm = 성과금
		deptno = 부서번호
		-------------------------- 한 사원당 8개의 데이터를 가지고 있다
						총 사원수 14명
						=> 오라클에서 연습용 테이블로 제작
	=> 확인 => desc 테이블명
	=> 자바매칭=> 컬럼명과 멤버변수 일치 (데이터형 일치)
	=> 데이터형
	 CHAR / VARCHAR2 / CLOB => String
	 NUMBER => 데이터값 => int/double


	
*/