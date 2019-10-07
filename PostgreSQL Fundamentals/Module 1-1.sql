------------------------------
-- O'reilly Online Training --
-- PostgreSQL fundamentals ---
-- Module 1.1: Architecture --
------------------------------
-- https://github.com/ami-levin/OReilly-Training/tree/master/PostgreSQL%20Fundamentals
--------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------                                                                                                           

-- Installation guide walkthrough
-- Tooling overview

/* 
███████╗██╗  ██╗███████╗██████╗  ██████╗██╗███████╗███████╗     ██╗
██╔════╝╚██╗██╔╝██╔════╝██╔══██╗██╔════╝██║██╔════╝██╔════╝    ███║
█████╗   ╚███╔╝ █████╗  ██████╔╝██║     ██║███████╗█████╗      ╚██║
██╔══╝   ██╔██╗ ██╔══╝  ██╔══██╗██║     ██║╚════██║██╔══╝       ██║
███████╗██╔╝ ██╗███████╗██║  ██║╚██████╗██║███████║███████╗     ██║
╚══════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝ ╚═════╝╚═╝╚══════╝╚══════╝     ╚═╝

Download and install PostgreSQL 12 from https://www.enterprisedb.com/downloads/postgresql
See Installation Guide @ https://www.enterprisedb.com/edb-docs/d/postgresql/installation-getting-started/installation-guide-installers/12/toc.html
For Windows and Mac O/S use the GUI installer, see https://www.enterprisedb.com/edb-docs/d/postgresql/installation-getting-started/installation-guide-installers/12/PostgreSQL_Installation_Guide.1.07.html#
You can install all 4 components but no need to launch Stak Builder after installation.

If for any reason you are unable to install PostgreSQL and have no access to a network or cloud instance, use https://dbfiddle.uk/?rdbms=postgres_12
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

For local installs, launch PgAdmin4 and connect to your local instance.
Expand Servers -> PostgreSQL 12 -> Databases and select the Postgres database.
Click Tools -> Query Tool 
Type "SELECT 'Hello, World!';" and click Execute (lightning icon button) or hit F5.
Make sure you see the output in the lower pane.

Launch PSQL and connect to your local instance.
At the Postgres=# prompt type "SELECT 'Hello, World!';" and hit <Enter>.
Make sure you get the result:
  ?column?
-------------
 Hello World
(1 row)

Congratulations! you have successfully installed PostgreSQL!

If using dbfiddle:
Replace the text "select version();" with "SELECT 'Hello, World!';" and click Run.
Make sure you see the result 
  ?column?
 Hello World
*/

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
https://www.postgresql.org/docs/12/tutorial-start.html
https://en.wikipedia.org/wiki/Database
https://en.wikipedia.org/wiki/Relational_model
https://en.wikipedia.org/wiki/SQL
https://en.wikipedia.org/wiki/PostgreSQL
https://wiki.postgresql.org/wiki/Main_Page

Tools:
------
https://www.pgadmin.org/
https://www.postgresql.org/docs/12/app-psql.html
https://dbeaver.io/
https://dbfiddle.uk/?rdbms=postgres_12
https://www.db-fiddle.com/
http://sqlfiddle.com

Cloud providers:
----------------
https://aws.amazon.com/rds/postgresql/
https://aws.amazon.com/rds/aurora/postgresql-features/
https://azure.microsoft.com/en-us/services/postgresql/
https://cloud.google.com/sql/docs/postgres/
*/
