-------------------------------------
-- O'reilly Online Training ---------
-- PostgreSQL fundamentals ----------
-- Module 4.3: Programming Objects --
-------------------------------------
-- https://github.com/ami-levin/OReilly-Training/tree/master/PostgreSQL%20Fundamentals
--------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------

-- Creating views, stored procedures, triggers and functions
-- Abstraction views
-- Inventory trigger
-- Stored procedures

/* 
███████╗██╗  ██╗███████╗██████╗  ██████╗██╗███████╗███████╗     ██╗
██╔════╝╚██╗██╔╝██╔════╝██╔══██╗██╔════╝██║██╔════╝██╔════╝    ███║
█████╗   ╚███╔╝ █████╗  ██████╔╝██║     ██║███████╗█████╗      ╚██║
██╔══╝   ██╔██╗ ██╔══╝  ██╔══██╗██║     ██║╚════██║██╔══╝       ██║
███████╗██╔╝ ██╗███████╗██║  ██║╚██████╗██║███████║███████╗     ██║
╚══════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝ ╚═════╝╚═╝╚══════╝╚══════╝     ╚═╝
*/

-- This is your wrap up exercise. Use the documentation in the links below.
-- Create a new table called 'log' with the following structure:
-- eventtime TIMESTAMP, tablename VARCHAR(20)

-- Create a trigger on the customers table to log any insert to the customers table in the log table.
-- Test it by adding a new customer and verifying it is logged.

-- Can you think of additional functionality that you would add to such a logging mechanism?

-- **** Scroll down for solution

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

/*
███████╗██████╗  ██████╗ ██╗██╗     ███████╗██████╗      █████╗ ██╗     ███████╗██████╗ ████████╗██╗
██╔════╝██╔══██╗██╔═══██╗██║██║     ██╔════╝██╔══██╗    ██╔══██╗██║     ██╔════╝██╔══██╗╚══██╔══╝██║
███████╗██████╔╝██║   ██║██║██║     █████╗  ██████╔╝    ███████║██║     █████╗  ██████╔╝   ██║   ██║
╚════██║██╔═══╝ ██║   ██║██║██║     ██╔══╝  ██╔══██╗    ██╔══██║██║     ██╔══╝  ██╔══██╗   ██║   ╚═╝
███████║██║     ╚██████╔╝██║███████╗███████╗██║  ██║    ██║  ██║███████╗███████╗██║  ██║   ██║   ██╗
╚══════╝╚═╝      ╚═════╝ ╚═╝╚══════╝╚══════╝╚═╝  ╚═╝    ╚═╝  ╚═╝╚══════╝╚══════╝╚═╝  ╚═╝   ╚═╝   ╚═╝                                                                                                   
*/

--

--

--

--

--

--

CREATE TABLE insert_log (event_time TIMESTAMP, table_name VARCHAR(20));

CREATE FUNCTION log_customer_insert() 
RETURNS TRIGGER AS $$
   BEGIN
  	INSERT INTO insert_log (event_time, table_name)
	SELECT CURRENT_TIMESTAMP, 'customers';
    RETURN NEW;
   END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER customer_insert 
    AFTER INSERT ON customers
    FOR EACH STATEMENT
    EXECUTE FUNCTION log_customer_insert();

INSERT INTO customers (customer, country)
VALUES ('George', 'Sudan');

SELECT * FROM customers;

SELECT * FROM insert_log;

/*
██████╗ ███████╗███████╗ ██████╗ ██╗   ██╗██████╗  ██████╗███████╗███████╗
██╔══██╗██╔════╝██╔════╝██╔═══██╗██║   ██║██╔══██╗██╔════╝██╔════╝██╔════╝
██████╔╝█████╗  ███████╗██║   ██║██║   ██║██████╔╝██║     █████╗  ███████╗
██╔══██╗██╔══╝  ╚════██║██║   ██║██║   ██║██╔══██╗██║     ██╔══╝  ╚════██║
██║  ██║███████╗███████║╚██████╔╝╚██████╔╝██║  ██║╚██████╗███████╗███████║
╚═╝  ╚═╝╚══════╝╚══════╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═╝ ╚═════╝╚══════╝╚══════╝

Additional Reading:
-------------------
https://www.postgresql.org/docs/12/sql-createview.html
https://www.postgresql.org/docs/12/sql-createprocedure.html
https://www.postgresql.org/docs/12/sql-createtrigger.html
https://www.postgresql.org/docs/12/sql-createfunction.html
https://www.postgresql.org/docs/12/plpgsql-trigger.html
https://www.postgresql.org/docs/12/plpgsql.html
*/