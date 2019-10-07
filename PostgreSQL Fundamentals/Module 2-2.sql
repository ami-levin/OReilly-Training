------------------------------
-- O'reilly Online Training --
-- PostgreSQL fundamentals ---
-- Module 2.2: Constraints ---
------------------------------
-- https://github.com/ami-levin/OReilly-Training/tree/master/PostgreSQL%20Fundamentals
--------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------

-- Primary keys
-- Unique constraints
-- NULL constraints
-- Foreign Keys
-- Check constraints

/* 
███████╗██╗  ██╗███████╗██████╗  ██████╗██╗███████╗███████╗     ██╗
██╔════╝╚██╗██╔╝██╔════╝██╔══██╗██╔════╝██║██╔════╝██╔════╝    ███║
█████╗   ╚███╔╝ █████╗  ██████╔╝██║     ██║███████╗█████╗      ╚██║
██╔══╝   ██╔██╗ ██╔══╝  ██╔══██╗██║     ██║╚════██║██╔══╝       ██║
███████╗██╔╝ ██╗███████╗██║  ██║╚██████╗██║███████║███████╗     ██║
╚══════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝ ╚═════╝╚═╝╚══════╝╚══════╝     ╚═╝

* NOTE: dbfiddle users - (almost...) no more restrictions for you in this course!
-- 
*/

-- Alter the oreilly.customers table so that
-- 1. Customer name will identify each customer.
-- 2. Country name will be mandatory.
-- USE THE DOCUMENTATION TO FIGURE OUT THE SYNTAX - https://www.postgresql.org/docs/12/sql-altertable.html
-- **** Scroll down for a solution

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

ALTER TABLE oreilly.customers ADD CONSTRAINT PK_Customers PRIMARY KEY(Customer);
ALTER TABLE oreilly.customers ALTER COLUMN Country SET NOT NULL;

/*
███████╗██╗  ██╗███████╗██████╗  ██████╗██╗███████╗███████╗    ██████╗ 
██╔════╝╚██╗██╔╝██╔════╝██╔══██╗██╔════╝██║██╔════╝██╔════╝    ╚════██╗
█████╗   ╚███╔╝ █████╗  ██████╔╝██║     ██║███████╗█████╗       █████╔╝
██╔══╝   ██╔██╗ ██╔══╝  ██╔══██╗██║     ██║╚════██║██╔══╝      ██╔═══╝ 
███████╗██╔╝ ██╗███████╗██║  ██║╚██████╗██║███████║███████╗    ███████╗
╚══════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝ ╚═════╝╚═╝╚══════╝╚══════╝    ╚══════╝
*/

-- Review the basicdemo db scripts CREATE TABLE statements and see that they make sense.
-- Write down your questions, we will have some review time right after this exercise.


/*
██████╗ ███████╗███████╗ ██████╗ ██╗   ██╗██████╗  ██████╗███████╗███████╗
██╔══██╗██╔════╝██╔════╝██╔═══██╗██║   ██║██╔══██╗██╔════╝██╔════╝██╔════╝
██████╔╝█████╗  ███████╗██║   ██║██║   ██║██████╔╝██║     █████╗  ███████╗
██╔══██╗██╔══╝  ╚════██║██║   ██║██║   ██║██╔══██╗██║     ██╔══╝  ╚════██║
██║  ██║███████╗███████║╚██████╔╝╚██████╔╝██║  ██║╚██████╗███████╗███████║
╚═╝  ╚═╝╚══════╝╚══════╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═╝ ╚═════╝╚══════╝╚══════╝

Additional Reading:
-------------------
https://www.postgresql.org/docs/12/ddl-constraints.html
https://www.postgresql.org/docs/12/sql-createtable.html
https://www.postgresql.org/docs/12/sql-altertable.html
*/
