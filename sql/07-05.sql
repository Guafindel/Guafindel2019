--2019.07.05

--���� ����

--SCOTT ����� �Ҽӵ� �μ� �̸��� ���
--�䱸 ������ �������� ����� �䱸�ϴ� �κ��� ���������� �ȴ�.
--�� �� ���ǿ����� �μ� �̸� ����� �䱸�ϴ� ���������� dept�� �ȴ�.
--SCOTT ����� �Ҽӵ� -> ����(��������)
select dname
from dept
where deptno = (select deptno 
                from emp
                where ename='SCOTT')
;

select deptno
from emp
where ename = 'SCOTT'
;

--���� �������� �׷� �Լ��� ���
--��� �޿����� �� ���� �޿��� �޴� ����� ���
select ename, sal
from emp
where sal > (select avg(sal)
                from emp)
;

--������������ �׷� �Լ� ���
--����� �߿� ��� �޿����� ���� �޿��� �޴� ����� �̸��� �޿��� ��� -> ��������(emp)
--����� �̸��� �޿��� ��� -> ���� ����
--��� �޿� -> ���� ����
select ename, sal
from emp
where sal > (select round(avg(sal))
             from emp)
;

select round(avg(sal))
from emp
;

--���� �� ��������
--�޿��� 3000 �̻��� ����� �Ҽ� �μ� -> ��������
--�ش� �μ��� �ٹ��ϴ� ����� ����Ʈ - ��������
select ename, sal, deptno
from emp
where deptno in (select distinct deptno
                 from emp
                 where sal >= 3000)
;

select distinct deptno
from emp
where sal >= 3000
;

--ALL ������
--30�� �Ҽ� ����� �߿��� �޿��� ���� ���� �޴� ������� 
--�� ���� �޿��� �޴� -> ����
--����� �̸�, �޿��� ���. -> ����
-- > ALL�� ����� �񱳰� ���� ũ�ġ� �� ���� ���� �ǹǷ�
--�ִ밪���� �� ũ�� ���� �ȴ�.
select ename, sal
from emp
where sal > all(select sal
                from emp
                where deptno=30)
;

select sal
from emp
where deptno=30
;

--ANY ������
--ANY�� ã���� ���� ���ؼ� �ϳ��� ũ�� ���� �Ǵ� ���̴�.
--�׷��Ƿ� ã���� �� �߿��� ���� ���� �� ��, �ּҰ� ���� ũ�� ���̵ȴ�.
select ename, sal
from emp
where sal > ANY(select sal
                from emp
                where deptno=30)
;

--�ζ��� �� : from �� �ڿ� ���������� ��ġ
select *
from (select empno, ename, job, hiredate
      from emp)
;

select empno, ename, job, hiredate
from emp
;

--��Į�� �μ�����
select ename, deptno, (select dname
                       from dept
                       where dept.deptno = emp.deptno)
from emp
order by deptno
;

select dname
from dept, emp
where dept.deptno = emp.deptno
;

----------------------------------------------------------
--DDL
----------------------------------------------------------

--CREATE TABLE : ���̺� ���� (������ ���� ��Ģ�� ����)
--�÷� �̸�, ���� �������� Ÿ��, ���� ������ ������, ��������

--���Ἲ ���� ���ǵ�
--null ����
--�ߺ� ����(unique)
--�⺻��
--üũ
--�⺻Ű 
--�ܷ�Ű

insert into dept 
values(10, 'test', 'seoul')
;

--CREATE TABLE : �÷��� ���� ����
create table emp01 (    --���̺� �̸��� emp01�� �����.
    empno number(4),    --�÷��̸��� empno�� ��������� �����. ����Ÿ��, 4�ڸ�
    ename varchar2(20), --�÷��̸��� ename�� ��������� �����. ��������Ÿ��, ���� 20�ڸ�, �ѱ� 10�ڸ�
    sal number(7,2) --�÷��̸��� sal�� ��������� �����. ����Ÿ��, 7�ڸ�, 7�ڸ� �� �� 2�ڸ��� �Ҽ� �ڸ�
);

--CREATE TABLE : ���� ������ �̿��ϴ� ���

create table emp02 
AS
select * from emp
;

desc emp02;

create table emp03
as
select empno, ename, job, hiredate from emp
;

desc emp03;

--���ϴ� �����θ� ���� ���̺� ����� where���� ���� �߰� 
create table emp04
as 
select * from emp where deptno=20
;

desc emp04;

select * from emp04;

--���̺��� ������ �����ϴ� ��� where���� �׻� false���� ������ ������ �����ϸ� �޾ƿ� �� �ִ� row���� ���� ������ ������ �������� �ȴ�.
create table emp05
as
select * from emp where 1=2
;

select * from emp05;


--���̺� Į�� �߰�
alter table emp03
add(hiredate date)
;

--MemberInfo ���̺� �����
--���̵� : 6~12 �ڸ� ���ڿ�
--��й�ȣ : 8~16�ڸ� ���ڿ�
--�̸� : 10�ڸ� ���ڿ�
--�������(�����̸�) : 30�ڸ� ���ڿ�
--���Գ�¥ : ��¥Ÿ��
--���̵�� ��й�ȣ ������� ���� ���ڿ��� �ѱ��� �ƴ϶� ���� ����������
--�̸��� ���� �ѱ۷� �����ϱ� ������ 10�ڸ� ���ڿ��� 20byte�� ���Ѵ�(20�ڸ�)
create table MemberInfo(
    u_Id varchar2(12),
    u_Pw varchar2(16),
    u_Name varchar2(20),
    u_Photo varchar2(30),
    regDate Date
);

drop table MemberInfo;

--���̺� Į�� �߰��ϱ�
ALTER TABLE EMP01
ADD(JOB VARCHAR2(9));

desc emp01;

--�÷��� ũ�� �����ϱ� MODIFY
alter table emp01
modify(job varchar2(30));

desc emp01;

--���� �÷� �����ϱ� DOP
alter table emp01
drop column job;

desc emp01;

--���̺��� ���� ��ü �����ϱ�
truncate table emp02;

select * from emp02;
desc emp02;

rename emp03 to test;

desc emp03;
desc test;

desc emp02;

--���� ���� ����
create table emp06 (
    empno number(4) not null,
    ename varchar2(20),
    sal number(7,2)
);

desc emp06;

--INSERT INTO ���̺��̸� (�÷�����Ʈ) VALUES(��, ��, ��...)
insert into emp06 (empno,ename) VALUES (null, null);
insert into emp06 (empno,ename) VALUES (2011, null);
select * from emp06;

insert into emp06 (empno,ename) VALUES (2011, 'king');
insert into emp06 (empno,ename) VALUES (2012, 'king');
insert into emp06 (empno,ename,sal) VALUES (2012, 'king','4000');

drop table emp06;

create table emp06 (
    empno number(4) Primary KEY,
    ename varchar2(20) not null,
    sal number(7,2) default 1000,
    grade number(1) check (grade between 1 and 5),
    gender char(1) check (gender IN ('M','W')),
    deptno number(2) REFERENCES dept(deptno)
    --FOREIGN key (deptno) REFERENCES dept(deptno)
)
;

desc emp06;

insert into emp06 values ('1000','king', null, 5, 'M', 40);
insert into emp06 values ('1001','king', null, 3, 'M', 30);

select * from emp06;

create table emp07( 
    empno number(4) constraint emp07_empno_NN not null,
    ename varchar2(10) constraint emp07_empno_NN not null,
    job varchar2(9),
    deptno number(2),
    constraint emp07_empno_pk PRIMARY KEY (empno),
    constraint emp07_job_uq UNIQUE (job),
    constraint emp07_deptno_fk FOREIGN KEY (deptno) REFERENCES dept(deptno)
);

drop table emp07;
select * from emp07;
desc emp07;

--MemberInfo ���̺� �����
--�븮Ű : idx                     -   �⺻Ű
--���̵� : 6~12 �ڸ� ���ڿ�         - not null, unique
--��й�ȣ : 8~16�ڸ� ���ڿ�         - not null
--�̸� : 10�ڸ� ���ڿ�              - not null
--�������(�����̸�) : 30�ڸ� ���ڿ�  - 
--���Գ�¥ : ��¥Ÿ��               - default sysdate

create table MemberInfo (
    idx number(4), 
    mId varchar2(12) constraint MemberInfo_mId_NN not null,
    mPx varchar2(16) constraint MemberInfo_mPw_NN not null,
    mName varchar(20) constraint MemberInfo_mName_NN not null,
    mPhoto varchar(30), 
    regDate Date default sysdate,
    constraint MemberInfo_idx_pk PRIMARY KEY (idx),
    constraint MemberInfo_mId_uk UNIQUE (mId)
);

desc MemberInfo;
drop table MemberInfo;