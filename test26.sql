 --2024-06-11
-- �������� : �� ���α׷� => SQL������ �������� ��� => SQL������ �����ؼ� �ѹ��� ����
/*
	���������� ����
	   = �Ϲ� �������� => ���ǹ� ó�� => WHERE
		1) ������ �������� (���� ���� ���ȴ�) => �񱳿�����
		    �÷��� �ڹ��� ������ ���� => ���� 1���� ������ ����
		    WHERE sal = 3000,2000,... => X
			       ------------
		    171page
		2) ������ �������� => �񱳿����� ( = , < , > ...)
		    => ���ÿ� ó�� => IN()
		    => ANY / ALL => ���� �Ѱ��� ���� => MAX / MIN
		    	 > ANY(MIN) 
		         < ANY(MAX)
			 > ALL(MAX)
			 < ALL(MIN)
			 ------------------------------ SELECT MAX() , MIN()�� �� ��
	   = ��Į�� �������� => Chapter 4�� => �÷� ���
	   = �ζ��κ� => Chapter 4�� => ���̺� ���
*/

-- ������ ������ ���� �ִ� ���� �̸��� ���

SELECT name
FROM customer
WHERE custid IN (SELECT custid
			 FROM orders);
-- 2�� ��������
-- ���� �̵��� ������ ������ ������ ���� �̸��� ���
-- custid => customer / orders
SELECT name
FROM customer
WHERE custid IN (SELECT custid
			 FROM orders
			 WHERE bookid IN(SELECT bookid
						   FROM book
						   WHERE publisher = '���ѹ̵��'));