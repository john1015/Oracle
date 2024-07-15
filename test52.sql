-- 2024-06-27

DROP TABLE genie_music;
DROP SEQUENCE gm_mno_seq;
CREATE TABLE genie_music(
	mno NUMBER , 
	title VARCHAR2(2000) CONSTRAINT gm_title_nn NOT NULL , 
	singer VARCHAR2(2000) CONSTRAINT gm_singer_nn NOT NULL , 
	album VARCHAR2(2000) , 
	poster VARCHAR2(300) CONSTRAINT gm_poster_nn NOT NULL , 
	state CHAR(12) , 
	idcrement NUMBER DEFAULT 0 , 
	CONSTRAINT gm_mno_pk PRIMARY KEY(mno)
);


CREATE SEQUENCE gm_mno_seq
	START WITH 1
	INCREMENT BY 1
	NOCACHE
	NOCYCLE;
