-- 수학 함수
-- abs: 절댓값
select abs(1), abs(-1) from dual;  -- 1, 1 출력

-- ceil: 올림
select ceil(3.14), ceiling(3.14) from dual;  -- 4, 4 출력

-- floor: 버림
select floor(3.14) from dual;  -- 3 출력

-- mod: 나머지
select mod(10, 3), 10 % 3 from dual;  -- 1, 1 출력

-- round(x): x에 가장 근접한 정수, 반올림
-- round(x, d): x값 중에 소수점 d 자리에 가장 근접한 실수
select round(1.498), round(1.511) from dual;  -- 1, 2 출력
select round(1.498, 1), round(1.498, 0);  -- 1.5, 1 출력

-- power(x, y), pow(x, y): x의 y승
select power(2, 10), pow(2, 10) from dual;  -- 1024, 1024 출력

-- sign(x): 양수면 1, 음수면 -1, 0이면 0 출력
select sign(20), sign(-100), sign(0) from dual;

-- greatest(x, y, ...): 리스트 중 제일 큰 수 출력, least(x, y, ...): 리스트 중 제일 작은 수 출력
select greatest(10, 40, 20, 50), least(10, 40, 20, 50) from dual;  -- 50, 10 출력
select greatest('b', 'A', 'C', 'D'), least('hello', 'hela', 'hell') from dual;  -- D, hela 출력(아스키코드)



