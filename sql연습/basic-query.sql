select version(), current_date(), now() from dual;

-- 수학함수, 사칙 연산도 된다.
select sin(pi() / 4), 1 + 2 + 3 + 4 / 5 from dual;   

-- 대소문자 구분 안한다.
seleCT version(), current_DATE, NOw() froM dual;

-- DB 보여줘라
show databases;

-- testDB를 사용하겠다.
use test;

-- testDB의 테이블을 보여줘라
show tables;

-- table 생성: DML
create table pet (
	name varchar(100), -- varchar: 길이는 100자
	owner varchar(20),
	species varchar(20),
	gender char(1), -- char: 길이가 한글자로 고정되있으면
	birth date,
	death date
);

-- schema 확인
describe pet;
desc pet;

-- table 삭제
drop table pet;
show tables;

-- insert: DML(C) -> create
insert into pet values('성탄이', '안대혁', 'dog', 'm', '2007-12-25', null);
select * from pet;

use webdb;  -- 모델 생성 후 webdb 사용
select * from pet;

insert into pet values('성탄이', '안대혁', 'dog', 'm', '2007-12-25', null);

-- select: DML(R) -> read
select * from pet;

-- update: DML(U) -> update
update pet set name = '구름이' where name = '성탄이';

-- delete: DBL(D) -> delete
delete from pet where name = '구름이';

-- load data
load data local infile 'd:\pet.txt' into table pet;

-- select
select * from pet where name = 'bowser';
select name, species from pet where name = 'bowser';