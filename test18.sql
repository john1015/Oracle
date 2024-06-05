-- 2024-06-05
-- SELECT연습
/*

 이름                                      널?      유형
 ----------------------------------------- -------- ----------------------------
 BOOKID                                    NOT NULL NUMBER(2)
 BOOKNAME                               VARCHAR2(40)
 PUBLISHER                                VARCHAR2(40)
 PRICE                                       NUMBER(8)

    BOOKID BOOKNAME                                                                         PUBLISHER
                                                                  PRICE
---------- -------------------------------------------------------------------------------- -------------------------------------------------------------------------------- ----------
         1 축구의 역사                                             7000                          굿스포츠
                                                                  
         2 축구아는 여자                                          13000                            나무수
                                                                
         3 축구의 이해                                          22000                             대한미디어
                                                                 
         4 골프 바이블                                             35000                           대한미디어
                                                                
         5 피겨 교본                                              8000                            굿스포츠
                                                                 
         6 역도 단계별기술                                     6000                              굿스포츠
                                                                  
         7 야구의 추억                                           20000                           이상미디어
                                                                  
         8 야구를 부탁해                                        13000                            이상미디어
                                                                  
         9 올림픽 이야기                                           7500                         삼성당
                                                                   
        10 Olympic Champions                                  13000                              Pearson
                                                                  
*/
-- 145page 형식 => 순서
-- SELECT  사용방법 => 전체데이터 / 필요한 컬럼만 출력
-- 1. BOOK테이블에 있는 모든 데이터 출력
SELECT bookid , bookname , publisher , price  from book;
select * from book;
-- 2. 필요한 컬럼만 추출 => 프로젝션 => select 뒤에 컬럼명 나열
-- 도서번호 / 도서명 / 가격
select bookid , bookname , price from book;
-- select * | 컬럼명_리스트 ...
-- 중복이 없는 데이터 출력 => distinct
select distinct publisher from book;
/*
	조건 검색 => 사용자의 요청
	WHERE 조건문(연산자)
	연산자
	= 산술연산자 => SELECT뒤에서 통계 , 산술처리
	   ------------
		+ , - , * , /
		+는 Only 산술(덧셈) => 문자열 결합은 ||
		/ 는 정수/정수 = 실수
	  = WHERE문장 뒤에 => 결과값 true/false
	------------------------------------------------------------
	1. 비교연산자
	     = 같다
	     != , <> : 같지 않다 => <> 권장
	     < : 작다 ==> 기준점 => 왼쪽
	     > : 크다
	     <= : 작거나 같다  =>  <||=
	     >= : 크거나 같다  =>  >||=
	     *** 자바(== , !=) , 오라클 (=,<>) , JavaScript (===,!==)
	     *** 특징 : 문자열 , 날짜 , 숫자 비교시 사용이 가능
			  --------------- 무조건 ' ' 을 이용한다
			  예) ename = KING
			       hiredate=81/10/10 ==> 오류
			       ename='KING'
			       hiredate='81/10/10' => ""인용부호는 별칭에서만
	2. 논리 연산자
	     AND : 직렬 연산자 => 조건 두개가 true만 true / 나머지는 false
					     --------------------
					     ** && => 입력창
	     OR : 병렬 연산자 => 조건중에 한개이상 true면 true / 나머지는 false => 기간,범위가 포함이 안된 경우
					      ** || => 문자열 결합
	     NOT : 부정 연산자
		      NOT BETWEEN
		      NOT LIKE
		      NOT IN
				    ** 자바는 !
	3. BETWEEN ~ AND : 범위 , 기간을 지정 =>	>= AND <=  -> 이상 , 이하
	4. IN => OR을 여러개 사용시에 대체
	    IN(값,값...)
	5. LIKE : 검색 => 찾기
		    시작 문자열  ===========> 글자수를 모르는 경우 '시작문자열%'
		    종료 문자열  ===========> '%종료문자열'
		    포함된 문자열 ==========> '%포함문자열%' => 웹사이트에 나오는 모든 검색  
		    몇글자인지 ... ===> _ => 한글자
	6. 저장된 데이터중에 NULL값이 있는 경우에는 연산처리가 안된다
				     10+NULL = NULL
	   NULL값을 처리하는 연산자 NULL연산자
			NULL 인가 ==> IS NULL
			NULL 아닌가 ==> IS NOT NULL
		149page참조
	------------------------------------------------------------
*/
-- 비교연산자
-- 가격이 20000 미만인 도서의 모든 정보
select * from book where price < 20000;
-- 범위 10000이상 20000 이하 => 모든 데이터 출력 
select * from book where price>=10000 and price <=20000;
-- 범위 10000이상 20000 미만 => 모든 데이터 출력 => between은 사용이 안된다
select * from book where price>=10000 and price <20000;
-- 여러개를 찾는 경우 => OR
-- 출판사가 굿스포츠 , 대한 미디어에 출판한 책과 가격
SELECT bookname, publisher , price FROM book WHERE publisher ='굿스포츠' or publisher='대한 미디어';
select bookname , publisher , price from book where publisher IN('굿스포츠','대한 미디어');
-- OR 3개이상이 있는 경우에는 IN연산자 사용
SELECT bookname, publisher , price FROM book WHERE NOT (publisher ='굿스포츠' or publisher='대한 미디어');
-- 일반연산자 (비교연산 , 논리연산) => NOT을 사용시에 () => 우선순위 변경
select bookname , publisher , price from book where publisher NOT IN('굿스포츠','대한 미디어');
-- LIKE => 152page
-- 검색기 => LIKE문장 => REGEXP_LIKE() => 정규식
-- LIKE
-- 축구가 포함된 데이터 읽기
SELECT * FROM book WHERE bookname LIKE '%축구%';

-- 두번째 글자가 '구' 찾기
select * from book where bookname like '_구%';
