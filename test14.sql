-- 2024-06-24
-- 변환 함수 / 기타 함수
/*
	*****TO_CHAR => 문자 변환
		= 원하는 날짜 형식을 출력 => SimpleDateFormat
			yyyy/YYYY년도 => Y2K => rrrr/RRRR
			월 : mm / MM / m
			일 : dd / DD / d(1~31)
			      01 ~ 31
			시간 : hh / HH24
				1-12	1-24
			분 : MI
			초 : ss / SS ============> 공지사항 / 댓글 / 예약 / 결제
			요일 : dy/DY
		       -------------------------------------------------------------------------
		= 원하는 숫자 형식 출력 => DecimalFormat
		   => 999,999
		TO_CHAR(10000000 , '99,999,999')
	TO_NUMBER => 숫자 변환
		자동으로 변환 => '10' + '10' = 20
					  --------------- TO_NUMBER가 적용된다
				     TO_NUMBER('10') + TO_NUMBER('10') =20
	TO_DATE => 날짜 변환

	***** NVL : NULL값을 다른 값으로 대체
		NVL(컬럼 , 문자열 , 대체값)
		      ------		   --------
			 |			|
			  ------------------- 데이터형 일치
		NVL(comm,0) NVL(comm,'no comm') => 숫자 -> 숫자 OR 문자 -> 문자 , TO_CHAR,TO_NUMBER로 변경후 실행해야댐
				
	---------------------------------------------
	DECODE => 다중 조건문
	CASE => switch ~ case
	--------------------------------------------- Trigger주로 사용 => 자동 처리
	입고 = 재고
	출고 = 재고
		  ------ 자동처리
*/
-- 1981년 12월 01일
-- SELECT ename , hiredate , TO_CHAR(hiredate,'YYYY"년" MM"월" DD"일"') FROM emp;
-- 한글있으면 인용부호(" ")필요
-- SELECT ename,hiredate,TO_CHAR(hiredate,'YYYY-MM-DD HH24:MI:SS') FROM emp;
-- 천 단위 앞에 , / \붙이려면 L을 앞에 붙혀서
--select ename , TO_CHAR(sal , 'L999,999') from emp;
-- NVL
--SELECT ename,sal,comm,sal+NVL(comm,0) FROM emp;
-- 문자 / 숫자 => TO_CHAR , TO_NUMBER
--SELECT ename,sal,NVL(TO_CHAR(comm),'성과급 없음') FROM emp;
/*
	DECODE => 선택문 (다중 조건문)
	DECODE(star,1,'★☆☆☆☆' , 2 , '★★☆☆☆' , 3 , '★★★☆☆' , 4 , '★★★★☆' , 5 , '★★★★★')
*/
--SELECT * FROM emp;
--SELECT empno , ename , job , mgr , hiredate , sal , comm , DECODE(deptno,10,'개발부' , 20 ,'자재부' , 30 , '영업부') dname FROM emp;
/*
	CASE => 조건 사용이 가능
	CASE
		WHEN deptno = 10 THEN 값
		WHEN deptno = 20 THEN 값
		WHEN deptno = 30 THEN 값
		WHEN deptno = 40 THEN 값
		WHEN deptno = 50 THEN 값
	END "dname"
*/
/*
SELECT ename , job , hiredate , CASE
						WHEN deptno = 10 THEN '개발부'
						WHEN deptno = 20 THEN '영업부'
						WHEN deptno = 30 THEN '기획부'
						END "dname"
FROM emp;*/