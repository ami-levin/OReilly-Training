------------------------------------
-- O'reilly Online Training --------
-- PostgreSQL fundamentals ---------
-- Module 1.2: Creating Databases --
------------------------------------
-- https://github.com/ami-levin/OReilly-Training/tree/master/PostgreSQL%20Fundamentals
--------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------

-- CREATE DATABASE basicdemos;
-- Create / manage databases with PgAdmin
-- BACKUP, ANALYZE, VACUUM

/* 
███████╗██╗  ██╗███████╗██████╗  ██████╗██╗███████╗███████╗     ██╗
██╔════╝╚██╗██╔╝██╔════╝██╔══██╗██╔════╝██║██╔════╝██╔════╝    ███║
█████╗   ╚███╔╝ █████╗  ██████╔╝██║     ██║███████╗█████╗      ╚██║
██╔══╝   ██╔██╗ ██╔══╝  ██╔══██╗██║     ██║╚════██║██╔══╝       ██║
███████╗██╔╝ ██╗███████╗██║  ██║╚██████╗██║███████║███████╗     ██║
╚══════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝ ╚═════╝╚═╝╚══════╝╚══════╝     ╚═╝

Using either PgAdmin or PSQL, create a new database named "basicdemos".
* dbfiddle users skip this phase as you don't have permissions to create databases. 
  You can only use the default database provided by the service.
  
With PgAdmin GUI, right click "Databases", choose "Create" and type in "basicdemos". 
View the options tabs but don't change anything, and click "Save".
Alternatively, use the query tool editor window and execute the query: "CREATE DATABASE basicdemos;"

After creation completes, you will need to right click "Databases" in PgAdmin and click "Refresh" to see it.

Open a new editor window in PgAdmin by right clicking "basicdemos" -> and click "Query Tool".
Copy / paste the text, or just open the "Basic Demos Database.sql" file directly with PgAdmin.
* NOTE: Make sure the "basicdemos" is selected on the left navigation pane so that the connection will be established to it.
* dbfiddle users copy and paste the entire script to the dbfiddle window and execute it.

If using PSQL, you must re-establish a new connection to the database using the "\c basicdemos" command.

Make sure execution succeeds with no errors.
Take a look at the statements, and write down any questions you have.
We will cover these in the next section, but they are mostly plain english.

You can close the editor window with the database script.
* dbfiddle users must leave the script in the first text box, it will be executed every time you click 'Run'.
*/

--------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------

/*
███████╗██╗  ██╗███████╗██████╗  ██████╗██╗███████╗███████╗    ██████╗ 
██╔════╝╚██╗██╔╝██╔════╝██╔══██╗██╔════╝██║██╔════╝██╔════╝    ╚════██╗
█████╗   ╚███╔╝ █████╗  ██████╔╝██║     ██║███████╗█████╗       █████╔╝
██╔══╝   ██╔██╗ ██╔══╝  ██╔══██╗██║     ██║╚════██║██╔══╝      ██╔═══╝ 
███████╗██╔╝ ██╗███████╗██║  ██║╚██████╗██║███████║███████╗    ███████╗
╚══════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝ ╚═════╝╚═╝╚══════╝╚══════╝    ╚══════╝
*/

-- Execute the following query in a new PgAdmin editor window or using PSQL:
-- dbfiddle users must use a new text box and keep the original script in place.
-- If using PSQL, you may need to re-establish the connection to the database using the "\c basicdemos" command.
-- The prompt name is the current database.

SELECT * FROM customers;

-- Expected Result:
/*
customer	|	country
------------------------
Dave		|	USA
John		|	USA
Gerald		|	Canada
Jose		|	Peru
Tim			|	<NULL>
*/

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

-- Backup the basicdemos database using PgAdmin:
-- Right click "basicdemos" and click "Backup". 
-- Provide a file name and change format to "Plain".
-- Check the destination folder and open the backup file with a text editor.

-- OPTIONAL: Backup the basicdemos database using pg_dump:
-- Open command shell and navigate to PostgreSQL BIN folder.
-- Execute the command: pg_dump -U postgres basicdemos > "Destination folder\file"
-- Check the destination folder and open the backup file with a text editor.

-- Open a new query tool editor window and execute the following statements:
VACUUM customers;

-- Right click "basicdemos", click "Maintenance" and review the various options.
-- Don't execute, click 'Cancel'.

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
https://www.postgresql.org/docs/12/sql-alterdatabase.html
https://www.postgresql.org/docs/12/sql-dropdatabase.html
https://www.pgadmin.org/
https://www.postgresql.org/docs/12/app-psql.html
https://www.postgresql.org/docs/12/app-pgdump.html
https://www.postgresql.org/docs/12/routine-vacuuming.html
https://www.postgresql.org/docs/12/sql-vacuum.html
https://www.postgresql.org/docs/12/sql-analyze.html
*/
