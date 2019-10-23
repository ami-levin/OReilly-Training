-------------------------------------
-- O'Reilly Online Training ---------
-- Getting Started with SQL Server --
-- Module 3.1: DML/DQL --------------
-------------------------------------
-- https://github.com/ami-levin/OReilly-Training/tree/master/SQL%20Server%20Fundamentals
----------------------------------------------------------------------------------------

-- INSERT, UPDATE, DELETE

/* 
███████╗██╗  ██╗███████╗██████╗  ██████╗██╗███████╗███████╗     ██╗
██╔════╝╚██╗██╔╝██╔════╝██╔══██╗██╔════╝██║██╔════╝██╔════╝    ███║
█████╗   ╚███╔╝ █████╗  ██████╔╝██║     ██║███████╗█████╗      ╚██║
██╔══╝   ██╔██╗ ██╔══╝  ██╔══██╗██║     ██║╚════██║██╔══╝       ██║
███████╗██╔╝ ██╗███████╗██║  ██║╚██████╗██║███████║███████╗     ██║
╚══════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝ ╚═════╝╚═╝╚══════╝╚══════╝     ╚═╝
*/

-- Add the following data to the OReilly.Customers table:
-- New Customer Jim is a male, he is from Canada, born on Jan 2nd 1984, and his phone number is 12345612,  
-- New Customer Jill is a female, she is from Germany, born on July 3rd 1991, and her phone number is 09865409

/*
███████╗██╗  ██╗███████╗██████╗  ██████╗██╗███████╗███████╗    ██████╗ 
██╔════╝╚██╗██╔╝██╔════╝██╔══██╗██╔════╝██║██╔════╝██╔════╝    ╚════██╗
█████╗   ╚███╔╝ █████╗  ██████╔╝██║     ██║███████╗█████╗       █████╔╝
██╔══╝   ██╔██╗ ██╔══╝  ██╔══██╗██║     ██║╚════██║██╔══╝      ██╔═══╝ 
███████╗██╔╝ ██╗███████╗██║  ██║╚██████╗██║███████║███████╗    ███████╗
╚══════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝ ╚═════╝╚═╝╚══════╝╚══════╝    ╚══════╝
*/

-- We had an error in the system, all Customer's birth date are 1 day off, we need to adjust them to the day after the current day.
-- Use the documentation (hint: https://docs.microsoft.com/en-us/sql/t-sql/functions/dateadd-transact-sql)
-- **** Scroll down for solutions to both exercises

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

INSERT INTO OReilly.Customers(Customer, Country, phone, gender, birthdate)
VALUES 	('Jim', 'Canada', 12345612, 'M', '19840102'),
		('Jill', 'Germany', 9865409, 'F', '19910703');

UPDATE 	OReilly.Customers
		SET birthdate = DATEADD(DAY, 1, birthdate);

/*
██████╗ ███████╗███████╗ ██████╗ ██╗   ██╗██████╗  ██████╗███████╗███████╗
██╔══██╗██╔════╝██╔════╝██╔═══██╗██║   ██║██╔══██╗██╔════╝██╔════╝██╔════╝
██████╔╝█████╗  ███████╗██║   ██║██║   ██║██████╔╝██║     █████╗  ███████╗
██╔══██╗██╔══╝  ╚════██║██║   ██║██║   ██║██╔══██╗██║     ██╔══╝  ╚════██║
██║  ██║███████╗███████║╚██████╔╝╚██████╔╝██║  ██║╚██████╗███████╗███████║
╚═╝  ╚═╝╚══════╝╚══════╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═╝ ╚═════╝╚══════╝╚══════╝

Additional Reading:
-------------------
https://docs.microsoft.com/en-us/sql/t-sql/statements/insert-transact-sql
https://docs.microsoft.com/en-us/sql/t-sql/queries/update-transact-sql
https://docs.microsoft.com/en-us/sql/t-sql/statements/delete-transact-sql
https://docs.microsoft.com/en-us/sql/t-sql/queries/select-transact-sql
*/