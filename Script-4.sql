-- pl-sql�� �⺻ ���
-- 1) ����� 100�� ������ �̸��� ����ó ���
DECLARE
	vname varchar2(50);
	vphone varchar2(50);
BEGIN
	SELECT first_name, phone_number
	INTO vname, vphone
	FROM EMPLOYEES e2 
	WHERE EMPLOYEE_ID = 100;

	dbms_output.put_line(vname);
	dbms_output.put_line(vphone);
END ;

-- 2) �μ��ڵ� 80�� ���� �޿� �հ� ��� ���
DECLARE 
	h number(7);
	p number(7, 2);
BEGIN
	SELECT sum(salary), avg(salary)
	INTO h, p
	FROM EMPLOYEES e2 
	WHERE DEPARTMENT_ID = 80;

	dbms_output.put_line("�հ�:"||h);
	dbms_output.put_line('���:'||p);
END; 

-- 3) Oliver �μ��� ���
a)
DECLARE
	dname varchar2(50);
BEGIN
	SELECT d.department_name
	INTO vname
	FROM DEPARTMENTS d2
	JOIN EMPLOYEES e2 
	ON d2.DEPARTMENT_ID = e2.DEPARTMENT_ID 
	WHERE FIRST_NAME = 'Oliver';

	dbms_output.put_line('�μ��� :' || dname);
END ;

b) sub query


-- 4) Tayler ������ ���
DECLARE
	vname varchar2(50);
	vphone varchar2(50);
BEGIN
	SELECT first_name, phone_number
	INTO vname, vphone
	FROM EMPLOYEES e2 
	WHERE EMPLOYEE_ID = 100;

	dbms_output.put_line(vname);
	dbms_output.put_line(vphone);
END ;
