Using **Snowflake** as our data warehouse for data analytics to gain valuable insights. 
**Pysical servers / on premise**. When workload is increasing, nbeed to buy more hardware. Not flexible and hard to manage. ANd there will be probably between teams how to scale up or scale out. Large upfront cost (CapEx)
**Snowflake three-tier architecture**. In snowflake there is cloud services, authentication & access control, infrastructure, optimizer, metadata and security. It has the cloud services in the background, AWS, google platform, 
compute virtual warehouses, you can have several warehouses, 4, 2, or 1. It is seperate from the storage.
Storage this run on top of cloud platforms. Aazure, AWS, Google platform.

Pricing: Storage cost, capacity storage then you have a upfront cost for a certain amount of storage, on-demand storage it depends on how much storage you have and it costs accordingly. Storage fee per month. **Cloud services:** Compute, storage, data transfer. Indirect costs related to cloud providers. Billing, credits transformed to currency. Based on cloud provider & region.
Time-travel and fail-safe cost: if you query and delete data you can retrieve the data going back in history when retrieving.
Compute cost:
1 credit per compute node. Based on credits consuption. Warehouse active, billed per second, minimum 1 min.

Hierarchy of snowflakes securable objects.
- Organisation
- Account
    - Warehouse, database, role, user, other acc_objs.
Within database you have database role and schema, and in schema you have table, views, stage stored procedure udf
Virtual warehouse scaling up, good for handling large, but few workloads. To scale up, you pick a warehouse of a larger size.
XS 1 compute node, 1 credit/hour. This is build per minute.
S 2 compute node, 2 credits/hour
M 4 compute nodes, 4 credits/hour
L 8 compute nodes 8 credits/hour

Scale out squares or rectangles, when you scale out you gain more clusters, you have two data warehouses running in parallel:
1 cluster
2 clusters
3 clusters
Good for handling many workloads in parallel. Configure to scale out automatically when needed based on scalin policy. Also called horizontal scaling.

Database and schemas object
Account can have several databases. and a organization can have several accounts.
- Database - information schema, other schemas. Schema: Used to organize database objects such as tables, views....
-Database
-Database
-Database

Different types of tables in snowflake
--------------------------------> storage time
Temporary table (session)
Automatically dropped after session
Transient table (short-term)
no time-travel, no fail-safe
Permanent stable (long term)
Time-travel, fail-safe

External table
Query data in azure blob storage, google cloud service and amazon s3 bucket, without loading into snowflake.