-- 2024-06-04 �����Լ� => 209page
/*
	�����Լ� : ����Ŭ���� �����ϴ� �Լ�
	---------- �������� ������ �ִ� �Լ�
	---------- ���ó : SELECT�ڿ� , WHERE�ڿ� , ORDER BY �ڿ� , GROUP BY �ڿ�
	| ����� ���� �Լ� : FUNCTION
	 CREATE FUNCTION max(�Ű�����) RETURN NUMBER => ����� ���� �Լ�
	| �Լ� => ������ / �Լ��� / �Ű����� / ���
		     ----------------------------------------
	=> ROW���� ó�� => ���پ� ó�� : ������ �Լ�
		�����Լ�
			***=> LENGTH() : ���� ����
				LENGTH('abc') => 3
				LENGTH('ȫ�浿') => 3 => �������� => ��й�ȣ 8~12
			=> LENGTHB() : ����Ʈ ��
				LENGTHB('abc') => 3
				LENGTHB('ȫ�浿') => 9 => �ѱ��� �ѱ��ڴ� 3byte
				=> CHAR(10) , VARCHAR2(10)
			=> UPPER() : �빮��
				UPPER('abc') => ABC
			=> LOWER() : �ҹ���
				LOWER('ABC') => abc
			=> INITCAP() : �̴ϼ�
				INITCAP('abc') => Abc => ù���ڸ� �빮��
			=> ������ ���̺� : DUAL => ���� , �Լ� ...
			-------------------------
			***=> SUBSTR : substring
			***=> INSTR : indexOf
			=> LTRIM / RTRIM / TRIM : rim
			=> LPAD / ***RPAD
			=> ***REPLACE : replace
			=> CONCAT : ���ڿ� ���� => ||
		�����Լ�
		��¥�Լ�
		��ȯ�Լ�
		��Ÿ�Լ�
	=> COLUMN���� ó�� => COLUMN��ü ó�� : ���� �Լ�


*/
-- SET LINESIZE 300;
-- SELECT LENGTH('abc'), LENGTH('ȫ�浿'),LENGTHB('abc'), LENGTHB('ȫ�浿')
-- FROM DUAL;
-- SELECT ename , LENGTH(ename)
-- FROM emp;
-- SELECT ename , length(ename) FROM emp WHERE length(ename)=6;
-- SELECT * FROM emp WHERE ename = UPPER('scott');
-- UPPER , LOWER , INITCAP
-- SELECT ename ,UPPER(ename) , lower(ename), INITCAP(ename) FROM emp;

/*
	SUBSTR : ���ڸ� �ڸ��� ��쿡 ��� => �ڹ� (substring)
	Hello Java
	12345678910 => ���� ��ȣ�� 1�� , (���α׷����� 0������ ����)
	SUBSTR(���ڿ� , ���۹�ȣ , ���ڰ���)
*/
-- SELECT SUBSTR('Hello Oracle',1,5) FROM DUAL;
-- ����� �Ի��� ���� ���
-- SELECT ename , hiredate "�Ի���" , SUBSTR(hiredate,4,2) "�Ի��� ��"FROM emp; 
-- ����
-- SELECT ename , hiredate "�Ի���" , SUBSTR(hiredate,4,2) "�Ի��� ��" , TO_CHAR(hiredate,'DY') "����" FROM emp; 
--81�⿡ �Ի��� ����� ��� ����
--SELECT ename ,hiredate FROM emp WHERE SUBSTR(hiredate,1,2)=81;
-- 12���� �Ի��� ���
--SELECT ename , hiredate FROM emp WHERE substr(hiredate ,4,2)=12;
-- ��
--SELECT ename , SUBSTR(hiredate , 7,2) from emp ;
/*
	ABCDEFG
	12345 6 7
		-2-1
*/
--select ename , SUBSTR(hiredate , -2,2) from emp ;
/*
	LPAD / ***RPAD => ���̵� ã�� / ��й�ȣ(�̸��� ����) => JavaMail  ad****
	LPAD : ****���� , RPAD : ����**** L = left  R = right
	LPAD(���ڿ�,���ڼ�,��ü����)
		------- ------- ----------
		'ABC' , 7 , '#' => ####ABC
*/
--SELECT LPAD('ABCDEFG',10,'#') FROM DUAL;
-- ABCDE
--KING ==> ****K
--SELECT LPAD(SUBSTR(ename,1,1) , LENGTH(ename),'*') from emp;
--SELECT RPAD(SUBSTR(ename,1,1) , LENGTH(ename),'*') from emp;
/*
	LTRIM / RTRIM / TRIM => trim() => �¿��� ���� ����
	=> ������ ���ڸ� ����
	TRIM() : �¿�
	LTRIM() : ���ʸ� => LTRIM(���ڿ� , ������ ����)
							 ------------- ������ ���� ��� ��������
				    LTRIM('AAABBBCCAAA','A') => BBBCCAAA
				    LTRIM('AAABBBCCAAA') => AAABBBCCAAA => ��������
	RTRIM() : �����ʸ�
				    RTRIM('AAABBBCCAAA','A') => AAABBBCC
*/
-- SELECT LTRIM('   AAABBBCCCAAA   ') "LTRIM" , RTRIM('   AAABBBCCCAAA   ') "RTRIM" , TRIM(' ' FROM '   AAABBBCCCAAA   ') "TRIM" FROM DUAL;
/*
	CONCAT => || => ���ڿ� ����
	----------------
	����Ŭ�� ||
	MySQL��CONCAT
	String sql = "SELECT * FROM table_name WHERE �÷��� LIKE '%'||?||'%'"
	String sql = "SELECT * FROM table_name WHERE �÷��� LIKE CONCAT('%',?,'%')"
	CONCAT(���ڿ� , ���ڿ�)
	CONCAT('Hrllo','Oracle') => Hello Oracle
	'Hello'||'Oracle' => +�� �������θ� ���
*/
-- select concat('�̸��� ',ename) from emp;

/*
	REPLACE => ����
	REPLACE(���ڿ� , ������ ���� , ���� ����)
	
*/
-- SELECT ename , REPLACE(ename , 'A','B') "����" from emp;
-- select replace('Hello Java' , 'Java' , 'Oracle') from dual;
/*
	INSTR => indexOf() => ��ġ ��ȣ
	INSTR(���ڿ� , ã�¹��� , ������ġ , ���°����)
	INSTR("Hello Java" , 'a' , 1,1) => 2

*/
 -- select ename , INSTR(ename , 'A' , 1 , 2) from emp;
select INSTR('Hello Java' , 'a' , 1 , 1) , INSTR('Hello Java' , 'a' , 1 , 2) from dual;