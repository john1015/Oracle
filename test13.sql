-- 2024- 06- 04
-- ��¥ �Լ�
/*
	***SYSDATE : �ý����� ��¥ �ð� => ��¥ ������� �ʴ´�
	----------
	***MONTHS_BETWEEN : �Ⱓ�� ����
	ADD_MONTHS : => ������
	NEXT_DAY : �����Ŀ� ���ƿ��� ����
	LAST_DAY : ��¥ �Է� => �ش� �� ������ ��
	=> LONG => ***ROUND() , ***TRUNC()
*/
-- ���� ��¥ ���
--SELECT SYSDATE FROM DUAL;
-- ���� , ���� ... 3���� ...
--SELECT SYSDATE-1 "����" , SYSDATE "����" , SYSDATE+1 "����" FROM DUAL;
-- MONTHS_BETWEEN => �Ⱓ�� ������ => ���� ��� / ������ ...
--SELECT ename , ROUND(ROUND(MONTHS_BETWEEN(SYSDATE,hiredate))/12) from emp;
-- ADD_MONTH : ������ �������� ��¥ ������ ����
-- SELECT SYSDATE , ADD_MONTHS(SYSDATE,5) FROM DUAL;
-- SELECT ADD_MONTHS('24/04/11',7) FROM DUAL;
-- NEXT_DAY => ������ ��¥ �б�
-- NEXT_DAY(SYSDATE , 'ȭ') ==> 21/06/11
SELECT SYSDATE , NEXT_DAY(SYSDATE , '��') FROM DUAL;
-- LAST_DAY => �� => ��������
SELECT LAST_DAY('24/04/01') FROM DUAL;