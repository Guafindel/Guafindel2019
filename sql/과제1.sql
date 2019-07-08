--EMP ���̺�� DEPT ���̺��� �̿��ؼ� ���� Ǯ��

--1. ���������ڸ� �̿��Ͽ� ��� ����� ���ؼ� $300�� �޿� �λ��� ����� �� ����� �̸�, �޿�, �λ�� �޿��� ����Ͻÿ�.
select ename as "����� �̸�" , sal as "�޿�", sal + 300 as "�λ�� �޿�"
from emp
;

select ename, sal, sal+100 as "�λ�� �޿�"
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
--hiredate�� 80/01/01 �̷������� ����Ǿ��ִ�. �̰��� �������� ��� ��������
--������ �߶󳻾� �ϴ��� �����غ��ٸ� ���� �ذ��� �� �����ž�.
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
--�Ի��� ���� ���� = '04'
select ename, hiredate
from emp
where substr(hiredate, '4','2') = '04'
;

select *
from emp
where substr(hiredate, '4','2') = '04'
;

select ename, hiredate
from emp
where to_char(hiredate,'mm') = 04
;

--18. MOD �Լ��� ����Ͽ� �����ȣ�� ¦���� ����� ����Ͻÿ�.
--MOD(�÷�, ���(������ ��)) -> ������ ��
select ename, empno
from emp
where mod(empno, 2) = 0
;

select *
from emp
where mod(empno, 2) = 0
;

--19. �Ի����� �⵵�� 2�ڸ�(YY), ���� ����(MON)�� ǥ���ϰ� ������ ��� (DY)�� �����Ͽ� ����Ͻÿ�.
select TO_CHAR(hiredate, 'YY/MON/DD DY')as changeDate
from emp
;

--20. ���� ��ĥ�� �������� ����Ͻÿ�. ���� ��¥���� ���� 1�� 1���� �� ����� ����ϰ� TO_DATE �Լ��� ����Ͽ� ������ ���� ��ġ ��Ű�ÿ�.
--date- date
select trunc(sysdate - TO_DATE('2019/01/01', 'YYYY/MM/DD'))
from dual
;

select round(sysdate - to_date('2019/01/01', 'YYYY/MM/DD'),0)
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

select ename, job, sal,
                decode(job,
                    'ANALYST',sal+200,
                    'SALESMAN',sal+100,
                    'MANAGER',sal+150,
                    'CLERK',sal+100)as "�λ�� �޿�"
from emp
order by job
;

select empno, ename, sal,
        decode(job,
            'ANALYST', sal+200,
            'SALESMAN', sal+180,
            'MANAGER', sal+150,
            'CLERK', sal+100
         ) as upsal
from emp
;

--23. ��� ����� �޿� �ְ��, ������, �Ѿ� �� ��� �޿��� ����Ͻÿ�. ��տ� ���ؼ��� ������ �ݿø��Ͻÿ�.
select max(sal), min(sal), sum(sal),round(avg(sal),0)
from emp
;

--24. �� ��� ���� �������� �޿� �ְ��, ������, �Ѿ� �� ��� ���� ����Ͻÿ�. ��տ� ���ؼ��� ������ �ݿø� �Ͻÿ�.
select job, max(sal), min(sal), sum(sal),round(avg(sal))
from emp
group by job
;

--25. COUNT(*) �Լ��� �̿��Ͽ� �������� ������ ��� ���� ����Ͻÿ�.
select job, count(*)
from emp
group by job
;

--26. ������ ���� �����Ͻÿ�.
--count�����ڴ� null���� �����ϱ� ������ where ������ ���� �߰��� �ʿ�� ����.
select count(distinct MGR)
from emp
--where MGR is not null
;

select job, count(*)
from emp
where job = 'MANAGER'
group by job
;

--27. �޿� �ְ��, �޿� �������� ������ ����Ͻÿ�.
select max(sal) - min(sal) as "����"  
from emp
;

select max(sal), min(sal), max(sal) - min(sal) as "����"  
from emp
;

--28. ���޺� ����� ���� �޿��� ����Ͻÿ�. �����ڸ� �� �� ���� ���, ���� �޿��� 2000 �̸��� �׷��� ���ܽ�Ű�� ����� �޿��� ���� ������������ �����Ͽ� ����Ͻÿ�.
select job, min(sal)
from emp
group by job
having min(sal) > 2000
;

select job, min(sal) as minsal
from emp
where mgr is not null
group by job
having min(sal) > 2000
order by minsal desc
;

--29. �� �μ��� ���� �μ���ȣ, ��� ��, �μ� ���� ��� ����� ��� �޿��� ����Ͻÿ�. ��� �޿��� �Ҽ��� ��° �ڸ��� �ݿø� �Ͻÿ�.
select deptno, count(*), round(avg(sal),2)
from emp
group by deptno
;

--30. �� �μ��� ���� �μ���ȣ �̸�, ���� ��, ��� ��, �μ����� ��� ����� ��� �޿��� ����Ͻÿ�. ��� �޿��� ������ �ݿø� �Ͻÿ�. DECODE ���.
select deptno,
            decode(deptno, 10,'ten', 20,'tw', 30,'tr',40,'ft') as dname,
            decode(deptno, 10,'incheon', 20,'seoul', 30,'busan', 40,'jeju') as localname,
            count(*),
            round(avg(sal))
from emp
group by deptno      
;

select e.deptno, d.dname, d.loc, count(*), round(avg(sal),0)
from emp e, dept d
where e.deptno = d.deptno
group by e.deptno, d.dname, d.loc
order by deptno
;


--31. ������ ǥ���� ����
--�ش� ������ ���� 
--�μ� ��ȣ�� �޿� �� �μ� 10, 20, 30�� �޿� �Ѿ��� ���� ����Ͻÿ�. 
--��Ī�� �� job, dno, �μ� 10, �μ� 20, �μ� 30, �Ѿ����� �����Ͻÿ�. 
--( hint. Decode, group by )
select job, deptno as dno,
            decode(deptno, 10,sum(sal)) as "�μ� 10",
            decode(deptno, 20,sum(sal)) as "�μ� 20",
            decode(deptno, 30,sum(sal)) as "�μ� 30",
            sum(sal) as "�޿� �Ѿ�"
from emp
group by job, deptno
order by deptno
;

--32. EQUI ������ ����Ͽ� SCOTT ����� �μ���ȣ�� �μ� �̸��� ����Ͻÿ�.
select e.ename, e.deptno, d.dname
from emp e, dept d
where e.deptno = d.deptno and e.ename='SCOTT'
;

--33. INNER JOIN�� ON �����ڸ� ����Ͽ� ��� �̸��� �Բ� �� ����� �Ҽӵ� �μ��̸��� ���� ���� ����Ͻÿ�.
select e.ename, d.dname, d.loc
from emp e inner join dept d
on e.deptno = d.deptno
order by dname
;

--36. ���ΰ� WildCARD�� ����Ͽ� �̸��� ��A���� ���Ե� ��� ����� �̸��� �μ����� ����Ͻÿ�.
select e.ename, d.dname
from emp e, dept d
where e.deptno = d.deptno and e.ename like ('%A%')
;

--37. JOIN�� �̿��Ͽ� NEW YORK�� �ٹ��ϴ� ��� ����� �̸�, ����, �μ���ȣ �� �μ����� ����Ͻÿ�.
select d.loc, e.ename, e.job, e.deptno, d.dname
from emp e, dept d
where e.deptno = d.deptno and d.loc = 'NEW YORK'
;

--38. SELF JOIN�� ����Ͽ� ����� �̸� �� �����ȣ, ������ �̸��� ����Ͻÿ�.
select e.ename || '�� ��� ��ȣ��' || e.empno || '�̸� �������� �̸���' || m.ename
from emp e join emp m
on e.mgr = m.empno
;

--39. OUTER JOIN, SELF JOIN�� ����Ͽ� �����ڰ� ���� ����� �����Ͽ� �����ȣ�� �������� �������� �����Ͽ� ����Ͻÿ�.
select e.ename || '�� ��� ��ȣ��' || e.empno || '�̸� �������� �̸���' || nvl(m.ename, ' X')
from emp e join emp m
on e.mgr = m.empno(+)
order by e.empno desc
;

--40. SELF JOIN�� ����Ͽ� ������ ����� �̸�, �μ���ȣ, ������ ����� ������ �μ����� �ٹ��ϴ� ����� ����Ͻÿ�. ( SCOTT )
select e.deptno, m.ename
from emp e, emp m
where e.deptno = m.deptno and e.ename = 'SCOTT'
;

--41. SELF JOIN�� ����Ͽ� WARD ������� �ʰ� �Ի��� ����� �̸��� �Ի����� ����Ͻÿ�.
select 'WARD�� �Ի����� '||e.hiredate || ' ���� �ʰ� �Ի��� ����� �̸��� ' || m.ename || '�̸� ���� �Ի����� ' || m.hiredate ||' �Դϴ�.'
from emp e, emp m
where e.hiredate < m.hiredate and e.ename='WARD'
;

--42. SELF JOIN �� ����Ͽ� �����ں��� ���� �Ի��� ��� ����� �̸� �� �Ի����� �������� �̸� �� �Ի��ϰ� �Բ� ����Ͻÿ�.
select e.ename as "���", e.hiredate as "��� �Ի���", m.ename as "������", m.hiredate as "������ �Ի���"
from emp e, emp m
where e.hiredate < m.hiredate and e.mgr = m.empno
;

select e.ename, m.ename
from emp e, emp m
where e.mgr = m.empno
;

--43. ��� ��ȣ�� 7788�� ����� ��� ������ ���� ����� ǥ��(��� �̸��� ������)�Ͻÿ�.
select e.ename, e.job
from (select * from emp where empno=7788) m, emp e
where e.job = m.job 
;

--44. �����ȣ�� 7499�� ������� �޿��� ���� ����� ǥ���Ͻÿ�. ����̸��� ��� ����
select e.ename, e.job, e.sal
from (select sal from emp where empno= 7499) m, emp e
where e.sal > m.sal
;

--45. �ּұ޿��� �޴� ����� �̸�, ������ �� �޿��� ǥ���Ͻÿ�. (�׷��Լ� ���)
select e.ename, e.job, min(sal)
from emp e
where sal = (select min(sal) from emp m)
group by e.ename, e.job
;

select e.ename, e.job, e.sal
from emp e
where e.sal = (select min(sal) from emp m)
;

--46. ��ձ޿��� ���� ���� ������ ���� �̸��� ������ ����� ���Ͻÿ�.

select job, avg(sal)
from emp
group by job
having avg(sal) <= all(select avg(sal) from emp group by job)
;
       
select job,avg(sal)
from emp
where min(avg(sal)) < (select avg(sal) from emp)
group by job
;
             
select avg(sal) from emp group by job;

--47. �� �μ��� �ּ� �޿��� �޴� ����� �̸�, �޿�, �μ���ȣ�� ǥ���Ͻÿ�.
select e.ename, e.sal, e.deptno
from (select deptno, min(sal)
      from emp
      group by deptno) m, emp e
where m.deptno = e.deptno and m.min(sal) = e.sal
;

select ename, sal, deptno
from emp
where (select deptno, min(sal)
       from emp
       group by deptno)
;

select deptno, min(sal)
from emp
group by deptno
;

--48. �������� ANALYST �� ������� �޿��� �����鼭 ������ ANALYST�� �ƴ� ������� ǥ��(�����ȣ, �̸�, ��� ����, �޿�)�Ͻÿ�.

--49. ���������� ���� ����� �̸��� ǥ���Ͻÿ�.

--50. ���������� �ִ� ����� �̸��� ǥ���Ͻÿ�.

--51. BLAKE�� ������ �μ��� ���� ����� �̸��� �Ի����� ǥ���ϴ� ���Ǹ� �ۼ��Ͻÿ�. ( �� BLAKE�� ���� )

--52. �޿��� ��� �޿����� ���� ������� ��� ��ȣ�� �̸��� ǥ���ϵ� ����� �޿��� ���ؼ� ������������ �����Ͻÿ�.

--53. �̸��� K�� ���Ե� ����� ���� �μ����� ���ϴ� ����� ��� ��ȣ�� �̸��� ǥ���Ͻÿ�.

--54. �μ���ġ�� DALLAS�� ����� �̸��� �μ���ȣ �� �������� ǥ���Ͻÿ�.

--55. KING���� �����ϴ� ����� �̸��� �޿��� ǥ���Ͻÿ�.

--56. RESEARCH �μ��� ����� ���� �μ���ȣ, ����̸� �� ��� ������ ǥ���Ͻÿ�.

--57. ��� ���޺��� ���� �޿��� �ް� �̸��� M�� ���Ե� ����� ���� �μ����� �ٹ��ϴ� ����� ��� ��ȣ, �̸�, �޿��� ǥ���Ͻÿ�.

--58. ��ձ޿��� ���� ���� ������ ã���ÿ�.

--59. �������� MANAGER �� ����� �Ҽӵ� �μ��� ������ �μ��� ����� ǥ���Ͻÿ�.

