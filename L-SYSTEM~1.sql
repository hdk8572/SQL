select * from user_tables;

-- 주석
-- Ctrl + / = 토글링
-- create 명령어 - DDL 데이터 정의어
create user c##scott identified by tiger;

alter session set "_ORACLE_SCRIPT"=true;
create user kh identified by kh;

-- DCL
-- create session, create table 처럼 각각의 권한명을 모두 나열하여 적기 어려움..
-- 권한들을 묶어서 만들어둔 롤 role을 사용하여 권한을 부여함.
-- connect - 접속관련 권한들이 있는 role
-- resource - 자원(table, view 등 객체) 관련 권한들이 있는 role
grant connect, resource to c##scott;
grant connect, resource to kh;
revoke connect, resource from kh;

