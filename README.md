# Use SQL Server Transaction Logs to Identify Data Leaks

## Description
Every SQL Server database has a transaction log that records all transactions and the database modifications made by each transaction.<br/>

Detailed information can be found at <a href="https://docs.microsoft.com/en-us/sql/relational-databases/logs/the-transaction-log-sql-server?view=sql-server-ver15#:~:text=Every%20SQL%20Server%20database%20has,back%20to%20a%20consistent%20state.">The Transaction Log (SQL SErver)</a></br>

## Multi-node Data Flow with SQL Server

The following example shows the basic data flow in an exchange that has 4 nodes:
* IBM z Log Files
* CDC Source Replication Engine (see more details under IBM article <a href="https://www.ibm.com/docs/en/idr/11.4.0?topic=zos-about-cdc-replication">About CDC Replication)</a>
* CDC Target REplication Engine
* CDC Target DB (SQL Server)</br>

In a standard configuration, the data flows from source (IBM z log files) to destination (target SQL Server) as following:

![CDC Basic Data Flow](https://user-images.githubusercontent.com/6631390/157726774-9e6eed22-65e8-444b-8665-a1f5582254fd.jpg)

## Data records leaked between source and destination
In order to identify the data records that are getting leaked between source an destination in the above flow we propose the following strategy.

### Clarification
In order to run the tests described below, I have used the 2 projects saved under the corrent respoitory:
* SampleDatabase (Sql Server Database project)
* TestSqlLogFiles (.NET Core Console App project)

### Checking if the records get discarded by Sql Server due to hidden constrains.

* This checks if data moves along step (4) in the data flow diagram above
* Before starting a 1-record "good insert" transaction from (1) to (5) save the current counter of Transaction Log records.</br>In the case below the counter value is <b>99</b>

![SQL Logs Initial Counter](https://user-images.githubusercontent.com/6631390/157722682-addceb78-e0ba-4adc-9631-983f94b9a5d9.JPG)

* Query the table you need to modify by running the script below.

![SQL Table Initial Query](https://user-images.githubusercontent.com/6631390/157725057-2e9040d1-b3dc-4681-bf1b-5050f7e3a07e.JPG)

* Run the "good insert" by executing the script below.

![SQL Good Insert](https://user-images.githubusercontent.com/6631390/157724723-49991545-52e1-48a6-9070-595115a26a81.JPG)

* Query Transaction Log counter: you will notice that for a "good insert" the counter advances with 2 positions, and is now at <b>101</b>

![SQL Logs After Good Insert Counter](https://user-images.githubusercontent.com/6631390/157724858-3f147d06-ee7c-43d6-b304-051eb5cedbd0.JPG)

* Query the table you midified and you will see the new record added.

![SQL Table After Good lnsert Query](https://user-images.githubusercontent.com/6631390/157724992-2adffab1-d876-44b6-aae7-a7029096ceca.JPG)

* Run a "bad insert" by executing the script below. A bad insert means we purposefully break the unique constraint on Department name.

![SQL Bad Insert](https://user-images.githubusercontent.com/6631390/157724627-50ba05cb-a300-498b-8ca0-afb79804eff9.JPG)

* Check first the table to make sure the records has not been added.

![SQL Table After Bad lnsert Query](https://user-images.githubusercontent.com/6631390/157724946-a05322e4-a266-4da7-9caf-96a870e6965a.JPG)

* Check Transaction Log counter and you will notice that it advanced only one position, from 101 to <b>102</b>

![SQL Logs After Bad Insert Counter](https://user-images.githubusercontent.com/6631390/157724771-0591fbac-7d98-4aef-a36a-2d5bda00fa20.JPG)

* The same behaviour is noticed if a bad insert is triggered from within a callin application (for test purposes I used the small .NET Core Console App whihc is part of the current repository) The Transaction Logs counter has now advanced to <b>103</b>

![SQL Error from Calling App](https://user-images.githubusercontent.com/6631390/157724669-7d47c9bf-8875-45ea-b655-bf78c0e29afe.JPG)

## Conclusion
In order to eliminate constraint issues in target Sql Server as cause for missing data records at the destination, we have to eliminate the possibility of errors triggered by Sql Server engine. This has to be done in the conditions when we might not have access to CDC Target REplication Engine logs, or the logs recorded under that application are poor.

The rule of thumb is that for any goo transaction there is a number N of new records in Sql Server Transaction Log file, where:

First record under context *LCX_CLUSTERED* is always present
Following N-1 records under context *LCX_INDEX_LEAF* will be missing for a "bad insert" transaction, i.e. an insert that failed because it browke one or ore of the constraints applied at the respecive table level









