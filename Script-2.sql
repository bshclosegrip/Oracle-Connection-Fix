-- system ������ ������ �� �۾��ϱ�_21.04.02
ALTER USER hr IDENTIFIED BY 1111;

-- ������ LOCK�� �ɸ� ���
ALTER USER hr account unlock;

-- �� ����(PARK) ��� �� ��ȣ ����
ALTER SESSION SET "_oracle_script" = TRUE;
CREATE USER park IDENTIFIED BY 1111;

-- ��ϵ� �������� ����(ROLE)
GRANT CONNECT, resource, dba TO park;

-- ���� ����
DROP USER park;
DROP USER kim;

