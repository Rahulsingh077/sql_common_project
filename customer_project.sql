/* In this project we will create a database for dummy E commerence organization named xyz_corp
where we will maintain entire operation in three tables viz. EMPLOYEE , SALES & CLIENT
EMPLOYEE table maintain data of employees of xyz_corp
SALES table will maintain all data related to sales section
CLIENT table will maintain record of xyz_corp's clients i.e. store owners who will provide products on xyz_corp's platform  
*/
create database xyz_corp;
use xyz_corp;
create table employees
(employee_id int primary key,
employee_name varchar(60) not null,
employee_rating int);
desc employees;
select * from employees;
insert into employees (employee_id, employee_name, employee_rating) values
(1,"rahul",5),(2,"dhruv",4),(3,"naeem",4),(4,"raj",3);
-- creating clients table 
create table clients (
store_id int primary key auto_increment,
store_name varchar(60) not null);
select* from clients;
insert into clients (store_id, store_name) values
(1001,"croma"),(1002,"ikea"),(1003,"bata"),(1004,"starbucks"),(1005,"zudio"),(1006,"sankalp");
-- creating sales table
create table sales
 (
sales_id int primary key auto_increment,
product_name varchar(70) not null,
store_id int not null,
employee_id int not null,
foreign key (store_id) references clients(store_id),
foreign key (employee_id) references employees(employee_id)
);
desc sales;
select * from sales;
insert into sales (sales_id, product_name, store_id, employee_id) values
(7001,"masala dosa",1006,2),(7002,"refrigerator",1001,1),(7003,"water purifier",1001,1),(7004,"formal black shoes",1003,3),
(7005,"sofa set",1002,4),(7006,"bed",1002,4),(7007,"filter coffee",1004,2),(7008,"veg sandwich",1004,2),(7009,"track suit",1005,1),
(7010,"sneakers",1005,1),(7011,"paper dosa",1006,3);
insert into sales (sales_id, product_name, store_id, employee_id) values
(7012,"latte",1004,3),(7013,"sandwich",1004,3),(7014,"washing machine",1001,1);
-- we want to see top 3 clients with maximun transactions
select clients.store_name, sales.store_id ,count(sales.sales_id) as transactions from sales
inner join clients
on sales.store_id = clients.store_id
group by sales.store_id
order by transactions desc
limit 3;

-- checking employee_id of employees who got 3 or more star ratings
select employee_name , employee_id,employee_rating from employees
where employee_rating >= 3;
commit;

-- updating sales date
update sales set sales_date =(2023-4-1) where sales_id=1;
select * from sales;
-- counting average monthly sales of each product
select product_name , count(sales_date) as avg_sales from sales
group by product_name
order by avg_sales desc;
-- inserting new clients
insert into clients (store_id, store_name) values
(1007,"applestore"),(1008,"Rtrends"),(1009,"zudio"),(1010,"tansiq"),(1011,"tgb"),(1012,"tansiq"),(1013,"bluebuddha");

-- finding and deleting duplicate records from clients table
select store_name , count(store_name) from clients
group by store_name
having count(store_name) > 1;

delete clients from clients
inner join clients as c2
where clients.store_id<c2.store_id and clients.store_name=c2.store_name;

-- finding common data in clints and sales table
select * from clients
join sales
on clients.store_id = sales.store_id;

