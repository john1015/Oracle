-- 2024-06-28
CREATE TABLE food_house(
	fno NUMBER , 
	name VARCHAR2(200) CONSTRAINT fh_name_nn NOT NULL , 
	type VARCHAR2(200) CONSTRAINT fh_type_nn NOT NULL , 
	phone VARCHAR2(30) , 
	address VARCHAR2(700) , 
	score NUMBER(2,1) , 
	theme CLOB , 
	poster VARCHAR2(260) CONSTRAINT fh_poster_nn NOT NULL , 
	content CLOB , 
	CONSTRAINT fh_fno_pk PRIMARY KEY(fno)	
);

CREATE SEQUENCE fh_fno_seq
	START WITH 1
	INCREMENT BY 1
	NOCACHE
	NOCYCLE;