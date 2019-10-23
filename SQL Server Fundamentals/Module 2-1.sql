-------------------------------------
-- O'Reilly Online Training ---------
-- Getting Started with SQL Server --
-- Module 2.1: Creating Tables ------
-------------------------------------
-- https://github.com/ami-levin/OReilly-Training/tree/master/SQL%20Server%20Fundamentals
----------------------------------------------------------------------------------------

-- CREATE TABLE / ALTER TABLE DDL and SSMS

/* 
███████╗██╗  ██╗███████╗██████╗  ██████╗██╗███████╗███████╗     ██╗
██╔════╝╚██╗██╔╝██╔════╝██╔══██╗██╔════╝██║██╔════╝██╔════╝    ███║
█████╗   ╚███╔╝ █████╗  ██████╔╝██║     ██║███████╗█████╗      ╚██║
██╔══╝   ██╔██╗ ██╔══╝  ██╔══██╗██║     ██║╚════██║██╔══╝       ██║
███████╗██╔╝ ██╗███████╗██║  ██║╚██████╗██║███████║███████╗     ██║
╚══════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝ ╚═════╝╚═╝╚══════╝╚══════╝     ╚═╝

* NOTE: db-fiddle users must use SQL code to perform these tasks, no GUI for you - extra challenge bonus points!
*/

-- In SSMS, expand "Databases" -> "BasicDemos" -> "Tables".
-- Right click on OReilly.Customers and click "Design".
-- NOTE: you might need to refresh SSMS object explorer's tables node by right click -> "Refresh" for it to show.

-- Add a third column named "Phone" with a data type of character varying and a length of 10.
-- Click "Save" or hit CTRL + S.

-- Add a 4th column named "Gender" with a data type of character and a length of 2 (we are inclusive of gender fluidity).
-- DON'T save yet!
-- On the toolbar, click "Table Designer" and choose "Generate change script" and review the script. 
-- Copy the script and paste it into a new SSMS query tool editor window.
-- Click 'No'.
-- Execute the script in SSMS, refresh the object explorer pane view.

-- What's the difference between executing a statement in SSMS query tool and executing it from the GUI wizard?

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
https://docs.microsoft.com/en-us/sql/t-sql/statements/create-table-transact-sql
https://docs.microsoft.com/en-us/sql/t-sql/statements/alter-table-transact-sql
https://docs.microsoft.com/en-us/sql/t-sql/statements/drop-table-transact-sql
*/