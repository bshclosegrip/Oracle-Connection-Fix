SELECT * FROM EMPLOYEES e;
SELECT first_name FROM employees;
--1) ��� ������ �̸����ּҸ� ��ȸ
SELECT first_name, email FROM EMPLOYEES;
--2) ��� �μ��� �μ���� �Ŵ��� ���̵� ��ȸ
SELECT department_id, manager_id FROM DEPARTMENTS d;

--3) �÷����� ��Ī ����ϱ�
SELECT 10 + 10 FROM dual;
SELECT 10+10 hap FROM dual;

--4) ��� ���̺��� �μ��ڵ�(department_id)�� �ߺ����� ��ȸ
SELECT DISTINCT department_id, EMPLOYEE_ID FROM EMPLOYEES e;

--5) ��� ���̺��� ������ �Ʒ��� ���� ����Ͻÿ�.
--   XXX ����� �μ����� XXX �Դϴ�.
SELECT EMPLOYEE_ID || '����� �μ��ڵ��' || DEPARTMENT_ID || '�Դϴ�.'
FROM EMPLOYEES;

--6) �޿��� 10000�� �̻��� ������ �̸��� �޿��� ��ȸ
SELECT first_name, salary FROM employees
WHERE salary >= 10000

--7) �޿��� 10000�� �̻��̰ų� 4000������ ������ �̸�, �޿�, �̸����� ��ȸ
SELECT first_name, salary, email FROM employees
WHERE salary >= 10000 OR salary <= 4000;

--8) �μ��ڵ尡 100�� �̰ų� �޿��� 10000�� �̻��� ������
-- �μ��ڵ�, �̸�, �޿� ��ȸ
SELECT DEPARTMENT_ID, first_name, salary FROM EMPLOYEES
WHERE salary >= 10000 OR DEPARTMENT_ID = 100;

--9) �޿��� 5000�̻��̰� 7000������ ������ ����, �޿��� ���(between)
-- salary >= 5000 and salary <= 7000
SELECT first_name, SALARY FROM EMPLOYEES
WHERE SALARY BETWEEN 5000 AND 7000;

--10) �μ����̵� 80 �Ǵ� 90 �Ǵ� 100�� ������ �̸�, �̸���, �μ����̵� ��ȸ
-- d = 80 or d = 90 or d = 100
-- in(80, 90, 100)
SELECT first_name, email, department_id FROM EMPLOYEES e 
WHERE DEPARTMENT_ID IN(80, 90, 100);

--11) �̸��� S�� �����ϴ� �������� ���̵�, ������ ��ȸ
SELECT employee_id, first_name FROM EMPLOYEES e 
WHERE FIRST_NAME LIKE 'S%'

--12) �̸��� s�� ���Ե� ������ ���̵�, ���� ��ȸ
SELECT employee_id, first_name FROM EMPLOYEES e 
WHERE FIRST_NAME LIKE '%s%'

--13) commission_pct�� �ִ� ������ �̸��� commision_pct�� ��ȸ(is null, is not null)
SELECT first_name, commission_pct FROM EMPLOYEES e 
WHERE COMMISSION_PCT IS NOT NULL;
SELECT first_name, commission_pct FROM EMPLOYEES e 
WHERE COMMISSION_PCT IS NULL;

--14) commission�� �ִ� ������ ����, �޿�, ���ʽ�(�޿� * commission_pct)��
--	�Ʒ��� ���� ��ȸ
--	����		�޿�		���ʽ�
--	XXX		XXXX	XXXX
SELECT first_name ����, commission_pct �޿�, salary*commission_pct AS Bonus FROM EMPLOYEES e 
WHERE COMMISSION_PCT IS NOT NULL;

--15) �޿��� 10000�� �̻��� ������ �̸�, �޿��� �޿������� ��ȸ
SELECT FIRST_NAME, SALARY FROM EMPLOYEES e 
WHERE SALARY >= 10000 ORDER BY SALARY DESC;

--16) 15�� �������� ������ �޿��� ��� �̸������� ����
SELECT FIRst_Name ����, Salary ���� FROM  EMPLOYEES e 
WHERE SALARY >= 10000 ORDER BY SALARY ASC, FIRST_NAME ASC;

--16) 15�� �������� ������ �޿��� ��� �̸������� ����-2
SELECT FIRst_Name ����, Salary ���� FROM  EMPLOYEES e 
WHERE SALARY >= 10000 ORDER BY SALARY, FIRST_NAME;

-- ���� �����ڸ� �����ϱ� ���� ���̺� ���� --
CREATE TABLE emp AS SELECT * FROM EMPLOYEES WHERE SALARY > 8000;
SELECT * FROM emp;

----���̺� ����
DROP TABLE emp;

--17) employees ���̺�� emp ���̺��� ������ union���� ����
SELECT employee_id, first_name, salary FROM EMPLOYEES
UNION 
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY FROM EMP;

--18) employees ���̺�� emp ���̺��� ������ �ߺ�����Ͽ� union all���� ����
SELECT employee_id, first_name, salary FROM EMPLOYEES
UNION ALL
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY FROM emp;

--19) employees, emp ���̺� �ߺ��� �ڷḦ ��ȸ
SELECT * FROM EMPLOYEES e2
INTERSECT
SELECT * FROM emp;

--20) ������ ��ȸ
SELECT * FROM EMPLOYEES e2
MINUS 
SELECT * FROM emp;

--21) first_name�� ��� �빮�ڷ�, last_name�� ��� �ҹ��ڷ� ���
SELECT upper(FIRST_NAME), lower(LAST_NAME) FROM EMPLOYEES e;

--22) email �ּ��� ���̸� ����, �̸���, �̸��� ���̷� ���
SELECT CONCAT(FIRST_NAME, LAST_NAME) AS ����, email, LENGTH(email) AS �̸��ϱ��� 
FROM EMPLOYEES e2;

SELECT FIRST_NAME ���� , email �̸���, LENGTH (EMAIL) "�̸��� ����"
FROM EMPLOYEES e;

--23) �μ��ڵ尡 100���� ������� �̸����� �̸���@korea.com ���·� ���
SELECT CONCAT(EMAIL, '@korea.com') �̸��� FROM EMPLOYEES e
WHERE DEPARTMENT_ID = 100;

--24) ���� th�� ���Ե� ������� �޿��� �޿�����ڸ��� 10�ڸ��� ������ �� ������ ������ '*'�� ä�� ����� �Բ� ���
SELECT CONCAT(FIRST_NAME, LAST_NAME) AS ����, LPAD(salary,10,'*') AS �޿� FROM EMPLOYEES e
WHERE CONCAT(FIRST_NAME, LAST_NAME) LIKE '%th%'

--25) �̸��� �� ���ڸ��� '**'���� ��ȯ�Ͽ� ��ȸ�Ͻÿ�(replace, substr)
SELECT first_name, SUBSTR(first_name, 1, 2) FROM EMPLOYEES;
SELECT first_name, REPLACE(first_name, 'd', '*****') FROM EMPLOYEES;
SELECT first_name, REPLACE(first_name, SUBSTR(first_name, 1, 2), '**') FROM EMPLOYEES;
 
--26) ����ó�� ��4�ڸ��� ��� '****'���� �ٲپ� ����, �̸��ϰ� �Բ� ��ȸ.
SELECT phone_number AS ����ó, REPLACE(phone_number, SUBSTR(phone_number, -4, 4), '****') AS �����ȿ���ó FROM EMPLOYEES;

SELECT first_name ����, email �̸���, REPLACE(phone_number, SUBSTR(phone_number, -4), '****') ����ó FROM EMPLOYEES;

SELECT FIRST_name ����, email �̸���, SUBSTR(PHONE_NUMBER, 1, LENGTH(PHONE_NUMBER)-4)||LPAD('****', 4, '****') ����ó FROM EMPLOYEES;

--27) ������� �޿�, ���ʽ�(�޿��� 300%), �Ѿ�(�޿�+���ʽ�)�� ����Ͻÿ�.(��, �Ѿ��� �Ҽ������ϴ� ����)
SELECT FIRST_NAME ����, salary �޿�, salary*3 ���ʽ�, CEIL((salary+salary*3)/100)*100 �Ѿ� FROM EMPLOYEES e

--28) ������� �޿�, ����(�޿��� 10%), ���޾�(�޿�-����)�� ����Ͻÿ�.(��, ���޾��� �Ҽ������ϴ� ����)
SELECT CONCAT(first_name, LAST_NAME) ����, salary �޿�, salary*0.1 ����, salary+salary*0.1 ���޾� FROM EMPLOYEES e

--29) ������ ��ƿ� �������� ���
SELECT CEIL(MONTHS_BETWEEN(sysdate, '1992-09-08')) FROM DUAL;

-- ����� ǥ��
SELECT FIRST_NAME, hire_date �Ի���, TO_CHAR(hire_date, 'MM') �Ի�� FROM EMPLOYEES e2;

-- 30) 3���� �Ի��� ������ �̸�, �Ի����� ��ȸ
SELECT FIRST_NAME, hire_date FROM EMPLOYEES e2 
WHERE to_char(HIRE_DATE, 'MM') = '03';

-- 31) 5���� �Ի��� ������ �̸�, �Ի���, �޿� ���(�޿����� õ���� ��ȣ ��� ��ȸ)
SELECT First_name, hire_date, to_char(salary, '999,999,999,999.999999999999') �޿� FROM EMPLOYEES e 
WHERE to_char(HIRE_DATE, 'MM') = 05;

-- 32) �Ի�⵵ 2007�� 3�� ���Ŀ� �Ի��� ������ ����, �޿�, ���ʽ�(�޿�*commission_pct)�� ����ϵ�, commision_pct�� ���� ������ ���ʽ��� 0���� ó��
SELECT first_name, HIRE_DATE, nvl((salary*commission_pct), 0) bonus FROM EMPLOYEES e 
where to_char(hire_date, 'rrrr-mm') > '2007-03';

-- 33) �μ��ڵ尡 100�̸� �μ��� �������� '����μ�' �ٿ��� ������ �Բ� ���
SELECT FIRST_NAME, department_id || decode(DEPARTMENT_ID, '100', '(����μ�)') FROM EMPLOYEES e2

-- 34) �����, �޿�, , �μ��ڵ�, ���ʽ�(�޿��� 50%) ����ϵ�, �μ� �ڵ尡 100�̸� ���ʽ��� �޿��� 50%�� �ƴϸ� �޿��� 10%�� �����ϵ��� ��ȸ
SELECT first_name, salary, DEPARTMENT_ID, decode(DEPARTMENT_ID , '100', SALARY*.5, salary*.1) bonus FROM EMPLOYEES e2;
	
-- 35) �����, �޿��� ����ϵ� �޿��� 15000�� �̻��̸�, (��׿�����) ��� / 5000�� �̸��̸�, (���ҵ� ���) ���
SELECT first_name, salary,
		CASE
			WHEN	salary	>=	15000	THEN '(��׿�����)'
			WHEN	SALARY	<	5000	THEN '(���ҵ� ���)'
			ELSE '��ձ޿�'
		END �޿�����
	FROM EMPLOYEES e2;

-- locations ���̺��� ����Ͽ� ������ �ذ��ϼ���.
-- 36) �����ȣ�� �����ڰ� ����ִ� ������ ��ȸ�Ͻÿ�.
SELECT postal_code FROM LOCATIONS l
WHERE REGEXP_LIKE(POSTAL_CODE, '[a-zA-Z]');

-- 37) �����ȣ�� �����ڷ� �����ϴ� ���� ��ȸ
SELECT * FROM LOCATIONS l
WHERE REGEXP_LIKE(POSTAL_CODE, '^[a-zA-Z]');

-- 39) ���� ��ü �������� ��ȸ
SELECT COUNT(EMPLOYEE_ID) FROM EMPLOYEES e2;

-- 40) 3���� �Ի��� ������ ��ȸ
SELECT COUNT(employee_id) FROM EMPLOYEES e2 WHERE to_char(hire_date, 'mm') = '03';

-- 41) �������� �޿��հ踦 ��ȸ
SELECT avg(SALARY) ���, sum(salary) FROM EMPLOYEES e;

-- 42) �μ��ڵ尡 80�� �̰ų� �Ի���� 04���� �������� ��ձ޿���? // ���� : floor, ���� : ceil
SELECT ROUND(AVG(SALARY)) FROM EMPLOYEES e2
WHERE TO_CHAR(HIRE_DATE, 'mm') = '04' OR DEPARTMENT_ID = 80;

-- group by --
-- 43) �μ��� �ο����� ���?
SELECT DEPARTMENT_ID, COUNT(employee_id) FROM EMPLOYEES e2
GROUP BY DEPARTMENT_ID 

SELECT DEPARTMENT_ID, COUNT(*) employee_id FROM EMPLOYEES e2
GROUP BY DEPARTMENT_ID 

-- 44) �Ի�⵵�� �ο����� ���?
SELECT to_char(HIRE_DATE, 'rrrr'), COUNT(EMPLOYEE_ID) cnt FROM EMPLOYEES e2
GROUP BY to_char(HIRE_DATE, 'rrrr')
ORDER BY cnt DESC;

-- 45) �μ��� �޿��հ�
SELECT DEPARTMENT_ID, sum(salary) hap FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;
ORDER BY hap DESC;

SELECT * FROM DEPARTMENTS d2 WHERE DEPARTMENT_ID = 10;

-- 46) ������(job_id) �ο����� ��� �޿��� ����Ͻÿ�.
SELECT COUNT(JOB_ID), AVG(SALARY) FROM EMPLOYEES e 
GROUP BY JOB_ID;

-- 47) �μ��ڵ尡 80���� �������� ������ �ο�����
SELECT  COUNT(job_id) cnt, job_id FROM EMPLOYEES e2 
WHERE DEPARTMENT_ID = '80'
GROUP BY JOB_ID;

-- 48) ������ �ο���
SELECT job_id, COUNT(job_id) FROM EMPLOYEES e 
GROUP BY JOB_ID;

-- 49) ������ �ο����� �ο��� 5���� ū ���� ��ȸ
SELECT job_id, COUNT(job_id) FROM EMPLOYEES e2 
GROUP BY JOB_ID
HAVING COUNT(JOB_ID) > 5;

-- 50) �μ���, ������ �ο��� ��ȸ
SELECT department_id, count(EMPLOYEE_ID) FROM EMPLOYEES e2 
GROUP BY DEPARTMENT_ID;

SELECT job_id, COUNT(employee_id) FROM EMPLOYEES e2
GROUP BY JOB_ID;

SELECT department_id, job_id, COUNT(employee_id) FROM EMPLOYEES e2
GROUP BY GROUPING sets(DEPARTMENT_ID, JOB_ID)
ORDER BY department_id;

SELECT department_id, job_id, COUNT(employee_id) FROM EMPLOYEES e2
GROUP BY GROUPING sets(DEPARTMENT_ID, JOB_ID)
ORDER BY JOB_ID;

-- join --
-- 51) Lex�� �μ�����?
SELECT * FROM EMPLOYEES e
WHERE FIRST_NAME = 'Lex';
SELECT * FROM EMPLOYEES e
WHERE DEPARTMENT_ID = '90';

-- oracle join --
SELECT department_name FROM EMPLOYEES e, DEPARTMENTS d
WHERE	e.DEPARTMENT_ID = d.DEPARTMENT_ID
AND		FIRST_NAME = 'Lex';

-- ANSI join --
SELECT department_name FROM EMPLOYEES e2 JOIN DEPARTMENTS d 
ON e2.department_id = d.DEPARTMENT_ID 
WHERE FIRST_NAME = 'Lex';

-- 52) ����� 112�� ������ �̸�, �޿�, �μ��ڵ�, �μ����� ��ȸ
SELECT first_name, salary, e.department_id, DEPARTMENT_name FROM EMPLOYEES e, DEPARTMENTS d
WHERE e.department_id = d.DEPARTMENT_ID
AND DEPARTMENT_ID = '112';

-- 53) �μ����� IT�� �������� �̸�, �̸���, �μ��ڵ� ��ȸ
SELECT first_name, EMAIL, e.DEPARTMENT_ID 
FROM EMPLOYEES e, DEPARTMENTS d
WHERE e.department_id = d.DEPARTMENT_ID 
AND DEPARTMENT_name = 'IT';

-- 54) �μ����� Sales�� �μ��� �޿� �հ� ��ȸ
SELECT first_name, EMAIL, d.DEPARTMENT_ID FROM EMPLOYEES e, DEPARTMENTS d
WHERE e.department_id = d.DEPARTMENT_ID 
AND DEPARTMENT_NAME = 'Sales';

SELECT sum(E.salary)
FROM EMPLOYEES e JOIN DEPARTMENTS d ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
WHERE d.DEPARTMENT_NAME = 'Sales';

-- 55) �μ����� Finance�� �μ��� �Ŵ��� �̸���?
SELECT d.department_name �μ���, first_name �̸� 
FROM EMPLOYEES e JOIN DEPARTMENTS d
ON e.EMPLOYEE_ID = d.MANAGER_ID
WHERE d.department_name = 'Finance';

-- outer, join, eqiv, join ����
SELECT count(*) FROM EMPLOYEES e JOIN DEPARTMENTS d
ON e.DEPARTMENT_ID = d.DEPARTMENT_ID ;

-- ���� ������ �μ��� ���� ������ ī���õ��� ����
SELECT count(*) FROM EMPLOYEES e2 LEFT OUTER JOIN DEPARTMENTS d2
ON e2.DEPARTMENT_ID = d2.DEPARTMENT_ID ;

-- 56) departments ���̺��� �������� �μ��ڵ�, �μ���, �����̸��� ��ȸ
-- 56.1) join
SELECT d.department_id, d.department_name, e.first_name 
FROM DEPARTMENTS d JOIN EMPLOYEES e
ON d.DEPARTMENT_ID = e.department_id

-- 56.2) left outer join
SELECT d.department_id, d.department_name, e.first_name 
FROM DEPARTMENTS d LEFT OUTER JOIN EMPLOYEES e
ON d.DEPARTMENT_ID = e.department_id

SELECT employee_id, manager_id FROM EMPLOYEES e;

-- 57) Sigal ����� �Ŵ��� �̸���?
SELECT manager_id FROM EMPLOYEES e WHERE FIRST_NAME = 'Sigal'
SELECT first_name FROM EMPLOYEES e WHERE EMPLOYEE_ID = 114

SELECT m.first_name FROM EMPLOYEES e JOIN EMPLOYEES M 
ON e.MANAGER_ID = m.EMPLOYEE_ID 
WHERE e.FIRST_NAME = 'Sigal';

-- 58) �Ŵ��� �̸��� John Russel�� �����ϴ� �������� ���, �̸�, �޿� ��ȸ
SELECT m.employee_id FROM EMPLOYEES m
WHERE m.FIRST_NAME = 'John'
AND m.last_name = 'Russel';

SELECT e.employee_id, e.first_name, e.salary FROM EMPLOYEES e
WHERE e.MANAGER_ID = '145';

SELECT e.employee_id, e.FIRST_name, e.salary 
FROM EMPLOYEES e
JOIN EMPLOYEES m 
ON e.MANAGER_ID = m.EMPLOYEE_ID 
WHERE m.FIRST_NAME = 'john' AND m.LAST_NAME = 'Russel';

-- 59) Luis�� ������ �Ի��� �������� �̸��� �̸����� ��ȸ
SELECT to_char(e.hire_date,'yyyy') �Ի�⵵, e.first_name ������, e.email �̸���
FROM EMPLOYEES e JOIN EMPLOYEES m 
ON to_char(e.hire_date,'yyyy') = to_char(m.hire_date,'yyyy')
WHERE m.first_name = 'Luis';

-- 60) David Austiin�� ���� �μ� ������� �̸�, ����ó�� ��ȸ
SELECT e.department_id �μ��ڵ�, e.first_name ������, e.phone_number ����ó 
FROM EMPLOYEES e JOIN EMPLOYEES m
ON e.department_id= m.DEPARTMENT_ID
WHERE m.first_name = 'David' AND m.last_name = 'Austin';

SELECT department_id FROM EMPLOYEES e2 --���� ���� ���̺�
WHERE FIRST_NAME = 'David' AND LAST_NAME = 'Austin';

SELECT FIRST_NAME, phone_number FROM EMPLOYEES e2 --�������� ���̺�
WHERE DEPARTMENT_ID = 60;

SELECT e.first_name, e.phone_number
FROM EMPLOYEES e JOIN EMPLOYEES e2
ON e.department_id = e2.DEPARTMENT_ID
WHERE e2.FIRST_NAME = 'David' AND eva2.LAST_NAME = 'Austin';

-- DDL(create, truncate, drop, alter)
-- 61) table ����
CREATE TABLE student (
	id varchar(20), 
	irum varchar(30), 
	phone varchar(50),
	adresss varchar(100),
	email varchar(50)
);

-- 62) student ���̺� ���� ����(������+����)
DROP TABLE student;

-- 63) ������ ���̺� student�� �ٽ� ������ �� ��ȣ, �г� �÷��� alter����� ����� �߰�
ALTER TABLE student add(pwd varchar(20));
ALTER TABLE student add(grade NUMBER(2));

-- 64) student ���̺� score(number) �ķ��� �߰����� �ٽ� scroe �÷��� ����
ALTER TABLE student add(score NUMBER(3));
ALTER TABLE student DROP COLUMN score;

-- 65) student ���̺��� id �÷����� mid�� ����
ALTER TABLE student RENAME COLUMN id TO mid;

-- 66) student ���̺��� phone �ķ��� ũ�⸦ 30���� ����
ALTER TABLE student MODIFY(phone varchar(30));

-- 67) score(serial)
CREATE TABLE score (
	serial NUMBER(10),
	mid varchar(20),
	subject varchar(30),
	score number(4)
	);

-- 68) ������ �����͸� score�� �Է��� �� TRUNCATE ����� ����Ͽ� �����͸� ����.
INSERT INTO score(SERIAL, MID, SUBJECT, SCORE)
values(100, 'hong', '����', 100);

COMMIT; -- INSERT, UPDATE, DELETE ����� Ȯ������ ���.(rollback : ���)

SELECT * FROM score;

TRUNCATE TABLE score;

SELECT * FROM score;

-- DML(insert, update, delete, merge)
-- 1) INSERT INTO ���̺��(�÷���1, �÷���2, ...) values(��1, ��2, ...);
-- 2) INSERT INTO ���̺�� values(��1, ��2, ...);
-- ��� �÷��� ������� ���� ��� �Է��Ҷ��� ���̺�� �ڿ� �ִ� �÷����� ���� ����
-- 3) INSERT INTO ���̺�� SELECT�� ���
-- 4) ���� ���̺� ���ÿ� ���� ���� �Է��Ҷ�
--		insert all 
--			INTO ���̺��1 VALUES(�÷���1, �÷���2, ...)
--			INTO ���̺��2 VALUES(�÷���1, �÷���2, ...)
--			SELECT ��

-- 69) score ���̺� hong, kim ���� ���� �Է�
-- (1, hong, ����, 90)
-- (2, kim, ����, 80)
INSERT INTO score(SERIAL, MID, SUBJECT, SCORE) values(1, 'hong', '����', 90);
INSERT INTO score(SERIAL, SCORE, MID, SUBJECT) values(2, 80, 'kim', '����');

-- 70) �÷����� ���� �Ʒ��� ���� �Է�
-- (3, park, ����, 80)
INSERT INTO score values(3, 'park', '����', 80);

SELECT * FROM score;

-- 71) score ���̺��� ���� ��� tempScore ���̺� ����
CREATE TABLE tempScore AS SELECT * FROM score WHERE 1=2;

-- 72) score ���̺��� ��� �����͸� tempScore�� ����
INSERT INTO tempScore SELECT * FROM score;
SELECT * form tempScore;

-- 73) score ���̺��� �ڷ� �� ���������� �ش� �ڷḸ tempScore�� ����
INSERT INTO tempScore
SELECT * FROM score WHERE SUBJECT = '����';

SELECT * FROM tempScore;

-- 74) score ���̺� ���� ���, imsiScore ���̺� ���� ��, insert all ���
-- 		���̺��� ��� ������ tempScore, imsiScore ���̺� ����
CREATE TABLE imsiScore AS SELECT * FROM score WHERE 1=2;
INSERT ALL
	INTO tempScore VALUES(serial, mid, subject, score)
	INTO imsiScore VALUES(serial, mid, subject, score)
SELECT * FROM score;

SELECT * FROM tempScore;
SELECT * FROM imsiScore;

-- update ���̺�� set �÷���1 = ������1, �÷���2 = ������2, ... where ����
-- update ���̺�� set �÷���1 = ������1, �÷���2 = ������2, ... where �÷��� = (sub query)

-- 75) hong�� ���� ������ 100���� ����
UPDATE score SET score = 100
WHERE mid = 'hong' AND subject = '����';

-- 76) park�� ������ ���п��� ����� ����
UPDATE score SET SUBJECT = '����'
WHERE mid = 'park';
SELECT * FROM score;

-- delete from ���̺�� where ����
-- 77) tempScore �ڷ� �� hong ���� ���� ��� ����
DELETE FROM tempScore WHERE mid = 'hong' AND subject = '����';
SELECT * FROM tempScore;

-- 78) imsiScore ��� �ڷ� ����
SELECT * FROM imsiScore;
DELETE FROM imsiScore;
SELECT * FROM imsiScore;

-- TCL(commit, rollback)
-- DBeaver�� commit �ɼ��� Auto => Mannual type ����
-- SQL PLUS ��� hr ������ �α���

-- 79) tempScore ������ ��� ����
SELECT * FROM tempScore;
DELETE FROM tempScore;
SELECT * FROM tempScore;
ROLLBACK;
SELECT * FROM tempScore;

DELETE FROM tempScore;
COMMIT;

-- 80) �������� 5���� ���̺� ������ ����
CREATE TABLE constTest(
	NO NUMBER(4),
	name varchar(20)
		CONSTRAINT constTest_name_nn NOT NULL,
	jumin varchar2(13)
		CONSTRAINT constTest_jumin_nn NOT NULL,
	loc_code number(1),
	deptno number(6),
	
		CONSTRAINT constTest_no_pk PRIMARY KEY,
		CONSTRAINT constTest_deptno_fk REFERENCES departments(department_id),
		CONSTRAINT constTest_jumin_uk UNIQUE,
		CONSTRAINT constTest_loc_ck CHECK (loc_code < 5)
		
		);
	
CREATE TABLE constTest2(
	NUM NUMBER(4),
	name varchar(20)
		CONSTRAINT constTest_name_nn NOT NULL,
	jumin varchar2(13)
		CONSTRAINT constTest_jumin_nn NOT NULL,
	loc_code number(1),
	deptno number(6),
	
		CONSTRAINT constTest2_no_pk		PRIMARY KEY(num),
		CONSTRAINT constTest2_deptno_fk	FOREIGN KEY(deptno) REFERENCES departments(department_id),
		CONSTRAINT constTest2_jumin_uk	UNIQUE(jumin),
		CONSTRAINT constTest2_loc_ck	CHECK (loc_code < 5)
		
		);

INSERT INTO constTest VALUES(1, 'hong', '901212', 1, 100);
SELECT * FROM constTest;
COMMIT;

-- 81) no�÷��� �ߺ��� ���� �Է�, primary Ű �Ӽ� test
INSERT INTO constTest VALUES(1, 'hong', '901212', 1, 100);

-- 82) no�÷��� null ����, primary Ű �Ӽ� test
INSERT INTO constTest(name, jumin, loc_code, deptno) values('kim', '990101', 1, 100);

-- 83) jumin ��ȣ�� �ߺ� �Է�, unique �Ӽ� test
INSERT INTO constTest VALUES(2, 'kim', '901213', 2, 100);
SELECT * FROM constTest;

-- 84) loc_code�� 8�� �Է�, check �Ӽ� ���� �� test
INSERT INTO constTest VALUES(3, 'kim', '901213', 8, 100);

-- 85) departments ���̺� department_id ���� �� �Է�, foreign key �Ӽ� test
INSERT INTO constTest VALUES(3, 'kim', '901214', 2, 999);

-- constTest ���̺� ������ ���� ���� ����
SELECT * FROM USER_CONSTRAINTS WHERE table_name = upper('constraint');

ALTER TABLE constTest DROP CONSTRAINT constTest_no_pk;
ALTER TABLE constTest DROP CONSTRAINT constTest_jumin_uk;
ALTER TABLE constTest DROP CONSTRAINT constTest_loc_ck;
ALTER TABLE constTest DROP CONSTRAINT constTest_deptno_fk;

-- ���̺� ���� �� alter table ��� ���� ���� ����
-- pk, fk, uk, ck ��� ���� ���
ALTER TABLE constTest ADD CONSTRAINT constTest_no_pk PRIMARY key(no);

-- null�� not null�� modify�� ����
ALTER TABLE constTest MODIFY jumin NULL;
ALTER TABLE constTest MODIFY jumin NOT NULL;

-- 86) view : ����, ����ó, �̸���, �Ŵ����̸�, �μ��ڵ�, �μ��� ��ȸ
CREATE OR REPLACE VIEW emp_view AS 
	SELECT	e.first_name ����, e.phone_number ����ó, e.email �̸���, m.first_name �Ŵ����̸�,
			e.department_id �μ��ڵ�, d.department_name �μ���
	FROM EMPLOYEES e JOIN EMPLOYEES m
	ON e.MANAGER_ID = m.EMPLOYEE_ID 
	JOIN DEPARTMENTS d
	ON e.DEPARTMENT_ID = d.DEPARTMENT_ID;

SELECT * FROM emp_view;
SELECT * FROM emp_view WHERE ���� = 'Lisa';
SELECT * FROM emp_view WHERE �Ŵ����̸� = 'Nancy';

-- Subquery
-- 87) �μ����� Sales�� �������� ���
-- a) JOIN
SELECT e2.* FROM EMPLOYEES e2 JOIN DEPARTMENTS d
ON e2.DEPARTMENT_ID = d.DEPARTMENT_ID
WHERE d.department_name = 'Sales';
-- b) SUBQUERY
SELECT * FROM EMPLOYEES e
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID FROM DEPARTMENTS d2 
WHERE DEPARTMENT_NAME = 'Sales');

-- 88) job_title�� Programmer�� �������� �̸��� ����ó ��ȸ(employees, jobs)
-- a) JOIN
SELECT e.FIRST_NAME �̸�, e.PHONE_NUMBER ����ó 
FROM SYSTEM.EMPLOYEES e JOIN SYSTEM.JOBS j
ON e.JOB_ID = j.JOB_ID
WHERE j.job_tile = 'Programmer';
-- b) SUBQUERY
SELECT FIRST_NAME, PHONE_NUMBER FROM hr.EMPLOYEES
WHERE JOB_ID = (SELECT job_id FROM hr.jobs 
WHERE JOB_TITLE = 'Programmer');

-- 89) city�� London�� �μ��� �̸� ��ȸ(departments, locations)
-- a) JOIN
SELECT d.department_name FROM LOCATIONS e2 JOIN DEPARTMENTS d
ON e2.LOCATION_ID = d.LOCATION_ID 
WHERE e2.city_name = 'Lodon';
-- b) SUBQUERY
SELECT DEPARTMENT_NAME FROM DEPARTMENTS d3
WHERE LOCATION_ID = (SELECT LOCATION_ID FROM LOCATIONS l2 
WHERE city = 'Lodon');

-- 90) department_name�� IT�� �μ��� �����ȣ(departments, locations)
-- a) JOIN
SELECT e2.POSTAL_CODE FROM locations e2 JOIN DEPARTMENTS d
ON e2.LOCATION_ID = d.LOCATION_ID 
WHERE d.DEPARTMENT_NAME = 'IT';
-- b) SUBQUERY
SELECT POSTAL_CODE FROM locations l
WHERE LOCATION_ID = (SELECT LOCATION_ID FROM DEPARTMENTS d2 
WHERE DEPARTMENT_NAME = 'IT');

-- 91) David�� �μ���(departmaents, employees)
-- a) JOIN
SELECT d2.DEPARTMENT_NAME, e.FIRST_NAME || ' ' || e.last_name 
FROM DEPARTMENTS d2 JOIN EMPLOYEES e2 
ON d2.DEPARTMENT_ID = e2.DEPARTMENT_ID
WHERE e2.FIRST_NAME = 'David';
-- b) SUBQUERY
SELECT d2.FIRST_NAME FROM EMPLOYEES e
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID FROM DEPARTMENTS d2 
WHERE FIRST_NAME = 'David');

-- 92) Adam Fripp�� ������(job_title)�� (employees, jobs)
-- a) JOIN
SELECT j.JOB_TITLE FROM EMPLOYEES e2 JOIN JOBS j 
ON e2.JOB_ID = j.JOB_ID 
WHERE CONCAT(e2.FIRST_NAME, e2.LAST_NAME) = 'AdamFripp';
-- b) SUBQUERY
SELECT JOB_TITLE FROM hr.JOBS j2 
WHERE JOB_ID = (SELECT JOB_ID FROM hr.EMPLOYEES
WHERE FIRST_NAME = 'Adam' AND LAST_NAME = 'Fripp');

COMMIT;

-- 93) �μ� ���̵� 30���� �μ� �������� �޿����� ���� �޿��� �޴� ������ �̸��� �޿� ��ȸ (<ANY, <ALL)
SELECT first_name, salary FROM EMPLOYEES e
WHERE SALARY < (SELECT min(SALARY) FROM EMPLOYEES e2 
WHERE DEPARTMENT_ID = 30);

SELECT first_name, salary FROM EMPLOYEES e
WHERE SALARY < all (SELECT SALARY FROM EMPLOYEES e2 
WHERE DEPARTMENT_ID = 30);

-- 94) 2007�⵵�� �Ի��� �������� �ִ�޿����� �޿��� ���� �޴� �������� �̸�, �޿� ��ȸ (>ANY, >ALL)
SELECT first_name, salary FROM EMPLOYEES e
WHERE SALARY > (SELECT max(SALARY) FROM EMPLOYEES e2 
WHERE to_char(HIRE_DATE, 'rrrr') = '2007');

-- sequence
-- ������ �߻� : ��������.nextval
-- ���� ������ ��ȸ : ��������.currcal
-- ���� : �ߺ����� �ʴ� ��ȣ �߻� select ���� ���� ���忡�� �Ѱ��� �����͸� �������� ���� ���.
-- 95) �⺻�� ���
CREATE SEQUENCE seq_score;

-- 96) ������ ������ �߻�
SELECT seq_score.nextval FROM dual;

-- 97) ���� ������ ���� ��ȸ
SELECT seq_score.currval FROM dual;

-- 98) score ���̺� ������ �Է��� �� serial �÷��� ������ ����
ALTER TABLE score disable CONSTRAINT score_mid_fk;

INSERT INTO score(serial, mid, subject, score)
VALUES(seq_score.nextval, 'kim', '����', 100);

SELECT * FROM score;

-- ������ ����
	SELECT rownum, LEVEL, employee_id, lpad(' ', LEVEL * 3, ' ') || first_name, manager_id 
	FROM EMPLOYEES e
	START WITH manager_id IS NULL
	CONNECT BY PRIOR employee_id = MANAGER_ID
	ORDER siblings BY MANAGER_ID

-- ������ ������ ����¡ ó��
	SELECT * FROM (
		SELECT rownum rn, a.* from
			(SELECT rownum, LEVEL, employee_id, lpad(' ', LEVEL * 3, ' ') || first_name, manager_id 
			FROM EMPLOYEES e
			START WITH manager_id IS NULL
			CONNECT BY PRIOR employee_id = MANAGER_ID
			ORDER siblings BY MANAGER_ID) a
	) WHERE rn BETWEEN 6 AND 10;

