show tables;
desc cart;

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
select no, title, price, category_no order by no desc;
select no, name from category order by no desc;
select no, name, number, email, password from user order by no desc;

select a.no, b.title, a.count, b.price 
	from cart a, book b, user c
    where a.book_no = b.no
    and a.user_no = c.no
    order by no desc; -- 카트

select a.no, a.order_no, a.price, a.address, d.no, d.title, b.count 
	from orders a, cart b, mser c, book d
    where a.cart_no = b.no
    and a.user_no = c.no
    and b.book_no = d.no
	order by no desc;  -- 주문

