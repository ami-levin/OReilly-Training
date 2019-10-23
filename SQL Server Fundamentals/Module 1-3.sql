-------------------------------------
-- O'Reilly Online Training ---------
-- Getting Started with SQL Server --
-- Module 1.3: Accessing Objects ----
-------------------------------------
-- https://github.com/ami-levin/OReilly-Training/tree/master/SQL%20Server%20Fundamentals
----------------------------------------------------------------------------------------

CREATE LOGIN OReilly WITH PASSWORD = 'some_password';
CREATE SCHEMA OReilly;
CREATE USER OReilly FOR LOGIN OReilly WITH DEFAULT_SCHEMA = OReilly;
CREATE TABLE OReilly.Customers (Customer varchar(20), Country varchar(20));
-- Using dbo schema
SELECT * FROM Customers;
SELECT * FROM OReilly.Customers;
-- assigning permissions (DCL)

/* 
███████╗██╗  ██╗███████╗██████╗  ██████╗██╗███████╗███████╗     ██╗
██╔════╝╚██╗██╔╝██╔════╝██╔══██╗██╔════╝██║██╔════╝██╔════╝    ███║
█████╗   ╚███╔╝ █████╗  ██████╔╝██║     ██║███████╗█████╗      ╚██║
██╔══╝   ██╔██╗ ██╔══╝  ██╔══██╗██║     ██║╚════██║██╔══╝       ██║
███████╗██╔╝ ██╗███████╗██║  ██║╚██████╗██║███████║███████╗     ██║
╚══════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝ ╚═════╝╚═╝╚══════╝╚══════╝     ╚═╝

* NOTE: db-fiddle users skip this exercise
*/

-- In SSMS or SQLCMD, create a new login called OReilly with a password.
-- Use the following statement, or the GUI as you prefer.

CREATE LOGIN OReilly WITH PASSWORD = 'some_password';

-- In SSMS or SQLCMD, create a new Schema called OReilly.
-- Use the following statement, or the GUI as you prefer.
-- * NOTE: Make sure your connection is set to the BasicDemos database context or the schema will be created in the wrong database!

CREATE SCHEMA OReilly;

-- Create a new user called "OReilly" using the query tool editor or SQLCMD.

CREATE USER OReilly FOR LOGIN OReilly WITH DEFAULT_SCHEMA = OReilly;

------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------

/*
███████╗██╗  ██╗███████╗██████╗  ██████╗██╗███████╗███████╗    ██████╗ 
██╔════╝╚██╗██╔╝██╔════╝██╔══██╗██╔════╝██║██╔════╝██╔════╝    ╚════██╗
█████╗   ╚███╔╝ █████╗  ██████╔╝██║     ██║███████╗█████╗       █████╔╝
██╔══╝   ██╔██╗ ██╔══╝  ██╔══██╗██║     ██║╚════██║██╔══╝      ██╔═══╝ 
███████╗██╔╝ ██╗███████╗██║  ██║╚██████╗██║███████║███████╗    ███████╗
╚══════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝ ╚═════╝╚═╝╚══════╝╚══════╝    ╚══════╝

* NOTE: db-fiddle users skip this exercise
*/

-- In SSMS, right click Databases and choose "Refresh".
-- click "Databases" and expand "BasicDemos".
-- Expand "Security" -> "Schemas".
-- Right click "Schemas" and "New Schema". View the options but don't save, cancel.
-- In SSMS or SQLCMD execute the queries:

CREATE TABLE OReilly.Customers (Customer varchar(20), Country varchar(20));

INSERT INTO OReilly.Customers VALUES ('your name', 'your Country');

------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------

/*
███████╗██╗  ██╗███████╗██████╗  ██████╗██╗███████╗███████╗    ██████╗ 
██╔════╝╚██╗██╔╝██╔════╝██╔══██╗██╔════╝██║██╔════╝██╔════╝    ╚════██╗
█████╗   ╚███╔╝ █████╗  ██████╔╝██║     ██║███████╗█████╗       █████╔╝
██╔══╝   ██╔██╗ ██╔══╝  ██╔══██╗██║     ██║╚════██║██╔══╝       ╚═══██╗
███████╗██╔╝ ██╗███████╗██║  ██║╚██████╗██║███████║███████╗    ██████╔╝
╚══════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝ ╚═════╝╚═╝╚══════╝╚══════╝    ╚═════╝ 

*NOTE: db-fiddle users skip this exercise
*/
 
 
 -- Launch a new SQLCMD window using the following syntax to log on as the OReilly user:
 
 SQLCMD -U OReilly -P some_password -d BasicDemos
 
 -- Execute the following query:
 
 SELECT * FROM Customers;
 -- Remember you must add a 'GO' indicator to tell the tool to execute the batch
 
 -- Can you explain the result?
 
 -- Execute the following query in SSMS (using the administrative connection, not the OReilly user....)
 
GRANT SELECT ON OReilly.Customers TO OReilly;

-- Execute the previous query again in SQLCMD.

 SELECT * FROM Customers;
 
 -- Execute the following query:
SELECT * FROM dbo.Customers;
  
 -- Can you explain the result? 
 -- Can you fix it? 
 -- Go ahead and do it...

------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------

/*
██████╗ ███████╗███████╗ ██████╗ ██╗   ██╗██████╗  ██████╗███████╗███████╗
██╔══██╗██╔════╝██╔════╝██╔═══██╗██║   ██║██╔══██╗██╔════╝██╔════╝██╔════╝
██████╔╝█████╗  ███████╗██║   ██║██║   ██║██████╔╝██║     █████╗  ███████╗
██╔══██╗██╔══╝  ╚════██║██║   ██║██║   ██║██╔══██╗██║     ██╔══╝  ╚════██║
██║  ██║███████╗███████║╚██████╔╝╚██████╔╝██║  ██║╚██████╗███████╗███████║
╚═╝  ╚═╝╚══════╝╚══════╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═╝ ╚═════╝╚══════╝╚══════╝

Additional Reading:
-------------------
https://docs.microsoft.com/en-us/sql/t-sql/statements/create-database-transact-sql
https://docs.microsoft.com/en-us/sql/relational-databases/security/authentication-access/create-a-database-schema
https://docs.microsoft.com/en-us/sql/relational-databases/security/security-center-for-sql-server-database-engine-and-azure-sql-database
https://docs.microsoft.com/en-us/sql/t-sql/statements/create-schema-transact-sql
https://docs.microsoft.com/en-us/sql/t-sql/statements/create-user-transact-sql
https://docs.microsoft.com/en-us/sql/t-sql/statements/create-role-transact-sql
https://docs.microsoft.com/en-us/sql/t-sql/statements/grant-transact-sql
https://docs.microsoft.com/en-us/sql/t-sql/statements/revoke-transact-sql
https://docs.microsoft.com/en-us/sql/t-sql/statements/deny-transact-sql
*/