-- 2024-06-10
-- JOIN (INNER JOIN) => ������ (���� ���̳� , ���Ե� ��)
-- ������ NULL���� ó������ ���Ѵ� => NULL���� ���ֵ� ó�� (OUTER JOIN)
-- ���̺� => ���ڰ� , �ߺ����� => ���̺��� �������� �л� => �����ؼ� �����͸� ������ �´� => ����
/*
	=> ����ȭ : 5����ȭ => 3����ȭ
	hobby
	� , ���� , ��� , ���� , ����
	hobby
		�
		����
		���
		����
		���� => ���� / ���� / �߰�
*/
-- ���� ���̺��� ������ ���� => SELF JOIN => �ݵ�� ��Ī�� ���
-- ��� => �̸�(���) => ����� Ȯ��
-- LEFT OUTER JOIN
-- ���� ���̺��� ������ �����ϴ�
-- �÷����� �������� �ʴ� ��쵵 �ִ� => �ݵ�� �����Ͱ��� ������ ������ �־�� �Ѵ�
-- ���̺��� ������ ��쿡�� ���� => ���� �÷����� �����Ѵ�
-- id => ��� ������ �о�´�
-- ���̺��� �ݵ�� => ȸ�����Ժ��� ����
SELECT e1.ename "����" , e2.ename "�����"
FROM emp e1 ,emp e2
WHERE e1.mgr = e2.empno(+);

-- ���� ���� �ֹ��� �����͸� ������ �����ؼ� ���
-- customer / orders
select * from customer c , orders o where c.custid = o.custid order by c.custid asc;

-- ������ �ֹ��� ��� ������ ���Ǹž� , ���� ����
select name , SUM(saleprice)
from customer c , orders o
where c.custid = o.custid
group by name
order by name;
-- 167page
-- ���� �̸��� ���� �ֹ��� ������ �ݾ��� ����Ͻÿ�
-- customer       orders             book
select name , bookname , price
from customer c , orders o , book b
where c.custid = o.custid and o.bookid = b. bookid;
-- 168page
-- 20000�̻��� ������
select name , bookname , price
from customer c , orders o , book b
where c.custid = o.custid and o.bookid = b. bookid and price >= 20000;

