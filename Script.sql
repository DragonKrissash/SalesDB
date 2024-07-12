create database Salesdb;
use salesdb;

create table productlines(
productLine varchar(50) primary key,
textDescription varchar(4000),
htmlDescription mediumtext,
image mediumblob);

create table products(
productCode varchar(15) primary key,
productName varchar(70) not null,
productLine varchar(50),
productScale varchar(10) not null,
productVendor varchar(50) not null,
productDescription text not null,
quantityInStock smallint not null,
buyPrice decimal(10,2) not null,
MSRP decimal(10,2) not null,
foreign key (productLine) references productlines(productLine));

create table offices(
officeCode VARCHAR(10) PRIMARY KEY,
city VARCHAR(50) NOT NULL,
phone VARCHAR(50) NOT NULL,
addressLine1 VARCHAR(50) NOT NULL,
addressLine2 VARCHAR(50),
state VARCHAR(50),
country VARCHAR(50) NOT NULL,
postalCode VARCHAR(15) NOT NULL,
territory VARCHAR(10) NOT NULL);

create table employees(
employeeNumber INT PRIMARY KEY,
lastName VARCHAR(50) NOT NULL,
firstName VARCHAR(50) NOT NULL,
extension VARCHAR(10) NOT NULL,
email VARCHAR(100) NOT NULL,
officeCode VARCHAR(10),
reportsTo INT,
jobTitle VARCHAR(50) NOT NULL,
foreign key (officeCode) references offices(officeCode),
foreign key (reportsTo) references employees(employeeNumber));

create table customers(
customerNumber INT PRIMARY KEY,
customerName VARCHAR(50) NOT NULL,
contactLastName VARCHAR(50) NOT NULL,
contactFirstName VARCHAR(50) NOT NULL,
phone VARCHAR(50) NOT NULL,
addressLine1 VARCHAR(50) NOT NULL,
addressLine2 VARCHAR(50),
city VARCHAR(50) NOT NULL,
state VARCHAR(50),
postalCode VARCHAR(15),
country VARCHAR(50) NOT NULL,
salesRepEmployeeNumber INT,
creditLimit DECIMAL(10, 2),
foreign key (salesRepEmployeeNumber) references employees(employeeNumber));

create table orders(
orderNumber INT PRIMARY KEY,
orderDate DATE NOT NULL,
requiredDate DATE NOT NULL,
shippedDate DATE,
status VARCHAR(15) NOT NULL,
comments TEXT,
customerNumber INT,
foreign key (customerNumber) references customers(customerNumber));

create table orderdetails(
orderNumber INT,
productCode VARCHAR(15),
quantityOrdered INT NOT NULL,
priceEach DECIMAL(10, 2) NOT NULL,
orderLineNumber SMALLINT NOT NULL,
primary key(orderNumber, productCode),
foreign key (orderNumber) references orders(orderNumber),
foreign key (productCode) references products(productCode));

create table payments(
customerNumber INT,
checkNumber VARCHAR(50) PRIMARY KEY,
paymentDate DATE NOT NULL,
amount DECIMAL(10, 2) NOT NULL,
foreign key (customerNumber) references customers(customerNumber));

insert into productlines(productLine,textDescription) 
values('Classic Cars', 'Cars from the 1950s and 1960s'),
('Motorcycles', 'A range of motorcycles');

insert into products values
('S10_1678', '1969 Harley Davidson Ultimate Chopper', 'Motorcycles', '1:10', 'Min Lin Diecast', 'This replica features working kickstand, front suspension, gear-shift lever.', 7933, 48.81, 95.70);

insert into offices values
('1', 'San Francisco', '+1 650 219 4782', '100 Market Street', 'Suite 300', 'CA', 'USA', '94080', 'NA');

insert into employees values
(1002, 'Murphy', 'Diane', 'x5800', 'dmurphy@classicmodelcars.com', '1', NULL, 'President');

insert into customers values
(103, 'Atelier graphique', 'Schmitt', 'Carine', 154236854 ,'40.32.2555', '54', 'rue Royale', 'Nantes',040, 'France', 1002, 21000.00);

insert into orders values
(10100, '2003-01-06', '2003-01-13', '2003-01-10', 'Shipped','Done', 103);

insert into orderdetails values
(10100, 'S10_1678', 30, 95.70, 1);

insert into payments values
(103, 'HQ336336', '2004-10-19', 6066.78);

select * from customers;
select * from employees;
select * from offices;
select * from orderdetails;
select * from orders;
select * from payments;
select * from productlines;
select * from products;
