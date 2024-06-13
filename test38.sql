-- ������ : �ڵ� ������ȣ => PRIMARY KEY�� �ִ� ���
-- ID�ܿ� ��� PRIMARY KEY�� ���ڷ� �Ǿ� �ִ� => ������(�ߺ��� ����)

/*
	����
		CREATE SEQUENCE
	����
		DROP SEQUENCE

		�����ÿ� �ɼ�
		1) START WITH => ���۹�ȣ
		2) INCREMENT BY => ������ȣ
		3) NOCACHE | CACHE => �̸� ���� 20�� ���� ���� 
		4) NOCYCLE | CYCLE => �ٽ� ���ƿ´� ==> MIN = 1 , MAX = 10 => 10���� ���� �Ǹ� 1
		   -------------------- MAX , MIN�� �������� ������ ���Ѵ�
		�̸��ο�
		 ���̺�_������ �÷���_seq
		���� �д� ���
		 nextval / currval
		 	      ���簪
		  => ���� ������
*/
CREATE TABLE movie(
	no NUMBER PRIMARY KEY , 
	title VARCHAR2(100)
);
CREATE SEQUENCE movie_no_seq
START WITH 1
INCREMENT BY 1
NOCACHE
NOCYCLE;