-- 2019.07.02

-- ���̺��� �÷����� ������ �Ӽ��� Ȯ���� �� �ִ�.
-- ������ �Է� ��, ������ ���� ��
DESC dept;

-- �����͸� �˻��ϴ� ���
-- select {�÷� �̸�,....} from ���̺� �̸�
select * from dept;
select deptno from dept; -- ��� �μ��� �μ� ��ȣ ����Ʈ
select dname from dept;
select dname, loc, deptno from dept;

-- emp ���̺� Ȯ��
DESC EMP; 

-- ��ü �÷� ���
select * from emp;

-- ����� ��ȣ, �̸��� ����Ʈ
select empno, ename from emp;

-- �÷��� ��Ģ����
select ename, sal from emp;
select sal, comm from emp;
select sal + comm from emp; --null ���� ���� ��Ģ������ ������������ ���� ���� ��Ģ�����̱� ������ ������� null�� ���´�. 
                            --�� �� select������ comm�� null������ ������ �ִ� ��ü���� �ֱ� ������ �� ������ ���� null�� ���°��̴�.
select sal, sal + 100 from emp;
select sal, sal - 100 from emp;
select ename, sal, sal * 12 from emp; -- ���� Ȯ��
select sal, sal / 5 from emp;
select sal, sal * 0.2 from emp;

-- NVL �Լ�. Ư�� �÷� ���� null�� �� ������ �ٸ� ������ ��ȯ�����ش�. nvl(Ư���÷�, ��ȯ��)
select sal + nvl(comm, 0) from emp;

-- ����� ������ Ŀ�̼� �ջ� �Ѿ�
select ename, sal, comm, sal*12+comm from emp; -- nvl �� ���� ��
select ename, sal, comm, sal*12 + nvl(comm,0) from emp; -- nvl ���� ��
select ename, sal, nvl(comm,0), sal*12, sal*12+nvl(comm,0) from emp;

-- ��Ī �ο��ϱ�
select ename, sal, nvl(comm,0) AS COMM, sal*12 AS YSAL1, sal*12+nvl(comm,0) as YSAL2 from emp;

-- Concatenation �������� ����, �÷��� ���ڿ��� �����ϴ� ��� ���, sql���� ���ڿ� ǥ���� ''�� ���´�.
select ename || ' is a ' || job from emp;
select ename || ' is a ' || job as str from emp;

-- DISTINCT Ű���� : �÷������� �ߺ��Ǵ� ���� �����ϰ� �ϳ��� �����͸� ������ش�.
select ename, deptno from emp; -- ������� �ҼӵǾ� �ִ� �μ� ��� ��� ���
select distinct deptno from emp; -- �μ��� ��ϸ� Ȯ�� �ϰ� ���� ��, �ߺ� ����� ���� �� ��츸 ������ ���.
select job from emp; -- ȸ�翡 �Ҽӵ� �������� ���, �ߺ� ����� ���ԵǾ� �ִ�.

select deptno, job from emp;
select  distinct deptno, job from emp;

-- select�� ������ : select �÷��� from ���̺�� where ���ǽ�(true/false);
-- where�� ������ ���� ã�´�. 
select dname 
from dept
where deptno = 10
;

select * from emp where deptno = 10;
select empno, ename, job 
from emp 
where deptno = 10
;

select * from emp where deptno between 10 and 20; -- �μ� ��ȣ�� 10�̻� 20������ ���� ����Ʈ

-- ��ҹ��� ���� ����
select empno, ename, sal from emp where ename='FORD'; -- where�������� ��ҹ��ڸ� �����Ѵ�.
select empno, ename, sal from emp where ename='ford'; -- ���� ford��� ������ ã�� ���� ����.

select *
from emp
where ename = 'scott'
;

select empno, job
from emp
where ename = 'SCOTT'
;

--��¥ �˻� : ��¥ �����͸� ''�� �����ش�.
select ename from emp where hiredate = '81-4-02';

select ename, hiredate
from emp
where hiredate between '80/12/17' and '81/5/30'
;

select ename, hiredate
from emp
where hiredate > '81/12/30'
;

--�� ������
--and
select *
from emp
where deptno = 20 and job = 'CLERK'
;

select *
from emp
where deptno = 10 and job = 'MANAGER'
;

select *
from emp
where deptno = 10 or job = 'CLERK' -- �μ� ��ȣ�� 10 �̻��̰ų� ������ 'CLERK' �̰ų� 
;

select *
from emp
where deptno IN(10,20,30)
;

select *
from emp
where not deptno=10
;

select *
from emp
where deptno <> 10
;

--�÷��� BETWEEN A AND B ������ : A�̻� B������ ���� ����
select *
from emp
where sal between 2000 and 3000
;

select *
from emp
where sal > 2000 and sal < 3000
;

--���� ������ ��¥ ���굵 �����ϴ�.
select *
from emp
where hiredate between '87/01/01' and '87/12/31'
;

-- in ������ : or ������ ���� �� ���ϰ� ���밡��.
select *
from emp
where comm in (300,500,1400)
;

select *
from emp
where job IN ('SALESMAN','CLERK')
;

select *
from emp
where comm in (300,500,1400)
;

--���ϵ�ī��(%) : select �÷� from ���̺� where �÷� like '%' ����

select * 
from emp
where ename like'%MA%'
;