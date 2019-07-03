-- 2019.07.02

-- 테이블의 컬럼들의 도메인 속성을 확인할 수 있다.
-- 데이터 입력 시, 데이터 수정 시
DESC dept;

-- 데이터를 검색하는 명령
-- select {컬럼 이름,....} from 테이블 이름
select * from dept;
select deptno from dept; -- 모든 부서의 부서 번호 리스트
select dname from dept;
select dname, loc, deptno from dept;

-- emp 테이블 확인
DESC EMP; 

-- 전체 컬럼 충격
select * from emp;

-- 사원의 번호, 이름의 리스트
select empno, ename from emp;

-- 컬럼의 사칙연산
select ename, sal from emp;
select sal, comm from emp;
select sal + comm from emp; --null 값에 대한 사칙연산은 정해지지않은 값에 대한 사칙연산이기 때문에 결과값이 null로 나온다. 
                            --즉 이 select에서는 comm을 null값으로 가지고 있는 개체들이 있기 때문에 그 값들은 전부 null로 나온것이다.
select sal, sal + 100 from emp;
select sal, sal - 100 from emp;
select ename, sal, sal * 12 from emp; -- 연봉 확인
select sal, sal / 5 from emp;
select sal, sal * 0.2 from emp;

-- NVL 함수. 특정 컬럼 값이 null일 때 지정한 다른 값으로 변환시켜준다. nvl(특정컬럼, 변환값)
select sal + nvl(comm, 0) from emp;

-- 사원의 연봉과 커미션 합산 총액
select ename, sal, comm, sal*12+comm from emp; -- nvl 안 썼을 때
select ename, sal, comm, sal*12 + nvl(comm,0) from emp; -- nvl 썼을 때
select ename, sal, nvl(comm,0), sal*12, sal*12+nvl(comm,0) from emp;

-- 별칭 부여하기
select ename, sal, nvl(comm,0) AS COMM, sal*12 AS YSAL1, sal*12+nvl(comm,0) as YSAL2 from emp;

-- Concatenation 연산자의 정의, 컬럼과 문자열을 연결하는 결과 출력, sql에서 문자열 표현은 ''로 묶는다.
select ename || ' is a ' || job from emp;
select ename || ' is a ' || job as str from emp;

-- DISTINCT 키워드 : 컬럼값에서 중복되는 값을 제거하고 하나의 데이터만 출력해준다.
select ename, deptno from emp; -- 사원들이 소속되어 있는 부서 목록 모두 출력
select distinct deptno from emp; -- 부서의 목록만 확인 하고 싶을 때, 중복 목록을 제거 한 경우만 보여줄 경우.
select job from emp; -- 회사에 소속된 직업군의 목록, 중복 목록이 포함되어 있다.

select deptno, job from emp;
select  distinct deptno, job from emp;

-- select의 조건절 : select 컬럼명 from 테이블명 where 조건식(true/false);
-- where의 조건은 행을 찾는다. 
select dname 
from dept
where deptno = 10
;

select * from emp where deptno = 10;
select empno, ename, job 
from emp 
where deptno = 10
;

select * from emp where deptno between 10 and 20; -- 부서 번호가 10이상 20이하인 직원 리스트

-- 대소문자 구분 예시
select empno, ename, sal from emp where ename='FORD'; -- where절에서는 대소문자를 구분한다.
select empno, ename, sal from emp where ename='ford'; -- 따라서 ford라는 직원을 찾을 수는 없다.

select *
from emp
where ename = 'scott'
;

select empno, job
from emp
where ename = 'SCOTT'
;

--날짜 검색 : 날짜 데이터를 ''로 묶어준다.
select ename from emp where hiredate = '81-4-02';

select ename, hiredate
from emp
where hiredate between '80/12/17' and '81/5/30'
;

select ename, hiredate
from emp
where hiredate > '81/12/30'
;

--논리 연산자
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
where deptno = 10 or job = 'CLERK' -- 부서 번호가 10 이상이거나 직업이 'CLERK' 이거나 
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

--컬럼명 BETWEEN A AND B 연산자 : A이상 B이하의 범위 연산
select *
from emp
where sal between 2000 and 3000
;

select *
from emp
where sal > 2000 and sal < 3000
;

--범위 연산은 날짜 연산도 가능하다.
select *
from emp
where hiredate between '87/01/01' and '87/12/31'
;

-- in 연산자 : or 조건이 많을 때 편하게 적용가능.
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

--와일드카드(%) : select 컬럼 from 테이블 where 컬럼 like '%' 조건

select * 
from emp
where ename like'%MA%'
;