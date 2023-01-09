-- 날짜 함수
-- curdate(), current_date : 현재 날짜 출력(2023-01-09)
select curdate(), current_date from dual;

-- curtime(), current_time : 현재 시간 출력(15:20:23)
select curtime(), current_time from dual;

-- now() vs sysdate() : 현재 날짜, 시간 출력
select now(), sysdate() from dual;
select now(), sleep(2), now() from dual;  -- now(): 쿼리가 실행될때 시간(전부 동일)
select now(), sleep(2), sysdate() from dual;  -- sysdate(): 함수가 실행될때 시간

-- date_format() : 내가 원하는 데로 포맷
-- 2023-01-09 15:19:20 : 기본 포맷팅
select date_format(now(), '%Y년 %m월 %d일 %h시 %i분 %s초') from dual;
select date_format(now(), '%d %b %y') from dual; -- 09 Jan 23 출력
select date_format(now(), '%d %b \'%y %H:%i:%s') from dual; 
                           -- 09 Jan '23 15:26:09 출력
                           
-- peroid_diff('A날짜', 'B날짜') : 'B날짜'에서 'A날짜'를 뺀 차이
-- 포맷팅 맞춰서 계산: YYMM, YYYYMM
-- 예) 근무개월이 오래된 순서로 출력
select first_name, hire_date, 
	period_diff(date_format(curdate(), '%y%m'), 
				date_format(hire_date, '%y%m')) as '근무개월'
	from employees
    order by '근무개월' desc;
    
-- date_add(=adddate), date_sub(=subdate)
-- 날짜를 date 타입의 컬럼이나 값에 type(year, month, day)의 표현식으로 더하거나 뺄 수 있음
-- 예) 각 사원등의 근속년수가 5년이 되는 날에 휴가를 보내준다면 각 사원의 5년 근속 휴가 날짜는?
select first_name, hire_date,
	date_add(hire_date, interval 5 year)  -- 입사일에서 5년을 더함
	from employees;
    
-- cast: type을 바꿔줌
select '12345' + 10, cast('12345' as int) + 10 from dual;
select date_format(cast('2023-01-09' as date), '%Y년 %m월 %d일') from dual;
select cast(cast(1-2 as unsigned)as signed) from dual;  -- -1 출력
select cast(cast(1-2 as unsigned)as integer) from dual;  -- -1 출력
select cast(cast(1-2 as unsigned)as int) from dual; -- -1 출력

-- type
-- 문자: varchar, char, text, CLOB(Character Large OBject)
-- 정수: medium int, int(signed, integer), unsigned(음수 x), big int
-- 실수: float, double
-- 시간: date, datetime
-- LOB: CLOB, BLOB(Binary Large OBject)



