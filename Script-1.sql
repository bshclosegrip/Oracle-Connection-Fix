SELECT * FROM EMPLOYEES e ;
SELECT first_name FROM employees;
--1) ��� ������ �̸����ּҸ� ��ȸ
SELECT first_name, email FROM EMPLOYEES;
--2) ��� �μ��� �μ���� �Ŵ��� ���̵� ��ȸ
SELECT first_department, manager_id FROM DEPARTMENTS d;

--3) �÷����� ��Ī ����ϱ�
SELECT 10 + 10 FROM dual;
SELECT 10+10 hap FROM dual;

--4) ��� ���̺��� �μ��ڵ�(department_id)�� �ߺ����� ��ȸ
SELECT depatment_id FROM EMPLOYEES e;
