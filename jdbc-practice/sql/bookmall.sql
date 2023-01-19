show tables;
desc order_book;

-- insert
insert into book(no, title, price, category_no) values(null, ?, ?, ?);
insert into cart(no, count, book_no,user_no) values(null, ?, ?, ?);
insert into category(no, name) values(null, ?);
insert into user(no, name, number, email, password) values(null, ?, ?, ?, ?);
insert into orders(no, order_no, price, address, user_no, cart_no) values(null, ?, ?, ?, ?, ?);

-- delete
delete from book where no = ?;
delete from cart where no = ?;
delete from category where no = ?;
delete from user where no = ?;
delete from orders where no = ?;


-- select
select a.no, a.title, a.price, b.name 
	from book a, category b 
    where a.category_no = b.no
    order by a.no desc;
select no, name from category order by no desc;
select no, name, number, email, password from user order by no desc;

select a.no, b.title, a.count, b.price 
	from cart a, book b, user c
    where a.book_no = b.no
    and a.user_no = c.no
    order by no desc; -- 카트

select a.no, a.order_no, d.name, d.email, sum(b.count * c.price) as 총주문가격, a.address
	from orders a, cart b, book c, user d
    where a.user_no = b.user_no
    and b.book_no = c.no
    and a.user_no = d.no
	order by a.no desc;  -- 주문

select sum(a.count * c.price) as 총주문가격, sum(a.count) as 총수량
	from cart a, order_book b, book c
    where a.no = b.cart_no
    and a.book_no = c.no
    order by a.no desc;

insert into order_book(no, cart_no, orders_no) values(null, 2, 2);
select b.no, b.title, c.count
	from order_book a, book b, cart c
    where a.book_no = b.no
    and a.cart_no = c.no;

show tables;
