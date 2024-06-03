-- 2024-06-03
-- 오라클 연산자
/*
	산술연산자 => SELECT 뒤에 주로 사용
	오라클의 단점 : 도메인단위로는 통계 (합,평균 ..)
			     ROW단위론느 통계를 낼 수 없다
	산술연산자를 제외하고 나머지는 결과값이 true/false
	=> 비교연산자 / 논리연산자 / NOT / IN /BETWEEN / LIKE / IS NULL ...
*/

/*
CREATE TABLE student(
	hakbun NUMBER,
	name VARCHAR2(52),
	kor NUMBER(3),
	eng NUMBER(3),
	math NUMBER(3) 
);
INSERT INTO student VALUES(1,'홍길동',89,78,67);
INSERT INTO student VALUES(2,'춘향이',80,70,60);
INSERT INTO student VALUES(3,'박문수',90,95,88);
INSERT INTO student VALUES(4,'이순신',67,89,67);
INSERT INTO student VALUES(5,'강감찬',78,78,78);

COMMIT;
*/
-- %는 존재하지 않는다 => MOD함수를 이용한다
SELECT hakbun , name , kor , eng , math , (kor+eng+math) "total" , (kor+eng+math)/3 "avg" FROM student;

/*
	1) 데이터베이스 => 반드시 컬렴명 / 데이터형을 확인
	2) SQL문장의 형식
	  전체 데이터 출력 ==> *
	   ***원하는 데이터 출력 ==> column 목록
	   SELECT : 데이터 검색 명령어 => 데이터 읽기
	형식) 
		5. SELECT [DISTINCT] * |column1 , column2 ...
		1. FROM  table_name (view_name , SELECT~) ==> 필수
		[
		2. 	WHERE 조건문 => 연산자
		3. 	GROUP BY 그룹컬럼 => 그룹별로 통계 , 회피 => 따로 통계
					---------- 같은 값을 가지고 있다(deptno , job , hiredate)
		4.	HAVING 그룹에 대한 조건
		6.	ORDER BY 컬럼명 (ASC|DESC) => 정렬
		]
		=> 원하는 컬럼의 값을 추출이 가능
		=> 연산자
		=> 내장 함수 (단일행 함수)
		=> 그룹별 처리 (집합함수)
		***=> JOIN(테이블연결) => 데이터 추출
		***=> SubQuery => SQL  문장을 한개로 만든다
		----------------------------------------------------- SELECT
		=> DDL => 테이블 생성 , 자동증가번호 , 가상테이블 , 인덱스 ...
			***=> 데이터 베이스 설계 / 정규화(1,2,3)
		=> 데이터 첨부 , 수정 , 삭제 => DML
		=> 재사용 기법
			***=> PL/SQL
		***=> 일괄처리 : 트랜잭션
*/