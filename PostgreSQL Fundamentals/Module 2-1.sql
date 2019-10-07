---------------------------------
-- O'reilly Online Training -----
-- PostgreSQL fundamentals ------
-- Module 2.1: Creating Tables --
---------------------------------
-- https://github.com/ami-levin/OReilly-Training/tree/master/PostgreSQL%20Fundamentals
--------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------

-- CREATE TABLE / ALTER TABLE DDL and PgAdmin

/* 
███████╗██╗  ██╗███████╗██████╗  ██████╗██╗███████╗███████╗     ██╗
██╔════╝╚██╗██╔╝██╔════╝██╔══██╗██╔════╝██║██╔════╝██╔════╝    ███║
█████╗   ╚███╔╝ █████╗  ██████╔╝██║     ██║███████╗█████╗      ╚██║
██╔══╝   ██╔██╗ ██╔══╝  ██╔══██╗██║     ██║╚════██║██╔══╝       ██║
███████╗██╔╝ ██╗███████╗██║  ██║╚██████╗██║███████║███████╗     ██║
╚══════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝ ╚═════╝╚═╝╚══════╝╚══════╝     ╚═╝

* NOTE: dbfiddle users must use SQL code to perform these tasks, no GUI for you - extra challenge bonus points!
*/

-- In PgAdmin, expand "Databases" -> "basicdemos" -> "Schemas" -> "oreilly" -> "Tables".
-- Right click on customers and click "Properties". Switch to the Columns tab.
-- Add a third column named "Phone" with a data typs of character varying and a length of 10.
-- Click "Save".

-- Expand "customers" table, right click on "Columns" and click "Create" -> "Column".
-- Add a 4th column named "gender", switch to "Definition" tab and choose a data type of character and a length of 2.
-- Switch to the "SQL" tab and review the script.
-- Copy the script and paste it into PgAdmin query tool editor window.
-- Click 'Cancel'.
-- Execute the script in PgAdmin, refresh the navigation pane view for the customers table.

-- What's the difference between executing in PgAdmin query tool and executing from the GUI wizard?

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
https://www.postgresql.org/docs/12/sql-createtable.html
https://www.postgresql.org/docs/12/sql-altertable.html
https://www.postgresql.org/docs/12/sql-droptable.html
*/