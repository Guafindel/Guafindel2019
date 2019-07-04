--2019.07.04

--그룹함수

--SUM(컬럼) : 그룹의 합을 구해 반환

--사원 테이블에서 사원의 월 급여(sal)의 총합을 구해보자
select sum(sal) as sumSal
from emp
;

--10번 부서 소속 직원들의 월 급여 총액을 구해보자
select sum(sal)
from emp
where deptno = 10
;

--SUM 함수에서 NULL값 처리 방식 : NULL 값은 무시한다.
select sum(comm) as sumcomm
from emp
;

select comm
from emp
;

--AVG(컬럼) : 그룹에 포함된 값들의 평균값을 반환
select avg(Sal)
from emp
;

--그룹함수의 결과는 단일행의 하나의 컬럼
select trunc(avg(sal)) as avgsal
from emp
where job= 'MANAGER'
;

select round(avg(sal))
from emp
;

--avg(컬럼) 함수도 컬럼의 값이 null일 때 연산이 가능하다. null값을 제외하고 처리하기 때문.
select avg(comm)
from emp
;

--max(컬럼)함수 : 최대값 반환 / min(컬럼)함수 :  최소값 반환. max와 min 두 함수 모두 null값이 있어도 연산 가능.
select max(sal), min(sal), max(comm), min(comm)
from emp
;

--conunt(컬럼) : row의 개수를 반환한다.

--회사에 소속된 사원의 수(null값이 있는 컬럼을 선택하면 null값을 제외하고 count하기 때문에 이 점을 유의해야 한다.
select count(*)
from emp
;

--10부서의 소속된 직원 수
select count(*)
from emp
where deptno = 10
;

--null값이 포함된 컬럼에 count함수를 적용시켰을 때
select count(comm)
from emp
;

--부서의 수를 구하자.
select count(*)
from dept
;

--사원들이 소속된 부서의 수
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

--group by 컬럼이름 : row를 그룹핑 해서 처리, 집합함수(sum, avg, count, max, min)와 함께 적용가능
--컬럼이름 -> 그룹핑의 기준
select deptno, count(distinct job), sum(sal), round(avg(sal)), count(*), count(comm), max(sal), min(sal)
from emp
group by deptno
;

--직무별 지표를 출력 해보자.
select job, sum(sal), trunc(avg(sal)), count(*), count(comm), TO_CHAR(sum(sal),'L999,999'), max(sal), min(sal) 
from emp
group by job
;

--HAVING : 그룹에 조건을 넣을 때 사용하는 조건절.

--부서별로 그룹지은 후 부서별 평균 급여가 2000이상인 부서번호와 부서별 평균 급여 출력
select deptno, trunc(avg(sal))
from emp
group by deptno
HAVING avg(sal) >= 2000
;

--부서의 최대값과 최소값을 구하되 최대 급여가 2900이상인 부서만 출력.
select deptno, max(sal), min(sal)
from emp
group by deptno
having max(sal) >= 2900
;

-------------------------------------------
--JOIN 2개 이상의 테이블을 옆으로 붙인다. 표현하는 컬럼
--이 늘어난다.

--테이블을 붙인다 CROSS JOIN
select *
from emp, dept
where emp.deptno = dept.deptno
;

select *
from emp e, dept d
where e.deptno = d.deptno
;

--주문테이블에서 회원의 이름과 주문 정보를 출력해보자.
--orders, customer
select o.orderid, c.name
from orders o ,customer c
where o.custid = c.custid and c.name='박지성'
;

--customer, book, orders -> 5 x 10 x 10 cross join = 500개가 나온다 
--이를 해결하기 위해서는 o.custid=c.custid / o.bookid=b.bookid가 같아야 한다.
--이것의 의미는 외래키를 이용해 참조한다는 것이다.
select *
from orders o, customer c, book b
where o.bookid = b.bookid and c.custid = o.custid
;

--박지성 고객이 주문한 책의 이름을 출력  -> 박지성(customer) 주문한(orders) 책의 이름(book) -> 행을 찾기 위한 조건
select b.bookname, b.publisher
from orders o, customer c, book b
where o.bookid = b.bookid and c.custid = o.custid and c.name='박지성'
;

--기본키가 없기 때문에 따로 범위를 지정하지 않는다면 14명의 인원이 
--지닌 sal이 모두 grade 1에 적용시키고 grade 2에 적용시키고... 
--이를 반복해서 grade 5까지 적용시켜 총 70개의 행이 나오게 된다.
--따라서 사원들의 sal값과 losal/hisal의 범위 비교를 적용시켜서
--비교하여 특정 조건을 만족할 때만 조건절로 나타내게 하였다. 
select ename, sal, grade ,losal,hisal
from emp e, salgrade s
where e.sal between s.losal and s.hisal
;

--scott만 나타내게 해보았다.
select e.ename,e.job, e.sal, s.grade
from emp e, salgrade s
where e.sal between s.losal and s.hisal and e.ename='SCOTT'
;

--self join 아래 경우는 king이 null값이라 동등비교가 불가능해서 제외됨
select e.ename || '의 매니저는' || m.ename || '입니다.'
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

-- USING을 이용한 조인 조건 지정
select *
from emp inner join dept
USING(deptno)
;

--NATURAL을 이용한 조인
select *
from emp natural join dept
;

--OUTER 조인
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
