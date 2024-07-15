--2024-07-12 : DBCP / 답변형 게시판 => request/response예제 
/*
CREATE TABLE replyBoard(
no NUMBER , 
name VARCHAR2(50) CONSTRAINT rb_name_nn NOT NULL , 
subject VARCHAR2(2000) CONSTRAINT rb_sub_nn NOT NULL , 
content CLOB CONSTRAINT rb_cont_nn NOT NULL , 
pwd VARCHAR2(10) CONSTRAINT rb_pwd_nn NOT NULL , 
regdate DATE DEFAULT SYSDATE , 
hit NUMBER DEFAULT 0 ,
group_id NUMBER , -- 답변그룹을 설정(답변끼리 묶는다)
group_step NUMBER DEFAULT 0 , -- 답변 출력 순서
group_tab NUMBER DEFAULT 0 ,  -- 답변 , 답변의답변...
root NUMBER DEFAULT 0,  -- 어느 게시물에 대한 답변
depth NUMBER DEFAULT 0 ,  -- 답변이 몇개인지
CONSTRAINT rb_no_pk PRIMARY KEY(no)
);
CREATE SEQUENCE rb_no_seq
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;
*/
/*
		답변 전체 => 한개의 그룹          출력순서    답변레벨
					  no group_id group_step group_tab root depth
		AAAAAA		  1      1		0		0       0      2
		  => BBBBBB		  2      1		1		1       1      1
			=> CCCCCC   3      1		2		2       2      0
		  => EEEEEE	          5      1             3               1       1      0
		DDDDDD		  4      2		0               0       0      0
*/