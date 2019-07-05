--2019.07.05

--서브 쿼리

--SCOTT 사원이 소속된 부서 이름을 출력
--요구 조건의 마지막에 출력을 요구하는 부분이 메인쿼리가 된다.
--즉 이 조건에서는 부서 이름 출력을 요구하니 메인쿼리는 dept가 된다.
--SCOTT 사원이 소속된 -> 조건(서브쿼리)
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

--서브 쿼리에서 그룹 함수의 사용
--평균 급여보다 더 많은 급여를 받는 사원을 출력
select ename, sal
from emp
where sal > (select avg(sal)
                from emp)
;

--서브쿼리에서 그룹 함수 사용
--사원들 중에 평균 급여보다 많은 급여를 받는 사원의 이름과 급여를 출력 -> 메인쿼리(emp)
--사원의 이름과 급여를 출력 -> 메인 쿼리
--평균 급여 -> 서브 쿼리
select ename, sal
from emp
where sal > (select round(avg(sal))
             from emp)
;

select round(avg(sal))
from emp
;

--다중 행 서브쿼리
--급여가 3000 이상인 사원의 소속 부서 -> 서브쿼리
--해당 부서에 근무하는 사원의 리스트 - 메인쿼리
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

--ALL 연산자
--30번 소속 사원들 중에서 급여를 가장 많이 받는 사원보다 
--더 많은 급여를 받는 -> 서브
--사람의 이름, 급여를 출력. -> 메인
-- > ALL은 “모든 비교값 보다 크냐” 고 묻는 것이 되므로
--최대값보다 더 크면 참이 된다.
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

--ANY 연산자
--ANY는 찾아진 값에 대해서 하나라도 크면 참이 되는 셈이다.
--그러므로 찾아진 값 중에서 가장 작은 값 즉, 최소값 보다 크면 참이된다.
select ename, sal
from emp
where sal > ANY(select sal
                from emp
                where deptno=30)
;

--인라인 뷰 : from 절 뒤에 서브쿼리가 위치
select *
from (select empno, ename, job, hiredate
      from emp)
;

select empno, ename, job, hiredate
from emp
;

--스칼라 부속질의
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

--CREATE TABLE : 테이블 생성 (데이터 저장 규칙을 정의)
--컬럼 이름, 저장 데이터의 타입, 저장 데이터 사이즈, 제약조건

--무결성 제약 조건들
--null 유무
--중복 여부(unique)
--기본값
--체크
--기본키 
--외래키

insert into dept 
values(10, 'test', 'seoul')
;

--CREATE TABLE : 컬럼을 직접 설정
create table emp01 (    --테이블 이름은 emp01로 만든다.
    empno number(4),    --컬럼이름이 empno인 저장공간을 만든다. 숫자타입, 4자리
    ename varchar2(20), --컬럼이름이 ename인 저장공간을 만든다. 가변문자타입, 영문 20자리, 한글 10자리
    sal number(7,2) --컬럼이름이 sal인 저장공간을 만든다. 숫자타입, 7자리, 7자리 중 뒤 2자리는 소수 자리
);

--CREATE TABLE : 서브 쿼리를 이용하는 방법

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

--원하는 행으로만 복제 테이블 만들기 where절로 조건 추가 
create table emp04
as 
select * from emp where deptno=20
;

desc emp04;

select * from emp04;

--테이블의 구조만 복사하는 방법 where절에 항상 false값이 나오는 조건을 지정하면 받아올 수 있는 row값이 없기 때문에 구조만 가져오게 된다.
create table emp05
as
select * from emp where 1=2
;

select * from emp05;


--테이블에 칼럼 추가
alter table emp03
add(hiredate date)
;

--MemberInfo 테이블 만들기
--아이디 : 6~12 자리 문자열
--비밀번호 : 8~16자리 문자열
--이름 : 10자리 문자열
--사진경로(파일이름) : 30자리 문자열
--가입날짜 : 날짜타입
--아이디와 비밀번호 사진경로 등은 문자열이 한글이 아니란 것을 가정하지만
--이름의 경우는 한글로 가정하기 때문에 10자리 문자열은 20byte를 뜻한다(20자리)
create table MemberInfo(
    u_Id varchar2(12),
    u_Pw varchar2(16),
    u_Name varchar2(20),
    u_Photo varchar2(30),
    regDate Date
);

drop table MemberInfo;

--테이블에 칼럼 추가하기
ALTER TABLE EMP01
ADD(JOB VARCHAR2(9));

desc emp01;

--컬럼의 크기 변경하기 MODIFY
alter table emp01
modify(job varchar2(30));

desc emp01;

--기존 컬럼 삭제하기 DOP
alter table emp01
drop column job;

desc emp01;

--테이블의 내용 전체 제거하기
truncate table emp02;

select * from emp02;
desc emp02;

rename emp03 to test;

desc emp03;
desc test;

desc emp02;

--제약 조건 적용
create table emp06 (
    empno number(4) not null,
    ename varchar2(20),
    sal number(7,2)
);

desc emp06;

--INSERT INTO 테이블이름 (컬럼리스트) VALUES(값, 값, 값...)
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

--MemberInfo 테이블 만들기
--대리키 : idx                     -   기본키
--아이디 : 6~12 자리 문자열         - not null, unique
--비밀번호 : 8~16자리 문자열         - not null
--이름 : 10자리 문자열              - not null
--사진경로(파일이름) : 30자리 문자열  - 
--가입날짜 : 날짜타입               - default sysdate

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