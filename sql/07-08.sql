--2019.07.08

--SQL�μ�����

--��Į�� �μ� ���� 
--���缭���� ���� �Ǹž��� ���̽ÿ�(����� ���̸��� ���� �Ǹž��� ���).
--�� �̸��� ���� �ѱݾ��� ���.
select custid, (select name 
               from customer 
               where orders.custid = customer.custid) as "�̸�", sum(saleprice) as �����Ѿ�
from orders
group by custid
;

select custid, (select name 
                from customer c
                where c.custid=o.custid) , sum(saleprice)
from orders o
group by custid
;

--JOIN ó��
select *
from orders o, customer c
;

select o.custid, c.name, sum(o.saleprice)
from orders o, customer c
where o.custid = c.custid
group by o.custid, c.name
order by o.custid
;

select c.name, sum(o.saleprice)
from orders o join customer c
on o.custid = c.custid
group by c.name
order by c.name
;

--�ζ��κ�(inline)
--����ȣ�� 2 ������ ���� �Ǹž��� ���̽ÿ�(����� ���̸��� ���� �Ǹž� ���)
select *
from customer
where custid <= 2
;

select c.name, sum(o.saleprice)
from (select *
      from customer  
      where custid <= 2) c, orders o
where c.custid = o.custid
group by c.name
order by c.name
;

--ROWNUM
--����Ŭ���� ���������� �����Ǵ� ���� �÷����� SQL ��ȸ ����� ������ ��Ÿ��.
select rownum, empno, ename
from emp
order by ename
;

--�μ����ǰ� ���� ó���Ǿ��� ������, �� ó���� �Ϳ� ���ؼ� ������� rownum�� �ο��� ��.
select rownum, empno, ename
from (select * from emp order by ename)
where rownum <= 13
;

--��ø���� -WHERE �μ�����

--��� �ֹ��ݾ� ������ �ֹ��� ���ؼ� �ֹ���ȣ�� �ݾ��� ���̽ÿ�.
select avg(saleprice)
from orders
;

--��� �ֹ��ݾ� = 11800

select orderid, saleprice
from orders
where saleprice <= (select avg(saleprice)
                      from orders)
;

--�� ���� ��� �ֹ��ݾ׺��� ū �ݾ��� �ֹ� ������ ���ؼ� 
--�ֹ���ȣ, ����ȣ, �ݾ��� ���̽ÿ�.
select od.orderid, od.custid, od.saleprice
from orders od
where saleprice > (select avg(saleprice)
                  from orders so
                  where od.custid = so.custid)
;

select avg(saleprice)
from orders
where custid = 2
;

select o.saleprice
from orders o join orders s
on o.custid = s.custid
where o.saleprice > s.avg(saleprice)
;

--���ѹα��� �����ϴ� ������ 
--�Ǹ��� ������ ���Ǹž��� ���Ͻÿ�.
select sum(saleprice) as "���ѹα� ���Ǹűݾ�"
from orders
where custid IN (select custid 
                 from customer
                 where address like '���ѹα�%')
;

select address
from customer
;

select sum(saleprice)
from orders o, customer c
where o.custid = c.custid and c.address like ('���ѹα�%')
;

select sum(saleprice)
from orders o join customer c
on o.custid = c.custid
where c.address like ('���ѹα�%')
;

-- ALL �ִ밪 ���� ��, �ּҰ� ���� ��

--3�� ���� �ֹ��� ������ �ְ� �ݾ׺��� �� ��� ������ ������ �ֹ��� �ֹ���ȣ�� �ݾ��� ���
--�ִ� ������ ū �� ã��

select orderid, saleprice
from orders
where saleprice > all (--������, ���Ͽ� ��
                        select saleprice
                        from orders
                        where custid = 3)
;

select orderid, saleprice
from orders
where saleprice >  (select max(saleprice)
                    from orders
                    where custid = 3)
;

select o.orderid, o.saleprice
from orders o join orders s
on o.custid = s.custid  
;

--EXISTS �����ڷ� ���ѹα��� �����ϴ� ������ �Ǹ��� ������ �� �Ǹž��� ���Ͻÿ�.
select sum(saleprice) as "���ѹα� ���Ǹž�"
from orders o
where exists ( select *
             from customer c 
             where o.custid = c.custid and c.address like '���ѹα�%' )
;

-------------------------------------------------------------------------------
--DML 
-------------------------------------------------------------------------------

--������ �Է� : INSERT INTO ���̺� �� (�÷� ����Ʈ) VALUES (�Է� ������ ����Ʈ)
--���̺� ����
drop table dept01;

--���̺� ����(������)
create table dept01
as
select * 
from dept
where 1=2
;

--������ ���̺� Ȯ��
select *
from dept01
;

desc dept01;

--���̺� �� �߰��ϱ�
--�÷��� ������ �Է� �������� ������ ���ƾ� �Ѵ�.
--�÷��� DATA�� Ÿ���� ���ƾ� �Ѵ�.
--�÷����� �����ÿ� ���� �÷� ���̾�� �Ѵ�.
insert into dept01(deptno, dname, loc)
            values(10, 'ACCOUNTING','NEW YORK')
;

--�÷� ����Ʈ ���� ������ �߰��ϱ�(��� �����͸��Է��Ѵٴ� �����Ͽ� ����)
insert into dept01
            values(20, 'RESEARCH', 'DALLAS')
;

--�⺻ �÷� ������ Ȯ���ϱ� ���� ��ɾ�
desc dept;

--null�� ����
--�Ͻ��� null�� ������ ���ؼ��� null���� �ְ��� �ϴ� �÷��� �����ϰ� �ۼ�
insert into dept01(deptno, dname)
            values(30,'SALES')
;

select * from dept01;

--����� null�� �Է��ϱ�
insert into dept01
            values(40,'OPERATIONS',null)
;

select * from dept01;
            
insert into dept01
            values(50, '', null)
;

select * from dept01;

--���������� ������ �����ϱ�
insert into dept01
select * from dept
;

--���̺��� ���� �����ϱ� update
--�������� ���� 
--:UPDATE ���̺� �̸� SET �÷��̸�=���浥����, �÷��̸�=���浥����, ...
--:WHERE �����ϰ��� �ϴ� ���� ã������ ����

--��� ���� �ٲ��ַ��� WHERE���� �����ϸ� �ȴ�.

--WHERE���� �̿��ؼ� Ư�� �ุ �����ϵ��� �ߴ�.
update dept01
set deptno = 15, dname = 'ACCOUNT', loc = 'LASVEGAS'
where deptno = 10
;

drop table emp01;

create table emp01
as
select * 
from emp
;

desc emp01;

select * from emp01;

--��� ���� �ѹ��� �����ϱ�
update emp01
set deptno = 30
;

update emp01
set sal = sal *1.1
;

update emp01
set hiredate=sysdate
;

--WHERE ���� �̿��� Ư������ ������ ����
--�μ���ȣ�� 10���� ����� �μ���ȣ�� 30������ ����
select * from emp01;

update emp01
set deptno=30
where deptno=10
;

--�޿��� 3000�̻��� ����� �޿��� 10% �λ�
update emp01
set sal = sal*1.1
where sal >= 3000
;

--1987�⿡ �Ի��� ����� �Ի����� ���÷� �����սô�.
--����� �Ի����� ���÷� ������ �Ŀ� ���̺� ������ ���캾�ô�.
update emp01
set hiredate = sysdate
where hiredate like '%1987%'
;

update emp01
set hiredate = sysdate
where hiredate like '82%'
;

update emp01
set hiredate = sysdate
where substr(hiredate, 1, 2) = '87'
;

select * from emp01;

--SCOTT �����
--�μ���ȣ�� 20������, ������ MANAGER�� �Ѳ����� �����ϵ��� �սô�.

update emp01
set deptno=20, job='MANAGER'
where ename ='SCOTT'
;

--SCOTT �����
--�Ի����ڴ� ���÷�, �޿��� 50���� Ŀ�̼��� 4000���� �����սô�.
update emp01
set hiredate = sysdate, sal = 50, comm=4000
where ename='SCOTT'
;

select * from dept01;

drop table dept01;

create table dept01
as
select *
from dept
;

select * from dept01;

--20�� �μ���
--�������� 40�� �μ��� ���������� �����ϱ� ���ؼ� ������������ ����� ���ô�
update dept01
set loc = (select loc  --��Į�� �μ�����:������/���Ͽ�.
           from dept01
           where deptno=40)
where deptno = 20
;

update dept01
set (dname, loc) = (select dname,loc
                    from dept
                    where deptno=40)
where deptno = 10
;

select * from dept01;

--������ ���� : DELETE FROM ���̺� �̸� WHERE ����
--���ǿ� �ش��ϴ� ���� ����
delete 
from dept01
where deptno = 30
;

--��ü ���� ���� : WHERE���� ���� ���� �ϸ� ��ü ����.
delete from dept01;

select * from dept01;

--Ư�� ���� ���� �Ѵ�. where������ Ư������ ã�� ������ ���

insert into dept01
select * 
from dept
;

delete from dept01
where loc = 'BOSTON'
;

select * from dept01;

desc memberinfo;

--VIEW : ����ڿ��� �����ִ� ���� ���̺� (Ư�� �÷��� �����ϰų� ������ sql���� ����ȭ ��Ų��.)
--VIEW ���� : CREATE VIEW �� �̸� AS ��������(table)

select empno, ename, deptno 
from emp 
where deptno = 30
;

create view emp_view30 
as 
select empno, ename, deptno
from emp
where deptno = 30
;

--������ Ȯ���ϱ����� ó���ߴ� ��ɹ��� ��� �ۼ��� ��ɹ� ��
select * from emp_view30;
select empno, ename, deptno from emp where deptno = 30;

--�ζ��� ��
--��� �߿��� 
--�Ի����� ���� ��� 5��(TOP-5)���� ��� ���� ���ǹ��� �ۼ��� ���ô�.

select rownum, empno, ename, hiredate
from emp
order by hiredate
;

select rownum, empno, ename, hiredate
from (select empno, ename, hiredate
      from emp
      order by hiredate)
where rownum <= 5
order by hiredate
;

-------------------------------------------------

create or replace view emp_view_hd
as
select empno, ename, hiredate
from emp
order by hiredate
;


select rownum, empno, ename, hiredate
from emp_view_hd
where rownum <= 5
order by hiredate
;

------------------------------------------------------------------
--SEQUENCE : �ڵ� ���� ����ó�����ִ� ��ü
------------------------------------------------------------------
create sequence test_seq
start with 10
increment by 10
;

drop sequence test_seq;

select test_seq.nextval from dual;

select test_seq.currval from dual;

desc dept01;
select * from dept01;

insert into dept01
values(40,'OPERATION', 'BOSTON');

insert into dept01
values(test_seq.nextval, 'DESIGN', 'SEOUL');

truncate table dept01;

