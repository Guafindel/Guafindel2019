--2019.07.03

--LIKE : ���� ���ϰ˻� ������ Ű����
--�÷��� LIKE ����
--���� : % _ (���ϵ�ī��)

--% ������ �̿�
--������̺��� 'S'�� �����ϴ� ����� �̸��� �˻�����
select ename
from emp
where ename like 'S%'
;

--'S'�� ������ �̸��� ���� ��� �˻�
select ename
from emp
where ename like '%S'
;

--����� �̸��� S�� �����ϴ� �̸��� ���� ��� �˻�
select *
from emp
where ename like '%S%'
;

--�ι�° ���ڰ� D�� ��� �˻�
select *
from emp
where ename like '_D%'
;

-- _ �����ڴ� ������ �ڸ�(��ġ) ������ �ǹ� : �ش� �ڸ����� ��� ���� �͵� ����� ������ �� �ڸ� ���ڿ��߸� �Ѵ�.
-- _A ���ڸ� ���ڴ� ��� ���ڿ��� ����, �ι�° ���ڴ� �ݵ�� A���� �Ѵ�.
-- _A_ �ι�° ���ڴ� ������ A���߸� �ϰ� �� �ڸ� ���ڿ��� �Ѵ�.
-- ����� �̸��߿� �ι�° ���ڿ� 'A'�� �����ϴ� �̸��� ���

select *
from emp
where ename like '_A%'
;

--�̸��� �� �ڸ� ���ڸ� ������ �ִ� ������ �̸�
select *
from emp
where ename like '____'
;

--����� �̸��� 'A'�� �������� �ʴ� ������� �˻�
select *
from emp
where ename not like '%A%'
;

-- IS NULL�� IS NOT NULL ������ 
select *
from emp
where comm = null
;
-- null�� ��쿡�� �ܼ� ������(=, >, <, <=, >=)���� �񱳰� �Ұ����Ͽ� ������� ��Ÿ���� ���Ѵ�. ���� IS NULL�� IS NOT NULL�� �̿��ؾ� �Ѵ�.

--comm�� null�� ����� ���
SELECT *
FROM EMP
WHERE comm IS NULL
;

--comm�� null�� �ƴ� ����� ���
select *
from emp
where comm is not null
;

--comm�� null�� �ƴϰ� 0�� �ƴ� ��� ���
select *
from emp
where not (comm is null or comm = 0)
;

--comm�� null�� �ƴϸ� 0 ���� ū ��� ���
select *
from emp
where comm is not null and comm > 0
;

--order by ���ı��� :  asc -> ��������(����: �����ͺ��� ���� ������, ����: ���� ������� a���� z����, null�� �Ʒ���) 
--order by ���ı��� : dbsc -> ��������(����: �����ͺ��� ���� ������, ����: ���� ������� z���� a����, null�� ����)
select *
from emp
order by comm asc
;

select *
from emp
order by comm desc
;

-- ��� ���̺��� �ο�(��) ����
--order by �÷��� [asc]/desc, �÷��� [asc]/desc

--�޿��� ���� ������� �޿��� ���� ��� ������ ����. ������ ��� default���� asc(��������)�̱⶧���� asc�� ���� �ʾƵ� �ڵ����� �������� ������ �ȴ�.
select *
from emp
order by sal --asc
;

--�޿��� ���� ������� �޿��� ���� ��� ������ ����
select *
from emp
order by sal desc
;

--�ֱ� �Ի��� ��� ������ ����� ����Ʈ ���
select *
from emp
order by hiredate desc
;

--�޿��� ���� ��� ������ ����, �޿��� ���� ����� ��� �̸� ������ ����(��¥�ε� ������ ����)
select ename, sal, hiredate
from emp
order by sal desc, ename asc --hiredate asc
;

--EMP ���̺�� DEPT ���̺��� �̿��ؼ� ���� Ǯ��

--1. ���������ڸ� �̿��Ͽ� ��� ����� ���ؼ� $300�� �޿� �λ��� ����� �� ����� �̸�, �޿�, �λ�� �޿��� ����Ͻÿ�.
select ename, sal, sal + 300 as addsal
from emp
;


--2. ����� �̸�, �޿�, ���� �� ������ �� ������ ���� �ͺ��� ���� ������ ����Ͻÿ�, ���� �Ѽ����� ���޿� 12�� ���� �� $100�� �󿩱��� ���ؼ� ����Ͻÿ�.
select ename, sal, sal*12+100 as addsal
from emp
order by (sal*12+100) desc
;


--3. �޿��� 2000�� �Ѵ� ����� �̸��� �޿��� ǥ��, �޿��� ���� �ͺ��� ���� ������ ����Ͻÿ�.
select ename, sal
from emp
where sal > 2000
order by sal desc
;


--4. �����ȣ�� 7788�� ����� �̸��� �μ���ȣ�� ����Ͻÿ�.
select ename, empno
from emp
where empno = 7788
;


--5. �޿��� 2000���� 3000 ���̿� ���Ե��� �ʴ� ����� �̸��� �޿��� ����Ͻÿ�.
select ename, sal
from emp
where not sal between 2000 and 3000 
;


--6. 1981�� 2�� 20�� ���� 1981�� 5�� 1�� ���̿� �Ի��� ����� �̸�, ������, �Ի����� ����Ͻÿ�.
select ename, job, hiredate
from emp
where hiredate between '81/02/20' and '81/05/01'
;


--7. �μ���ȣ�� 20 �� 30�� ���� ����� �̸��� �μ���ȣ�� ���, �̸��� ����(��������)���� �����ڼ����� ����Ͻÿ�.
select ename, deptno
from emp
where deptno in(20,30)
order by ename desc
;

--8. ����� �޿��� 2000���� 3000���̿� ���Եǰ� �μ���ȣ�� 20 �Ǵ� 30�� ����� �̸�, �޿��� �μ���ȣ�� ���, �̸���(��������)���� ����Ͻÿ�.
select ename, sal, deptno
from emp
where sal between 2000 and 3000
order by ename asc
;


--9. 1981�⵵�� �Ի��� ����� �̸��� �Ի����� ����Ͻÿ�. (like �����ڿ� ���ϵ�ī�� ���)
select ename, hiredate
from emp
where hiredate like ('81/__/__')
;

--10. �����ڰ� ���� ����� �̸��� ��� ������ ����Ͻÿ�.
select ename, job
from emp
where mgr is null
;

--11. Ŀ�̼��� ���� �� �ִ� �ڰ��� �Ǵ� ����� �̸�, �޿�, Ŀ�̼��� ����ϵ� �޿� �� Ŀ�̼��� �������� �������� �����Ͽ� ǥ���Ͻÿ�.
select ename, sal, comm
from emp
where comm is not null and comm > 0
order by sal desc, comm desc --comm desc --desc, comm desc
;


--12. �̸��� ����° ���ڰ� R�� ����� �̸��� ǥ���Ͻÿ�.
select ename
from emp
where ename like ('__R%')
;


--13. �̸��� A�� E�� ��� �����ϰ� �ִ� ����� �̸��� ǥ���Ͻÿ�.
select ename
from emp
where ename like '%A%' and ename like '%E%'
--where ename like '%A%, %E%'
;


--14. �������� CLERK, �Ǵ� SALESMAN�̸鼭 �޿��� $1600, $950 �Ǵ� $1300�� �ƴ� ����� �̸�, ������, �޿��� ����Ͻÿ�.
select ename, job, sal
from emp
where job in('CLERK','SALESMAN') and sal not in(1600,950,1300)
;


--15. Ŀ�̼��� $500 �̻��� ����� �̸��� �޿� �� Ŀ�̼��� ����Ͻÿ�.
select ename, sal, comm
from emp
where comm >= 500
;

-----------------------------------------------------------------------------

--TO_CHAR
--DATE -> STR
select sysdate
from dual
;

select sysdate ��¥, TO_CHAR(sysdate, 'YYYY.MM.DD. DAY') as ��ȯ��¥ 
from dual
;

select hiredate, TO_CHAR(hiredate,'YYYY.MM.DD') as "date"
from emp
;

select sysdate ��¥, TO_CHAR(sysdate, 'YYYY.MM.DD. HH24:MI:SS') as ��ȯ��¥2
from dual
;

--NUMBER -> STR : TO_CHAR(����Ÿ��, '����')
select TO_CHAR(10000, 'L000,000.00')
from dual
;
select TO_CHAR(1000000, 'L000,000,000') 
from dual
;

select TO_CHAR(10000, 'L999,999')
from dual
;

select sal, TO_CHAR(sal,'L999,999') as "�� �޿�", TO_CHAR(sal*12+nvl(comm,0), 'L999,999') as "����"
from emp
;

-- TO_DATE(����, 'YYYYMMDD') -> DATE
select ename, hiredate, TO_DATE(19810220, 'YYYYMMDD')
from emp
where hiredate = TO_DATE('1981-02-20', 'YYYY-MM-DD')
;
--TO_NUMBER �Լ� : Ư�� �����͸� ���������� ��ȯ�� �ִ� �Լ� -> ��� ������ �Ϸ��� �������� ���������� ��ȯ�� �Ŀ� �����ؾ� �ϱ� ������ ���.
select TO_NUMBER('300,000', '999,999')- TO_NUMBER('246,424', '999,999')
from dual
;

select sysdate, TO_DATE('1990/10/26', 'YYYY/MM/DD'), trunc(sysdate-TO_DATE('1990/10/26', 'YYYY/MM/DD'))
from dual
;
--NVL �Լ� : NULL���� �� Ư�� ������ ��ȯ���ִ� �Լ� nvl(�÷�, 0) -> null�� ���� ��Ģ������ ���� �� ������� null�� ������ ������ ���.
select ename sal, comm, sal*12+comm, sal*12+nvl(comm, 0) as salComm
from emp
;

--DECODE �Լ� : switch case ���İ� ����
select ename, deptno, 
        decode(deptno,
                    10, 'ACCOUNTING', 
                    20, 'RESEARCH', 
                    30, 'SALES', 
                    40, 'OPERATIONS') as DNAME
from emp
order by deptno asc
;

-- ���޿� ���� �޿��� �λ��ϵ��� ����. ������ 'ANAlYST'�� ����� 5%, 
--'SALESMAN'�� ����� 10%, 'MANAGER'�� ����� 15%, 'CLERK'�� ����� 20%�� �λ��Ѵ�.
select distinct job from emp;
select empno, ename, job, sal, 
        DECODE(JOB,
                'ANALYST', sal*1.05,
                'SALESMAN', sal*1.1,
                'MANAGER', sal*1.15,
                'CLERK', sal*1.2) as upSal          
from emp
;

--CASE �Լ� WHEN:���� THEN:���
select ename, deptno,

                case
                    when deptno=10 then 'ACCOUNTING'
                    when deptno=20 then 'RESERCH'
                    when deptno=30 then 'SALES'
                    when deptno=40 then 'OPERATION' 
                    else 'no name'
                end 
            as dname
from emp
order by deptno
;

