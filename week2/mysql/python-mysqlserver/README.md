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
