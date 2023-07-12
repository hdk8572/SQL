1. JOB 테이블의 모든 정보 조회
select *
from job;

2. JOB 테이블의 직급 이름 조회
select job_name
from job;

3. DEPARTMENT 테이블의 모든 정보 조회
select *
from department;

4. EMPLOYEE테이블의 직원명, 이메일, 전화번호, 고용일 조회
select emp_name "직원명", email "이메일", phone "전화번호", hire_date "고용일"
from employee;

5. EMPLOYEE테이블의 고용일, 사원 이름, 월급 조회
select hire_date "고용일", emp_name "사원 이름", salary "월급"
from employee;

-----------------------
6. EMPLOYEE테이블에서 이름, 연봉, 총수령액(보너스포함), 실수령액(총수령액 - (연봉*세금 3%)) 조회
select emp_name "이름", (salary * 12) "연봉", floor((salary*12)+((salary*12)*nvl(bonus,0))) "보너스포함", floor(((salary*12)+((salary*12)*nvl(bonus,0)))-((salary*12)*0.03)) "실수령액"
from employee;

7. EMPLOYEE테이블에서 SAL_LEVEL이 S1인 사원의 이름, 월급, 고용일, 연락처 조회
select emp_name "이름", salary "월급", hire_date "고용일", phone "연락처"
from employee
where sal_level = 'S1';

8. EMPLOYEE테이블에서 실수령액(6번 참고)이 5천만원 이상인 사원의 이름, 월급, 실수령액, 고용일 조회
select emp_name "이름", salary "월급", floor(((salary*12)+((salary*12)*nvl(bonus,0)))-((salary*12)*0.03)) "실수령액", hire_date "고용일"
from employee
where floor(((salary*12)+((salary*12)*nvl(bonus,0)))-((salary*12)*0.03)) > 50000000;

9. EMPLOYEE테이블에 월급이 4000000이상이고 JOB_CODE가 J2인 사원의 전체 내용 조회
select *
from employee
where salary >= 4000000 and job_code = 'J2'
;
10. EMPLOYEE테이블에 DEPT_CODE가 D9이거나 D5인 사원 중, 고용일이 02년 1월 1일보다 빠른 사원의 이름, 부서코드, 고용일 조회
select emp_name "이름", dept_code "부서코드", hire_date "고용일"
from (select * from employee where dept_code in ('D5', 'D9'))
where hire_date <= '02/01/01'
;

11. EMPLOYEE테이블에 고용일이 90/01/01 ~ 01/01/01인 사원의 전체 내용을 조회
select *
from employee
where hire_date between '90/01/01' and '01/01/01';

12. EMPLOYEE테이블에서 이름 끝이 '연'으로 끝나는 사원의 이름 조회
select emp_name
    from employee
    where emp_name like '%연';

13. EMPLOYEE테이블에서 전화번호 처음 3자리가 010이 아닌 사원의 이름, 전화번호를 조회
select emp_name "이름", phone "전화번호"
    from employee
    where phone not like '010%';

14. EMPLOYEE테이블에서 메일주소 '_'의 앞이 4자이면서 DEPT_CODE가 D9 또는 D6이고
고용일이 90/01/01 ~ 00/12/01이고, 급여가 270만 이상인 사원의 전체를 조회
select *
    from employee
    where instr(email, '_') =5
    and dept_code in ('D9', 'D6')
    and hire_date between '90/01/01'
    and '00/12/01' and salary >= 2700000;
    
15. EMPLOYEE테이블에서 사원 명과 직원의 주민번호를 이용하여 생년, 생월, 생일 조회
select emp_name "사원명", substr(emp_no,1,2) "생년", substr(emp_no,3,2) "생월", substr(emp_no,5,2) "생일"
from employee
;

16. EMPLOYEE테이블에서 사원명, 주민번호 조회 (단, 주민번호는 생년월일만 보이게 하고, '-'다음 값은 '*'로 바꾸기)
select emp_name "사원명", rpad(substr(emp_no, 1, 7), 14, '*') "주민번호"
from employee
;

17. EMPLOYEE테이블에서 사원명, 입사일-오늘, 오늘-입사일 조회(단, 각 별칭은 근무일수1, 근무일수2가 되도록 하고 모두 정수(내림), 양수가 되도록 처리)
select emp_name "사원명", abs(floor(months_between(hire_date, sysdate))) "근무일수1", abs(floor(months_between(sysdate, hire_date))) "근무일수2"
from employee
order by 3 desc
;

18. EMPLOYEE테이블에서 사번이 홀수인 직원들의 정보 모두 조회
select *
from employee
where mod(emp_id, 2)=1
;

19. EMPLOYEE테이블에서 근무 년수가 20년 이상인 직원 정보 조회
select *
from employee
where months_between(sysdate, hire_date) >= 240
;

20. EMPLOYEE 테이블에서 사원명, 급여 조회 (단, 급여는 '\9,000,000' 형식으로 표시)
select emp_name "사원명", 'W'||substr(salary, 1,1)||','||substr(salary, 2,3)||','||substr(salary, 5,3)
from employee
;

21. EMPLOYEE테이블에서 직원 명, 부서코드, 생년월일, 나이(만) 조회 (단, 생년월일은 주민번호에서 추출해서 00년 00월 00일로 출력되게 하며 나이는 주민번호에서 출력해서 날짜데이터로 변환한 다음 계산)

select emp_name "직원 명", dept_code "부서코드", substr(emp_no,1,2)||+'년 '+||substr(emp_no,1,2)||+'년' 
from employee;
