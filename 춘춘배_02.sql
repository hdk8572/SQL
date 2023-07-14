1.
select student_no "학번", student_name "이름", entrance_date "입학년도"
from tb_student
where department_no = 002
order by entrance_date;

2.
select professor_name, professor_ssn
from tb_professor
where length(professor_name) > 3 or length(professor_name) < 3
order by professor_name;

3.
select professor_name "교수이름", to_char(sysdate, 'yyyy') - (decode(substr(professor_ssn, 8, 1), '1', '19', '2', '19', 20)||substr(professor_ssn, 1, 2)) "나이"
from tb_professor
where substr(professor_ssn, 8, 1) = 1
    and (decode(substr(professor_ssn, 8, 1), '1', '19', '2', '19', 20)||substr(professor_ssn, 1, 2)) < 2000
order by (decode(substr(professor_ssn, 8, 1), '1', '19', '2', '19', 20)||substr(professor_ssn, 1, 2)) desc;

4.
select substr(professor_name, 2,2) "이름"
from tb_professor
order by "이름";

5.
select student_no, student_name 
from tb_student
where extract(year from entrance_date) - extract(year from to_date(substr(student_ssn, 1, 2), 'rr')) > '19';

6.
select to_char(to_date(20201225, 'yyyymmdd'), 'dy') "2020년 크리스마스"
from dual;

7. 

select to_char(to_date('99/10/11', 'yy/mm/dd'), 'yyyymmdd'), to_char(to_date('49/10/11', 'yy/mm/dd'), 'yyyymmdd'), to_char(to_date('99/10/11', 'rr/mm/dd'), 'yyyymmdd'), to_char(to_date('49/10/11', 'rr/mm/dd'), 'yyyymmdd')
from dual;

8.
select student_no, student_name
from tb_student
where student_no not like 'A%'
order by student_name
;

9.
select distinct round((select avg(point) from tb_grade where student_no = 'A517178'), 1) "평점"
from tb_student 
    join tb_grade using(student_no)
where student_name = '한아름'
;

10.
select  department_no "학과번호", count(*) "학생수(명)"
from tb_student
group by department_no
order by department_no
;

11.
select count(*)
from tb_student
where coach_professor_no is null
;

12.
select substr(term_no,1,4), round(avg(point),1)
from tb_grade
where student_no = 'A112113'
group by substr(term_no,1,4)
;

select department_no
from tb_student
where absence_yn = 'Y'
group by department_no
