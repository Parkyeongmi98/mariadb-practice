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
-- 현재, 전체 사원의 평균 연봉보다 적은 급여를 받는 사원의 이름과 급여를 출력 -> 평균연봉: 72012.2359
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
-- 1) 직책별 평균 급여 
select b.title as '직책', avg(a.salary) as '평균급여'
	from salaries a, titles b
    where a.emp_no = b.emp_no
    and a.to_date = '9999-01-01'
    and b.to_date = '9999-01-01'
    group by b.title;
    
-- 2) 직책별 가장 적은 평균 급여 -> 가장 적은 평균 급여: 57317.5736
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


-- 3-2) 복수행 연산자: in, not in, any비교연산자, all비교연산자
-- any 사용법
-- 1. =any : in
-- 2. >any, >=any: 최소값
-- 3. <any, <=any: 최대값
-- 4. <>any, !=any: not in

-- all 사용법
-- 1. =all: (x)
-- 2. >all, >=all: 최대값
-- 3. <all, <=all: 최소값
-- 4. <>all, !=all

-- 실습문제3
-- 현재, 급여가 50000 이상인 직원의 이름과 급여를 출력
-- sol1)
select concat(a.first_name, ' ', a.last_name) as '이름', b.salary as '급여'
	from employees a, salaries b
    where a.emp_no = b.emp_no
    and b.to_date = '9999-01-01'
    and b.salary >= 50000
    order by 급여 asc;
    
-- sol2) subquery
select concat(a.first_name, ' ', a.last_name) as '이름', b.salary as '급여'
	from employees a, salaries b
    where a.emp_no = b.emp_no
    and b.to_date = '9999-01-01'
	and (a.emp_no, b.salary) =any (select emp_no, salary
									from salaries
									where to_date = '9999-01-01'
									and salary >= 50000)
	order by 급여 asc;

-- 실습문제4: 현재, 각 부서별로 최고 급여를 받고 있는 직원의 이름과 월급을 출력
select a.dept_no, max(b.salary)
	from dept_emp a, salaries b
    where a.emp_no = b.emp_no
    and a.to_date = '9999-01-01'
    and b.to_date = '9999-01-01'
    group by a.dept_no;
    
-- sol1) where절 subquery(in)
select a.dept_name, b.first_name, d.salary
	from departments a, employees b, dept_emp c, salaries d
    where a.dept_no = c.dept_no
    and b.emp_no = c.emp_no
    and c.emp_no = d.emp_no
    and c.to_date = '9999-01-01'
    and d.to_date = '9999-01-01'
    and (a.dept_no, d.salary) =any (select a.dept_no, max(b.salary)
										from dept_emp a, salaries b
										where a.emp_no = b.emp_no
										and a.to_date = '9999-01-01'
										and b.to_date = '9999-01-01'
										group by a.dept_no);

-- sol2) from절 join
select a.dept_name, b.first_name, d.salary
	from departments a, employees b, dept_emp c, salaries d, 
		(select a.dept_no, max(b.salary) as '평균급여'
			from dept_emp a, salaries b
			where a.emp_no = b.emp_no
			and a.to_date = '9999-01-01'
			and b.to_date = '9999-01-01'
			group by a.dept_no) e
    where a.dept_no = c.dept_no
    and b.emp_no = c.emp_no
    and c.emp_no = d.emp_no
    and a.dept_no = e.dept_no
    and c.to_date = '9999-01-01'
    and d.to_date = '9999-01-01'
    and d.salary = e.평균급여;
    

