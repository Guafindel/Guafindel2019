--2019.07.04

--�׷��Լ�

--SUM(�÷�) : �׷��� ���� ���� ��ȯ

--��� ���̺��� ����� �� �޿�(sal)�� ������ ���غ���
select sum(sal) as sumSal
from emp
;

--10�� �μ� �Ҽ� �������� �� �޿� �Ѿ��� ���غ���
select sum(sal)
from emp
where deptno = 10
;

--SUM �Լ����� NULL�� ó�� ��� : NULL ���� �����Ѵ�.
select sum(comm) as sumcomm
from emp
;

select comm
from emp
;

--AVG(�÷�) : �׷쿡 ���Ե� ������ ��հ��� ��ȯ
select avg(Sal)
from emp
;

--�׷��Լ��� ����� �������� �ϳ��� �÷�
select trunc(avg(sal)) as avgsal
from emp
where job= 'MANAGER'
;

select round(avg(sal))
from emp
;

--avg(�÷�) �Լ��� �÷��� ���� null�� �� ������ �����ϴ�. null���� �����ϰ� ó���ϱ� ����.
select avg(comm)
from emp
;

--max(�÷�)�Լ� : �ִ밪 ��ȯ / min(�÷�)�Լ� :  �ּҰ� ��ȯ. max�� min �� �Լ� ��� null���� �־ ���� ����.
select max(sal), min(sal), max(comm), min(comm)
from emp
;

--conunt(�÷�) : row�� ������ ��ȯ�Ѵ�.

--ȸ�翡 �Ҽӵ� ����� ��(null���� �ִ� �÷��� �����ϸ� null���� �����ϰ� count�ϱ� ������ �� ���� �����ؾ� �Ѵ�.
select count(*)
from emp
;

--10�μ��� �Ҽӵ� ���� ��
select count(*)
from emp
where deptno = 10
;

--null���� ���Ե� �÷��� count�Լ��� ��������� ��
select count(comm)
from emp
;

--�μ��� ���� ������.
select count(*)
from dept
;

--������� �Ҽӵ� �μ��� ��
select deptno
from emp
;

select distinct deptno
from emp
;

select count(distinct deptno)
from emp
;

select count(job)
from emp
;

select count(distinct job)
from emp
;

select *
from emp
order by deptno
;

select job, sum(sal)
from emp
group by job
;

--group by �÷��̸� : row�� �׷��� �ؼ� ó��, �����Լ�(sum, avg, count, max, min)�� �Բ� ���밡��
--�÷��̸� -> �׷����� ����
select deptno, count(distinct job), sum(sal), round(avg(sal)), count(*), count(comm), max(sal), min(sal)
from emp
group by deptno
;

--������ ��ǥ�� ��� �غ���.
select job, sum(sal), trunc(avg(sal)), count(*), count(comm), TO_CHAR(sum(sal),'L999,999'), max(sal), min(sal) 
from emp
group by job
;

--HAVING : �׷쿡 ������ ���� �� ����ϴ� ������.

--�μ����� �׷����� �� �μ��� ��� �޿��� 2000�̻��� �μ���ȣ�� �μ��� ��� �޿� ���
select deptno, trunc(avg(sal))
from emp
group by deptno
HAVING avg(sal) >= 2000
;

--�μ��� �ִ밪�� �ּҰ��� ���ϵ� �ִ� �޿��� 2900�̻��� �μ��� ���.
select deptno, max(sal), min(sal)
from emp
group by deptno
having max(sal) >= 2900
;

-------------------------------------------
--JOIN 2�� �̻��� ���̺��� ������ ���δ�. ǥ���ϴ� �÷�
--�� �þ��.

--���̺��� ���δ� CROSS JOIN
select *
from emp, dept
where emp.deptno = dept.deptno
;

select *
from emp e, dept d
where e.deptno = d.deptno
;

--�ֹ����̺��� ȸ���� �̸��� �ֹ� ������ ����غ���.
--orders, customer
select o.orderid, c.name
from orders o ,customer c
where o.custid = c.custid and c.name='������'
;

--customer, book, orders -> 5 x 10 x 10 cross join = 500���� ���´� 
--�̸� �ذ��ϱ� ���ؼ��� o.custid=c.custid / o.bookid=b.bookid�� ���ƾ� �Ѵ�.
--�̰��� �ǹ̴� �ܷ�Ű�� �̿��� �����Ѵٴ� ���̴�.
select *
from orders o, customer c, book b
where o.bookid = b.bookid and c.custid = o.custid
;

--������ ���� �ֹ��� å�� �̸��� ���  -> ������(customer) �ֹ���(orders) å�� �̸�(book) -> ���� ã�� ���� ����
select b.bookname, b.publisher
from orders o, customer c, book b
where o.bookid = b.bookid and c.custid = o.custid and c.name='������'
;

--�⺻Ű�� ���� ������ ���� ������ �������� �ʴ´ٸ� 14���� �ο��� 
--���� sal�� ��� grade 1�� �����Ű�� grade 2�� �����Ű��... 
--�̸� �ݺ��ؼ� grade 5���� ������� �� 70���� ���� ������ �ȴ�.
--���� ������� sal���� losal/hisal�� ���� �񱳸� ������Ѽ�
--���Ͽ� Ư�� ������ ������ ���� �������� ��Ÿ���� �Ͽ���. 
select ename, sal, grade ,losal,hisal
from emp e, salgrade s
where e.sal between s.losal and s.hisal
;

--scott�� ��Ÿ���� �غ��Ҵ�.
select e.ename,e.job, e.sal, s.grade
from emp e, salgrade s
where e.sal between s.losal and s.hisal and e.ename='SCOTT'
;

--self join �Ʒ� ���� king�� null���̶� ����񱳰� �Ұ����ؼ� ���ܵ�
select e.ename || '�� �Ŵ�����' || m.ename || '�Դϴ�.'
from emp e, emp m
where e.mgr = m.empno
order by m.ename
;

select e.empno, e.ename, e.mgr, m.ename
from emp e, emp m
where e.mgr = m.empno(+)
;

--ANSI CROSS JOIN 
select *
from emp cross join dept
;

select *
from emp, dept
;

--ANSI INNER JOIN
select *
from emp INNER JOIN dept
on emp.deptno = dept.deptno
;

select *
from emp JOIN dept
on emp.deptno = dept.deptno
;

select *
from emp e, dept d
where e.deptno = d.deptno
;

-- USING�� �̿��� ���� ���� ����
select *
from emp inner join dept
USING(deptno)
;

--NATURAL�� �̿��� ����
select *
from emp natural join dept
;

--OUTER ����
select e.ename, m.ename
from emp e left outer join emp m
on e.mgr = m.empno
;

select *
from customer
;

select distinct(custid)
from orders
;

select *
from orders o, customer c
where o.custid(+) = c.custid
;

select *
from orders o right outer join customer c
on o.custid= c.custid
;
