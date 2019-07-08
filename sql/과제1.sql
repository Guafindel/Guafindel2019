--EMP 테이블과 DEPT 테이블을 이용해서 문제 풀이

--1. 덧셈연산자를 이용하여 모든 사원에 대해서 $300의 급여 인상을 계산한 후 사원의 이름, 급여, 인상된 급여를 출력하시오.
select ename as "사원의 이름" , sal as "급여", sal + 300 as "인상된 급여"
from emp
;

select ename, sal, sal+100 as "인상된 급여"
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
--hiredate는 80/01/01 이런식으로 저장되어있다. 이것을 기준으로 어디를 시작으로
--어디까지 잘라내야 하는지 생각해본다면 쉽게 해결할 수 있을거야.
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
--입사일 월을 축출 = '04'
select ename, hiredate
from emp
where substr(hiredate, '4','2') = '04'
;

select *
from emp
where substr(hiredate, '4','2') = '04'
;

select ename, hiredate
from emp
where to_char(hiredate,'mm') = 04
;

--18. MOD 함수를 사용하여 사원번호가 짝수인 사람만 출력하시오.
--MOD(컬럼, 재수(나누는 수)) -> 나머지 값
select ename, empno
from emp
where mod(empno, 2) = 0
;

select *
from emp
where mod(empno, 2) = 0
;

--19. 입사일을 년도는 2자리(YY), 월은 숫자(MON)로 표시하고 요일은 약어 (DY)로 지정하여 출력하시오.
select TO_CHAR(hiredate, 'YY/MON/DD DY')as changeDate
from emp
;

--20. 올해 며칠이 지났는지 출력하시오. 현재 날짜에서 올해 1월 1일을 뺀 결과를 출력하고 TO_DATE 함수를 사용하여 데이터 형을 일치 시키시오.
--date- date
select trunc(sysdate - TO_DATE('2019/01/01', 'YYYY/MM/DD'))
from dual
;

select round(sysdate - to_date('2019/01/01', 'YYYY/MM/DD'),0)
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

select ename, job, sal,
                decode(job,
                    'ANALYST',sal+200,
                    'SALESMAN',sal+100,
                    'MANAGER',sal+150,
                    'CLERK',sal+100)as "인상된 급여"
from emp
order by job
;

select empno, ename, sal,
        decode(job,
            'ANALYST', sal+200,
            'SALESMAN', sal+180,
            'MANAGER', sal+150,
            'CLERK', sal+100
         ) as upsal
from emp
;

--23. 모든 사원의 급여 최고액, 최저액, 총액 및 평균 급여를 출력하시오. 평균에 대해서는 정수로 반올림하시오.
select max(sal), min(sal), sum(sal),round(avg(sal),0)
from emp
;

--24. 각 담당 업무 유형별로 급여 최고액, 최저액, 총액 및 평균 액을 출력하시오. 평균에 대해서는 정수로 반올림 하시오.
select job, max(sal), min(sal), sum(sal),round(avg(sal))
from emp
group by job
;

--25. COUNT(*) 함수를 이용하여 담당업무가 동일한 사원 수를 출력하시오.
select job, count(*)
from emp
group by job
;

--26. 관리자 수를 나열하시오.
--count연산자는 null값을 무시하기 때문에 where 조건을 따로 추가할 필요는 없다.
select count(distinct MGR)
from emp
--where MGR is not null
;

select job, count(*)
from emp
where job = 'MANAGER'
group by job
;

--27. 급여 최고액, 급여 최저액의 차액을 출력하시오.
select max(sal) - min(sal) as "차액"  
from emp
;

select max(sal), min(sal), max(sal) - min(sal) as "차액"  
from emp
;

--28. 직급별 사원의 최저 급여를 출력하시오. 관리자를 알 수 없는 사원, 최저 급여가 2000 미만인 그룹은 제외시키고 결과를 급여에 대한 내림차순으로 정렬하여 출력하시오.
select job, min(sal)
from emp
group by job
having min(sal) > 2000
;

select job, min(sal) as minsal
from emp
where mgr is not null
group by job
having min(sal) > 2000
order by minsal desc
;

--29. 각 부서에 대해 부서번호, 사원 수, 부서 내의 모든 사원의 평균 급여를 출력하시오. 평균 급여는 소수점 둘째 자리로 반올림 하시오.
select deptno, count(*), round(avg(sal),2)
from emp
group by deptno
;

--30. 각 부서에 대해 부서번호 이름, 지역 명, 사원 수, 부서내의 모든 사원의 평균 급여를 출력하시오. 평균 급여는 정수로 반올림 하시오. DECODE 사용.
select deptno,
            decode(deptno, 10,'ten', 20,'tw', 30,'tr',40,'ft') as dname,
            decode(deptno, 10,'incheon', 20,'seoul', 30,'busan', 40,'jeju') as localname,
            count(*),
            round(avg(sal))
from emp
group by deptno      
;

select e.deptno, d.dname, d.loc, count(*), round(avg(sal),0)
from emp e, dept d
where e.deptno = d.deptno
group by e.deptno, d.dname, d.loc
order by deptno
;


--31. 업무를 표시한 다음
--해당 업무에 대해 
--부서 번호별 급여 및 부서 10, 20, 30의 급여 총액을 각각 출력하시오. 
--별칭은 각 job, dno, 부서 10, 부서 20, 부서 30, 총액으로 지정하시오. 
--( hint. Decode, group by )
select job, deptno as dno,
            decode(deptno, 10,sum(sal)) as "부서 10",
            decode(deptno, 20,sum(sal)) as "부서 20",
            decode(deptno, 30,sum(sal)) as "부서 30",
            sum(sal) as "급여 총액"
from emp
group by job, deptno
order by deptno
;

--32. EQUI 조인을 사용하여 SCOTT 사원의 부서번호와 부서 이름을 출력하시오.
select e.ename, e.deptno, d.dname
from emp e, dept d
where e.deptno = d.deptno and e.ename='SCOTT'
;

--33. INNER JOIN과 ON 연산자를 사용하여 사원 이름과 함께 그 사원이 소속된 부서이름과 지역 명을 출력하시오.
select e.ename, d.dname, d.loc
from emp e inner join dept d
on e.deptno = d.deptno
order by dname
;

--36. 조인과 WildCARD를 사용하여 이름에 ‘A’가 포함된 모든 사원의 이름과 부서명을 출력하시오.
select e.ename, d.dname
from emp e, dept d
where e.deptno = d.deptno and e.ename like ('%A%')
;

--37. JOIN을 이용하여 NEW YORK에 근무하는 모든 사원의 이름, 업무, 부서번호 및 부서명을 출력하시오.
select d.loc, e.ename, e.job, e.deptno, d.dname
from emp e, dept d
where e.deptno = d.deptno and d.loc = 'NEW YORK'
;

--38. SELF JOIN을 사용하여 사원의 이름 및 사원번호, 관리자 이름을 출력하시오.
select e.ename || '의 사원 번호는' || e.empno || '이며 관리자의 이름은' || m.ename
from emp e join emp m
on e.mgr = m.empno
;

--39. OUTER JOIN, SELF JOIN을 사용하여 관리자가 없는 사원을 포함하여 사원번호를 기준으로 내림차순 정렬하여 출력하시오.
select e.ename || '의 사원 번호는' || e.empno || '이며 관리자의 이름은' || nvl(m.ename, ' X')
from emp e join emp m
on e.mgr = m.empno(+)
order by e.empno desc
;

--40. SELF JOIN을 사용하여 지정한 사원의 이름, 부서번호, 지정한 사원과 동일한 부서에서 근무하는 사원을 출력하시오. ( SCOTT )
select e.deptno, m.ename
from emp e, emp m
where e.deptno = m.deptno and e.ename = 'SCOTT'
;

--41. SELF JOIN을 사용하여 WARD 사원보다 늦게 입사한 사원의 이름과 입사일을 출력하시오.
select 'WARD의 입사일인 '||e.hiredate || ' 보다 늦게 입사한 사원의 이름은 ' || m.ename || '이며 그의 입사일은 ' || m.hiredate ||' 입니다.'
from emp e, emp m
where e.hiredate < m.hiredate and e.ename='WARD'
;

--42. SELF JOIN 을 사용하여 관리자보다 먼저 입사한 모든 사원의 이름 및 입사일을 관리자의 이름 및 입사일과 함께 출력하시오.
select e.ename as "사원", e.hiredate as "사원 입사일", m.ename as "관리자", m.hiredate as "관리자 입사일"
from emp e, emp m
where e.hiredate < m.hiredate and e.mgr = m.empno
;

select e.ename, m.ename
from emp e, emp m
where e.mgr = m.empno
;

--43. 사원 번호가 7788인 사원과 담당 업무가 같은 사원을 표시(사원 이름과 담당업무)하시오.
select e.ename, e.job
from (select * from emp where empno=7788) m, emp e
where e.job = m.job 
;

--44. 사원번호가 7499인 사원보다 급여가 많은 사원을 표시하시오. 사원이름과 담당 업무
select e.ename, e.job, e.sal
from (select sal from emp where empno= 7499) m, emp e
where e.sal > m.sal
;

--45. 최소급여를 받는 사원의 이름, 담당업무 및 급여를 표시하시오. (그룹함수 사용)
select e.ename, e.job, min(sal)
from emp e
where sal = (select min(sal) from emp m)
group by e.ename, e.job
;

select e.ename, e.job, e.sal
from emp e
where e.sal = (select min(sal) from emp m)
;

--46. 평균급여가 가장 적은 직급의 직급 이름과 직급의 평균을 구하시오.

select job, avg(sal)
from emp
group by job
having avg(sal) <= all(select avg(sal) from emp group by job)
;
       
select job,avg(sal)
from emp
where min(avg(sal)) < (select avg(sal) from emp)
group by job
;
             
select avg(sal) from emp group by job;

--47. 각 부서의 최소 급여를 받는 사원의 이름, 급여, 부서번호를 표시하시오.
select e.ename, e.sal, e.deptno
from (select deptno, min(sal)
      from emp
      group by deptno) m, emp e
where m.deptno = e.deptno and m.min(sal) = e.sal
;

select ename, sal, deptno
from emp
where (select deptno, min(sal)
       from emp
       group by deptno)
;

select deptno, min(sal)
from emp
group by deptno
;

--48. 담당업무가 ANALYST 인 사원보다 급여가 적으면서 업무가 ANALYST가 아닌 사원들을 표시(사원번호, 이름, 담당 업무, 급여)하시오.

--49. 부하직원이 없는 사원의 이름을 표시하시오.

--50. 부하직원이 있는 사원의 이름을 표시하시오.

--51. BLAKE와 동일한 부서에 속한 사원의 이름과 입사일을 표시하는 질의를 작성하시오. ( 단 BLAKE는 제외 )

--52. 급여가 평균 급여보다 많은 사원들의 사원 번호와 이름을 표시하되 결과를 급여에 대해서 오름차순으로 정렬하시오.

--53. 이름에 K가 포함된 사원과 같은 부서에서 일하는 사원의 사원 번호와 이름을 표시하시오.

--54. 부서위치가 DALLAS인 사원의 이름과 부서번호 및 담당업무를 표시하시오.

--55. KING에게 보고하는 사원의 이름과 급여를 표시하시오.

--56. RESEARCH 부서의 사원에 대한 부서번호, 사원이름 및 담당 업무를 표시하시오.

--57. 평균 월급보다 많은 급여를 받고 이름에 M이 포함된 사원과 같은 부서에서 근무하는 사원의 사원 번호, 이름, 급여를 표시하시오.

--58. 평균급여가 가장 적은 업무를 찾으시오.

--59. 담당업무가 MANAGER 인 사원이 소속된 부서와 동일한 부서의 사원을 표시하시오.

