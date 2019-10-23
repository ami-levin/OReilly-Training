-------------------------------------
-- O'Reilly Online Training ---------
-- Getting Started with SQL Server --
-- Module 2.3: Data Types -----------
-------------------------------------
-- https://github.com/ami-levin/OReilly-Training/tree/master/SQL%20Server%20Fundamentals
----------------------------------------------------------------------------------------

-- Data type families
-- Data type conversions 

/* 
███████╗██╗  ██╗███████╗██████╗  ██████╗██╗███████╗███████╗     ██╗
██╔════╝╚██╗██╔╝██╔════╝██╔══██╗██╔════╝██║██╔════╝██╔════╝    ███║
█████╗   ╚███╔╝ █████╗  ██████╔╝██║     ██║███████╗█████╗      ╚██║
██╔══╝   ██╔██╗ ██╔══╝  ██╔══██╗██║     ██║╚════██║██╔══╝       ██║
███████╗██╔╝ ██╗███████╗██║  ██║╚██████╗██║███████║███████╗     ██║
╚══════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝ ╚═════╝╚═╝╚══════╝╚══════╝     ╚═╝
*/

-- Change the phone column in OReilly.Customers to an integer instead of a string.
-- You can use either T-SQL queries, or the GUI table designer.
-- Try to insert a row for customer Dan from Poland, a male, with a phone value of '123-456-0891'
-- Can you explain the result?
-- Add another column to the table for the Customer's birth date.
-- Add a constraint to this column as you see fit to enforce a reasonable business rule of your choice.
-- **** Scroll down for a suggested solution

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

ALTER TABLE OReilly.Customers
ALTER COLUMN phone INT;

INSERT INTO OReilly.Customers (Customer, Country, Phone, Gender)
VALUES ('Dan', 'Poland', '123-456-0987', 'M'); 

-- Can you explain why you get this result?

ALTER TABLE OReilly.Customers 
ADD birthdate DATE NULL CHECK (birthdate < '20010101');

-- CHECK constraint just an example of limiting Customers to be born in the year 2000 or earlier.
-- You can make up your own... 

/*
██████╗ ███████╗███████╗ ██████╗ ██╗   ██╗██████╗  ██████╗███████╗███████╗
██╔══██╗██╔════╝██╔════╝██╔═══██╗██║   ██║██╔══██╗██╔════╝██╔════╝██╔════╝
██████╔╝█████╗  ███████╗██║   ██║██║   ██║██████╔╝██║     █████╗  ███████╗
██╔══██╗██╔══╝  ╚════██║██║   ██║██║   ██║██╔══██╗██║     ██╔══╝  ╚════██║
██║  ██║███████╗███████║╚██████╔╝╚██████╔╝██║  ██║╚██████╗███████╗███████║
╚═╝  ╚═╝╚══════╝╚══════╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═╝ ╚═════╝╚══════╝╚══════╝

Additional Reading:
-------------------
https://docs.microsoft.com/en-us/sql/t-sql/data-types/data-types-transact-sql
https://docs.microsoft.com/en-us/sql/t-sql/statements/create-type-transact-sql
https://docs.microsoft.com/en-us/sql/t-sql/data-types/data-type-conversion-database-engine
*/