-- system 유저로 접속한 후 작업하기_21.04.02
ALTER USER hr IDENTIFIED BY 1111;

-- 계정에 LOCK이 걸린 경우
ALTER USER hr account unlock;

-- 새 유저(PARK) 등록 및 암호 설정
ALTER SESSION SET "_oracle_script" = TRUE;
CREATE USER park IDENTIFIED BY 1111;

-- 등록된 유저에게 권한(ROLE)
GRANT CONNECT, resource, dba TO park;

-- 유저 삭제
DROP USER park;
DROP USER kim;

