-- pl-sql의 기본 골격
-- 1) 사번이 100인 직원의 이름과 연락처 출력
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

-- 2) 부서코드 80번 직원 급여 합계 평균 출력
DECLARE 
	h number(7);
	p number(7, 2);
BEGIN
	SELECT sum(salary), avg(salary)
	INTO h, p
	FROM EMPLOYEES e2 
	WHERE DEPARTMENT_ID = 80;

	dbms_output.put_line("합계:"||h);
	dbms_output.put_line('평균:'||p);
END; 

-- 3) Oliver 부서명 출력
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

	dbms_output.put_line('부서명 :' || dname);
END ;

b) sub query


-- 4) Tayler 직무명 출력
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
