select * from TB_department;

1.
select department_name "학과 명", category "계열"
from TB_department;

2.
select department_name||'의 정원은 '||capacity||'명 입니다.'
from TB_department;

3.
select student_name
from tb_student
where department_no = 001 
        and absence_yn = 'Y'
        and substr(student_ssn, 8,1) = 2;