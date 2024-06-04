-- 2024-06-24
-- ��ȯ �Լ� / ��Ÿ �Լ�
/*
	*****TO_CHAR => ���� ��ȯ
		= ���ϴ� ��¥ ������ ��� => SimpleDateFormat
			yyyy/YYYY�⵵ => Y2K => rrrr/RRRR
			�� : mm / MM / m
			�� : dd / DD / d(1~31)
			      01 ~ 31
			�ð� : hh / HH24
				1-12	1-24
			�� : MI
			�� : ss / SS ============> �������� / ��� / ���� / ����
			���� : dy/DY
		       -------------------------------------------------------------------------
		= ���ϴ� ���� ���� ��� => DecimalFormat
		   => 999,999
		TO_CHAR(10000000 , '99,999,999')
	TO_NUMBER => ���� ��ȯ
		�ڵ����� ��ȯ => '10' + '10' = 20
					  --------------- TO_NUMBER�� ����ȴ�
				     TO_NUMBER('10') + TO_NUMBER('10') =20
	TO_DATE => ��¥ ��ȯ

	***** NVL : NULL���� �ٸ� ������ ��ü
		NVL(�÷� , ���ڿ� , ��ü��)
		      ------		   --------
			 |			|
			  ------------------- �������� ��ġ
		NVL(comm,0) NVL(comm,'no comm') => ���� -> ���� OR ���� -> ���� , TO_CHAR,TO_NUMBER�� ������ �����ؾߴ�
				
	---------------------------------------------
	DECODE => ���� ���ǹ�
	CASE => switch ~ case
	--------------------------------------------- Trigger�ַ� ��� => �ڵ� ó��
	�԰� = ���
	��� = ���
		  ------ �ڵ�ó��
*/
-- 1981�� 12�� 01��
-- SELECT ename , hiredate , TO_CHAR(hiredate,'YYYY"��" MM"��" DD"��"') FROM emp;
-- �ѱ������� �ο��ȣ(" ")�ʿ�
-- SELECT ename,hiredate,TO_CHAR(hiredate,'YYYY-MM-DD HH24:MI:SS') FROM emp;
-- õ ���� �տ� , / \���̷��� L�� �տ� ������
--select ename , TO_CHAR(sal , 'L999,999') from emp;
-- NVL
--SELECT ename,sal,comm,sal+NVL(comm,0) FROM emp;
-- ���� / ���� => TO_CHAR , TO_NUMBER
--SELECT ename,sal,NVL(TO_CHAR(comm),'������ ����') FROM emp;
/*
	DECODE => ���ù� (���� ���ǹ�)
	DECODE(star,1,'�ڡ١١١�' , 2 , '�ڡڡ١١�' , 3 , '�ڡڡڡ١�' , 4 , '�ڡڡڡڡ�' , 5 , '�ڡڡڡڡ�')
*/
--SELECT * FROM emp;
--SELECT empno , ename , job , mgr , hiredate , sal , comm , DECODE(deptno,10,'���ߺ�' , 20 ,'�����' , 30 , '������') dname FROM emp;
/*
	CASE => ���� ����� ����
	CASE
		WHEN deptno = 10 THEN ��
		WHEN deptno = 20 THEN ��
		WHEN deptno = 30 THEN ��
		WHEN deptno = 40 THEN ��
		WHEN deptno = 50 THEN ��
	END "dname"
*/
/*
SELECT ename , job , hiredate , CASE
						WHEN deptno = 10 THEN '���ߺ�'
						WHEN deptno = 20 THEN '������'
						WHEN deptno = 30 THEN '��ȹ��'
						END "dname"
FROM emp;*/