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

-- insert
insert 
	into member 
    values(null, 'yeongmi_@naver.com', password('1234'), '박영미', '개발팀', null);
select * from member;

-- 순서를 내가 지정할 수 있음
insert 
	into member (no, email, name, dept, password)
    values(null, 'yeongmi_2@naver.com', '박영미', '개발팀', password('1234'));
select * from member;

-- update
update member
	set email = 'yeongmi_3@naver.com', password=password('5678')
    where no = 2;  -- no가 2번인 사람의 정보를 바꿔라
select * from member;

-- delete
delete
	from member
	where no = 2;  -- no가 2번인 사람을 삭제
select * from member;

-- transaction
select @@autocommit; -- 1 출력(true) commit이 자동으로 설정되있음
set autocommit=0;  -- 0으로 바꿔주기

insert 
	into member (no, email, name, dept, password)
    values(null, 'yeongmi_5@naver.com', '박영미5', '개발팀5', password('1234'));
select * from member;

commit; -- db 서버에 commit


