/* PostgreSQL commands to seed tables */

CREATE TABLE Customers(
  CustomerID serial PRIMARY KEY,
  CustomerName varchar,
  ContactName varchar,
  Address varchar,
  City varchar,
  PostalCode varchar,
  Country varchar
);

COPY Customers(CustomerName, ContactName, Address, City, PostalCode, Country)
FROM 'C:\sql\Customers.csv' DELIMITER ';' CSV HEADER;



CREATE TABLE Categories(
  CategoryID serial PRIMARY KEY,
  CategoryName varchar,
  Description varchar
);

COPY Categories(CategoryName, Description)
FROM 'C:\sql\Categories.csv' DELIMITER ';' CSV HEADER;


CREATE TABLE Employees(
  EmployeeID serial PRIMARY KEY,
  LastName varchar,
  FirstName varchar,
  BirthDate date,
  Photo varchar,
  Notes varchar
);

COPY Employees(LastName, FirstName, BirthDate, Photo, Notes)
FROM 'C:\sql\Employees.csv' DELIMITER ';' CSV HEADER;


CREATE TABLE OrderDetails(
  OrderDetailID serial PRIMARY KEY,
  OrderID INT,
  ProductID INT,
  Quantity INT
);

COPY OrderDetails(OrderID, ProductID, Quantity)
FROM 'C:\sql\OrderDetails.csv' DELIMITER ';' CSV HEADER;


/* use a custom sequence */
CREATE SEQUENCE orders_orderid_seq
  start 10248
  increment 1;
CREATE TABLE Orders(
  OrderID INT PRIMARY KEY DEFAULT nextval('orders_orderid_seq'),
  CustomerID INT,
  EmployeeID INT,
  OrderDate date,
  ShipperID INT
);

COPY Orders(CustomerID, EmployeeID, OrderDate, ShipperID)
FROM 'C:\sql\Orders.csv' DELIMITER ';' CSV HEADER;


CREATE TABLE Products(
  ProductID serial PRIMARY KEY,
  ProductName varchar,
  SupplierID INT,
  CategoryID INT,
  Unit varchar,
  Price real
);

COPY Products(ProductName, SupplierID, CategoryID, Unit, Price)
FROM 'C:\sql\Products.csv' DELIMITER ';' CSV HEADER;


CREATE TABLE Shippers(
  ShipperID serial PRIMARY KEY,
  ShipperName varchar,
  Phone varchar
);

COPY Shippers(ShipperName, Phone)
FROM 'C:\sql\Shippers.csv' DELIMITER ';' CSV HEADER;


CREATE TABLE Suppliers(
  SupplierID serial PRIMARY KEY,
  SupplierName varchar,
  ContactName varchar,
  Address varchar,
  City varchar,
  PostalCode varchar,
  Country varchar,
  Phone varchar
);

COPY Suppliers(SupplierName, ContactName, Address, City, PostalCode, Country, Phone)
FROM 'C:\sql\Suppliers.csv' DELIMITER ';' CSV HEADER;
