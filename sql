-- Inner Join
-- 예제1) 현재, 근무하고 있는 직원의 이름과 직책을 모두 출력
select concat(a.first_name, ' ', a.last_name), b.title 
	from employees a, titles b
	where  a.emp_no = b.emp_no		-- join 조건
    and b.to_date = '9999-01-01';	-- row 선택 조건
    
-- 예제2) 현재, 근무하고 있는 직원의 이름과 직책을 출력하되 여성 엔지니어(Engineer)만 출력
select concat(a.first_name, ' ', a.last_name), b.title
	from employees a, titles b
    where a.emp_no = b.emp_no		-- join 조건
    and b.to_date = '9999-01-01'	-- row 선택 조건 1
    and a.gender = 'f'				-- row 선택 조건 2
    and b.title = 'Engineer';		-- row 선택 조건 3
    
--
-- ANSI/ISO SQL1999 JOIN 표준 문법
--
-- 1) Natural Join
--    조인 대상이 되는 두 테이블에 이름이 같은 공통 컬럼이 있으면 조인 조건을 
--    명시하지 않고 암묵적으로 조인이 된다.
select concat(a.first_name, ' ', a.last_name), b.title 
	from employees a natural join titles b
	where b.to_date = '9999-01-01';

-- 2) join ~ using
--    natural join의 문제점(공통 컬럼이 많을 경우)
select count(*)
	from salaries a join titles b using(emp_no)
    where a.to_date = '9999-01-01'
    and b.to_date = '9999-01-01';

-- 3) join ~ on ***
-- 예제) 현재, 직책별 평균 연봉을 큰 순서대로 출력
select b.title, avg(salary) as '평균연봉'
	from salaries a join titles b on a.emp_no = b.emp_no
	where a.to_date = '9999-01-01'
    and b.to_date = '9999-01-01'
    group by b.title
    order by 평균연봉 desc;
    
-- 실습문제1
-- 현재, 직원별 근무 부서를 사번, 직원 이름, 부서명으로 출력
select a.emp_no as '사번',
		concat(b.first_name, ' ', b.last_name) as '직원이름',
		c.dept_name as '부서명'
	from dept_emp a join employees b on a.emp_no = b.emp_no
    join departments c on a.dept_no = c.dept_no
    where a.to_date = '9999-01-01';

-- 강사님 코드(join 생략)
select a.emp_no as '사번',
		concat(b.first_name, ' ', b.last_name) as '직원이름',
		c.dept_name as '부서명'
	from employees a, departments b, dept_emp c
    where a.emp_no = c.emp_no
    and b.dept_no = c.dept_no
    and c.to_date = '9999-01-01';

-- 실습문제2
-- 현재, 지급되고 있는 급여를 출력(사번, 이름, 급여 순으로 출력)
select a.emp_no as '사번',
		concat(a.first_name, ' ', a.last_name) as '직원이름',
		b.salary as '급여'
	from employees a join salaries b on a.emp_no = b.emp_no
    where b.to_date = '9999-01-01';

-- 실습문제3
-- 현재, 직책별 평균 연봉, 직원 수를 구하되 직책별 직원수가 100명 이상인 직책만 출력(직책, 평균연봉, 직원수 순으로 출력)
select a.title as '직책', avg(b.salary) as '평균연봉', count(a.emp_no) as '직원수'
	from titles a join salaries b on a.emp_no = b.emp_no
    where a.to_date = '9999-01-01'
    and b.to_date = '9999-01-01'
    group by a.title
    having 직원수 >= 100;

-- 실습문제4
-- 현재, 부서별로 직책이 Engineer인 직원들에 대해서만 평균 급여를 출력
select d.dept_name, avg(b.salary) as '평균급여'
	from dept_emp a join salaries b on a.emp_no = b.emp_no
    join titles c on a.emp_no = c.emp_no
    join departments d on a.dept_no = d.dept_no
    where a.to_date = '9999-01-01'
    and b.to_date = '9999-01-01'
    and c.to_date = '9999-01-01'
    and c.title = 'Engineer'
	group by d.dept_name
    order by 평균급여 desc;
    
-- 강사님 코드(join 생략)
select d.dept_name, avg(b.salary) as '평균급여'
	from dept_emp a, salaries b, titles c, departments d
    where a.emp_no = b.emp_no
    and a.emp_no = c.emp_no
    and a.dept_no = d.dept_no
    and a.to_date = '9999-01-01'
    and b.to_date = '9999-01-01'
    and c.to_date = '9999-01-01'
    and c.title = 'Engineer'
    group by d.dept_name
    order by 평균급여 desc;


