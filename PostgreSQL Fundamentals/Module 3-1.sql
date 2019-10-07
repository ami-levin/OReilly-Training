------------------------------
-- O'reilly Online Training --
-- PostgreSQL fundamentals ---
-- Module 3.1: DML/DQL -------
------------------------------
-- https://github.com/ami-levin/OReilly-Training/tree/master/PostgreSQL%20Fundamentals
--------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------

-- INSERT, UPDATE, DELETE, SELECT

/* 
███████╗██╗  ██╗███████╗██████╗  ██████╗██╗███████╗███████╗     ██╗
██╔════╝╚██╗██╔╝██╔════╝██╔══██╗██╔════╝██║██╔════╝██╔════╝    ███║
█████╗   ╚███╔╝ █████╗  ██████╔╝██║     ██║███████╗█████╗      ╚██║
██╔══╝   ██╔██╗ ██╔══╝  ██╔══██╗██║     ██║╚════██║██╔══╝       ██║
███████╗██╔╝ ██╗███████╗██║  ██║╚██████╗██║███████║███████╗     ██║
╚══════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝ ╚═════╝╚═╝╚══════╝╚══════╝     ╚═╝
*/

-- Add the following data to the oreilly.customers table:
-- New customer Jim is a male, he is from Canada, born on Jan 2nd 1984, and his phone number is 12345612,  
-- New customer Jill is a female, she is from Germany, born on July 3rd 1991, and her phone number is 09865409

/*
███████╗██╗  ██╗███████╗██████╗  ██████╗██╗███████╗███████╗    ██████╗ 
██╔════╝╚██╗██╔╝██╔════╝██╔══██╗██╔════╝██║██╔════╝██╔════╝    ╚════██╗
█████╗   ╚███╔╝ █████╗  ██████╔╝██║     ██║███████╗█████╗       █████╔╝
██╔══╝   ██╔██╗ ██╔══╝  ██╔══██╗██║     ██║╚════██║██╔══╝      ██╔═══╝ 
███████╗██╔╝ ██╗███████╗██║  ██║╚██████╗██║███████║███████╗    ███████╗
╚══════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝ ╚═════╝╚═╝╚══════╝╚══════╝    ╚══════╝
*/

-- We had an error in the system, all customer's birth date are 1 day off, we need to adjust them to the day after the current day.
-- Use the documentation (hint: https://www.postgresql.org/docs/12/functions-datetime.html)


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

INSERT INTO oreilly.customers(customer, country, phone, gender, birthdate)
VALUES 	('Jim', 'Canada', 12345612, 'M', '19840102'),
		('Jill', 'Germany', 9865409, 'F', '19910703');

UPDATE 	oreilly.customers
		SET birthdate = birthdate + 1;

/*
██████╗ ███████╗███████╗ ██████╗ ██╗   ██╗██████╗  ██████╗███████╗███████╗
██╔══██╗██╔════╝██╔════╝██╔═══██╗██║   ██║██╔══██╗██╔════╝██╔════╝██╔════╝
██████╔╝█████╗  ███████╗██║   ██║██║   ██║██████╔╝██║     █████╗  ███████╗
██╔══██╗██╔══╝  ╚════██║██║   ██║██║   ██║██╔══██╗██║     ██╔══╝  ╚════██║
██║  ██║███████╗███████║╚██████╔╝╚██████╔╝██║  ██║╚██████╗███████╗███████║
╚═╝  ╚═╝╚══════╝╚══════╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═╝ ╚═════╝╚══════╝╚══════╝

Additional Reading:
-------------------
https://www.postgresql.org/docs/12/tutorial-populate.html
https://www.postgresql.org/docs/12/tutorial-update.html
https://www.postgresql.org/docs/12/tutorial-delete.html
https://www.postgresql.org/docs/12/sql-insert.html
https://www.postgresql.org/docs/12/sql-update.html
https://www.postgresql.org/docs/12/sql-delete.html
https://www.postgresql.org/docs/12/sql-truncate.html
*/