--2019.07.03

--LIKE : 문자 패턴검색 연산자 키워드
--컬러명 LIKE 패턴
--패턴 : % _ (와일드카드)

--% 패턴을 이용
--사원테이블에서 'S'로 시작하는 사원의 이름을 검색하자
select ename
from emp
where ename like 'S%'
;

--'S'로 끝나는 이름을 가진 사원 검색
select ename
from emp
where ename like '%S'
;

--사원의 이름에 S를 포함하는 이름을 가진 사원 검색
select *
from emp
where ename like '%S%'
;

--두번째 글자가 D인 사원 검색
select *
from emp
where ename like '_D%'
;

-- _ 연산자는 문자의 자리(위치) 고정을 의미 : 해당 자리에는 어떠한 값이 와도 상관이 없으나 한 자리 글자여야만 한다.
-- _A 앞자리 문자는 어떠한 문자여도 무관, 두번째 문자는 반드시 A여야 한다.
-- _A_ 두번째 글자는 무조건 A여야만 하고 세 자리 글자여야 한다.
-- 사원의 이름중에 두번째 문자에 'A'를 포함하는 이름의 사원

select *
from emp
where ename like '_A%'
;

--이름이 네 자리 글자를 가지고 있는 직원의 이름
select *
from emp
where ename like '____'
;

--사원의 이름중 'A'를 포함하지 않는 사원들을 검색
select *
from emp
where ename not like '%A%'
;

-- IS NULL과 IS NOT NULL 연산자 
select *
from emp
where comm = null
;
-- null의 경우에는 단순 연산자(=, >, <, <=, >=)들은 비교가 불가능하여 결과값을 나타내지 못한다. 따라서 IS NULL과 IS NOT NULL을 이용해야 한다.

--comm이 null인 사원들 목록
SELECT *
FROM EMP
WHERE comm IS NULL
;

--comm이 null이 아닌 사원들 목록
select *
from emp
where comm is not null
;

--comm이 null이 아니고 0도 아닌 사원 목록
select *
from emp
where not (comm is null or comm = 0)
;

--comm이 null이 아니며 0 보다 큰 사원 목록
select *
from emp
where comm is not null and comm > 0
;

--order by 정렬기준 :  asc -> 오름차순(숫자: 낮은것부터 높은 순으로, 문자: 사전 순서대로 a부터 z까지, null은 아래로) 
--order by 정렬기준 : dbsc -> 내림차순(숫자: 높은것부터 낮은 순으로, 문자: 사전 순서대로 z부터 a까지, null은 위로)
select *
from emp
order by comm asc
;

select *
from emp
order by comm desc
;

-- 결과 테이블의 로우(행) 정렬
--order by 컬럼명 [asc]/desc, 컬럼명 [asc]/desc

--급여가 작은 사원부터 급여가 많은 사원 순으로 정렬. 정렬의 경우 default값이 asc(오름차순)이기때문에 asc를 쓰지 않아도 자동으로 오름차순 정렬이 된다.
select *
from emp
order by sal --asc
;

--급여가 많은 사원부터 급여가 작은 사원 순으로 정렬
select *
from emp
order by sal desc
;

--최근 입사한 사원 순으로 사원의 리스트 출력
select *
from emp
order by hiredate desc
;

--급여가 많은 사람 순으로 정렬, 급여가 같은 사원의 경우 이름 순으로 정렬(날짜로도 정렬이 가능)
select ename, sal, hiredate
from emp
order by sal desc, ename asc --hiredate asc
;

--EMP 테이블과 DEPT 테이블을 이용해서 문제 풀이

--1. 덧셈연산자를 이용하여 모든 사원에 대해서 $300의 급여 인상을 계산한 후 사원의 이름, 급여, 인상된 급여를 출력하시오.
select ename, sal, sal + 300 as addsal
from emp
;


--2. 사원의 이름, 급여, 연간 총 수입을 총 수입이 많은 것부터 작은 순으로 출력하시오, 연간 총수입은 월급에 12를 곱한 후 $100의 상여금을 더해서 계산하시오.
select ename, sal, sal*12+100 as addsal
from emp
order by (sal*12+100) desc
;


--3. 급여가 2000을 넘는 사원의 이름과 급여를 표현, 급여가 많은 것부터 작은 순으로 출력하시오.
select ename, sal
from emp
where sal > 2000
order by sal desc
;


--4. 사원번호가 7788인 사원의 이름과 부서번호를 출력하시오.
select ename, empno
from emp
where empno = 7788
;


--5. 급여가 2000에서 3000 사이에 포함되지 않는 사원의 이름과 급여를 출력하시오.
select ename, sal
from emp
where not sal between 2000 and 3000 
;


--6. 1981년 2월 20일 부터 1981년 5월 1일 사이에 입사한 사원의 이름, 담당업무, 입사일을 출력하시오.
select ename, job, hiredate
from emp
where hiredate between '81/02/20' and '81/05/01'
;


--7. 부서번호가 20 및 30에 속한 사원의 이름과 부서번호를 출력, 이름을 기준(내림차순)으로 영문자순으로 출력하시오.
select ename, deptno
from emp
where deptno in(20,30)
order by ename desc
;

--8. 사원의 급여가 2000에서 3000사이에 포함되고 부서번호가 20 또는 30인 사원의 이름, 급여와 부서번호를 출력, 이름순(오름차순)으로 출력하시오.
select ename, sal, deptno
from emp
where sal between 2000 and 3000
order by ename asc
;


--9. 1981년도에 입사한 사원의 이름과 입사일을 출력하시오. (like 연산자와 와일드카드 사용)
select ename, hiredate
from emp
where hiredate like ('81/__/__')
;

--10. 관리자가 없는 사원의 이름과 담당 업무를 출력하시오.
select ename, job
from emp
where mgr is null
;

--11. 커미션을 받을 수 있는 자격이 되는 사원의 이름, 급여, 커미션을 출력하되 급여 및 커미션을 기준으로 내림차순 정렬하여 표시하시오.
select ename, sal, comm
from emp
where comm is not null and comm > 0
order by sal desc, comm desc --comm desc --desc, comm desc
;


--12. 이름의 세번째 문자가 R인 사원의 이름을 표시하시오.
select ename
from emp
where ename like ('__R%')
;


--13. 이름에 A와 E를 모두 포함하고 있는 사원의 이름을 표시하시오.
select ename
from emp
where ename like '%A%' and ename like '%E%'
--where ename like '%A%, %E%'
;


--14. 담당업무가 CLERK, 또는 SALESMAN이면서 급여가 $1600, $950 또는 $1300이 아닌 사원의 이름, 담당업무, 급여를 출력하시오.
select ename, job, sal
from emp
where job in('CLERK','SALESMAN') and sal not in(1600,950,1300)
;


--15. 커미션이 $500 이상인 사원의 이름과 급여 및 커미션을 출력하시오.
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

select sysdate 날짜, TO_CHAR(sysdate, 'YYYY.MM.DD. DAY') as 변환날짜 
from dual
;

select hiredate, TO_CHAR(hiredate,'YYYY.MM.DD') as "date"
from emp
;

select sysdate 날짜, TO_CHAR(sysdate, 'YYYY.MM.DD. HH24:MI:SS') as 변환날짜2
from dual
;

--NUMBER -> STR : TO_CHAR(숫자타입, '패턴')
select TO_CHAR(10000, 'L000,000.00')
from dual
;
select TO_CHAR(1000000, 'L000,000,000') 
from dual
;

select TO_CHAR(10000, 'L999,999')
from dual
;

select sal, TO_CHAR(sal,'L999,999') as "월 급여", TO_CHAR(sal*12+nvl(comm,0), 'L999,999') as "연봉"
from emp
;

-- TO_DATE(원본, 'YYYYMMDD') -> DATE
select ename, hiredate, TO_DATE(19810220, 'YYYYMMDD')
from emp
where hiredate = TO_DATE('1981-02-20', 'YYYY-MM-DD')
;
--TO_NUMBER 함수 : 특정 데이터를 숫자형으로 변환해 주는 함수 -> 산술 연산을 하려면 문자형을 숫자형으로 변환한 후에 실행해야 하기 때문에 사용.
select TO_NUMBER('300,000', '999,999')- TO_NUMBER('246,424', '999,999')
from dual
;

select sysdate, TO_DATE('1990/10/26', 'YYYY/MM/DD'), trunc(sysdate-TO_DATE('1990/10/26', 'YYYY/MM/DD'))
from dual
;
--NVL 함수 : NULL값일 때 특정 값으로 변환해주는 함수 nvl(컬럼, 0) -> null일 때는 사칙연산을 했을 시 결과값이 null로 나오기 때문에 사용.
select ename sal, comm, sal*12+comm, sal*12+nvl(comm, 0) as salComm
from emp
;

--DECODE 함수 : switch case 형식과 유사
select ename, deptno, 
        decode(deptno,
                    10, 'ACCOUNTING', 
                    20, 'RESEARCH', 
                    30, 'SALES', 
                    40, 'OPERATIONS') as DNAME
from emp
order by deptno asc
;

-- 직급에 따라 급여를 인상하도록 하자. 직급이 'ANAlYST'인 사원은 5%, 
--'SALESMAN'인 사원은 10%, 'MANAGER'인 사원은 15%, 'CLERK'인 사원은 20%인 인상한다.
select distinct job from emp;
select empno, ename, job, sal, 
        DECODE(JOB,
                'ANALYST', sal*1.05,
                'SALESMAN', sal*1.1,
                'MANAGER', sal*1.15,
                'CLERK', sal*1.2) as upSal          
from emp
;

--CASE 함수 WHEN:조건 THEN:결과
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

