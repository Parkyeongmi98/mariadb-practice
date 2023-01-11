-- 서브쿼리(SUBQUERY) SQL 문제

-- 문제1.
-- 현재, 평균 급여보다 많은 월급을 받는 직원은 몇 명이나 있습니까?
select avg(salary)
	from salaries
    where to_date = '9999-01-01'; -- 평균 급여
    
select count(*)
	from salaries
    where to_date = '9999-01-01'
    and salary > (select avg(salary)
					from salaries
					where to_date = '9999-01-01');  -- 정답

-- 문제2. 
-- 현재, 각 부서별로 최고의 급여를 받는 사원의 사번, 이름, 부서 급여를 조회하세요. 
-- 단 조회결과는 급여의 내림차순으로 정렬되어 나타나야 합니다. 
select a.dept_no, max(b.salary) as '최고 급여'
	from dept_emp a, salaries b
    where a.emp_no = b.emp_no
    and a.to_date = '9999-01-01'
    and b.to_date = '9999-01-01'
    group by a.dept_no;  -- 각 부서별 최고 급여
                        
select a.emp_no as 사번, concat(a.first_name, ' ', a.last_name) as 이름, d.dept_name as 부서, c.salary as 급여
	from employees a, dept_emp b, salaries c, departments d,
		(select a.dept_no, max(b.salary) as '최고급여'
			from dept_emp a, salaries b
			where a.emp_no = b.emp_no
			and a.to_date = '9999-01-01'
			and b.to_date = '9999-01-01'
			group by a.dept_no) e
    where a.emp_no = b.emp_no
    and b.emp_no = c.emp_no
    and b.dept_no = d.dept_no
    and b.dept_no = e.dept_no
    and b.to_date = '9999-01-01'
    and c.to_date = '9999-01-01'
    and c.salary = e.최고급여
	order by c.salary desc;  -- 정답

-- 문제3.
-- 현재, 자신의 부서 평균 급여보다 급여 많은 사원의 사번, 이름과 급여를 조회하세요 
select a.dept_no, avg(b.salary)
	from dept_emp a, salaries b
    where a.emp_no = b.emp_no
    and a.to_date = '9999-01-01'
    and b.to_date = '9999-01-01'
    group by a.dept_no;  -- 부서별 평균 급여
    
select b.emp_no, b.first_name, c.salary
	from dept_emp a, employees b, salaries c,
		(select a.dept_no as '부서', avg(b.salary) as '평균급여'
			from dept_emp a, salaries b
			where a.emp_no = b.emp_no
			and a.to_date = '9999-01-01'
			and b.to_date = '9999-01-01'
			group by a.dept_no) e
    where a.emp_no = b.emp_no
    and b.emp_no = c.emp_no
    and a.dept_no = e.부서
    and a.to_date = '9999-01-01'
    and c.to_date = '9999-01-01'
    and c.salary > e.평균급여;  -- 정답
    

-- 문제4.
-- 현재, 사원들의 사번, 이름, 매니저 이름, 부서 이름으로 출력해 보세요.
select b.dept_name as '부서', concat(a.first_name, ' ', a.last_name) as '매니저이름'
	from employees a, departments b, dept_manager c, titles d
    where a.emp_no = c.emp_no
    and c.dept_no = b.dept_no
    and c.emp_no = d.emp_no
    and c.to_date = '9999-01-01'
    and d.to_date = '9999-01-01'
    and d.title = 'Manager';  -- 매니저 이름 출력
    
select a.emp_no as '사번', concat(a.first_name, ' ', a.last_name) as '이름', e.매니저이름, e.부서이름
	from employees a, dept_manager b,
		(select b.dept_name as '부서이름', c.dept_no as '부서',
		concat(a.first_name, ' ', a.last_name) as '매니저이름'
			from employees a, departments b, dept_manager c, titles d
			where a.emp_no = c.emp_no
			and c.dept_no = b.dept_no
			and c.emp_no = d.emp_no
			and c.to_date = '9999-01-01'
			and d.to_date = '9999-01-01'
			and d.title = 'Manager') e
	where a.emp_no = b.emp_no
    and b.dept_no = e.부서;  -- 정답

-- 문제5.
-- 현재, 평균급여가 가장 높은 부서의 사원들의 사번, 이름, 직책, 급여를 조회하고 급여 순으로 출력하세요.
select a.dept_no, avg(b.salary) as 평균급여
	from dept_emp a, salaries b
    where a.emp_no = b.emp_no
    and a.to_date = '9999-01-01'
    and b.to_date = '9999-01-01'
    group by a.dept_no
    order by 평균급여 desc
    limit 0, 1;  -- 부서별 평균 급여
    
select a.dept_no
	from (select a.dept_no, avg(b.salary) as 평균급여
			from dept_emp a, salaries b
			where a.emp_no = b.emp_no
			and a.to_date = '9999-01-01'
			and b.to_date = '9999-01-01'
			group by a.dept_no) a;  -- 평균급여가 가장 높은 부서
    
select a.emp_no, concat(a.first_name, ' ', a.last_name), b.title, c.salary
	from employees a, titles b, salaries c, dept_emp d
    where a.emp_no = b.emp_no
    and b.emp_no = c.emp_no
    and c.emp_no = d.emp_no
    and b.to_date = '9999-01-01'
    and c.to_date = '9999-01-01'
    and d.to_date = '9999-01-01'
    group by d.dept_no
    having (d.dept_no, c.salary) = (select a.dept_no, max(평균급여)
										from (select a.dept_no, avg(b.salary) as 평균급여
												from dept_emp a, salaries b
												where a.emp_no = b.emp_no
												and a.to_date = '9999-01-01'
												and b.to_date = '9999-01-01'
												group by a.dept_no) a);

-- 문제6.
-- 평균 급여가 가장 높은 부서는? 
select c.dept_name, avg(b.salary) as 평균급여
	from dept_emp a, salaries b, departments c
    where a.emp_no = b.emp_no
    and a.dept_no = c.dept_no
    and a.to_date = '9999-01-01'
    and b.to_date = '9999-01-01'
    group by c.dept_name
    having 평균급여 = (select max(a.평균급여)
						from (select a.dept_no, avg(b.salary) as 평균급여
								from dept_emp a, salaries b
								where a.emp_no = b.emp_no
								and a.to_date = '9999-01-01'
								and b.to_date = '9999-01-01'
								group by a.dept_no) a);
    
-- 문제7.
-- 평균 급여가 가장 높은 직책?
select a.title, avg(b.salary) as 평균급여
	from titles a, salaries b
    where a.emp_no = b.emp_no
    and a.to_date = '9999-01-01'
    and b.to_date = '9999-01-01'
    group by a.title
    having 평균급여 = (select max(a.평균급여)
						from (select a.title, avg(b.salary) as 평균급여
								from titles a, salaries b
								where a.emp_no = b.emp_no
								and a.to_date = '9999-01-01'
								and b.to_date = '9999-01-01'
								group by a.title) a);
                                
-- 문제8.
-- 현재 자신의 매니저보다 높은 급여를 받고 있는 직원은?
-- 부서이름, 사원이름, 급여, 매니저 이름, 메니저 급여 순으로 출력합니다.
