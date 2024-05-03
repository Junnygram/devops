# connect python with sql

import mysql.connector as mysql
import socket

hostname = socket.gethostname()
IP_address = socket.gethostbyname(hostname)

user=input("User: ")
password=input("Password: ")

db=mysql.connect(
host=IP_address,
user=user,
port=3306,
password=password,
database="Example_db")

print("connected to: ",db.get_server_info())

# Hint

1. install python
2. pip3 install mysql-connector

#solution
This code is a series of commands and SQL statements for setting up a MySQL server, creating a database, tables, and users, as well as configuring access privileges. Let's break it down step by step:

### Server Setup:

1. **Update package lists**: `sudo apt update -y` - This command updates the list of available packages from repositories.
2. **Install MySQL Server**: `sudo apt install mysql-server -y` - Installs MySQL server.
3. **Check MySQL service status**: `sudo systemctl status mysql` - Checks the status of the MySQL service.
4. **Run MySQL secure installation**: `sudo mysql_secure_installation` - This script allows you to improve the security of your MySQL installation.
5. **Access MySQL shell**: `sudo mysql` - Enters the MySQL command-line interface.

### Database and Table Creation:

6. **Create a database**: `CREATE DATABASE schooldb;` - Creates a new database named "schooldb".
7. **Create a table**: Defines a table named "Subjects" with columns: ID, LastName, FirstName, Subject, Score.
8. **Insert data into the table**: Inserts a record into the "Subjects" table.

### User and Privilege Management:

9. **Navigate to MySQL configuration directory**: `cd /etc/mysql/mysql.conf.d/`
10. **List files in the directory**: `ls`
11. **Edit MySQL configuration file**: `sudo nano mysqld.cnf` - Edits the MySQL configuration file.
12. **Restart MySQL service**: `sudo systemctl restart mysql.service` - Restarts the MySQL service.
13. **Flush privileges**: `FLUSH PRIVILEGES;` - Reloads the grant tables in the mysql database to ensure that privilege changes made by the `CREATE USER` and `GRANT` statements take effect.

### User Creation and Privileges:

14. **Create a MySQL user with specific privileges**: `CREATE USER 'principal'@'localhost' IDENTIFIED BY 'Passw@rd//;098’;`
15. **Create a MySQL user with specific privileges for remote access**: `CREATE USER 'principal'@'%' IDENTIFIED WITH mysql_native_password BY 'Passw@rd//;098';`
16. **Grant privileges to a user**: `GRANT ALL ON schooldb.* TO 'principal'@'%' WITH GRANT OPTION;` - Grants all privileges on the "schooldb" database to the user "principal" from any host with the ability to grant privileges to other users.

### Client Setup:

17. **Update package lists**: `sudo apt update -y`
18. **Install MySQL Client**: `sudo apt install mysql-client -y` - Installs MySQL client tools.
19. **Access MySQL server from client**: `mysql -h 54.87.111.32 -u principal -p` - Connects to the MySQL server hosted at the specified IP address with the username "principal" and prompts for the password.
20. **Execute SQL commands**: Various SQL commands to interact with the MySQL server from the client.
21. **Exit MySQL client**: `:wq!` or use appropriate exit command depending on the text editor used (`nano`, `vi`, etc.).

The provided steps cover setting up a MySQL server, creating databases and tables, managing users and their privileges, and accessing the MySQL server from a client machine. Make sure to replace placeholders like IP addresses, passwords, and database names with actual values relevant to your setup.
