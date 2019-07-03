--EMP ���̺�� DEPT ���̺��� �̿��ؼ� ���� Ǯ��

--1. ���������ڸ� �̿��Ͽ� ��� ����� ���ؼ� $300�� �޿� �λ��� ����� �� ����� �̸�, �޿�, �λ�� �޿��� ����Ͻÿ�.
select ename as "����� �̸�" , sal as "�޿�", sal + 300 as "�λ�� �޿�"
from emp
;


--2. ����� �̸�, �޿�, ���� �� ������ �� ������ ���� �ͺ��� ���� ������ ����Ͻÿ�, ���� �Ѽ����� ���޿� 12�� ���� �� $100�� �󿩱��� ���ؼ� ����Ͻÿ�.
select ename as "����� �̸�", sal as "�޿�", sal*12+100 as "������ �󿩱� �ջ�"
from emp
order by (sal*12+100) desc
;


--3. �޿��� 2000�� �Ѵ� ����� �̸��� �޿��� ǥ��, �޿��� ���� �ͺ��� ���� ������ ����Ͻÿ�.
select ename as "����� �̸�", sal as "�޿�"
from emp
where sal > 2000
order by sal desc
;


--4. �����ȣ�� 7788�� ����� �̸��� �μ���ȣ�� ����Ͻÿ�.
select ename as "����� �̸�", empno as "�μ���ȣ"
from emp
where empno = 7788
;


--5. �޿��� 2000���� 3000 ���̿� ���Ե��� �ʴ� ����� �̸��� �޿��� ����Ͻÿ�.
select ename as "����� �̸�", sal as "�޿�"
from emp
where not sal between 2000 and 3000 
;


--6. 1981�� 2�� 20�� ���� 1981�� 5�� 1�� ���̿� �Ի��� ����� �̸�, ������, �Ի����� ����Ͻÿ�.
select ename as "����� �̸�", job as "������", hiredate as "�Ի���"
from emp
where hiredate between '81/02/20' and '81/05/01'
;


--7. �μ���ȣ�� 20 �� 30�� ���� ����� �̸��� �μ���ȣ�� ���, �̸��� ����(��������)���� �����ڼ����� ����Ͻÿ�.
select ename as "����� �̸�", deptno as "�μ���ȣ"
from emp
where deptno in(20,30)
order by ename desc
;

--8. ����� �޿��� 2000���� 3000���̿� ���Եǰ� �μ���ȣ�� 20 �Ǵ� 30�� ����� �̸�, �޿��� �μ���ȣ�� ���, �̸���(��������)���� ����Ͻÿ�.
select ename as "����� �̸�", sal as "�޿�", deptno as "�μ���ȣ"
from emp
where sal between 2000 and 3000
order by ename asc
;


--9. 1981�⵵�� �Ի��� ����� �̸��� �Ի����� ����Ͻÿ�. (like �����ڿ� ���ϵ�ī�� ���)
select ename as "����� �̸�", hiredate as "�Ի���"
from emp
where hiredate like ('81/__/__')
;

--10. �����ڰ� ���� ����� �̸��� ��� ������ ����Ͻÿ�.
select ename as "����� �̸�", job as "��� ����"
from emp
where mgr is null
;

--11. Ŀ�̼��� ���� �� �ִ� �ڰ��� �Ǵ� ����� �̸�, �޿�, Ŀ�̼��� ����ϵ� �޿� �� Ŀ�̼��� �������� �������� �����Ͽ� ǥ���Ͻÿ�.
select ename as "����� �̸�", sal as "�޿�", comm as "�󿩱�"
from emp
where comm is not null and comm > 0
order by sal desc, comm desc --comm desc --desc, comm desc
;


--12. �̸��� ����° ���ڰ� R�� ����� �̸��� ǥ���Ͻÿ�.
select ename as "����� �̸�"
from emp
where ename like ('__R%')
;


--13. �̸��� A�� E�� ��� �����ϰ� �ִ� ����� �̸��� ǥ���Ͻÿ�.
select ename as "����� �̸�"
from emp
where ename like '%A%' and ename like '%E%'
--where ename like '%A%, %E%'
;


--14. �������� CLERK, �Ǵ� SALESMAN�̸鼭 �޿��� $1600, $950 �Ǵ� $1300�� �ƴ� ����� �̸�, ������, �޿��� ����Ͻÿ�.
select ename as "����� �̸�", job as "��� ����", sal as "�޿�"
from emp
where job in('CLERK','SALESMAN') and sal not in(1600,950,1300)
;


--15. Ŀ�̼��� $500 �̻��� ����� �̸��� �޿� �� Ŀ�̼��� ����Ͻÿ�.
select ename as "����� �̸�", sal as "�޿�", comm as "�󿩱�"
from emp
where comm >= 500
;

--16. SUBSTR �Լ��� ����Ͽ� ������� �Ի��� �⵵�� �Ի��� �޸� ����Ͻÿ�.
--substr(�÷�, '�ڸ� ������', '�ڸ���')
--������ġ�� 0 �ƴϸ� 1�� ó���ȴٴ� ���� ����ص���. �� 1�̰ų� 0�̰ų� �� �� ����� ���µ��ϴ�.
select ename, substr(hiredate,'0','5')
from emp
;

select ename, substr(hiredate,'1','2'),substr(hiredate,'4','2')
from emp
;

select ename, hiredate, to_char(hiredate, 'yyyy/mm')
from emp
;

--17. SUBSTR �Լ��� ����Ͽ� 4���� �Ի��� ����� ����Ͻÿ�.
select ename, hiredate
from emp
where substr(hiredate, '4','2') = '04'
;

select ename, hiredate
from emp
where to_char(hiredate,'mm')=04
;

--18. MOD �Լ��� ����Ͽ� �����ȣ�� ¦���� ����� ����Ͻÿ�.
select ename, empno
from emp
where mod(empno, 2)=0
;

--19. �Ի����� �⵵�� 2�ڸ�(YY), ���� ����(MON)�� ǥ���ϰ� ������ ��� (DY)�� �����Ͽ� ����Ͻÿ�.
select hiredate, TO_CHAR(hiredate, 'YY/MON/DD DY')as changeDate
from emp
;

--20. ���� �� ĥ�� �������� ����Ͻÿ�. ���糯¥���� ���� 1�� 1���� �� ����� ����ϰ� TO_DATE �Լ��� ����Ͽ� ������ ���� ��ġ ��Ű�ÿ�.
select trunc(sysdate - TO_DATE('2019/01/01', 'YYYY/MM/DD'))
from dual
;

--21. ������� ��� ����� ����ϵ� ����� ���� ����� ���ؼ��� NULL �� ��� 0���� ����Ͻÿ�.
select ename, nvl(mgr,0)
from emp
order by mgr
;

--22. DECODE �Լ��� ���޿� ���� �޿��� �λ��ϵ��� �Ͻÿ�. ������ ��ANALIST���� ����� 200, ��SALESMAN���� ����� 180, ��MANAGER���� ����� 150, ��CLERK���� ����� 100�� �λ��Ͻÿ�.
select empno, ename, job, sal,
                 DECODE(JOB, 
                         'ANALYST', sal+200,
                         'SALESMAN', sal+180,
                         'MANAGER', sal+150,
                         'CLERK', sal+100) as upSal       
from emp
;

select *
from emp;