--2019.07.08

--SQL부속질의

--스칼라 부속 질의 
--마당서점의 고객별 판매액을 보이시오(결과는 고객이름과 고객별 판매액을 출력).
--고객 이름별 구매 총금액을 출력.
select custid, (select name 
               from customer 
               where orders.custid = customer.custid) as "이름", sum(saleprice) as 구매총액
from orders
group by custid
;

select custid, (select name 
                from customer c
                where c.custid=o.custid) , sum(saleprice)
from orders o
group by custid
;

--JOIN 처리
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

--인라인뷰(inline)
--고객번호가 2 이하인 고객의 판매액을 보이시오(결과는 고객이름과 고객별 판매액 출력)
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
--오라클에서 내부적으로 생성되는 가상 컬럼으로 SQL 조회 결과의 순번을 나타냄.
select rownum, empno, ename
from emp
order by ename
;

--부속질의가 먼저 처리되었기 때문에, 그 처리된 것에 대해서 순차대로 rownum을 부여된 것.
select rownum, empno, ename
from (select * from emp order by ename)
where rownum <= 13
;

--중첩질의 -WHERE 부속질의

--평균 주문금액 이하의 주문에 대해서 주문번호와 금액을 보이시오.
select avg(saleprice)
from orders
;

--평균 주문금액 = 11800

select orderid, saleprice
from orders
where saleprice <= (select avg(saleprice)
                      from orders)
;

--각 고객의 평균 주문금액보다 큰 금액의 주문 내역에 대해서 
--주문번호, 고객번호, 금액을 보이시오.
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

--대한민국에 거주하는 고객에게 
--판매한 도서의 총판매액을 구하시오.
select sum(saleprice) as "대한민국 총판매금액"
from orders
where custid IN (select custid 
                 from customer
                 where address like '대한민국%')
;

select address
from customer
;

select sum(saleprice)
from orders o, customer c
where o.custid = c.custid and c.address like ('대한민국%')
;

select sum(saleprice)
from orders o join customer c
on o.custid = c.custid
where c.address like ('대한민국%')
;

-- ALL 최대값 기준 비교, 최소값 기준 비교

--3번 고객이 주문한 도서의 최고 금액보다 더 비싼 도서를 구입한 주문의 주문번호와 금액을 출력
--최대 값보다 큰 값 찾기

select orderid, saleprice
from orders
where saleprice > all (--다중행, 단일열 비교
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

--EXISTS 연산자로 대한민국에 거주하는 고객에게 판매한 도서의 총 판매액을 구하시오.
select sum(saleprice) as "대한민국 총판매액"
from orders o
where exists ( select *
             from customer c 
             where o.custid = c.custid and c.address like '대한민국%' )
;

-------------------------------------------------------------------------------
--DML 
-------------------------------------------------------------------------------

--데이터 입력 : INSERT INTO 테이블 명 (컬럼 리스트) VALUES (입력 데이터 리스트)
--테이블 삭제
drop table dept01;

--테이블 생성(구조만)
create table dept01
as
select * 
from dept
where 1=2
;

--생성한 테이블 확인
select *
from dept01
;

desc dept01;

--테이블에 행 추가하기
--컬럼의 개수와 입력 데이터의 개수는 같아야 한다.
--컬럼과 DATA의 타입이 같아야 한다.
--컬럼명은 생성시에 만든 컬럼 명이어야 한다.
insert into dept01(deptno, dname, loc)
            values(10, 'ACCOUNTING','NEW YORK')
;

--컬럼 리스트 없이 데이터 추가하기(모든 데이터를입력한다는 가정하에 가능)
insert into dept01
            values(20, 'RESEARCH', 'DALLAS')
;

--기본 컬럼 순서를 확인하기 위한 명령어
desc dept;

--null값 삽입
--암시적 null값 삽입을 위해서는 null값을 넣고자 하는 컬럼을 제외하고 작성
insert into dept01(deptno, dname)
            values(30,'SALES')
;

select * from dept01;

--명시적 null값 입력하기
insert into dept01
            values(40,'OPERATIONS',null)
;

select * from dept01;
            
insert into dept01
            values(50, '', null)
;

select * from dept01;

--서브쿼리로 데이터 삽입하기
insert into dept01
select * from dept
;

--테이블의 내용 수정하기 update
--데이터의 수정 
--:UPDATE 테이블 이름 SET 컬럼이름=변경데이터, 컬럼이름=변경데이터, ...
--:WHERE 변경하고자 하는 행을 찾기위한 조건

--모든 행을 바꿔주려면 WHERE절을 생략하면 된다.

--WHERE절을 이용해서 특정 행만 변경하도록 했다.
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

--모든 행을 한번에 수정하기
update emp01
set deptno = 30
;

update emp01
set sal = sal *1.1
;

update emp01
set hiredate=sysdate
;

--WHERE 절을 이용한 특정행의 데이터 변경
--부서번호가 10번인 사원의 부서번호를 30번으로 수정
select * from emp01;

update emp01
set deptno=30
where deptno=10
;

--급여가 3000이상인 사원만 급여를 10% 인상
update emp01
set sal = sal*1.1
where sal >= 3000
;

--1987년에 입사한 사원의 입사일을 오늘로 수정합시다.
--사원의 입사일을 오늘로 수정한 후에 테이블 내용을 살펴봅시다.
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

--SCOTT 사원의
--부서번호는 20번으로, 직급은 MANAGER로 한꺼번에 수정하도록 합시다.

update emp01
set deptno=20, job='MANAGER'
where ename ='SCOTT'
;

--SCOTT 사원의
--입사일자는 오늘로, 급여를 50으로 커미션을 4000으로 수정합시다.
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

--20번 부서의
--지역명을 40번 부서의 지역명으로 변경하기 위해서 서브쿼리문을 사용해 봅시다
update dept01
set loc = (select loc  --스칼라 부속질의:단일행/단일열.
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

--데이터 삭제 : DELETE FROM 테이블 이름 WHERE 조건
--조건에 해당하는 행을 삭제
delete 
from dept01
where deptno = 30
;

--전체 행을 삭제 : WHERE절로 조건 없이 하면 전체 삭제.
delete from dept01;

select * from dept01;

--특정 행을 삭제 한다. where절에서 특정행을 찾는 조건을 기술

insert into dept01
select * 
from dept
;

delete from dept01
where loc = 'BOSTON'
;

select * from dept01;

desc memberinfo;

--VIEW : 사용자에게 보여주는 가상 테이블 (특정 컬럼을 제외하거나 복장한 sql문을 간소화 시킨다.)
--VIEW 생성 : CREATE VIEW 뷰 이름 AS 서브쿼리(table)

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

--기존의 확인하기위해 처리했던 명령문과 뷰로 작성한 명령문 비교
select * from emp_view30;
select empno, ename, deptno from emp where deptno = 30;

--인라인 뷰
--사원 중에서 
--입사일이 빠른 사람 5명(TOP-5)만을 얻어 오는 질의문을 작성해 봅시다.

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
--SEQUENCE : 자동 숫자 증가처리해주는 객체
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

