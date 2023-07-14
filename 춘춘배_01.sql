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

4.
select student_name
from tb_student
where student_no in ('A513079', 'A513090', 'A513091', 'A513110', 'A513119');

5.
select department_name "학과 이름", category "계열"
from TB_department
where capacity between 20 and 30;

6.
select professor_name
from tb_professor
where department_no is null;

7.
select student_name
from tb_student
where department_no is null;

8.
select class_no
from tb_class
where preattending_class_no is not null;

9.
select category
from tb_department
group by category
order by category;

10.
select student_no "학번", student_name "이름", student_ssn "주민번호"
from tb_student
where absence_yn = 'N'
    and to_char(entrance_date, 'yy') >= 02
    and substr(student_address, 1,3) = '전주시';