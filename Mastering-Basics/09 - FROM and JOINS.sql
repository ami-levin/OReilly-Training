-- O'reilly Online Training
-- Mastering Relational SQL Querying
-- FROM clause and JOINS
--------------------------------------

-----------------------------------
-- CLASS EXAMPLES -----------------
-----------------------------------

-- CROSS JOIN
SELECT 	*
FROM 	Customers
		CROSS JOIN
		Items;

SELECT	*
FROM	Customers AS C
		INNER JOIN
		Items
		ON 1=1;

-- INNER JOIN
SELECT 	*
FROM 	Orders AS O
		INNER JOIN
		OrderItems AS OI
		ON O.OrderID = OI.OrderID;

-- OUTER JOIN
SELECT 	*
FROM	Items AS I
		LEFT OUTER JOIN
		OrderItems AS OI
		ON I.Item = OI.Item;
-- Which item was never ordered?

-- Joining more than 2 tables
SELECT	*
FROM	Items AS I
		LEFT OUTER JOIN
			(
				OrderItems AS OI
				INNER JOIN -- LEFT OUTER JOIN
				Orders AS O
				ON O.OrderID = OI.OrderID
			)
		ON I.Item = OI.Item;

-- Non equality JOIN predicate
SELECT	*
FROM	Customers AS C1
		INNER JOIN
		Customers AS C2
		ON C1.Customer > C2.Customer;


-----------------------------------
-- EXERCISES ----------------------
-----------------------------------

-- Create a new database using the DemoDB_Script.sql script
-----------------------------------------------------------
-- 1. Download the DemoDB_Script.sql file and save to a local folder
-- 2. Open DB Browser and click File -> Import -> Database from SQL File 
-- 3. Select the DemoDB_Script.sql file and click Open
-- 4. In the 'save as database file' window, choose a name and location for the database file
-- 5. Click OK and confirm that you can see the tables and data

-- OR Use the pre-built DemoDB_SQLite3.db file
-----------------------------------
-- 1. Download the DemoDB_SQLite3.db and save it to a local folder
-- 2. Open DB Browser and click File -> Open Database
-- 3. Point to the downloaded file and click 'OK. 
-- 4. Confirm that you can see the tables and data 

-- Exercise 1
-- Write a query that returns all orders and include the countries of the customers

-- Exercise 2
-- Change the above query so that it returns customers that made no orders as well

-- Exercise 3
-- Write a query that returns all orders, include the country of the customer, and the order items
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
--
-----------------------------------
-- EXERCISE ANSWERS ---------------
-----------------------------------

-- Exercise 1
-- Write a query that returns all orders and include the countries of the customers

SELECT	*
FROM	Orders AS O
		INNER JOIN
		Customers AS C
		ON O.Customer = C.Customer

-- Exercise 2
-- Change the above query so that it returns customers that made no orders as well

SELECT	*
FROM	Customers AS C
		LEFT OUTER JOIN
		Orders AS O
		ON O.Customer = C.Customer

-- Exercise 3
-- Write a query that returns all orders, the order items, and include the country of the customer

SELECT	*
FROM	Orders AS O
		INNER JOIN
		OrderItems AS OI
		ON O.OrderID = OI.OrderID
		INNER JOIN
		Customers AS C
		ON C.Customer = O.Customer;
