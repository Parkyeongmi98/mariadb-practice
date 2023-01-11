-- subquery
-- 1) select절, insert values(...)의 서브쿼리


-- 2) from절의 서브쿼리
select now() as n, sysdate() as s, 3 +  1 as r from dual;
select a.n, a.r, a.s
	from (select now() as n, sysdate() as s, 3 +  1 as r from dual) a;
    
-- 3) where절의 서브쿼리


-- 예제) 현재, Fai Bale이 근무하는 부서에서 근무하는 다른 직원의 사번, 이름을 출력
select c.dept_name
	from employees a, dept_emp b, departments c
    where a.emp_no = b.emp_no
    and b.dept_no = c.dept_no
    and b.to_date = '9999-01-01'
    and concat(a.first_name, ' ', a.last_name) = 'Fai Bale';
    
-- Fai Bale이 근무하는 부서 -> Production
select a.emp_no as '사번', concat(a.first_name, ' ', a.last_name) as '이름'
	from employees a, dept_emp b, departments c
    where a.emp_no = b.emp_no
    and b.dept_no = c.dept_no
    and b.to_date = '9999-01-01'
    and c.dept_name = 'Production';
    
-- 서브쿼리를 이용해서 풀어보기
select a.emp_no as '사번', concat(a.first_name, ' ', a.last_name) as '이름'
	from employees a, dept_emp b, departments c
    where a.emp_no = b.emp_no
    and b.dept_no = c.dept_no
    and b.to_date = '9999-01-01'
    and c.dept_name = (select c.dept_name
					   from employees a, dept_emp b, departments c
					   where a.emp_no = b.emp_no
					   and b.dept_no = c.dept_no
					   and b.to_date = '9999-01-01'
					   and concat(a.first_name, ' ', a.last_name) = 'Fai Bale');

-- 3-1) 단일행 연산자: =, >, <, >=, <=, <>, !=
-- 실습문제1
-- 현재, 전체 사원의 평균 연봉보다 적은 급여를 받는 사원의 이름과 급여를 출력
-- 평균연봉: 72012.2359
select concat(a.first_name, ' ', a.last_name) as '이름', b.salary
	from employees a, salaries b
    where a.emp_no = b.emp_no
    and b.to_date = '9999-01-01'
    and b.salary < (select avg(salary)
					from salaries
					where to_date = '9999-01-01') 
	order by b.salary desc;

-- 실습문제2
-- 현재, 가장 적은 평균 급여의 직책과 그 평균 급여를 출력

-- 1) 직책별 평균 급여 -> 가장 적은 평균 급여: 57317.5736
select b.title as '직책', avg(a.salary) as '평균급여'
	from salaries a, titles b
    where a.emp_no = b.emp_no
    and a.to_date = '9999-01-01'
    and b.to_date = '9999-01-01'
    group by b.title;
    
-- 2) 직책별 가장 적은 평균 급여
select min(a.평균급여)
	from (select b.title as '직책', avg(a.salary) as '평균급여'
			from salaries a, titles b
			where a.emp_no = b.emp_no
			and a.to_date = '9999-01-01'
			and b.to_date = '9999-01-01'
			group by b.title) a;

-- 3) sol1: 서브쿼리를 이용해서 출력(limit없이 한 줄만 출력해야하므로)
select b.title as '직책', avg(a.salary) as '평균급여'
	from salaries a, titles b
	where a.emp_no = b.emp_no
	and a.to_date = '9999-01-01'
	and b.to_date = '9999-01-01'
	group by b.title
    having 평균급여 = (select min(a.평균급여)
						from (select b.title as '직책', avg(a.salary) as '평균급여'
								from salaries a, titles b
								where a.emp_no = b.emp_no
								and a.to_date = '9999-01-01'
								and b.to_date = '9999-01-01'
								group by b.title) a);

-- 4) sol4: top-k(limit 사용)
select b.title as '직책', avg(a.salary) as '평균급여'
	from salaries a, titles b
    where a.emp_no = b.emp_no
    and a.to_date = '9999-01-01'
    and b.to_date = '9999-01-01'
    group by b.title
    order by 평균급여 asc
    limit 0, 1;


-- 3-2) 복수행 연산자:  


    