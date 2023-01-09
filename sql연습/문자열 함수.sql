-- 문자열 함수
-- upper: 대문자
select upper('busan'), upper('BusaN'), upper('Busan') from dual;
select upper(first_name) from employees order by upper(first_name);

-- lower: 소문자
select lower('BUSAN'), lower('BusaN'), lower('Busan') from dual;
select lower(first_name) from employees;

-- substring(문자열, index, length)
select substring('Hello World', 2, 2); -- el 출력 

-- 예제) 1989년에 입사한 사원들의 이름, 입사일을 출력
select first_name, hire_date
	from employees
    where substring(hire_date, 1, 4) = '1989';
    
-- lpad(오른쪽 정렬), rpad(왼쪽 정렬)
select lpad('1234', 10, '-') from dual; -- '------1234' 출력
select rpad('1234', 10, '-') from dual; -- '1234------' 출력

-- 예제) 직원들의 월급을 오른쪽 정렬(빈공간 *)
select lpad(salary, 10, '*') from salaries;

-- trim(공백제거), ltrim(왼쪽 공백 제거), rtrim(오른쪽 공백 제거)
select concat('---', ltrim('     hello     '), '---') from dual; -- '---hello     ---' 출력
select concat('---', rtrim('     hello     '), '---') from dual; -- '---     hello---' 출력
select concat('---', trim(both ' ' from '     hello     '), '---') from dual; -- '---hello---' 출력
select concat('---', trim(both 'x' from 'xxxxxhelloxxxxx'), '---') from dual; -- '---hello---' 출력
select concat('---', trim(leading 'x' from 'xxxxxhelloxxxxx'), '---') from dual; -- '---helloxxxxx---' 출력
select concat('---', trim(trailing 'x' from 'xxxxxhelloxxxxx'), '---') from dual; -- '---xxxxxhello---' 출력

-- length
select length('Hello World') from dual;  -- 11 출력

