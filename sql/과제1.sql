--EMP 테이블과 DEPT 테이블을 이용해서 문제 풀이

--1. 덧셈연산자를 이용하여 모든 사원에 대해서 $300의 급여 인상을 계산한 후 사원의 이름, 급여, 인상된 급여를 출력하시오.
select ename as "사원의 이름" , sal as "급여", sal + 300 as "인상된 급여"
from emp
;


--2. 사원의 이름, 급여, 연간 총 수입을 총 수입이 많은 것부터 작은 순으로 출력하시오, 연간 총수입은 월급에 12를 곱한 후 $100의 상여금을 더해서 계산하시오.
select ename as "사원의 이름", sal as "급여", sal*12+100 as "연봉과 상여금 합산"
from emp
order by (sal*12+100) desc
;


--3. 급여가 2000을 넘는 사원의 이름과 급여를 표현, 급여가 많은 것부터 작은 순으로 출력하시오.
select ename as "사원의 이름", sal as "급여"
from emp
where sal > 2000
order by sal desc
;


--4. 사원번호가 7788인 사원의 이름과 부서번호를 출력하시오.
select ename as "사원의 이름", empno as "부서번호"
from emp
where empno = 7788
;


--5. 급여가 2000에서 3000 사이에 포함되지 않는 사원의 이름과 급여를 출력하시오.
select ename as "사원의 이름", sal as "급여"
from emp
where not sal between 2000 and 3000 
;


--6. 1981년 2월 20일 부터 1981년 5월 1일 사이에 입사한 사원의 이름, 담당업무, 입사일을 출력하시오.
select ename as "사원의 이름", job as "담당업무", hiredate as "입사일"
from emp
where hiredate between '81/02/20' and '81/05/01'
;


--7. 부서번호가 20 및 30에 속한 사원의 이름과 부서번호를 출력, 이름을 기준(내림차순)으로 영문자순으로 출력하시오.
select ename as "사원의 이름", deptno as "부서번호"
from emp
where deptno in(20,30)
order by ename desc
;

--8. 사원의 급여가 2000에서 3000사이에 포함되고 부서번호가 20 또는 30인 사원의 이름, 급여와 부서번호를 출력, 이름순(오름차순)으로 출력하시오.
select ename as "사원의 이름", sal as "급여", deptno as "부서번호"
from emp
where sal between 2000 and 3000
order by ename asc
;


--9. 1981년도에 입사한 사원의 이름과 입사일을 출력하시오. (like 연산자와 와일드카드 사용)
select ename as "사원의 이름", hiredate as "입사일"
from emp
where hiredate like ('81/__/__')
;

--10. 관리자가 없는 사원의 이름과 담당 업무를 출력하시오.
select ename as "사원의 이름", job as "담당 업무"
from emp
where mgr is null
;

--11. 커미션을 받을 수 있는 자격이 되는 사원의 이름, 급여, 커미션을 출력하되 급여 및 커미션을 기준으로 내림차순 정렬하여 표시하시오.
select ename as "사원의 이름", sal as "급여", comm as "상여금"
from emp
where comm is not null and comm > 0
order by sal desc, comm desc --comm desc --desc, comm desc
;


--12. 이름의 세번째 문자가 R인 사원의 이름을 표시하시오.
select ename as "사원의 이름"
from emp
where ename like ('__R%')
;


--13. 이름에 A와 E를 모두 포함하고 있는 사원의 이름을 표시하시오.
select ename as "사원의 이름"
from emp
where ename like '%A%' and ename like '%E%'
--where ename like '%A%, %E%'
;


--14. 담당업무가 CLERK, 또는 SALESMAN이면서 급여가 $1600, $950 또는 $1300이 아닌 사원의 이름, 담당업무, 급여를 출력하시오.
select ename as "사원의 이름", job as "담당 업무", sal as "급여"
from emp
where job in('CLERK','SALESMAN') and sal not in(1600,950,1300)
;


--15. 커미션이 $500 이상인 사원의 이름과 급여 및 커미션을 출력하시오.
select ename as "사원의 이름", sal as "급여", comm as "상여금"
from emp
where comm >= 500
;

--16. SUBSTR 함수를 사용하여 사원들의 입사한 년도와 입사한 달만 출력하시오.
--substr(컬럼, '자를 시작점', '자리수')
--시작위치가 0 아니면 1로 처리된다는 것을 기억해두자. 즉 1이거나 0이거나 둘 다 상관이 없는듯하다.
select ename, substr(hiredate,'0','5')
from emp
;

select ename, substr(hiredate,'1','2'),substr(hiredate,'4','2')
from emp
;

select ename, hiredate, to_char(hiredate, 'yyyy/mm')
from emp
;

--17. SUBSTR 함수를 사용하여 4월에 입사한 사원을 출력하시오.
select ename, hiredate
from emp
where substr(hiredate, '4','2') = '04'
;

select ename, hiredate
from emp
where to_char(hiredate,'mm')=04
;

--18. MOD 함수를 사용하여 사원번호가 짝수인 사람만 출력하시오.
select ename, empno
from emp
where mod(empno, 2)=0
;

--19. 입사일을 년도는 2자리(YY), 월은 숫자(MON)로 표시하고 요일은 약어 (DY)로 지정하여 출력하시오.
select hiredate, TO_CHAR(hiredate, 'YY/MON/DD DY')as changeDate
from emp
;

--20. 올해 몇 칠이 지났는지 출력하시오. 현재날짜에서 올해 1월 1일을 뺀 결과를 출력하고 TO_DATE 함수를 사용하여 데이터 형을 일치 시키시오.
select trunc(sysdate - TO_DATE('2019/01/01', 'YYYY/MM/DD'))
from dual
;

--21. 사원들의 상관 사번을 출력하되 상관이 없는 사원에 대해서는 NULL 값 대신 0으로 출력하시오.
select ename, nvl(mgr,0)
from emp
order by mgr
;

--22. DECODE 함수로 직급에 따라 급여를 인상하도록 하시오. 직급이 ‘ANALIST”인 사원은 200, ‘SALESMAN’인 사원은 180, ‘MANAGER’인 사원은 150, ‘CLERK”인 사원은 100을 인상하시오.
select empno, ename, job, sal,
                 DECODE(JOB, 
                         'ANALYST', sal+200,
                         'SALESMAN', sal+180,
                         'MANAGER', sal+150,
                         'CLERK', sal+100) as upSal       
from emp
;

select *
from emp;