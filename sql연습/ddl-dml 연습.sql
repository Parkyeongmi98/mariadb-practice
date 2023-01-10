drop table member; 
use webdb;
create table member(
	no int not null auto_increment,
    email varchar(100) not null,
    password varchar(64) not null,
    name varchar(100) not null,
    department varchar(100),
    primary key(no)
);
desc member;

-- 데이터 추가
alter table member add column juminbunho char(13) not null;
desc member;

-- 데이터 삭제
alter table member drop juminbunho;
desc member;

-- 위치 지정해서 추가
alter table member add column juminbunho char(13) not null after email;
desc member;

-- 데이터 변경
alter table member change column department dept varchar(200) not null;
desc member;

alter table member add self_intro text;
desc member;

alter table member drop juminbunho;
desc member;
