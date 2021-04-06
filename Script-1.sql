SELECT * FROM EMPLOYEES e ;
SELECT first_name FROM employees;
--1) 모든 사원명과 이메일주소만 조회
SELECT first_name, email FROM EMPLOYEES;
--2) 모든 부서의 부서명과 매니저 아이디만 조회
SELECT first_department, manager_id FROM DEPARTMENTS d;

--3) 컬럼명의 별칭 사용하기
SELECT 10 + 10 FROM dual;
SELECT 10+10 hap FROM dual;

--4) 사원 테이블에서 부서코드(department_id)를 중복없이 조회
SELECT depatment_id FROM EMPLOYEES e;
