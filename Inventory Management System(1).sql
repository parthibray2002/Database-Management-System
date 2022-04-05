-- create a table

CREATE TABLE brands
(
  bid integer(5) PRIMARY KEY,
  bname varchar(20) NOT NULL
);

-- create another table

create table inv_user
(
  user_id varchar(20) primary key,
  name varchar(20),
  password varchar(20),
  last_login timestamp,
  user_type varchar(10) 
);

-- create third table
create table categories
(
 cid number(5) primary key,
 category_name varchar(20)

);

-- create fourth table
create table products
(
pid number(5) primary key,
cid number(5) references categories(cid), bid number(5) references brands(bid),
sid number(5),
pname varchar(20),
p_stock number(5),
price number(5),
added_date date,
foreign key(sid) references stores(sid)
); 

-- create fifth table
 create table stores
( 
    sid number(5) primary key,
	sname varchar(20),
	address varchar(20),
	mobno number(10)
 );
 
-- create sixth table
create table provides(
bid number(5)references brands(bid), 
sid number(5)references stores(sid), 
discount number(5)
);

-- create seventh table
create table customer_cart
( cust_id number(5) primary key, 
name varchar(20),
mobno number(10)
);

-- create another table
create table select_products
(
cust_id number(5) references customer_cart(cust_id),
pid number(5)references product(pid), 
quantity number(4)
 );
 
-- create ninth table
create table transactions( 
id number(5) primary key, 
 total_amount number(5),
	paid number(5),
	due number(5),
	gst number(3),
	discount number(5),
	payment_method varchar(10),
	cart_id number(5) references customer_cart(cust_id) 
	);
	
-- create last table
create table invoices( 
    item_no number(5),
	product_name varchar(20),
	quantity number(5),
	net_price number(5),
	transaction_id number(5)references transactions(id) 
	);
	
-- Insertion Functions
insert into brands values('1','Apple');
insert into brands values('2','Samsung');
insert into brands values('3','Lava');
insert into brands values('4','Oppo');
insert into brands values('5','Vivo');
insert into brands values('6','Oneplus');



insert into inv_user values('harsh@gmail.com','Harsh Khanelwal','1111','30-oct- 18 10:20','Manager');
 
insert into inv_user values('prashant@gmail.com','Prashant','0011','29-oct-18 10:20','Accountant');

insert into categories values(1,'Mobile Phones'); 
insert into categories values(2,'Clothing'); 
insert into categories values(3,'Grocery'); 


insert into products values(2,1,1,1,'Airpods',3,19000,'27-oct- 18'); 
insert into products values(3,1,1,1,'Smart Watch',3,19000,'27-oct-18'); 
insert into products values(4,2,3,2,'Air Max',6,7000,'27-oct-18'); 
insert into products values(5,3,4,3,'REFINED OIL',6,750,'25-oct-18');


insert into provides values(1,1,12); 
insert into provides values(2,2,7); 
insert into provides values(3,3,15); 
insert into provides values(1,2,7);

insert into provides values(4,2,19); 
insert into provides values(4,3,20);



insert into customer_cart values(2,'Shyam',7777777777); 
insert into customer_cart values(3,'Mohan',7777777775);


insert into select_products values(1,3,1); 
insert into select_products values(2,3,3);
insert into select_products values(3,2,1); 

insert into transactions values(2,57000,57000,0,570,570,'cash',2);
insert into transactions values(3,19000,17000,2000,190,190,'credit',3);

-- Access some information
select * from products where pid>3;

select bname from brands;

select avg(pid) from products;

select sum(paid) from transactions;

select name from customer_cart where mobno>70000000;

































 






 





