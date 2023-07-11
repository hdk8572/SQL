1. EMP���̺��� COMM �� ���� NULL�� �ƴ� ���� ��ȸ
SELECT *
FROM EMP
WHERE COMM IS NOT NULL;

2. EMP���̺��� Ŀ�̼��� ���� ���ϴ� ���� ��ȸ
SELECT *
FROM EMP
WHERE COMM IS NULL OR COMM = '0';

3. EMP���̺��� �����ڰ� ���� ���� ���� ��ȸ
SELECT *
FROM EMP
WHERE MGR IS NULL;

4. EMP���̺��� �޿��� ���� �޴� ���� ������ ��ȸ
SELECT *
FROM EMP
ORDER BY SAL DESC;

5. EMP���̺��� �޿��� ���� ��� Ŀ�̼��� �������� ���� ��ȸ
SELECT *
FROM EMP
order by sal desc, comm desc;

6. EMP���̺��� �����ȣ, �����, ����, �Ի��� ��ȸ (��, �Ի����� �������� ���� ó��)
select empno "�����ȣ", ename "�����", job "����", hiredate "�Ի���"
from EMP
order by hiredate asc;

7. EMP���̺��� �����ȣ, ����� ��ȸ (�����ȣ ���� �������� ����)
select empno "�����ȣ", ename "�����"
from EMP
order by empno desc;

8. EMP���̺��� ���, �Ի���, �����, �޿� ��ȸ(�μ���ȣ�� ���� ������, ���� �μ���ȣ�� ���� �ֱ� �Ի��� ������ ó��)
select empno "���", deptno "�μ���ȣ", hiredate "�Ի���", ename "�����", sal "�޿�"
from emp
order by deptno asc, hiredate desc;


9. ���� ��¥�� ���� ����  ��ȸ
select sysdate
from dual;

10. EMP���̺��� ���, �����, �޿� ��ȸ (��, �޿��� 100���������� ���� ��� ó���ϰ� �޿� ���� �������� ����)
select empno "���", ename "�����", round(sal, -2) "�޿�"
from emp
order by sal desc
;

11. EMP���̺��� �����ȣ�� Ȧ���� ������� ��ȸ
select *
from emp
where mod(empno, 2)=1
;

12. EMP���̺��� �����, �Ի��� ��ȸ (��, �Ի����� �⵵�� ���� �и� �����ؼ� ���)
select ename "�����", extract(year from hiredate) "��", extract(month from hiredate) "��"
from emp
;

13. EMP���̺��� 9���� �Ի��� ������ ���� ��ȸ
select *
from emp
where extract(month from hiredate) = 9
;

14. EMP���̺��� 81�⵵�� �Ի��� ���� ��ȸ
select *
from emp
where extract(year from hiredate) = 1981
;

15. EMP���̺��� �̸��� 'E'�� ������ ���� ��ȸ
select *
from emp
where ename like '%E'
;
16. EMP���̺��� �̸��� �� ��° ���ڰ� 'R'�� ������ ���� ��
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
17. EMP���̺��� ���, �����, �Ի���, �Ի��Ϸκ��� 40�� �Ǵ� ��¥ ��ȸ
select empno "���", ename "�����", hiredate "�Ի���", add_months(hiredate, 480) 
from emp
;

18. EMP���̺��� �Ի��Ϸκ��� 38�� �̻� �ٹ��� ������ ���� ��ȸ
select *
from emp
where months_between(sysdate, hiredate) >= 456
;

19. ���� ��¥���� �⵵�� ����
select extract(year from sysdate)
from dual;