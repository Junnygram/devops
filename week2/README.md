sql server

# Tasks

1. Create a database server - done
2. connect with a database client ( phpmyadmin, mysqlclient)
3. demo python application that connects to our database.

Instructions to deploy a MySql Server on a Linux Machine
Step 1: Update the system
==============================================================================

sudo apt update

# Step 2: Install MySql

sudo apt install mysql-server -y

# Step 3: Check the Status of MySql (Active or Inactive)

sudo systemctl status mysql

# Step 4: Login to MySql as a root user or a normal user

sudo mysql

# Step 5: Update the password for the MySql Server

ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '{1@5!passwo-rd}';

# Step 6: Test the MySql server if it is working by running sample sql queries

// create a database and a table, then insert content, then create a user

CREATE DATABASE schooldb;

USE schooldb;

CREATE TABLE Subjects (
ID int,
LastName varchar(255),
FirstName varchar(255),
Subject varchar(10),
Score int(10)
);

INSERT INTO Subjects (ID, LastName, FirstName, Subject, Score)
VALUES (3, 'Ogbu', 'Victor', 'Maths', 98);

// create a user with a password plugin and provide a password.

CREATE USER 'olaleye'@'localhost' IDENTIFIED BY 'Yourpassword';

or

CREATE USER 'olaleye'@'%' IDENTIFIED WITH mysql_native_password BY 'Yourpassword';

FLUSH PRIVILEGES;

# Step 7: Configure remote access to the database server on the mysqld in /etc

cd /etc/mysql/mysql.conf.d/

edit the mysqld.cnf file or use below

skip-networking
skip-bind-address

sudo service mysql status/stop/enable/restart/reload/disable

# Step 8: If any, ensure to Open the security group / firewall

either using ufw or open port 3306 on your machine

Test connection using any client (workbench, mysql client or phpmyadmin )

# Step 9: Grant priviliges to users using either below to see and perform operations on the db

`
GRANT CREATE ON techpeakdb._ TO 'olaleye'@'%' with grant option;
GRANT CREATE, SELECT, DELETE ON techpeakdb._ TO 'achiever'@'%' with grant option;
GRANT ALL ON techpeakdb._ TO 'olaleye'@'%' with grant option;
GRANT ALL ON _.\* TO 'olaleye'@'%' with grant option;`
