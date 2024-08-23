Terminology	Explanation
**Downstream** - Downstream in the data warehouse lifecycle refers to the processes sand activities that occur after data has been ingested and processed in the data warehouse. This includes data analysis, reporting and consumption by end-users or applications.
*Summary:* In the data warehouse lifecycle, downstream activities involve analyzing, reporting and utilizing data after it has been processed and stored. This stage focuses on how data is accessed and used for decision-making and insights.
**Data lineage** - Data lineage in the data warehouse lifecycle refers to the tracking of data's journey from it's origin through various processing stages to itäs final form in the data warehouse. It involes documenting and visualizing how data is collected, transformed and used, which helps understanding data flow, dependencies and transformations.
**Upstream** - Upstream in the data warehouse lifecycle refers to the processes and activities involved in collecting, preparing and ingesting data before it reaches the data warehouse. This includes data extraction, transformation and loading (ETL) from various sources into the data warehouse.
*Summary*: In the data warehouse lifecycle, upstream activities involve collecting and preparing data for loading into the warehouse. These processes ensure that data is accurately and efficiently ingested for subsequent analysis and reporting.
data warehouse - Is a centralized repository designed to store, organize and analyze large volumes of historical and current data from various sources. It is optimized for querying and reporting, providing a structured enviroment for BI and decision-making.
Summary: A data warehouse centralizes and stores large amounts of data from different sources, optimized for analysis and reporting. It supports BI by providing a consistent and accessible data enviroment for decision-making.	
cloud computing	- Refers to the delivery of computing services - such as servers, storage, databases and software - and over the cloud. This model allows users to access and use these resources on a pay-as-you-go basis without needing to manage physical hardware.
Summary: Cloud computing provides on-demand access to computiong resources via the internet, enabling scalable and flexible data managemnt and processing. In the data warehouse lifecycle, it supports scalable storage, compute power, and efficient data operations without the need for on-premises infrastructure.
modern data stack - A modern stack refers to a contemporary set of tools and technologies used together to manage, preocess and analyze data in a data warehouse enviroment. This stack typically includes components for data ingenstion, storage, transformation, and visualization, leveraging cloud-native and scalable technologies.
Summary: The modern stack is a collection of integrated tools and technologies used for managing and analysing data, featuring cloud-based solutions for efficient data ingestion, storage, transformations, and visualization.
idempotent - Refers to a operation that, when applied multiple times, has the same effect as if it were applied once. In the context of data warehousing, an idempotent operation esures that executing a data modification or update multiple times will not produce different results or unintended side effects.
Summary: In data warehousing, an idempotent operation produces the same result no matter how many times it is performed. This property ensures consistency and reliability in data processing tasks.
OLAP - (Online Analytical Processing) refers to a type of a database system optimized for querying and analyzing large volumes of data to support decision-making and business intelligence. OLAP systems are designed for complex queries, aggregations, and data analysis, often invloving historical data and multidimensional analysis.
Summary: OLAP systems are used for analysing large datasets and complex queries to support business intelligence and decision-making. They are optimized for in-depth data analysis and reporting, focusing on historical and aggregated data.
OLTP - (Online Transaction Processing) refers to a type of database system optimized for managing and processing real-time transactional data, such as order processing, inventory management, and customer interactions. OLTP systems are designed for high efficiency in handling a large number of short, frequent transactions.
Summary: OLTP systems are designed for real-time processing of transactional data with high efficiency for frequent, short transactions. They are typically used for day-to-day operations and data entry tasks.	
virtual warehouse - A virtual warehouse in the data warehouse lifecycle is a compute resource in Snowflake that performs the processing of queries and data operations. It is a scalable, isolated cluster of compute resources that can be resized or turned on and off as needed to handle varying workloads efficiently.
Summary: A virtual warehouse is a scalable compute cluster used for executing queries and processing data in Snowflake. It can be adjusted based on workload demands, providing flexibility and efficiency in data processing.
external stage - Am extermaö stage in the data warehouse lifecycle is a storage location outside of the data warehouse where data files are temporarily stored before being loaded into the warehouse. It typically refers to cloud storage services like Amazon S3, Azure Blob storage, or Google Cloud Storage, and is used to manage data ingestion and integration.
Summary: An external stage is a cloud-based location used to tomporarily hold data files before they are loaded into the data warehouse. It facilitates data ingestion by serving as an intermediary storage area.
data consumer - A data consumer in the data warehouse lifecycle refers to the individuals, applications, or systems that access and use the data stored in the warehouse for analysis, reporting, or decision-making. Data consumers can be business analysts, data scientists, executives, or BI tools that query and interpret the data to gain insights.
Summary: Data consumers are users or systems that interact with and utilize the data in a data warehouse for analysis and reporting. They play a key role in leveraging the data to drive business decisions and insights.
scaling out	- Scaling out in data warehouse architecture refers to addiung more machines or nodes to a system to distribute the workload across multiple servers. Instead of relying on a single powerful machine, scaling out increases capacity by connecting multiple systems, which work together to handle more data or queries simultaneously.
Summary: Scaling out involves adding more servers or nodes to a data warehouse architecture, allowing the workload to be distributed and processed in parallel, thus improving performance and capacity.
scaling up - Scaling up in data warehouse architecture refers to increasing the resources of a single machine or system to handle more workload. This typically involves upgrading CPU, memory or storage capacity of the servers running the data warehouse, allowing it to process larger datasets or more complex.
Summary: Scaling up means enhancing the hardware resources of a single system in a data warehouse to improve it's ability to handle larger or more demanding workloads.
snowflake credit - A snowflake credit is a unit of measure used to calculate the cost of compute resources in Snowflake. Credits are consumed based on the size and duration of virtual warehouses (compute clusters) that process queries and other tasks. The larger the warehouse or the longer it runs, the more credits are used.
Summary: Snowflake credits are units to measure and bill the usage of compute resources. The number of credits consumed depends on the size and runtime of the virtual warehouse used in your operations.
securable object - In snowflake, a securable object is any object within the snowflake enviroment to which you can apply access control or permissions. This includes objects like databases, schemas, tables, views, stages and warehouses. These objects can be secured by granting specific privileges to roles or users, determing who can access or modify them.
Summary: Securable objects in Snowflake are database objects, such as tables and schemas, that you can protect by setting permissions. They are essential for managing access control within your data warehouse.
snowflake object - a "snowflake object" refers to any database object that you can create and manage within the snowflake enviroment. These objects include:
1. Database: Containers that hold schemas, tables, views and other objects.
2. Schemas: Logical grouping of database objects like tables and views.
3. Tables: STructures that store data in rows and columns.
4. Views: Virtual tables that are based on the result of a SQL query.
5. Stages: Locations where data is stored temporarily before loading into tables.
6. File formats: Definitions for how data files are structured (e.g. CSV, JSON).
Summary: Snowflake objects, are the various entities you create within Snowflake's enviroment, such as database, tables and views, which help organize, store, and manage your data. These objects are essential for building and maintaning your data warehouse.
schema - is a description, represented by objects such as tables and indexes, of how data relates logically within data warehouse. Star, galaxy and Snowflake schema are types of warehouse schema that describe different logical arrangements of data.
permanent table	- store data on long term storage, or disk drives. The data exists permanently and other SQL client session can see or edit the data.
transient table	- Are designed for transitory data that needs to be maintained beyond the current session (unlike temporary tables). Data in transient tables will contribute to the overall storage costs, however, there will be no Fail-safe costs as they do not make use of Snowflake's Fail-safe feature.
temporary table - is a base table that exists only for the duration of a specific database session and is not stored permantently in the database. It allows for the storage and manipulation of data during
the session, providing better performance for repeated data usage compared to views.
time-travel	- The to query a data from a specific timestamp. Time travel facilitates stable reporting by maintaining the consistency and accuracy of data over time.
Allows you to access and query historical versions of data within a specified retention period. It's useful for recovering from mistakes, auditing changes, or analyzing past data states.
fail-safe - is a data recovery service that is provided on a best on a best effort basis and is intedented only for use when all other recovery options have been. Fail-safe is not provided as ameans for accessing historical data after the time travel retention period has ended.
view - is a virtual table that presents data from one or more tables in a structured and user-friendly format. Is defined by a SQL query. THe use of a view offers an improved user experience for those running
queries for analytics, ETL, and other data operations.
table - are database objects that contain all the data in a database, in tables, data is logically organized in a row-and-column format similar to a spreadsheet. Each row represents a unique record, and each column represents a field in the record.
DML	- The SQL commands that deal with the manipulation of data present in the database belong to DML or Data manipulation language and this includes most of the SQL statements.
It is the component of the SQL statement that controls access to data and to the database. Basically, DCL statements are grouped with DML statements.
INSERT - Insert data into a table
Update - Update existing data within a table.
DELETE - Delete records from a database table.
LOCK - Table control concurrency.
CALL - Call a PL/SQL or JAVA subprogram.
EXPLAIN PLAN - Describe the access path to data.
DDL - (Data definition language) is a set of SQL commands used to define, create, modify and delete the structure of a database objects, such as tables and schemas. It focuses on the database schema rather than the data itself and is typically used by database administrators rather than general users.
CREATE - creates new database objects, such as tables, views, indexes or databases
ALTER - modifies the structure of an existing database object, like adding or dropping columns in a table.
DROP - Used to delete database objects like tables, views or entire database.
TRUNCATE - Removes all access from a table, but the table structure remains intact.
COMMENT - Add comments to the data dictionary for documentation purposes.
RENAME - Change the name of an existing database object.

DQL	- (Data query language) DQL statements are used for performing queries ojn the data within schema objects. The purpose of the DQL command is to get some schema relation based on the query passed to it.
We can define DQL as follows it as a component of SQL statement that aLlows getting data from the database and imposing order upon it. It includes the SELECT statement.
This command allows getting the data out of the database to perform operations with it. When a SELECT is fired against a table or tables the result is compiled into a further temporary table, which is displayed or perhaps received by the program i.e. a front-end. SELECT - It is used to retrieve data from the database.
DCL - (Data control language) includes commands such as GRANT and REVOKE which mainly deal with the rights, permissions and other controls of the database systems.
GRANT - Assigns new privileges to a user account, allowing access to a specific database objects, actions or functions.
REVOKE - Removes previously granted privileges from a user account, taking away their access to a certain database objects or actions
