-- 2024-06-26 트리거 => PL/SQL
/*
	1. 자동 이벤트 처리
	   => 미리 설정된 조건에 맞는 경우에 자동으로 SQL문장을 실행
	   => 실무에는 많이 사용하지 않는다 (오류발생시 웹프로그램에서 처리하기 어렵다)
	   => 입고 (INSERT) => 자동으로 재고를 완성
	   => 출고 => 재고 변경
	2. 형식
	   CREATE| ORREPLACE TRIGGER tri_name
	   BEFORE|AFTER (INSERT|UPDATE|DELETE) ON table_name
	   TRIGGER => 실제
	   실제 => TRIGGER
	   =>AFTER

	*** INSERT | UPDATE | DELETE에 수행 (SELECT는 제외)
	*** TRIGGER은 자동 COMMIT(COMMIT을 사용하진 않는다)
	*** :NEW => 새로운 데이터가 들어올때
	*** :OLD => 기존에 있는데이터

	FOR EACH ROW *** 전체 ROW에 대한 처리

	DECLARE
	BEGIN
	END;
	/

	3. 삭제
		DROP TRIGGER trigger_name
	4. 수정
		ALTER TRIGGER tri_name_(사용빈도가 적다) => OR REPLACE
	5. 주로 사용처
		=> 찜 / 좋아요
		=> 입고 / 출고 => 재고를 자동화 처리
*/
/*
CREATE TABLE 상품(
	품번 NUMBER,
	상품명 VARCHAR2(30),
	단가 NUMBER
);
CREATE TABLE 입고(
	품번 NUMBER,
	수량 NUMBER,
	금액 NUMBER
);
CREATE TABLE 출고 (
	품번 NUMBER,
	수량 NUMBER,
	금액 NUMBER
);
CREATE TABLE 재고(
	품번 NUMBER,
	수량 NUMBER,
	금액 NUMBER,
	누적금액 NUMBER
);
*/
--상품
/*
INSERT INTO 상품 VALUES(100,'새우깡',1500);
INSERT INTO 상품 VALUES(200,'감자깡',1000);
INSERT INTO 상품 VALUES(300,'맛동산',2000);
INSERT INTO 상품 VALUES(400,'짱구',500);
INSERT INTO 상품 VALUES(500,'고구마깡',2500);
COMMIT;
*/
-- 입고 => 재고를 자동화 처리

CREATE OR REPLACE TRIGGER input_trigger
AFTER INSERT ON 입고
FOR EACH ROW
DECLARE
  v_cnt NUMBER:=0;
BEGIN
	SELECT COUNT(*) INTO v_cnt
	FROM 재고
	WHERE 품번=:NEW.품번;
	
	IF v_cnt=0 THEN -- 재고에 신상품이 들어온 경우
	  INSERT INTO 재고 VALUES(:NEW.품번 , :NEW.수량 , :NEW.금액, :NEW.수량*:NEW.금액);
	ELSE -- 재고에 상품이 이미 존재
	  UPDATE 재고 SET
	    수량 = 수량+:NEW.수량 , 
	    누적금액 = 누적금액+(:NEW.수량 * :NEW.금액)
	    WHERE 품번 = :NEW.품번;
-- 주의점 : AUTOCOMMIT
	END IF;
END;
/

--입고

--INSERT INTO 입고 VALUES(100,5,1500);
--COMMIT;

-- INSERT INTO 입고 VALUES(200,10,1000);
-- COMMIT;
-- SELECT * FROM 입고;
-- SELECT * FROM 재고;
-- 트리거 : 연쇄반응 => 테이블 두개를 동시에 처리

-- 출고
CREATE OR REPLACE TRIGGER output_trigger
AFTER INSERT ON 출고
FOR EACH ROW
DECLARE
   v_cnt NUMBER := 0;
BEGIN
   -- 수량 확인 => 출고되는 품번에 대한
  SELECT COUNT(*) INTO v_cnt
  FROM 재고
  WHERE 품번 = : NEW.품번; -- 출고가 INSERT시 => 지정된 품번울 읽어 온다
	IF :NEW.수량 = v_cnt THEN
	DELETE FROM 재고
	WHERE 품번 = :NEW.품번;
	ELSE 
	UPDATE 재고 SET
	수량 = :NEW.수량 , 
	누적금액 = :NEW.누적금액 = (:NEW.수량 * :NEW.금액)
	WHERE 품번 =:NEW.품번;
	END IF;
END;
/

INSERT INTO 출고 VALUES (100,5,1500);
COMMIT;
SELECT * FROM 출고;
SELECT * FROM 재고;
