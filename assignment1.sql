


create database assignment;


create table  SalesPeople
       (Snum int ,
       Sname varchar (50) not null,
       City varchar (50) ,
       Comm   float ,
       primary key (Snum));
       
insert into salespeople values
( 1001 ,'Peel', 'London' ,.12),

(1002 , 'Serres' ,'Sanjose' ,.13),

(1004 ,'Motika', 'London', .11),

(1007, 'Rifkin', 'Barcelona', .15),

(1003, 'Axelrod' ,'Newyork' ,.10);

select * from salespeople; 
  
create table  customers
	(Cnum int primary key ,
       Cname varchar (50) ,
       City varchar (50) not null,
       Snum int ,
	   foreign key (Snum) references salespeople(Snum));

insert into customers values
( 2001 , 'Hoffman' ,'London', 1001),

(2002 , 'Giovanni', 'Rome', 1003),

(2003,  'Liu', 'Sanjose', 1002),

(2004 , 'Grass', 'Berlin', 1002),

(2006 ,'Clemens', 'London', 1001),

(2008 ,'Cisneros', 'Sanjose', 1007),

(2007 ,'Pereira', 'Rome', 1004);

select * from customers; 

create table  orders
	(Onum  int primary key ,
       Amt decimal(7,2) ,
       Odate date not null,
       Cnum int,
       Snum int ,
	   foreign key (Snum) references salespeople(Snum),
       foreign key (Cnum) references customers(Cnum));

insert into orders values
(3001 ,18.69 ,'1990-10-03' ,2008 ,1007),

(3003 ,767.19 ,'1990-10-03' ,2001, 1001),

(3002, 1900.10,'1990-10-03', 2007 ,1004),

(3005 , 5160.45, '1990-10-03', 2003 ,1002),

(3006 , 1098.16 ,'1990-10-03' ,2008, 1007),

(3009, 1713.23, '1990-10-04' ,2002, 1003),

(3007 , 75.75, '1990-10-04', 2004 ,1002),

(3008  ,4273.00 ,'1990-10-05', 2006 ,1001),

(3010 , 1309.95, '1990-10-06', 2004 ,1002),

(3011,  9891.88, '1990-10-06', 2006, 1001);

select * from orders;
show tables;

--  1.Count the number of Salesperson whose name begin with ‘a’/’A’.

select count(*) from salespeople  where sname like 'a%';

-- 2. Display all the Salesperson whose all orders worth is more than Rs. 2000.

select sname from salespeople where snum in (select snum from orders where amt > 2000);

-- 3. Count the number of Salesperson belonging to Newyork.
select sname from salespeople where city in ('newyork'); 

-- 4.Display the number of Salespeople belonging to London and belonging to Paris.

select * from salespeople where city in ('london', 'paris'); 

-- 5.Display the number of orders taken by each Salesperson and their date of orders.

select Snum, odate, count(*) as numberoforders from orders ;







