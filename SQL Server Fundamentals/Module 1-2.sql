-------------------------------------
-- O'Reilly Online Training ---------
-- Getting Started with SQL Server --
-- Module 1.2: Creating Databases ---
-------------------------------------
-- https://github.com/ami-levin/OReilly-Training/tree/master/SQL%20Server%20Fundamentals
----------------------------------------------------------------------------------------

-- CREATE DATABASE BasicDemos;
-- Create / manage databases with SSMS
-- BACKUP, Defrag, Export

/* 
███████╗██╗  ██╗███████╗██████╗  ██████╗██╗███████╗███████╗     ██╗
██╔════╝╚██╗██╔╝██╔════╝██╔══██╗██╔════╝██║██╔════╝██╔════╝    ███║
█████╗   ╚███╔╝ █████╗  ██████╔╝██║     ██║███████╗█████╗      ╚██║
██╔══╝   ██╔██╗ ██╔══╝  ██╔══██╗██║     ██║╚════██║██╔══╝       ██║
███████╗██╔╝ ██╗███████╗██║  ██║╚██████╗██║███████║███████╗     ██║
╚══════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝ ╚═════╝╚═╝╚══════╝╚══════╝     ╚═╝

Using either SSMS or SQLCMD, create a new database named "BasicDemos".
* NOTE: db-fiddle users skip this phase as you don't have permissions to create databases.
        You can only use the default database provided by the service.
  
With SSMS, right click "Databases", choose "New database" and type  BasicDemos" for the database name. 
View the options tabs but don't change anything, and click "OK".
Alternatively, use the query tool editor window and execute the query: */

CREATE DATABASE BasicDemos;

/*
Open a new editor window in SSMS by right clicking "BasicDemos" -> and click "New Query".
Copy / paste the text, or just open the "Basic Demos Database.sql" file directly with SSMS from the "File" -> "Open" -> "File" menu (CTRL + O).
* NOTE: db-fiddle users copy and paste the entire script to the db-fiddle window and execute it.
		Skip the CREATE and USE statements.

Make sure execution succeeds with no errors.
Take a look at the statements, and write down any questions you have.
We will cover these in the next section, but they are mostly plain English.

You can close the editor window with the database script.
* db-fiddle users must leave the script in the first text box, it will be executed every time you click 'Run'.
*/

------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------

/*
███████╗██╗  ██╗███████╗██████╗  ██████╗██╗███████╗███████╗    ██████╗ 
██╔════╝╚██╗██╔╝██╔════╝██╔══██╗██╔════╝██║██╔════╝██╔════╝    ╚════██╗
█████╗   ╚███╔╝ █████╗  ██████╔╝██║     ██║███████╗█████╗       █████╔╝
██╔══╝   ██╔██╗ ██╔══╝  ██╔══██╗██║     ██║╚════██║██╔══╝      ██╔═══╝ 
███████╗██╔╝ ██╗███████╗██║  ██║╚██████╗██║███████║███████╗    ███████╗
╚══════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝ ╚═════╝╚═╝╚══════╝╚══════╝    ╚══════╝
*/

-- Execute the following query in a new SSMS editor or using SQLCMD:
-- db-fiddle users must use a new text box and keep the original script in place.

SELECT * FROM Customers;

-- Expected Result:
/*
Customer	|	Country
------------------------
Dave		|	USA
John		|	USA
Gerald		|	Canada
Jose		|	Peru
Tim			|	<NULL>
*/

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

-- Backup the BasicDemos database using SSMS:
-- Right click "BasicDemos" and choose "Tasks" -> "Backup". 
-- Copy or change the destination folder and file name.
-- NOTE: You can't edit the destination file name, you need to remove it and add a new one to backup to a different location.
--       The location shown is the default chosen at installation.

-- Open a new query tool editor window and execute the following statements:
ALTER TABLE Customers REBUILD;

-- Right click "BasicDemos", choose "Tasks" -> "Generate Scripts" and review the wizard's options.
-- Feel free to execute, and review the results.

-- Right click "BasicDemos", choose "Tasks" -> "Export Data" and review the wizard's options.
-- Feel free to execute and review the results.
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
https://docs.microsoft.com/en-us/sql/t-sql/statements/alter-database-transact-sql
https://docs.microsoft.com/en-us/sql/t-sql/statements/drop-database-transact-sql
https://docs.microsoft.com/en-us/sql/ssms/sql-server-management-studio-ssms
https://docs.microsoft.com/en-us/sql/azure-data-studio/what-is
https://docs.microsoft.com/en-us/sql/t-sql/statements/backup-transact-sql
https://docs.microsoft.com/en-us/sql/t-sql/statements/restore-statements-transact-sql
https://docs.microsoft.com/en-us/sql/integration-services/import-export-data/import-and-export-data-with-the-sql-server-import-and-export-wizard
https://docs.microsoft.com/en-us/sql/ssms/scripting/generate-and-publish-scripts-wizard
*/