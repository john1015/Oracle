-- 2024-06-11
-- 179 page => 테이블 생성
-- 183 page => 데이터형
-- 184 page => ALTER(테이블 변경)
-- 186 page => 테이블 삭제 DROP

/*
	사용자 정의 테이블 생성
	1) 형식
		CREATE TABLE table_name(
			컬럼명 데이터형 [제약조건] , => 제약조건은 여러개 설정이 가능
			컬럼명 데이터형 [제약조건] ,  => 컬럼뒤에 설정 (컬럼 레벨)
			컬럼명 데이터형 [제약조건] , 
			컬럼명 데이터형 [제약조건] , 
			컬럼명 데이터형 [제약조건] , 
			[제약조건] , => 컬럼 생성 이후에 설정 (테이블 레벨)
			[제약조건]  
		)
		= 컬럼레벨 => 컬럼 생성과 동시에 생성
					NOT NULL , DEFAULT
		= 테이블레벨 => 컬럼 전체를 생성후에 나중에 제약조건 생성
					PRIMARY KEY , FOREIGN KEY , CHECK , UNIQUE => 1개 이상을 동시에 생성 할 수 있다

		*** 제약조건을 수정하기 위해 제약조건에 이름을 부여
		CONSTRAINT 이름 제약조건 부여
				  ------- 한개 테이블에 저장 => 중복이 있으면 안된다
				  tableName_컬럼명_약자
							     pk
							     fk
							     ck
							     uk
							     nn
		member
		   id VARVHAR2(10) constraint member_id_pk PRIMARY KEY
							 ------------------
*/
-- 게시판
/*
	1. 게시물 번호 => 중복 없는 데이터 => PK
	2. 작성자 = 반드시 입력 => NN
	3. 제목 => NN
	4. 내용 => NN
	5. 비밀번호 => NN
	6. 작성일 => DEFAULT
	7. 조회수 => 숫자 DEFAULT 0
*/
/*
CREATE TABLE board(
	no NUMBER , 
	name VARCHAR2(51) CONSTRAINT board_name_nn NOT NULL,
	subjuct VARCHAR2(4000) CONSTRAINT board_subject_nn NOT NULL,
	content CLOB CONSTRAINT board_content_nn NOT NULL, 
	pwd VARCHAR(10) CONSTRAINT pwd_name_nn NOT NULL,
	regdate DATE DEFAULT SYSDATE,
	hit NUMBER DEFAULT 0,
	CONSTRAINT board_no_pk PRIMARY KEY(no)
);
*/
/*
CREATE TABLE myDEPT(
	deptno NUMBER(2) ,
	dname VARCHAR2(20) CONSTRAINT md_dname_nn NOT NULL , 
	loc VARCHAR2(20) CONSTRAINT md_loc_nn NOT NULL , 
	CONSTRAINT md_dname_uk UNIQUE(dname) ,
	CONSTRAINT md_loc_uk UNIQUE(loc) , 
	CONSTRAINT md_deptno_pk PRIMARY KEY(deptno)
);

CREATE TABLE myEMP(
	empno NUMBER(4),
	ename VARCHAR2(20) CONSTRAINT me_ename_nn NOT NULL ,
	job VARCHAR2(20) CONSTRAINT me_job_nn NOT NULL ,
	mgr NUMBER(4),
	hiredate DATE DEFAULT SYSDATE ,
	sal NUMBER(7,2) CONSTRAINT me_sal_nn NOT NULL ,
	comm NUMBER(7,2) ,
	deptno NUMBER(2) ,
	CONSTRAINT me_empno_pk PRIMARY KEY(empno),
	CONSTRAINT me_deptno_ck CHECK(deptno IN(10,20,30,40)) ,	
	CONSTRAINT me_deptno_fk FOREIGN KEY(deptno)
	REFERENCES myDept(deptno) ON DELETE CASCADE	
);
*/

/*
	형식)
		1. NOT NULL => NULL값을 허용하지 않는다
		   ------------ 반드시 컬럼뒤에서 생성
		   = 컬럼 데이터형 NOT NULL => 약식으로 설정 => 테이블 삭제후 다시만들어야함
		   = 컬럼 데이터형 CONSTRAINT 제약조건명 NOT NULL ==> 권장 => NOT NULL생략
		2. UNIQUE : 중복이 없는 값 , NULL 값을 허용
				email / phone => 후보키(대체키) => 기본키를 잃어버린 경우 사용
				=> 주민등록번호
		  ---------- 컬럼 생성 이후에 생성
		  CONSTRAINT 제약조건명 UNIQUE(컬럼명)
		3. CHECK : 지정된 데이터만 사용이 가능하게 만든다
		  ---------- 컬럼생성이후에 생성
		   CONSTRAINT 제약조건명 CHECK(컬럼명 IN(값 ....))
		4. PRIMARY KEY : 기본키 (테이블은 한개이상의 기본키를 가지고 있어야 한다)
						   ----------------------------------------------------------- 이상현상 => 무결성
		  ----------------- 컬럼 생성이후에 생성
		  CONSTRAINT 제약조건명 PRIMARY KEY(컬럼명)
		5. FOREIGN KEY : 외래키(참조키) => 다른 테이블 연결 => 참조 무결성
		   --------------- 컬럼생성이후에 생성
		   CONSTRAINT 제약조건명 FOREIGN KEY (컬럼명)
		   REFERENCES 참조테이블(참조컬럼)
		6. DEFAULT : 사용자가 값을 입력을 하지 않은 경우 자동 지정
		   ----------- 컬럼뒤에 생성
		   컬럼명 데이터형 DEFAULT값
	 --------------------------------------------------------------------------------------------------------------------
	 제약조건 => ALTER를 이용해서 제어가 가능
	 제약조건명 => 테이블_컬럼_약자 => 제어가 쉽게 할 수 있게 만든다
			pk => PRIMARY
			fk => FOREIGN
			nn => NOT NULL
			ck => CHECK
			uk => UNIQUE		
	---------------------------------------------------------------------------------------------------------------------
	테이블 수정 : ALTER
		ALTER 사용법
		= 컬럼 추가 : ADD
		   ALTER TABLE table_name ADD 컬럼명 데이터형 [제약조건설정]
										     ---------------- NOT NULL (데이터 없는 경우)
										     ------ 데이터가 있는 경우 => DEFAULT => NOT NULL
		= 컬럼 수정 : MODIFY
		   ALTER TABLE table_name MODIFY 컬럼명 데이터형
									     ---------- '홍길동' ,  '심청이' => NUMBER
		= 컬럼 삭제 : DROP COLUMN
		   ALTER TABLE table_name DROP COLUMN column_name
	테이블 삭제 : DROP
		DROP TABLE table_name
	테이블 이름 변경 : RENAME
		RENAME old_name TO new_name
	데이터 잘라내기 : TRUNCATE
		TRUNCATE TABLE table_name
*/
DROP TABLE emp_copy;
CREATE TABLE emp_copy
AS 
SELECT * FROM emp
WHERE 1=2;