Collaborate and manage scurity with users and roles in snowflake

Hierarchy of securable objects
Organization -> account
Warehouse, database, role, user, other acc_objs

Database: Database role, Schema -> table, views, stage, stored procedure, UDF

Access control in Snowflake
DAC - Discretionary access control
Each object has an owner
An owner can grant privilege to access the object

RBAC - role-based access control
Access privileges assigned to roles
Roles assigned to users and other roles.

Example of access control
Role 1 -> OBJ 1 (warehouse) cetrain privileges -> GRANT <privilege> TO <role> Role 2 -> GRANT <role> TO <user> User 1
OBJ 2 (Database) -> privilege - Role 3 -> User 2 and role 3 can grant a role to role 4 
User 2 GRANTS privileges from OBJ 1 and OBJ 2.

Privileges are inherited. Role 3 grant to role 2 and role 2 grant privilege 2 to role 1 the user 1 grants privilege 2 and 3.
Role 1 GRANT role1 TO user1 -> User1
Privilege 1
Role 2
Privilege 2
Role 3
Privilege 3

System-defined roles
**ORGADMIN** Manage operations in organizational level, create accounts in organizations.
**ACCOUNTADMIN** Top level role, grant to few users. 
**SECURITYADMIN** Manage object grant globally
**SYSADMIN** Create warehouse, create database, create other objects, create all custom roles.
**USERADMIN** User and role management
**PUBLIC** Objects owned by PUBLIC is available to everyone, Pseudo-role granted to every user and role.

Accountadmin inheritage from SecurityAdmin and SysAdmin, SecurityAdmin inheritage from UserAdmin, SysAdmin inheritage from Custom role which it creates.
Public can have several custom roles. And everyone inheritage from Public.