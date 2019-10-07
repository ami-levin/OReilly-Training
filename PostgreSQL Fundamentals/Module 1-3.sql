-----------------------------------
-- O'reilly Online Training -------
-- PostgreSQL fundamentals --------
-- Module 1.3: Accessing Objects --
-----------------------------------
-- https://github.com/ami-levin/OReilly-Training/tree/master/PostgreSQL%20Fundamentals
--------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------

CREATE SCHEMA oreilly;
-- Using public schema
CREATE USER oreilly WITH PASSWORD = 'some_password';
CREATE TABLE oreilly.customers (customer varchar(20), country varchar(20));
SELECT * FROM customers;
SELECT * FROM oreilly.customers;
-- assigning permissions (DCL)

/* 
███████╗██╗  ██╗███████╗██████╗  ██████╗██╗███████╗███████╗     ██╗
██╔════╝╚██╗██╔╝██╔════╝██╔══██╗██╔════╝██║██╔════╝██╔════╝    ███║
█████╗   ╚███╔╝ █████╗  ██████╔╝██║     ██║███████╗█████╗      ╚██║
██╔══╝   ██╔██╗ ██╔══╝  ██╔══██╗██║     ██║╚════██║██╔══╝       ██║
███████╗██╔╝ ██╗███████╗██║  ██║╚██████╗██║███████║███████╗     ██║
╚══════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝ ╚═════╝╚═╝╚══════╝╚══════╝     ╚═╝

* NOTE: dbfiddle users skip this exercise
*/

-- Create a new user called "oreilly" using the query tool editor or PSQL.

CREATE USER oreilly WITH PASSWORD 'some_password';

-- In PgAdmin, right click on Login/Group Roles and click "Refresh". 
-- Make sure user oreilly is visible.

--------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------

/*
███████╗██╗  ██╗███████╗██████╗  ██████╗██╗███████╗███████╗    ██████╗ 
██╔════╝╚██╗██╔╝██╔════╝██╔══██╗██╔════╝██║██╔════╝██╔════╝    ╚════██╗
█████╗   ╚███╔╝ █████╗  ██████╔╝██║     ██║███████╗█████╗       █████╔╝
██╔══╝   ██╔██╗ ██╔══╝  ██╔══██╗██║     ██║╚════██║██╔══╝      ██╔═══╝ 
███████╗██╔╝ ██╗███████╗██║  ██║╚██████╗██║███████║███████╗    ███████╗
╚══════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝ ╚═════╝╚═╝╚══════╝╚══════╝    ╚══════╝

* NOTE: dbfiddle users skip this exercise
*/

-- In PgAdmin or PSQL, execute the query:
-- * NOTE: Make sure your connection is set to the basicdemos database!

CREATE SCHEMA oreilly;

-- In PgAdmin, right click "Schemas" (under basicdemos) and click "Refresh".
-- Right click "Schemas" -> "Create" -> "Schema" and view the options but don't save, cancel.

-- In PgAdmin or PSQL execute the queries:

CREATE TABLE oreilly.customers (customer varchar(20), country varchar(20));

INSERT INTO oreilly.customers VALUES ('your name', 'your country');

--------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------

/*
███████╗██╗  ██╗███████╗██████╗  ██████╗██╗███████╗███████╗    ██████╗ 
██╔════╝╚██╗██╔╝██╔════╝██╔══██╗██╔════╝██║██╔════╝██╔════╝    ╚════██╗
█████╗   ╚███╔╝ █████╗  ██████╔╝██║     ██║███████╗█████╗       █████╔╝
██╔══╝   ██╔██╗ ██╔══╝  ██╔══██╗██║     ██║╚════██║██╔══╝       ╚═══██╗
███████╗██╔╝ ██╗███████╗██║  ██║╚██████╗██║███████║███████╗    ██████╔╝
╚══════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝ ╚═════╝╚═╝╚══════╝╚══════╝    ╚═════╝ 

*NOTE: dbfiddle users skip this exercise
*/
 
 -- Right click "basicdemos" -> properties. switch to "Security" and click the + sign next to "Privileges".
 -- Add "oreilly" as "Grantee", and click the "connect" checkbox under the Privileges tab. 
 -- Click "Save".
 
 -- In PgAdmin, expand "basicdemos" -> "Schemas".
 -- Right click the "oreilly" schema and click "properties".
 -- Switch to "Security" and click the + sign next to "Privileges".
 -- Add "oreilly" as Grantee, and the "Usage" privilege.
 -- Click "Save".
 
 -- In PgAdmin, expand "basicdemos" -> "Schemas" -> "oreilly" -> "tables".
 -- Right click "customers" and choose "Properties".
 -- Switch to "Security" tab and click the + sign next to "Privileges". 
 -- Add "oreilly" as "Grantee", and click "All" permissions checkbox. 
 -- Click "Save".
 
 -- Launch a new PSQL window, type "basicdemos" for database, and "oreilly" as user name, provide your password.
 -- Execute the following query:
 
 SELECT * FROM customers;
 
 -- Can you explain the result?
 
 -- Execute the following query:
  SELECT * FROM public.customers;
  
 -- Can you explain the result?

--------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------

/*
██████╗ ███████╗███████╗ ██████╗ ██╗   ██╗██████╗  ██████╗███████╗███████╗
██╔══██╗██╔════╝██╔════╝██╔═══██╗██║   ██║██╔══██╗██╔════╝██╔════╝██╔════╝
██████╔╝█████╗  ███████╗██║   ██║██║   ██║██████╔╝██║     █████╗  ███████╗
██╔══██╗██╔══╝  ╚════██║██║   ██║██║   ██║██╔══██╗██║     ██╔══╝  ╚════██║
██║  ██║███████╗███████║╚██████╔╝╚██████╔╝██║  ██║╚██████╗███████╗███████║
╚═╝  ╚═╝╚══════╝╚══════╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═╝ ╚═════╝╚══════╝╚══════╝

Additional Reading:
-------------------
https://www.postgresql.org/docs/12/sql-createdatabase.html
https://www.postgresql.org/docs/12/ddl-schemas.html
https://www.postgresql.org/docs/12/user-manag.html
https://www.postgresql.org/docs/12/sql-createschema.html
https://www.postgresql.org/docs/12/sql-createuser.html
https://www.postgresql.org/docs/12/sql-createrole.html
https://www.postgresql.org/docs/12/client-authentication.html
https://www.postgresql.org/docs/12/sql-grant.html
https://www.postgresql.org/docs/12/sql-revoke.html
*/