-- O'reilly Online Training
-- Relational SQL Querying - Mastering the Basics
-- Demo DB
--------------------------------------
-- DROP DATABASE BasicDemos;
-- CREATE DATABASE BasicDemos;
-- GO

USE BasicDemos;
GO

CREATE TABLE Customers  (
                        Customer VARCHAR(20) NOT NULL 
							PRIMARY KEY,
                        Country VARCHAR(20) NULL
                        );

CREATE TABLE Items		(
                        Item VARCHAR(20) NOT NULL 
							PRIMARY KEY
                        );

CREATE TABLE Orders		(
						OrderID INTEGER NOT NULL 
							PRIMARY KEY,
						OrderDate DATE NOT NULL,
						Customer VARCHAR(20) NOT NULL 
							REFERENCES Customers(Customer) 
						);

CREATE TABLE OrderItems (
                        OrderID INTEGER NOT NULL 
							REFERENCES Orders(OrderID),
                        Item VARCHAR(20) NOT NULL 
							REFERENCES Items(Item),
                        Quantity INTEGER NOT NULL 
							CHECK (Quantity > 0),
                        Price DECIMAL(9,2) NOT NULL 
							CHECK (Price >=0),
                        PRIMARY KEY (OrderID, Item)
                        );

INSERT INTO Customers (Customer, Country)
VALUES ('Dave', 'USA'), ('John', 'USA'), ('Gerald', 'Canada'), ('Jose', 'Peru'), ('Tim', NULL);

INSERT INTO Items (Item)
VALUES  ('Pencil'), ('Pen'), ('Marker'), ('Notebook'), ('Ruler');

INSERT INTO Orders (OrderID, OrderDate, Customer)
VALUES  (1, '20180101', 'Dave'), (2, '20180102', 'John'), (3, '20180103', 'Gerald'), (4, '20180109', 'John');

INSERT INTO OrderItems (OrderID, Item, Quantity, Price)
VALUES  (1, 'Pen', 2, 1.5), (1, 'Pencil', 1, 0.75),
        (2, 'Marker', 3, 3),
        (3, 'Pen', 1, 1.5), (3, 'Marker', 1, 3),
        (4, 'Pen', 4, 1.5), (4, 'Pencil', 2, 1.25), (4, 'Ruler', 2, 3);

