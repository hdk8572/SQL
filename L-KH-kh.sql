create synonym emp for employee;
select * from emp;

select * from kh.dept;

create public synonym dept2_public for KH.DEPT;
select * from dept_public;