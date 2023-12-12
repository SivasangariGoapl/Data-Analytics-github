Use classicmodels;
/* Question Day 3(1)*/
select * from customers;
select customernumber,customername,state,creditlimit from customers where state is not null and creditlimit between 50000 and 100000 order by creditlimit DESC;

/*Question Day 3(2)*/
select * from products;
select distinct(productline) from products where productLine like "%cars";

/*Question Day 4(1)*/
Select * from orders;
select ordernumber,status,ifnull(comments,"-")as "comments" from orders where status="shipped";

/*Question Day 4(2)*/
 select * from employees;
select ordernumber, status, ifnull(comments,"-") from orders
where status = "shipped";
select employeeNumber,firstName, jobTitle, case
when jobtitle = "president" then "P"
when jobtitle like "%Sales manager%" then "SM"
when jobtitle like "%Sale manager%" then "SM"
when jobtitle = "Sales rep" then "SR"
when jobtitle like "%VP%" then "VP"
else jobtitle
end as Jobtitle_abbr
from employees;
 
 /*Question Dayn 5*/
 select * from payments;
 select year(paymentdate) as "year", min(amount) as "MIN AMOUNT" from payments group by year order by year(paymentdate);
 
 /*Question Day 5(2)*/
 select * from orders;
 select year(orderdate) as "year", concat("Q",quarter(orderdate)) as "quarter",count(distinct(customernumber)) as "unique customers", count(ordernumber) 
 as "total orders" from orders group by year,quarter;
 
 /*Question Day 5(3)*/
 use classicmodels;
 select left(monthname(paymentdate),"3") as "month", concat(Round(sum(amount/1000)),"k") as "formatted_amount" from payments group  by month order by formatted_amount desc;
 select * from payments;
select date_format(paymentDate, '%b')as month, concat(format (sum(amount)/1000,0),'K') as "Formatted Amount" 
from payments
group by month having sum(amount) between 500000 and 1000000 
order by sum(amount)desc;
 
 /*Question Day 6(1)*/
 create table journey1(bus_id int not null,bus_name varchar(20) not null,source_station varchar(20) not null,destination varchar(20) not null,email varchar(30) unique);
 Insert Into Journey1 values(21345,"Red Bus","Bangalore","Delhi","vithal672@gmail.com");
 Insert Into Journey1 values(15673,"SRC","Mysore","pune","kishore32@gmail.com");
 Insert Into Journey1 values(34526,"ClearTrip","Chennai","Andrapradesh","Maahi90@gmail.com");
 Insert Into Journey1 values(43521,"AbhiBus","kerala","Maharastra","abhi456@gmail.com");
 Select * from Journey1;
 desc journey1;
 
 /*Question Day 6(2) vendor*/
 create table vendor(vendors_id int unique,name varchar(50) not null,Email varchar(30)unique,Country varchar(20));
 select * from vendor;
 Desc vendor;
 insert into vendor values(7,"vithal","vithal90@gmail.com","India");
 insert into vendor values(3,"Stefan","stefan7t4@gmail.com","USA");
 insert into vendor values(11,"cha eun woo","chaun856@gmail.com","China");
 insert into vendor values(13,"Azzd","Azzii90@gmail.com","Cannada");
 alter table vendor modify column country varchar(30) default "NA";
 alter table vendor modify column vendors_id int not null;
 select * from vendor;
 
 create table vendor(Vendor_id int not null unique,
					Name varchar(50) not null,
                    Email varchar(50) unique,
                    country varchar(50) default "N/A");
                    
desc vendor;
 
 /*Question 6(3) movie*/
 create table movie(movie_id int unique not null,Name varchar(30) not null,Release_year varchar(10) default"-",Cast varchar(60) not null,
 Gender varchar(20),no_of_shows int check(no_of_shows>0));
 desc movie;
 
 /*Question 6(4a) product*/
 create table product(product_id int primary key,
 product_name varchar(20) not null unique,Descr varchar(30));
 alter table product add column supplier_id int;
 alter table product modify column product_id int auto_increment;
 desc product;
 insert into product(product_name,descr) values("Ferrari","we are competition");
 insert into product(product_name,descr) values("Apple iPhone 15","Think Different");
 insert into product(product_name,descr) values("Celine","Luxury & Elegance"),("Dior"," Care & simplicity");
 select * from product;
 
 /*Question 6(4b) supplier*/
 create table supplier(supplier_id int primary key,
 supplier_name varchar(20),location varchar(20));
 insert into supplier(supplier_id,supplier_name,location)
 values(121,"Ananyaa","Delhi"),(123,"Ameer","Mumbai"),(125,"Abhimanyhu","Bangalore");
 alter table product drop column supplier_id; 
 select * from supplier;
 alter table product add foreign key(supplier_id)references supplier(supplier_id) 
 on update cascade on delete cascade;
 update product set supplier_id=100;
 set sql_safe_updates=0;
 update supplier set supplier_id=121 where location="Delhi";
 select * from product;
 
 /*Question 6(4c) stock*/
 create table stock(id int primary key auto_increment,balance_stock int);
 insert into stock(balance_stock) values(7212),(3049),(9876);
 select * from stock;
 alter table stock add column product_id int;
 alter table stock add foreign key(product_id) 
 references product(product_id) on update cascade on delete cascade;
 insert into stock (balance_stock) values (7854);
 update stock set product_id=5;
 update product set product_id=8 where product_name="ferrari";
 select * from product;
 
 /*Question Day 7(1)*/
 select * from employees;
 select * from customers;
 select employeenumber,concat(firstname," ",lastname) as "sales_person",count(customernumber) as "uniquecustomer" from customers inner join employees 
 on customers.salesRepemployeeNumber = employees.employeenumber group by employeenumber order by count(customernumber) desc;
 
/*Question Day 7(2)*/
select * from customers;
select * from orders;
select * from orderdetails;
select * from products;
select customers.customerNumber,customers.customerName,orderdetails.productCode,
products.productName,orderdetails.quantityOrdered 
as "Orderedquantity",products.quantityInStock as "Total Inventary",
products.quantityInStock-orderdetails.quantityOrdered as "Leftquantity" 
from customers inner join orders using(customernumber) inner join orderdetails
using(ordernumber) inner join products using(productcode) order by 
customers.customerNumber,products.productCode;
set sql_mode=" ";

/*Question Day 7(3)*/
create table laptop1(laptop_name varchar(20));
insert into laptop1 values("Dell"),("HP");
select * from laptop1;
create table color1(color_name varchar(20));
insert into color1 values("White"),("Silver"),("Black");
select * from color1;
select * from laptop1 cross join color1 order by laptop_name;

/*Question Day 7(4)*/
Use classicmodels;
create table project1(employeeid int,fullname varchar (30),gender varchar(10),managerID int);
Desc project1;
insert into project1 values(1,"Pranaya","Male",3),(2,"Priyanka","Female",1),(3,"Preety","Female",null),
(4,"Anurag","Male",1),(5,"Sambit","Male",1),(6,"Rajesh","Male",3),(7,"Hina","Female",3);
select * from project1;
drop table project1;
select* from project1 as t1 join project1 as t2 on t2.employeeID=t1.managerID;
select t2.fullname as "Manager Name",t1.fullname as "employee name" from project1 
as t1 join project1 as t2 on t2.employeeID=t1.managerID order by t1.managerID,t1.employeeID;

/*Question Day 8*/
create table facility1(facility_id int,Name varchar(100),state varchar(100),country varchar(100));
select * from facility1;
alter table facility1 modify column facility_id int primary key auto_increment;
alter table facility1 add column city varchar(100) after Name;
desc facility1;
insert into facility1 (name,city,state,country) values("Aarif","Bangalore","Mumbai","India");
select * from facility1;


/*Question Day 9*/
create table university1(id int,Name varchar(30));
insert into university1 values(1,concat(LTRIM(  "Pune")," ",trim(  "University "))),(2,concat(LTRIM(  "Mumbai")," ",
trim(  "University   "))),(3,concat(ltrim(" Delhi"),"  ",trim(  "University  "))),(4,"Madras University"),(5,"Nagpur University");
select * from University1;
select concat((  "pune")," ",trim("   University  "))from university1;
set sql_safe_update=0;
insert into university1 values(1, "Pune   University  "),(2,  "Mumbai    University  "),(3,"  Delhi  University   "),
(4,"Madras University "),(5,"Nagpur University ");
update university1 set name=replace(name,'  ','');
select * from University1;

/*Question Day 10*/
use classicmodels;
select * from products;
select * from orders;
select * from orderdetails;
select year(orderdate) as "year",concat(count(quantityordered)," ","(",left(count(quantityordered)*100/3,2),'%',")") as "value" from orders join orderdetails
using(ordernumber) group by year(orderdate) order by count(quantityOrdered) desc;

/*Question Day 11*(1)/
/* getcustomerlevel */
select * from customers;
call classicmodels.GetCustomerLevel(103);
select  customernumber, case 
when creditlimit > 100000 then "Platinum"
when creditlimit between 25000 and 100000 then "Gold"
else "Silver"
end as "customer level" from customers 
 group by customernumber ;

/*get_country_payments*/
select * from customers;
select * from payments;
call classicmodels.Get_Country_payments("France", 2003);
select year(p.paymentdate) as Year,
c.country as country,
concat(round(sum(p.amount)/1000),'K') as TotalAmount
from Payments p
join customers c on p.customernumber = c.customernumber
where year(p.paymentdate) = year and c.country = country
group by year(p.paymentdate),c.country;


/*Question Day 12*/
select * from orders;
select year(orderdate),monthname(orderdate),count(ordernumber),
concat(round(((count(ordernumber)-lag(count(ordernumber),1)over())/lag(count(ordernumber),1)
over())*100),"%") as "%YOY change" from orders group by year(orderDate),monthname(orderDate);

/*Question Day 12(2)*/
CREATE TABLE emp_udfun(Emp_ID INT PRIMARY KEY AUTO_INCREMENT ,Name VARCHAR(255) NOT NULL,DOB DATE );
INSERT INTO emp_udfun (Name, DOB)VALUES ("Piyush", "1990-03-30"),("Aman", "1992-08-15"),("Meena", "1998-07-28"),("Ketan", "2000-11-21"),("Sanjay", "1995-05-21");
select*,calculate_age(DOB) as age from emp_udfun;
    
-- Create the user-defined function calculate_age
set global log_bin_trust_function_creators=1;
DELIMITER //
CREATE FUNCTION calculate_age(dob DATE)
RETURNS VARCHAR(50)
BEGIN
    DECLARE years INT;
    DECLARE months INT;
    DECLARE age VARCHAR(50);
SET years = TIMESTAMPDIFF(YEAR, dob, CURDATE());
SET months = TIMESTAMPDIFF(MONTH, dob, CURDATE()) - (years * 12);
SET age = CONCAT(years, ' years ', months, ' months');    
RETURN age;
END //
DELIMITER ;
SHOW FUNCTION STATUS LIKE 'calculate_age';

/*Question Day 13(1)*/
select * from customers;
select * from orders;
select customernumber,customername from customers where customerNumber not in(select customerNumber from orders);

/*Question Day 13(2)*/
select * from customers;
select * from orders;
select customernumber,customername,count(ordernumber) as "Total orders" from customers left join orders
using(customernumber) group by customernumber Union all 
select customernumber,customername,count(ordernumber) as "Total orders" from orders left join customers
using(customernumber) group by customerNumber;

/*Question Day 13(3)*/
select * from orderdetails;
with s as (select *,dense_rank() 
over (partition by ordernumber order by quantityordered desc) as rnk from orderdetails)
select distinct(ordernumber),quantityordered from s where rnk=2;

/*Question Day 13(4)*/
select * from orderdetails;
with s as (select count(ordernumber) as Total from orderdetails group by orderNumber)
select Max(Total),Min(Total) from s;

/*Question Day 13(5)*/
select * from products;
select * from productlines;
select productline,count(productline) as"Total" from products where buyPrice>(select avg(buyPrice) from products)
group by productline order by count(productLine) desc;

/*Question Day 14*/
/* nullerror stored proc*/
create table EMP_EH1(EMPID INT PRIMARY KEY,EMPNAME VARCHAR(20) unique ,EMAILADDRESS VARCHAR(40));
INSERT INTO EMP_EH1 VALUES(1,"vital","vitalrav75@gmail.com");
INSERT INTO EMP_EH1 VALUES(NULL,"Ragav","Ragavk7568@gmail.com");
SELECT* FROM EMP_EH1;


/*Question Day 15*/
create table Emp_BIT1 (Name varchar(255),Occupation VARCHAR(255),Working_date DATE,Working_hours INT);
INSERT INTO Emp_BIT1 VALUES
('Robin', 'Scientist', '2020-10-04', 12),  
('Warner', 'Engineer', '2020-10-04', 10),  
('Peter', 'Actor', '2020-10-04', 13),  
('Marco', 'Doctor', '2020-10-04', 14),  
('Brayden', 'Teacher', '2020-10-04', 12),  
('Antonio', 'Business', '2020-10-04', 11);
SELECT*FROM Emp_BIT1 ;


DELIMITER //
CREATE TRIGGER Emp_BIT1_BeforeInsert
BEFORE INSERT ON Emp_BIT1
FOR EACH ROW
BEGIN
    IF NEW.Working_hours < 0 THEN
        SET NEW.Working_hours = -NEW.Working_hours;
    END IF;
END //

DELIMITER ;





















 

 
 
 
 
 


 
 
 
 
 


