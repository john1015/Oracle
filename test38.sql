-- 시퀀스 : 자동 증가번호 => PRIMARY KEY가 있는 경우
-- ID외에 모든 PRIMARY KEY는 숫자로 되어 있다 => 구분자(중복이 없다)

/*
	생성
		CREATE SEQUENCE
	삭제
		DROP SEQUENCE

		생성시에 옵션
		1) START WITH => 시작번호
		2) INCREMENT BY => 증가번호
		3) NOCACHE | CACHE => 미리 숫자 20개 정도 저장 
		4) NOCYCLE | CYCLE => 다시 돌아온다 ==> MIN = 1 , MAX = 10 => 10까지 증가 되면 1
		   -------------------- MAX , MIN을 지정하지 않으면 무한대
		이름부여
		 테이블_증가할 컬럼명_seq
		값을 읽는 경우
		 nextval / currval
		 	      현재값
		  => 다음 증가값
*/
CREATE TABLE movie(
	no NUMBER PRIMARY KEY , 
	title VARCHAR2(100)
);
CREATE SEQUENCE movie_no_seq
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;