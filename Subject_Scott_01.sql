1. EMP테이블에서 COMM 의 값이 NULL이 아닌 정보 조회
SELECT *
FROM EMP
WHERE COMM IS NOT NULL;

2. EMP테이블에서 커미션을 받지 못하는 직원 조회
SELECT *
FROM EMP
WHERE COMM IS NULL OR COMM = '0';

3. EMP테이블에서 관리자가 없는 직원 정보 조회
SELECT *
FROM EMP
WHERE MGR IS NULL;

4. EMP테이블에서 급여를 많이 받는 직원 순으로 조회
SELECT *
FROM EMP
ORDER BY SAL DESC;

5. EMP테이블에서 급여가 같을 경우 커미션을 내림차순 정렬 조회
SELECT *
FROM EMP
order by sal desc, comm desc;

6. EMP테이블에서 사원번호, 사원명, 직급, 입사일 조회 (단, 입사일을 오름차순 정렬 처리)
select empno "사원번호", ename "사원명", job "직급", hiredate "입사일"
from EMP
order by hiredate asc;

7. EMP테이블에서 사원번호, 사원명 조회 (사원번호 기준 내림차순 정렬)
select empno "사원번호", ename "사원명"
from EMP
order by empno desc;

8. EMP테이블에서 사번, 입사일, 사원명, 급여 조회 (부서번호가 빠른 순으로, 같은 부서번호일 때는 최근 입사일 순으로 처리)
select empno "사번", deptno "부서번호", hiredate "입사일", ename "사원명", sal "급여"
from emp
order by deptno asc, hiredate desc;


9. 오늘 날짜에 대한 정보 조회
select sysdate
from dual;

10. EMP테이블에서 사번, 사원명, 급여 조회
select empno "사번", ename "사원명", round(sal, -2) "급여"
from emp
order by sal desc
;

11. EMP테이블에서 사원번호가 홀수인 사원들을 조회
select *
from emp
where mod(empno, 2)=1
;

12. EMP테이블에서 사원명, 입사일 조회 (단, 입사일은 년도와 월을 분리 추출해서 출력)
select ename "사원명", extract(year from hiredate) "입사일", extract(month from hiredate) "��"
from emp
;

13. EMP테이블에서 9월에 입사한 직원의 정보 조회
select *
from emp
where extract(month from hiredate) = 9
;

14. EMP테이블에서 81년도에 입사한 직원 조회
select *
from emp
where extract(year from hiredate) = 1981
;

15. EMP테이블에서 이름이 'E'로 끝나는 직원 조회
select *
from emp
where ename like '%E'
;
16. EMP테이블에서 이름의 세 번째 글자가 'R'인 직원의 정보 조회
16-1
select *
from emp
where ename like '__R%'
;
16-2
select *
from emp
where substr(ename, 3, 1) = 'R'
;
17. EMP테이블에서 사번, 사원명, 입사일, 입사일로부터 40년 되는 날짜 조회
select empno "사번", ename "사원명", hiredate "입사일", add_months(hiredate, 480) 
from emp
;

18. EMP테이블에서 입사일로부터 38년 이상 근무한 직원의 정보 조회
select *
from emp
where months_between(sysdate, hiredate) >= 456
;

19. 오늘 날짜에서 년도만 추출
select extract(year from sysdate)
from dual;