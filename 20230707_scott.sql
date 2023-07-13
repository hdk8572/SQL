-- 학습용 SCOTT 명령어들
SELECT *
from EMP
;
SELECT EMPNO, ENAME, SAL
from EMP
;

SELECT ENAME, MGR, SAL, DEPTNO
from EMP
WHERE DEPTNO=20 AND SAL>1500
;
-- 예약어는 대소문자 구분 없지만, 대문자로 기입할 것.
SELECT ENAME, MGR, SAL, DEPTNO
FROM emp
--WHERE ENAME = 'smith'
WHERE ENAME = 'SMITH'
;

SELECT EMPNO, ENAME, SAL
FROM EMP
;
-- * 을 사용하는 것 보다 속도 빠름. 권장.
select empno, ename, job, mgr, hiredate, sal, comm, deptno
from emp;
-- * 보다 컬럼명을 나열하는 것이 속도면에서 좋음.
select * from emp;
select * from dept;
select * from salgrade;
select * from bonus;


-- Q: 사원명과 연봉을 조회

select ename "사원명", sal * 12 "연봉", sal * 12 + nvl(comm, 0) "보너스포함연봉"
from emp
;

select comm, nvl(comm,0), nvl(comm,100)
from emp
;

-- 급여를 1500보다 많이 받고 2800보다 적게 받는 직원 이름과 급여 조회
-- between and
select ename, sal
    from emp
    where sal between 1500 and 2799
;
-- <= >= 사용
select ename, sal
    from emp
    where 1500 < sal and sal < 2800
; 

-- 20번 부서를 제외한 사원 정보를 조회
select *
    from emp
--    where deptno = 20
--    where deptno <> 20
--    where deptno ^= 20
--    where not deptno = 20
    where deptno in (20, 10)
;

-- 20번 부서를 제외한 사원 중 comm이 null인 사원 정보를 조회
select *
    from emp
    where not deptno = 20
--               and comm is not null
-- 오류           comm != null  comm = null
;

-- 10, 20, 30 부서를 사원 정보를 조회
select *
    from emp
--    where deptno = 10 or deptno = 20 or deptno = 30
    where deptno in (10, 20, 30)
;
-- 10, 20, 30 부서를 제외한 사원 정보를 조회
select *
    from emp
--    where not(deptno = 10 or deptno = 20)
--    where not(deptno != 10 and deptno != 20 and deptno != 30)
    where deptno not in (10, 20, 30)
;
-- 사원명의 시작부분 S와 끝나는 부분 S 모두 제거해주세요 .
select Rtrim(Ltrim(ename, 'S'),'S') from emp;
-- Ltrim 예시 010 제거

-- Lpad / Rpad 채워넣기
-- ename이 총 10자가 되도록 left 쪽에 'S'를 채워주세요.
select Lpad(ename, 10, 'S') from emp;
-- ename이 총 10자가 되도록 left 쪽에 '' 공백(default)를 채워주세요.
select Lpad(ename, 10, ' ') from emp;

select concat (ename, comm) from emp;
select ename||comm from emp;
select sal||'달러' from emp;
select concat (sal, '달러') from emp;
-- substr 엄청중요!!
-- replace
select replace(ename, 'SM', 'A') from emp;





select ename||'s family' , sal || '원'
from emp
;
select sal, '원'
from emp
;

-- sysdate는 함수는 아니나 명령어가 실행되는 시점에 결과값을 출력해주므로 함수호출과 같음.
select SYSDATE, add_months(sysdate, 1) from dual;
select hiredate from emp;
select add_months(hiredate, 2) from emp;
-- 2023.07.10 (월요일)
select sysdate, to_char(sysdate, 'yyyy.mm.dd (dy) hh24:mi:ss') from dual;
select sysdate, to_char(sysdate, 'yyyy.mm.dd (day) hh24:mi:ss') from dual;

alter session set NLS_DATE_FORMAT = 'yyyy-mm-dd hh24:mi:ss';
select sysdate from dual;
select * from emp;

-- year 2023 month 09 day 11 hour 13
select to_date('2023091113', 'yyyymmddhh24') from dual;
select add_months(to_date('2023091113', 'yyyymmddhh24'), 5) from dual;
select next_day(to_date('2023091113', 'yyyymmddhh24'), '수') from dual;
select next_day(to_date('2023091113', 'yyyymmddhh24'), 4) from dual;
-- 1: 일요일, 2: 월요일, 3: 화요일

select last_day(to_date('2023091113', 'yyyymmddhh24'), 4) from dual;
select last_day(to_date('2023091113', 'yyyymmddhh24'), 4) from dual;

select * from emp;
-- 직원들의 평균 급여는 얼마인지 조회
select avg(sal) 평균급여 from emp;
select sum(sal) 평균급여 from emp;
select max(sal) 평균급여 from emp;
select min(sal) 평균급여 from emp;
-- job별 평균 급여 조회
select avg(sal) 평균급여, deptno from emp group by job;
select sum(sal) sum, job from emp group by job;
select max(sal) max, job from emp group by job;
select min(sal) min, job from emp group by job;
select count(sal) min, job from emp group by job;
select count(*) min, job from emp group by job;

select job, deptno, ename
    from emp
    where job='CLERK'
;
select job, deptno, avg(sal)
    from emp
    where job='CLERK'
    group by deptno, job
;

SELECT * FROM EMP
--    ORDER BY JOB;
    ORDER BY 3;

-- 부서 위치가 DALLAS인 사원명, 부서번호, 부서명, 위치를 조회
SELECT ENAME, DEPT.DEPTNO, DNAME, LOC
    FROM EMP, DEPT
    WHERE EMP.DEPTNO = DEPT.DEPTNO
        AND LOC = 'DALLAS'
;

SELECT EMPNO, LOC
    FROM EMP CORSS JOIN DEPT
;

-- 사원의 이름, 사번, SAL, GRADE를 조회.
SELECT ENAME "이름", EMPNO "사번", SAL "SAL", GRADE "GRADE"
FROM EMP, SALGRADE
;

SELECT E.ENAME "이름", E.EMPNO "사번", E.SAL "SAL", S.GRADE "등급"
    FROM EMP E
        JOIN SALGRADE S ON E.SAL BETWEEN S.LOSAL AND S.HISAL
    ORDER BY S.GRADE DESC, E.SAL DESC
;

SELECT E.EMPNO, E.ENAME, E.MGR, M.ENAME MGRNAME
    FROM EMP E JOIN EMP M
        ON E.MGR = M.EMPNO
;
create table t1(
    c1 char(5),
    c2 varchar2(5)
);
insert into t1 values('12','12');
insert into t1 values('12345','12345');
insert into t1 values('123456','123456');
commit;
select * from t1;
select length(c1), length(c2) from t1;

-- ERD ( Entity Relationship Diagram )

insert into emp (ename, empno, job, mgr, hiredate, deptno)
    values ('EJK', 8003, 'T', 7788, SYSDATE, 40) ;
SELECT * FROM EMP;
insert into emp (ename, empno, job, mgr, hiredate, deptno)
    values ('EJK2', 8004, 'P', NULL, TO_DATE('2023-07-12', 'YYYY-MM-DD'), 40) ;
COMMIT;

update emp
    set mgr = 7788
    where ename='ejk2'
    --  update 명령문의 where 절에는 컬럼명 pk=값
    --  where절에는 컬럼명 pk=값 --> resultset은 단일행
;   -- 
rollback;
select * from emp;

-- 30번 부서의 mgr가 SMITH 7908 로 조직개편
update emp
    set mgr = 7908
    where deptno=30
;
update emp
    set mgr = 7902
    where ename = 'EJK2'
;
-- 여러 DML 명령어 들을 묶어서 하나의 행동(일)처리를 하고자 할 때 commit / rollback 을 적절히 사용.
-- 1 DML 명령어가 하나의 행동(일) 처리 단위라면 DML - commit;
-- 2 이상 DML 명령어가 하나의 행동(일) 처리 단위라면 DML 모두가 성공해야 - commit;, 그 중 일부가 실패했다면 - rollback
-- 하나의 행동(일) 처리단위를 transaction 트랜잭션 - commit/rollback 명려어가 수행되는 단위
-- commit;
-- rollback;

commit;
select * from emp;
select * from dept;
-- 새로운 부서 50번이 만들어지고 그 부서에 신입사원 EJ3 (8005), EJ4(5006)을 투입함.
insert into emp (ename, empno, deptno) values ('EJ3', 8005, 50); 
insert into emp (ename, empno, deptno) values ('EJ4', 8005, 50); 