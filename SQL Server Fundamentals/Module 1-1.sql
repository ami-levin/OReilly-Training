-------------------------------------
-- O'Reilly Online Training ---------
-- Getting Started with SQL Server --
-- Module 1.1: Installation ---------
-------------------------------------
-- https://github.com/ami-levin/OReilly-Training/tree/master/SQL%20Server%20Fundamentals
----------------------------------------------------------------------------------------                                                                                                          

-- Installation walk-through
-- Tooling overview

/* 
███████╗██╗  ██╗███████╗██████╗  ██████╗██╗███████╗███████╗     ██╗
██╔════╝╚██╗██╔╝██╔════╝██╔══██╗██╔════╝██║██╔════╝██╔════╝    ███║
█████╗   ╚███╔╝ █████╗  ██████╔╝██║     ██║███████╗█████╗      ╚██║
██╔══╝   ██╔██╗ ██╔══╝  ██╔══██╗██║     ██║╚════██║██╔══╝       ██║
███████╗██╔╝ ██╗███████╗██║  ██║╚██████╗██║███████║███████╗     ██║
╚══════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝ ╚═════╝╚═╝╚══════╝╚══════╝     ╚═╝

Download and install SQL Server 2017 Express or Developer Edition from https://www.microsoft.com/en-us/sql-server/sql-server-downloads
* NOTE: Enable SQL Authentication on the security settings page and choose a password for the sa account.
* NOTE2: If installing Express edition, change the instance installation to a default instance.
See Installation Guide @ https://docs.microsoft.com/en-us/sql/database-engine/install-windows/install-sql-server
Download one (or more) client tool:
SSMS: 			https://docs.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms
Data Studio:	https://docs.microsoft.com/en-us/sql/azure-data-studio/download
Download and install SQLCMD if missing
SQLCMD 14: 	https://www.microsoft.com/en-us/download/details.aspx?id=53591

If for any reason you are unable to install SQL Server and have no access to a network or cloud instance, use https://db-fiddle.uk/
*/

----------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------

/*
███████╗██╗  ██╗███████╗██████╗  ██████╗██╗███████╗███████╗    ██████╗ 
██╔════╝╚██╗██╔╝██╔════╝██╔══██╗██╔════╝██║██╔════╝██╔════╝    ╚════██╗
█████╗   ╚███╔╝ █████╗  ██████╔╝██║     ██║███████╗█████╗       █████╔╝
██╔══╝   ██╔██╗ ██╔══╝  ██╔══██╗██║     ██║╚════██║██╔══╝      ██╔═══╝ 
███████╗██╔╝ ██╗███████╗██║  ██║╚██████╗██║███████║███████╗    ███████╗
╚══════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝ ╚═════╝╚═╝╚══════╝╚══════╝    ╚══════╝

For local installs, launch SSMS and connect to your local instance.
Choose Windows Authentication as you are a local administrator on your Windows PC (otherwise you wouldn't have been able to install it...).
Open a new editor window using CTRL + N.
Type "SELECT 'Hello, World!';" and click Execute (Green triangle icon button) or hit F5.
Make sure you see the output in the lower pane.

(No column name)
----------------
Hello, World!

Launch SQLCMD and connect to your local instance.
At the  prompt type "SELECT 'Hello, World!';" <Enter> GO <Enter>.
Make sure you get the result:

-------------
Hello, World!
(1 rows affected)

Congratulations! 
You have successfully installed SQL Server and connected both tools!

If using db-fiddle:
Replace the text "select version();" with "SELECT 'Hello, World!';" and click Run.
Make sure you see the result 
(No column name)
----------------
Hello, World!
*/

----------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------

/*
██████╗ ███████╗███████╗ ██████╗ ██╗   ██╗██████╗  ██████╗███████╗███████╗
██╔══██╗██╔════╝██╔════╝██╔═══██╗██║   ██║██╔══██╗██╔════╝██╔════╝██╔════╝
██████╔╝█████╗  ███████╗██║   ██║██║   ██║██████╔╝██║     █████╗  ███████╗
██╔══██╗██╔══╝  ╚════██║██║   ██║██║   ██║██╔══██╗██║     ██╔══╝  ╚════██║
██║  ██║███████╗███████║╚██████╔╝╚██████╔╝██║  ██║╚██████╗███████╗███████║
╚═╝  ╚═╝╚══════╝╚══════╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═╝ ╚═════╝╚══════╝╚══════╝

Additional Reading:
-------------------
https://en.wikipedia.org/wiki/Database
https://en.wikipedia.org/wiki/Relational_model
https://en.wikipedia.org/wiki/SQL
https://en.wikipedia.org/wiki/Microsoft_SQL_Server

Tools:
------
https://docs.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms
https://docs.microsoft.com/en-us/sql/azure-data-studio/download
https://www.microsoft.com/en-us/download/details.aspx?id=53591
https://db-fiddle.uk/ <-- Preferred online tool
https://www.db-fiddle.com/
http://sqlfiddle.com

Cloud providers:
----------------
https://azure.microsoft.com/en-us/services/sql-database/
https://docs.microsoft.com/en-us/azure/sql-database/sql-database-managed-instance
https://azure.microsoft.com/en-us/services/virtual-machines/sql-server/
https://aws.amazon.com/rds/sqlserver/
https://cloud.google.com/sql-server/
*/
