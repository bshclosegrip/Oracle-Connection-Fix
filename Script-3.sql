SELECT * FROM EMPLOYEES e;
SELECT first_name FROM employees;
--1) 모든 사원명과 이메일주소만 조회
SELECT first_name, email FROM EMPLOYEES;
--2) 모든 부서의 부서명과 매니저 아이디만 조회
SELECT department_id, manager_id FROM DEPARTMENTS d;

--3) 컬럼명의 별칭 사용하기
SELECT 10 + 10 FROM dual;
SELECT 10+10 hap FROM dual;

--4) 사원 테이블에서 부서코드(department_id)를 중복없이 조회
SELECT DISTINCT department_id, EMPLOYEE_ID FROM EMPLOYEES e;

--5) 사원 테이블의 정보를 아래와 같이 출력하시오.
--   XXX 사원의 부서명은 XXX 입니다.
SELECT EMPLOYEE_ID || '사원의 부서코드는' || DEPARTMENT_ID || '입니다.'
FROM EMPLOYEES;

--6) 급여가 10000원 이상인 직원의 이름과 급여를 조회
SELECT first_name, salary FROM employees
WHERE salary >= 10000

--7) 급여가 10000원 이상이거나 4000이하인 직원의 이름, 급여, 이메일을 조회
SELECT first_name, salary, email FROM employees
WHERE salary >= 10000 OR salary <= 4000;

--8) 부서코드가 100번 이거나 급여가 10000원 이상인 직원의
-- 부서코드, 이름, 급여 조회
SELECT DEPARTMENT_ID, first_name, salary FROM EMPLOYEES
WHERE salary >= 10000 OR DEPARTMENT_ID = 100;

--9) 급여가 5000이상이고 7000이하인 직원의 성명, 급여를 출력(between)
-- salary >= 5000 and salary <= 7000
SELECT first_name, SALARY FROM EMPLOYEES
WHERE SALARY BETWEEN 5000 AND 7000;

--10) 부서아이디가 80 또는 90 또는 100인 직원의 이름, 이메일, 부서아이디를 조회
-- d = 80 or d = 90 or d = 100
-- in(80, 90, 100)
SELECT first_name, email, department_id FROM EMPLOYEES e 
WHERE DEPARTMENT_ID IN(80, 90, 100);

--11) 이름이 S로 시작하는 직원들의 아이디, 성명을 조회
SELECT employee_id, first_name FROM EMPLOYEES e 
WHERE FIRST_NAME LIKE 'S%'

--12) 이름에 s가 포함된 직원의 아이디, 성명 조회
SELECT employee_id, first_name FROM EMPLOYEES e 
WHERE FIRST_NAME LIKE '%s%'

--13) commission_pct가 있는 직원의 이름과 commision_pct를 조회(is null, is not null)
SELECT first_name, commission_pct FROM EMPLOYEES e 
WHERE COMMISSION_PCT IS NOT NULL;
SELECT first_name, commission_pct FROM EMPLOYEES e 
WHERE COMMISSION_PCT IS NULL;

--14) commission이 있는 직원은 성명, 급여, 보너스(급여 * commission_pct)를
--	아래와 같이 조회
--	성명		급여		보너스
--	XXX		XXXX	XXXX
SELECT first_name 성명, commission_pct 급여, salary*commission_pct AS Bonus FROM EMPLOYEES e 
WHERE COMMISSION_PCT IS NOT NULL;

--15) 급여가 10000원 이상인 직원의 이름, 급여를 급여순으로 조회
SELECT FIRST_NAME, SALARY FROM EMPLOYEES e 
WHERE SALARY >= 10000 ORDER BY SALARY DESC;

--16) 15번 문제에서 동일한 급여인 경우 이름순으로 정렬
SELECT FIRst_Name 성명, Salary 봉급 FROM  EMPLOYEES e 
WHERE SALARY >= 10000 ORDER BY SALARY ASC, FIRST_NAME ASC;

--16) 15번 문제에서 동일한 급여인 경우 이름순으로 정렬-2
SELECT FIRst_Name 성명, Salary 봉급 FROM  EMPLOYEES e 
WHERE SALARY >= 10000 ORDER BY SALARY, FIRST_NAME;

-- 집합 연산자를 연습하기 위한 테이블 생성 --
CREATE TABLE emp AS SELECT * FROM EMPLOYEES WHERE SALARY > 8000;
SELECT * FROM emp;

----테이블 삭제
DROP TABLE emp;

--17) employees 테이블과 emp 테이블의 내용을 union으로 병합
SELECT employee_id, first_name, salary FROM EMPLOYEES
UNION 
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY FROM EMP;

--18) employees 테이블과 emp 테이블의 내용을 중복허용하여 union all으로 병합
SELECT employee_id, first_name, salary FROM EMPLOYEES
UNION ALL
SELECT EMPLOYEE_ID, FIRST_NAME, SALARY FROM emp;

--19) employees, emp 테이블에 중복된 자료를 조회
SELECT * FROM EMPLOYEES e2
INTERSECT
SELECT * FROM emp;

--20) 차집합 조회
SELECT * FROM EMPLOYEES e2
MINUS 
SELECT * FROM emp;

--21) first_name은 모두 대문자로, last_name은 모두 소문자로 출력
SELECT upper(FIRST_NAME), lower(LAST_NAME) FROM EMPLOYEES e;

--22) email 주소의 길이를 성명, 이메일, 이메일 길이로 출력
SELECT CONCAT(FIRST_NAME, LAST_NAME) AS 성명, email, LENGTH(email) AS 이메일길이 
FROM EMPLOYEES e2;

SELECT FIRST_NAME 성명 , email 이메일, LENGTH (EMAIL) "이메일 길이"
FROM EMPLOYEES e;

--23) 부서코드가 100번인 사원들의 이메일을 이메일@korea.com 형태로 출력
SELECT CONCAT(EMAIL, '@korea.com') 이메일 FROM EMPLOYEES e
WHERE DEPARTMENT_ID = 100;

--24) 성명에 th가 포함된 사원들의 급여의 급여출력자리는 10자리로 지정한 뒤 나머지 공간은 '*'로 채워 성명과 함께 출력
SELECT CONCAT(FIRST_NAME, LAST_NAME) AS 성명, LPAD(salary,10,'*') AS 급여 FROM EMPLOYEES e
WHERE CONCAT(FIRST_NAME, LAST_NAME) LIKE '%th%'

--25) 이름의 앞 두자리는 '**'으로 변환하여 조회하시오(replace, substr)
SELECT first_name, SUBSTR(first_name, 1, 2) FROM EMPLOYEES;
SELECT first_name, REPLACE(first_name, 'd', '*****') FROM EMPLOYEES;
SELECT first_name, REPLACE(first_name, SUBSTR(first_name, 1, 2), '**') FROM EMPLOYEES;
 
--26) 연락처의 뒷4자리를 모두 '****'으로 바꾸어 성명, 이메일과 함께 조회.
SELECT phone_number AS 연락처, REPLACE(phone_number, SUBSTR(phone_number, -4, 4), '****') AS 수정된연락처 FROM EMPLOYEES;

SELECT first_name 성명, email 이메일, REPLACE(phone_number, SUBSTR(phone_number, -4), '****') 연락처 FROM EMPLOYEES;

SELECT FIRST_name 성명, email 이메일, SUBSTR(PHONE_NUMBER, 1, LENGTH(PHONE_NUMBER)-4)||LPAD('****', 4, '****') 연락처 FROM EMPLOYEES;

--27) 사원들의 급여, 보너스(급여의 300%), 총액(급여+보너스)를 출력하시오.(단, 총액은 소숫점이하는 절삭)
SELECT FIRST_NAME 성명, salary 급여, salary*3 보너스, CEIL((salary+salary*3)/100)*100 총액 FROM EMPLOYEES e

--28) 사원들의 급여, 세금(급여의 10%), 지급액(급여-세금)을 출력하시오.(단, 지급액의 소숫점이하는 절삭)
SELECT CONCAT(first_name, LAST_NAME) 성명, salary 급여, salary*0.1 세금, salary+salary*0.1 지급액 FROM EMPLOYEES e

--29) 본인이 살아온 개월수를 계산
SELECT CEIL(MONTHS_BETWEEN(sysdate, '1992-09-08')) FROM DUAL;

-- 년월일 표시
SELECT FIRST_NAME, hire_date 입사일, TO_CHAR(hire_date, 'MM') 입사월 FROM EMPLOYEES e2;

-- 30) 3월에 입사한 직원의 이름, 입사일을 조회
SELECT FIRST_NAME, hire_date FROM EMPLOYEES e2 
WHERE to_char(HIRE_DATE, 'MM') = '03';

-- 31) 5월에 입사한 직원의 이름, 입사일, 급여 출력(급여에는 천단위 기호 사용 조회)
SELECT First_name, hire_date, to_char(salary, '999,999,999,999.999999999999') 급여 FROM EMPLOYEES e 
WHERE to_char(HIRE_DATE, 'MM') = 05;

-- 32) 입사년도 2007년 3월 이후에 입사한 직원의 성명, 급여, 보너스(급여*commission_pct)를 출력하되, commision_pct가 없는 직원의 보너스는 0으로 처리
SELECT first_name, HIRE_DATE, nvl((salary*commission_pct), 0) bonus FROM EMPLOYEES e 
where to_char(hire_date, 'rrrr-mm') > '2007-03';

-- 33) 부서코드가 100이면 부서명 오른쪽의 '우수부서' 붙여서 사원명과 함께 출력
SELECT FIRST_NAME, department_id || decode(DEPARTMENT_ID, '100', '(우수부서)') FROM EMPLOYEES e2

-- 34) 사원명, 급여, , 부서코드, 보너스(급여의 50%) 출력하되, 부서 코드가 100이면 보너스를 급여의 50%를 아니면 급여의 10%를 지급하도록 조회
SELECT first_name, salary, DEPARTMENT_ID, decode(DEPARTMENT_ID , '100', SALARY*.5, salary*.1) bonus FROM EMPLOYEES e2;
	
-- 35) 사원명, 급여를 출력하되 급여가 15000원 이상이면, (고액연봉자) 출력 / 5000원 미만이면, (저소득 사원) 출력
SELECT first_name, salary,
		CASE
			WHEN	salary	>=	15000	THEN '(고액연봉자)'
			WHEN	SALARY	<	5000	THEN '(저소득 사원)'
			ELSE '평균급여'
		END 급여수준
	FROM EMPLOYEES e2;

-- locations 테이블을 사용하여 문제를 해결하세요.
-- 36) 우편번호에 영문자가 들어있는 정보를 조회하시오.
SELECT postal_code FROM LOCATIONS l
WHERE REGEXP_LIKE(POSTAL_CODE, '[a-zA-Z]');

-- 37) 우편번호가 영문자로 시작하는 정보 조회
SELECT * FROM LOCATIONS l
WHERE REGEXP_LIKE(POSTAL_CODE, '^[a-zA-Z]');

-- 39) 직원 전체 연월수를 조회
SELECT COUNT(EMPLOYEE_ID) FROM EMPLOYEES e2;

-- 40) 3월에 입사한 직원수 조회
SELECT COUNT(employee_id) FROM EMPLOYEES e2 WHERE to_char(hire_date, 'mm') = '03';

-- 41) 전직원의 급여합계를 조회
SELECT avg(SALARY) 평균, sum(salary) FROM EMPLOYEES e;

-- 42) 부서코드가 80번 이거나 입사월이 04월인 직원들의 평균급여는? // 절삭 : floor, 절상 : ceil
SELECT ROUND(AVG(SALARY)) FROM EMPLOYEES e2
WHERE TO_CHAR(HIRE_DATE, 'mm') = '04' OR DEPARTMENT_ID = 80;

-- group by --
-- 43) 부서별 인원수는 몇명?
SELECT DEPARTMENT_ID, COUNT(employee_id) FROM EMPLOYEES e2
GROUP BY DEPARTMENT_ID 

SELECT DEPARTMENT_ID, COUNT(*) employee_id FROM EMPLOYEES e2
GROUP BY DEPARTMENT_ID 

-- 44) 입사년도별 인원수는 몇명?
SELECT to_char(HIRE_DATE, 'rrrr'), COUNT(EMPLOYEE_ID) cnt FROM EMPLOYEES e2
GROUP BY to_char(HIRE_DATE, 'rrrr')
ORDER BY cnt DESC;

-- 45) 부서별 급여합계
SELECT DEPARTMENT_ID, sum(salary) hap FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;
ORDER BY hap DESC;

SELECT * FROM DEPARTMENTS d2 WHERE DEPARTMENT_ID = 10;

-- 46) 직무별(job_id) 인원수와 평균 급여를 계산하시오.
SELECT COUNT(JOB_ID), AVG(SALARY) FROM EMPLOYEES e 
GROUP BY JOB_ID;

-- 47) 부서코드가 80번인 직원들중 직무별 인원수는
SELECT  COUNT(job_id) cnt, job_id FROM EMPLOYEES e2 
WHERE DEPARTMENT_ID = '80'
GROUP BY JOB_ID;

-- 48) 직무별 인원수
SELECT job_id, COUNT(job_id) FROM EMPLOYEES e 
GROUP BY JOB_ID;

-- 49) 직무별 인원수중 인원이 5명보다 큰 정보 조회
SELECT job_id, COUNT(job_id) FROM EMPLOYEES e2 
GROUP BY JOB_ID
HAVING COUNT(JOB_ID) > 5;

-- 50) 부서별, 직무별 인원수 조회
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
-- 51) Lex의 부서명은?
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

-- 52) 사번이 112인 직원의 이름, 급여, 부서코드, 부서명을 조회
SELECT first_name, salary, e.department_id, DEPARTMENT_name FROM EMPLOYEES e, DEPARTMENTS d
WHERE e.department_id = d.DEPARTMENT_ID
AND DEPARTMENT_ID = '112';

-- 53) 부서명이 IT인 직원들의 이름, 이메일, 부서코드 조회
SELECT first_name, EMAIL, e.DEPARTMENT_ID 
FROM EMPLOYEES e, DEPARTMENTS d
WHERE e.department_id = d.DEPARTMENT_ID 
AND DEPARTMENT_name = 'IT';

-- 54) 부서명이 Sales인 부서의 급여 합계 조회
SELECT first_name, EMAIL, d.DEPARTMENT_ID FROM EMPLOYEES e, DEPARTMENTS d
WHERE e.department_id = d.DEPARTMENT_ID 
AND DEPARTMENT_NAME = 'Sales';

SELECT sum(E.salary)
FROM EMPLOYEES e JOIN DEPARTMENTS d ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
WHERE d.DEPARTMENT_NAME = 'Sales';

-- 55) 부서명이 Finance인 부서의 매니저 이름은?
SELECT d.department_name 부서명, first_name 이름 
FROM EMPLOYEES e JOIN DEPARTMENTS d
ON e.EMPLOYEE_ID = d.MANAGER_ID
WHERE d.department_name = 'Finance';

-- outer, join, eqiv, join 차이
SELECT count(*) FROM EMPLOYEES e JOIN DEPARTMENTS d
ON e.DEPARTMENT_ID = d.DEPARTMENT_ID ;

-- 위의 쿼리는 부서가 없는 직원은 카운팅되지 않음
SELECT count(*) FROM EMPLOYEES e2 LEFT OUTER JOIN DEPARTMENTS d2
ON e2.DEPARTMENT_ID = d2.DEPARTMENT_ID ;

-- 56) departments 테이블을 기준으로 부서코드, 부서명, 직원이름을 조회
-- 56.1) join
SELECT d.department_id, d.department_name, e.first_name 
FROM DEPARTMENTS d JOIN EMPLOYEES e
ON d.DEPARTMENT_ID = e.department_id

-- 56.2) left outer join
SELECT d.department_id, d.department_name, e.first_name 
FROM DEPARTMENTS d LEFT OUTER JOIN EMPLOYEES e
ON d.DEPARTMENT_ID = e.department_id

SELECT employee_id, manager_id FROM EMPLOYEES e;

-- 57) Sigal 사원의 매니저 이름은?
SELECT manager_id FROM EMPLOYEES e WHERE FIRST_NAME = 'Sigal'
SELECT first_name FROM EMPLOYEES e WHERE EMPLOYEE_ID = 114

SELECT m.first_name FROM EMPLOYEES e JOIN EMPLOYEES M 
ON e.MANAGER_ID = m.EMPLOYEE_ID 
WHERE e.FIRST_NAME = 'Sigal';

-- 58) 매니저 이름이 John Russel이 관리하는 직원들의 사번, 이름, 급여 조회
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

-- 59) Luis와 같은해 입사한 직원들의 이름과 이메일을 조회
SELECT to_char(e.hire_date,'yyyy') 입사년도, e.first_name 직원명, e.email 이메일
FROM EMPLOYEES e JOIN EMPLOYEES m 
ON to_char(e.hire_date,'yyyy') = to_char(m.hire_date,'yyyy')
WHERE m.first_name = 'Luis';

-- 60) David Austiin과 같은 부서 사람들의 이름, 연락처를 조회
SELECT e.department_id 부서코드, e.first_name 직원명, e.phone_number 연락처 
FROM EMPLOYEES e JOIN EMPLOYEES m
ON e.department_id= m.DEPARTMENT_ID
WHERE m.first_name = 'David' AND m.last_name = 'Austin';

SELECT department_id FROM EMPLOYEES e2 --내가 속한 테이블
WHERE FIRST_NAME = 'David' AND LAST_NAME = 'Austin';

SELECT FIRST_NAME, phone_number FROM EMPLOYEES e2 --동료직원 테이블
WHERE DEPARTMENT_ID = 60;

SELECT e.first_name, e.phone_number
FROM EMPLOYEES e JOIN EMPLOYEES e2
ON e.department_id = e2.DEPARTMENT_ID
WHERE e2.FIRST_NAME = 'David' AND eva2.LAST_NAME = 'Austin';

-- DDL(create, truncate, drop, alter)
-- 61) table 생성
CREATE TABLE student (
	id varchar(20), 
	irum varchar(30), 
	phone varchar(50),
	adresss varchar(100),
	email varchar(50)
);

-- 62) student 테이블 완전 삭제(데이터+구조)
DROP TABLE student;

-- 63) 삭제된 테이블 student를 다시 생성한 후 암호, 학년 컬럼을 alter명령을 사용해 추가
ALTER TABLE student add(pwd varchar(20));
ALTER TABLE student add(grade NUMBER(2));

-- 64) student 테이블에 score(number) 컴럼을 추가한후 다시 scroe 컬럼을 삭제
ALTER TABLE student add(score NUMBER(3));
ALTER TABLE student DROP COLUMN score;

-- 65) student 테이블의 id 컬럼명을 mid로 수정
ALTER TABLE student RENAME COLUMN id TO mid;

-- 66) student 테이블의 phone 컴럼의 크기를 30으로 수정
ALTER TABLE student MODIFY(phone varchar(30));

-- 67) score(serial)
CREATE TABLE score (
	serial NUMBER(10),
	mid varchar(20),
	subject varchar(30),
	score number(4)
	);

-- 68) 임의의 데이터를 score에 입력한 후 TRUNCATE 명령을 사용하여 데이터만 삭제.
INSERT INTO score(SERIAL, MID, SUBJECT, SCORE)
values(100, 'hong', '영어', 100);

COMMIT; -- INSERT, UPDATE, DELETE 명령을 확정짓는 명령.(rollback : 취소)

SELECT * FROM score;

TRUNCATE TABLE score;

SELECT * FROM score;

-- DML(insert, update, delete, merge)
-- 1) INSERT INTO 테이블명(컬럼명1, 컬럼명2, ...) values(값1, 값2, ...);
-- 2) INSERT INTO 테이블명 values(값1, 값2, ...);
-- 모든 컬럼의 순서대로 값을 모두 입력할때는 테이블명 뒤에 있는 컬럼명을 생략 가능
-- 3) INSERT INTO 테이블명 SELECT절 사용
-- 4) 여러 테이블에 동시에 같은 값을 입력할때
--		insert all 
--			INTO 테이블명1 VALUES(컬럼명1, 컬럼명2, ...)
--			INTO 테이블명2 VALUES(컬럼명1, 컬럼명2, ...)
--			SELECT 절

-- 69) score 테이블에 hong, kim 성적 정보 입력
-- (1, hong, 국어, 90)
-- (2, kim, 영어, 80)
INSERT INTO score(SERIAL, MID, SUBJECT, SCORE) values(1, 'hong', '국어', 90);
INSERT INTO score(SERIAL, SCORE, MID, SUBJECT) values(2, 80, 'kim', '영어');

-- 70) 컬럼명을 생략 아래의 점수 입력
-- (3, park, 수학, 80)
INSERT INTO score values(3, 'park', '수학', 80);

SELECT * FROM score;

-- 71) score 테이블의 구조 사용 tempScore 테이블 생성
CREATE TABLE tempScore AS SELECT * FROM score WHERE 1=2;

-- 72) score 테이블의 모든 데이터를 tempScore에 저장
INSERT INTO tempScore SELECT * FROM score;
SELECT * form tempScore;

-- 73) score 테이블의 자료 중 국어점수에 해당 자료만 tempScore에 저장
INSERT INTO tempScore
SELECT * FROM score WHERE SUBJECT = '국어';

SELECT * FROM tempScore;

-- 74) score 테이블 구조 사용, imsiScore 테이블 생성 후, insert all 사용
-- 		테이블의 모든 데이터 tempScore, imsiScore 테이블 저장
CREATE TABLE imsiScore AS SELECT * FROM score WHERE 1=2;
INSERT ALL
	INTO tempScore VALUES(serial, mid, subject, score)
	INTO imsiScore VALUES(serial, mid, subject, score)
SELECT * FROM score;

SELECT * FROM tempScore;
SELECT * FROM imsiScore;

-- update 테이블명 set 컬럼명1 = 수정값1, 컬럼멸2 = 수정값2, ... where 조건
-- update 테이블명 set 컬럼명1 = 수정값1, 컬럼명2 = 수정값2, ... where 컬럼명 = (sub query)

-- 75) hong의 국어 성적을 100으로 수정
UPDATE score SET score = 100
WHERE mid = 'hong' AND subject = '국어';

-- 76) park의 과목을 수학에서 영어로 수정
UPDATE score SET SUBJECT = '영어'
WHERE mid = 'park';
SELECT * FROM score;

-- delete from 테이블명 where 조건
-- 77) tempScore 자료 중 hong 국어 점수 모두 삭제
DELETE FROM tempScore WHERE mid = 'hong' AND subject = '국어';
SELECT * FROM tempScore;

-- 78) imsiScore 모든 자료 삭제
SELECT * FROM imsiScore;
DELETE FROM imsiScore;
SELECT * FROM imsiScore;

-- TCL(commit, rollback)
-- DBeaver의 commit 옵션을 Auto => Mannual type 수정
-- SQL PLUS 열어서 hr 유저로 로그임

-- 79) tempScore 데이터 모두 삭제
SELECT * FROM tempScore;
DELETE FROM tempScore;
SELECT * FROM tempScore;
ROLLBACK;
SELECT * FROM tempScore;

DELETE FROM tempScore;
COMMIT;

-- 80) 제약조건 5가지 테이블 생성시 지정
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

-- 81) no컬럼에 중복된 값을 입력, primary 키 속성 test
INSERT INTO constTest VALUES(1, 'hong', '901212', 1, 100);

-- 82) no컬럼에 null 대입, primary 키 속성 test
INSERT INTO constTest(name, jumin, loc_code, deptno) values('kim', '990101', 1, 100);

-- 83) jumin 번호를 중복 입력, unique 속성 test
INSERT INTO constTest VALUES(2, 'kim', '901213', 2, 100);
SELECT * FROM constTest;

-- 84) loc_code에 8을 입력, check 속성 위배 됨 test
INSERT INTO constTest VALUES(3, 'kim', '901213', 8, 100);

-- 85) departments 테이블 department_id 없는 값 입력, foreign key 속성 test
INSERT INTO constTest VALUES(3, 'kim', '901214', 2, 999);

-- constTest 테이블에 설정된 제약 조건 삭제
SELECT * FROM USER_CONSTRAINTS WHERE table_name = upper('constraint');

ALTER TABLE constTest DROP CONSTRAINT constTest_no_pk;
ALTER TABLE constTest DROP CONSTRAINT constTest_jumin_uk;
ALTER TABLE constTest DROP CONSTRAINT constTest_loc_ck;
ALTER TABLE constTest DROP CONSTRAINT constTest_deptno_fk;

-- 테이블 생성 후 alter table 사용 제약 조건 수정
-- pk, fk, uk, ck 모두 같은 방법
ALTER TABLE constTest ADD CONSTRAINT constTest_no_pk PRIMARY key(no);

-- null과 not null은 modify로 수정
ALTER TABLE constTest MODIFY jumin NULL;
ALTER TABLE constTest MODIFY jumin NOT NULL;

-- 86) view : 성명, 연락처, 이메일, 매니저이름, 부서코드, 부서명 조회
CREATE OR REPLACE VIEW emp_view AS 
	SELECT	e.first_name 성명, e.phone_number 연락처, e.email 이메일, m.first_name 매니저이름,
			e.department_id 부서코드, d.department_name 부서명
	FROM EMPLOYEES e JOIN EMPLOYEES m
	ON e.MANAGER_ID = m.EMPLOYEE_ID 
	JOIN DEPARTMENTS d
	ON e.DEPARTMENT_ID = d.DEPARTMENT_ID;

SELECT * FROM emp_view;
SELECT * FROM emp_view WHERE 성명 = 'Lisa';
SELECT * FROM emp_view WHERE 매니저이름 = 'Nancy';

-- Subquery
-- 87) 부서명이 Sales인 직원들의 명단
-- a) JOIN
SELECT e2.* FROM EMPLOYEES e2 JOIN DEPARTMENTS d
ON e2.DEPARTMENT_ID = d.DEPARTMENT_ID
WHERE d.department_name = 'Sales';
-- b) SUBQUERY
SELECT * FROM EMPLOYEES e
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID FROM DEPARTMENTS d2 
WHERE DEPARTMENT_NAME = 'Sales');

-- 88) job_title이 Programmer인 직원들의 이름과 연락처 조회(employees, jobs)
-- a) JOIN
SELECT e.FIRST_NAME 이름, e.PHONE_NUMBER 연락처 
FROM SYSTEM.EMPLOYEES e JOIN SYSTEM.JOBS j
ON e.JOB_ID = j.JOB_ID
WHERE j.job_tile = 'Programmer';
-- b) SUBQUERY
SELECT FIRST_NAME, PHONE_NUMBER FROM hr.EMPLOYEES
WHERE JOB_ID = (SELECT job_id FROM hr.jobs 
WHERE JOB_TITLE = 'Programmer');

-- 89) city가 London인 부서의 이름 조회(departments, locations)
-- a) JOIN
SELECT d.department_name FROM LOCATIONS e2 JOIN DEPARTMENTS d
ON e2.LOCATION_ID = d.LOCATION_ID 
WHERE e2.city_name = 'Lodon';
-- b) SUBQUERY
SELECT DEPARTMENT_NAME FROM DEPARTMENTS d3
WHERE LOCATION_ID = (SELECT LOCATION_ID FROM LOCATIONS l2 
WHERE city = 'Lodon');

-- 90) department_name이 IT인 부서의 우편번호(departments, locations)
-- a) JOIN
SELECT e2.POSTAL_CODE FROM locations e2 JOIN DEPARTMENTS d
ON e2.LOCATION_ID = d.LOCATION_ID 
WHERE d.DEPARTMENT_NAME = 'IT';
-- b) SUBQUERY
SELECT POSTAL_CODE FROM locations l
WHERE LOCATION_ID = (SELECT LOCATION_ID FROM DEPARTMENTS d2 
WHERE DEPARTMENT_NAME = 'IT');

-- 91) David의 부서명(departmaents, employees)
-- a) JOIN
SELECT d2.DEPARTMENT_NAME, e.FIRST_NAME || ' ' || e.last_name 
FROM DEPARTMENTS d2 JOIN EMPLOYEES e2 
ON d2.DEPARTMENT_ID = e2.DEPARTMENT_ID
WHERE e2.FIRST_NAME = 'David';
-- b) SUBQUERY
SELECT d2.FIRST_NAME FROM EMPLOYEES e
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID FROM DEPARTMENTS d2 
WHERE FIRST_NAME = 'David');

-- 92) Adam Fripp의 직무명(job_title)은 (employees, jobs)
-- a) JOIN
SELECT j.JOB_TITLE FROM EMPLOYEES e2 JOIN JOBS j 
ON e2.JOB_ID = j.JOB_ID 
WHERE CONCAT(e2.FIRST_NAME, e2.LAST_NAME) = 'AdamFripp';
-- b) SUBQUERY
SELECT JOB_TITLE FROM hr.JOBS j2 
WHERE JOB_ID = (SELECT JOB_ID FROM hr.EMPLOYEES
WHERE FIRST_NAME = 'Adam' AND LAST_NAME = 'Fripp');

COMMIT;

-- 93) 부서 아이디가 30번인 부서 직원들의 급여보다 작은 급여를 받는 직원의 이름과 급여 조회 (<ANY, <ALL)
SELECT first_name, salary FROM EMPLOYEES e
WHERE SALARY < (SELECT min(SALARY) FROM EMPLOYEES e2 
WHERE DEPARTMENT_ID = 30);

SELECT first_name, salary FROM EMPLOYEES e
WHERE SALARY < all (SELECT SALARY FROM EMPLOYEES e2 
WHERE DEPARTMENT_ID = 30);

-- 94) 2007년도에 입사한 직원들의 최대급여보다 급여를 많이 받는 직원들의 이름, 급여 조회 (>ANY, >ALL)
SELECT first_name, salary FROM EMPLOYEES e
WHERE SALARY > (SELECT max(SALARY) FROM EMPLOYEES e2 
WHERE to_char(HIRE_DATE, 'rrrr') = '2007');

-- sequence
-- 시퀀스 발생 : 시퀀스명.nextval
-- 현재 시퀀스 조회 : 시퀀스명.currcal
-- 목적 : 중복되지 않는 번호 발생 select 같은 쿼리 문장에서 한건의 데이터를 가져오기 위한 방법.
-- 95) 기본값 사용
CREATE SEQUENCE seq_score;

-- 96) 생성된 시퀀스 발생
SELECT seq_score.nextval FROM dual;

-- 97) 현재 시퀀스 값만 조회
SELECT seq_score.currval FROM dual;

-- 98) score 테이블에 성적을 입력할 때 serial 컬럼엔 시퀀스 적용
ALTER TABLE score disable CONSTRAINT score_mid_fk;

INSERT INTO score(serial, mid, subject, score)
VALUES(seq_score.nextval, 'kim', '국어', 100);

SELECT * FROM score;

-- 계층형 쿼리
	SELECT rownum, LEVEL, employee_id, lpad(' ', LEVEL * 3, ' ') || first_name, manager_id 
	FROM EMPLOYEES e
	START WITH manager_id IS NULL
	CONNECT BY PRIOR employee_id = MANAGER_ID
	ORDER siblings BY MANAGER_ID

-- 게층형 쿼리와 페이징 처리
	SELECT * FROM (
		SELECT rownum rn, a.* from
			(SELECT rownum, LEVEL, employee_id, lpad(' ', LEVEL * 3, ' ') || first_name, manager_id 
			FROM EMPLOYEES e
			START WITH manager_id IS NULL
			CONNECT BY PRIOR employee_id = MANAGER_ID
			ORDER siblings BY MANAGER_ID) a
	) WHERE rn BETWEEN 6 AND 10;

