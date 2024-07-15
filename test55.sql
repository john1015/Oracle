-- 2024-07-15	
-- 파일 업로드 : => 답변형 게시판 => 홈페이지 => MV / MVC => EL / JSTL
/*
CREATE TABLE databoard(
	no NUMBER , 
	name VARCHAR2(50) CONSTRAINT db_name_nn NOT NULL ,
	subject VARCHAR2(2000) CONSTRAINT db_sub_nn NOT NULL  , 
	content CLOB CONSTRAINT db_cont_nn NOT NULL  , 
	pwd VARCHAR2(10) CONSTRAINT db_pwd_nn NOT NULL , 
	regdate DATE DEFAULT SYSDATE , 
	hit NUMBER DEFAULT 0 ,
	filename VARCHAR2(260) , 
	filesize NUMBER DEFAULT 0 ,
	CONSTRAINT db_no_pk PRIMARY KEY(no)
);*/
CREATE SEQUENCE db_no_seq
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;
