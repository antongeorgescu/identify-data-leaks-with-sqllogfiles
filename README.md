# Use SQL Server Transaction Logs to Identify Data Leaks

## Description
Every SQL Server database has a transaction log that records all transactions and the database modifications made by each transaction.<br/>

Detailed information can be found at <a href="https://docs.microsoft.com/en-us/sql/relational-databases/logs/the-transaction-log-sql-server?view=sql-server-ver15#:~:text=Every%20SQL%20Server%20database%20has,back%20to%20a%20consistent%20state.">The Transaction Log (SQL SErver)</a>

## Multi-node Data Flow with SQL Server

The following example shows the basic data flow in an exchange that has 4 nodes:
* IBM z Log Files
* CDC Source Replication Engine (see more details under IBM article <a href="https://www.ibm.com/docs/en/idr/11.4.0?topic=zos-about-cdc-replication">About CDC Replication)</a>
* CDC Target REplication Engine
* CDC Target DB (SQL Server)

In a standard configuration, the data flows from source (IBM z log files) to destination (target SQL Server) as following:

![CDC Basic Data Flow](https://user-images.githubusercontent.com/6631390/157721130-26444596-ada0-47bc-976b-4a80c15dd3ac.jpg)

