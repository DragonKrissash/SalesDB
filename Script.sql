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






