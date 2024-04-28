# Tasks

connect sql client to sql server

Instructions to deploy a MySql Server on a Linux Machine

# Step 1: Update the system

`sudo apt update`

# Step 2: Install MySql

`sudo apt install mysql-server -y`

# Step 3: Check the Status of MySql (Active or Inactive)

`sudo systemctl status mysql`

# Step 4: For secure connection, to remove any anonymouse user

`sudo mysql_secure_installation`
this will prommpt few questions [y,1,y,y,y,y]

# Step 5: Login to MySql as a root user or a normal user

`sudo mysql`

# Step 6: To view default database

`use mysql`
`show databases;`

# Step 7: To view default table

`show tables;`

# Step 8: To view only the host, user, plugin from the table for configuration

`select host, user, plugin from mysql.user;`

# Step 9: Update the password for the MySql Server

`ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'your_password';`

its not a good practice to use root , but now the root will always requir a password to login, best practice is to create a user with password . to create a user

`CREATE USER 'junny'@'localhost' IDENTIFIED BY 'Yourpassword';`

or

`CREATE USER 'junny'@'%' IDENTIFIED WITH mysql_native_password BY 'Yourpassword';`

when we run `select host, user, plugin from mysql.user;` we will see the user junny in the table

ND: % means any ip as youve seen on the table, We should use subnets if its an internal development , but for customers we use %

# Step 10: To clear cache

`FLUSH PRIVILEGES;`

# Step 11: Test the MySql server if it is working by running sample sql queries

// create a database and a table, then insert content, then create a user

CREATE DATABASE techpeakdb;

USE techpeakdb;

CREATE TABLE Subjects (
ID int,
LastName varchar(255),
FirstName varchar(255),
Subject varchar(10),
Score int(10)
);

INSERT INTO Subjects (ID, LastName, FirstName, Subject, Score)
VALUES (3, 'Ogbu', 'Victor', 'Maths', 98);

# we can exit mysql and login as a root user we created or root user

`exit`
`mysql -h 127.0.0.0.1 -u root -p`
or
`mysql -h 127.0.0.0.1 -u junny -p`
`mysql -u junny -p`

NB: junny doesnt have access to techpeak only root and this will login because junny can be accessed from any ip

to check ip on terminal
`ip a`

# Step 12: Configure remote access to the database server on the mysqld in /etc

`cd /etc/mysql`

you cannot modify anything in the etc path if you are not a root user except you use sudo

`sudo nano mysql.conf.d`

edit the mysqld.cnf file or use below

bind-address = 0.0.0.0

if you cant see bind-address , type
skip-networking
skip-bind-address

ctrl s to save ,y to quit enter

now run
`sudo systemctrl restart mysql.service`

<!-- `sudo service mysql status/stop/enable/restart/reload/disable` -->

If any, ensure to Open the security group / firewall

<!-- on aws /ec2/security setting/inbound route/ mysql , save roles -->

# ------------------------------------------------------------------

on mysql-client
`mysql -h ipaddress -u junny -p`

either using ufw or open port 3306 on your machine

Test connection using any client (workbench, mysql client or phpmyadmin )

# Step 13: Grant priviliges to users using either below to see and perform operations on the db

`mysql -u root -p`
`GRANT CREATE ON *.* TO 'junny'@'%' with grant option;` //this will grant junny all permission to create on all databases
`GRANT CREATE ON techpeakdb._ TO 'junny'@'%' with grant option;`
`GRANT CREATE, SELECT, DELETE ON techpeakdb._ TO 'junny'@'%' with grant option;`
`GRANT ALL ON techpeakdb._ TO 'junny'@'%' with grant option;`
`GRANT ALL ON _.\* TO 'junny'@'%' with grant option;` //this will grant junny all permission on all databases

<!-- # on mysql-server for phpmyadmin

`sudo apt install pip phpmyadmin -y`
space bar to select

to configure no

`curl localhost`
or use lynx to view on browser
`sudo apt install lynx -y`
`lynx localhost`
then
`lynx localhost/phpmyadmin`
then yyyy

on browser
ip/phpmyadmin -->
