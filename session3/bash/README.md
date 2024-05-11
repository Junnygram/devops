Bash - bourne again shell
terminal - tool that gives us access to interact with shell
shell - is a utility / program that interpretes commands and interact with the linux kernel

executing a script

`touch script.sh`
`nano script.sh`
echo this is junny
ctrl x y, enter
`bash script.sh` this will run the script

#!/bin/bash

`ls -l`
-rw-r--r-- script.sh
r => read => 4
w => write => 2
x => execute => 1

there are three category in linux
user, groups, other

`./script.sh` permission denied

chmod 700

`chmod u+x` script.sh this will give execution porevilege to user
`touch createfolder.sh`
echo "Welcome to my app, lets help you create a folder"
sleep 3

echo "Enter the first folder name: "
read folder1
sleep 3

echo "Enter the second folder name: "
read folder2

echo "Enter the third folder name: "
read folder3
mkdir $folder1
mkdir $folder2
mkdir $folder3

ctrl x y, enter
$./createfolder.sh node1 node2 node3

//we can improve this code

echo "Welcome to my app, lets help you create a folder"
sleep 3

read -p "Enter the first folder name: " var1
sleep 3

read -p "Enter the second folder name: " var2

read -p "Enter the third folder name: " var3
read folder3
mkdir $var1
mkdir $var2
mkdir $var3

//create a atm bash

echo "Welcome to my Bank-Junny"
echo "••••••••••••••••••••••••"
sleep 3

#ask for username
read -p "Enter your name: " user
sleep 3

read -s -p "Enter your password: " pass

echo "Welcome $user, your password $pass is correct"
