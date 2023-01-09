-- explore datas....
show tables;

select count(*) from employees;
select count(*) from departments;
select count(*) from titles;
select count(*) from salaries;

-- select 기본
-- 예제1 " departments 테이블의 모든 데이터 출력
select * from departments;

-- 프로젝션(projection)
-- 예제2 : departments 테이블에서 dept_no, dept_name을 출력
select dept_no, dept_name from departments;

-- as(alias, 생략 가능)
-- 예제2 : employees 테이블에서 직원의 이름, 성별, 입사일을 출력
select first_name as '이름', 
		gender as '성별', 
		hire_date as '입사일' 
    from employees;

-- concat으로 성과 이름을 연결 후 이름으로 바꿔서 출력
select concat(first_name, ' ', last_name) as '이름', 
		gender as '성별', 
		hire_date as '입사일' 
    from employees;

