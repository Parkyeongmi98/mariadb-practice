-- bookshop
desc author;
desc book;

-- insert
insert into book(no, title, author_no) values(null, '안녕', 2);

-- delete
delete from book where title = '풀하우스';

-- list
select no, title, rent, author_no from book order by no desc;
select no, name from author order by no desc;