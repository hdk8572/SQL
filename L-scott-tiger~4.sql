-- 부서별 평균급여와 직원들 정보를 조회해주세요.

select e.*,
        -- 스칼라서브쿼리 작성되어야 함.
        (select trunc(avg(sal)) from emp e2 where e2.deptno = e.deptno) avgsal
    from emp e   
    ;
-- 직원 정보와 부서번호, 부서명, 부서위치
select ename, deptno, dname, loc
    from emp join dept using(deptno)
;
select ename, deptno,
        (select dname from dept d where d.deptno=e.deptno) dname
        ,(select loc from dept d where d.deptno=e.deptno) loc
    from emp e
;

-- SALESMAN 과 MANAGER를 조회해주세요.

select *
from emp
where job in ('SALESMAN', 'MANAGER');

select *
    from emp
    where job = 'SALESMAN'
union
select *
    from emp
    where job = 'MANAGER';
    
select empno, ename, job from emp where job = 'SALESMAN'
union
select mgr, ename, job from emp where job = 'MANAGER';

-- 급여가 1000미만인 직원, 2000미만인 직원 조회 - 중복 포함 결과.
select empno, ename, sal from emp where sal < 1000
union all
select empno, ename, sal from emp where sal < 2000;

-- 급여가 1000 초과인 직원, 2000미만인 직원 조회 - intersect
select empno, ename, sal from emp where sal > 1000
intersect
select empno, ename, sal from emp where sal < 2000;

-- 2000 미만인 직원을 제외하고 조회 - minus
select empno, ename, sal from emp
minus
select empno, ename, sal from emp where sal < 2000;

-- not exist
select empno, ename, sal from emp e
    where not exist (select empno e2.sal from emp e2 where 0.Sai  < 2000);


desc emp;
desc user_constraints;;

select * from user_constraints