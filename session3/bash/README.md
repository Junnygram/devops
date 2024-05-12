Bash - bourne again shell
terminal - tool that gives us access to interact with shell
shell - is a utility / program that interpretes commands and interact with the linux kernel

#!/bin/bash

# Creating and Executing a Script

`touch script.sh`
`echo "echo 'This is Junny.'" `
to run `bash script.sh` or `./script.sh` you might get permission denied

# File Permissions

`ls -l` to show
-rw-r--r-- script.sh
r => read => 4
w => write => 2
x => execute => 1
there are three category in linux
user, groups, other

to fix the permision denied
`chmod u+x` script.sh this will give execution porevilege to user
there are three category in linux
user, groups, other

or `chmod 700 script.sh` this gives read, write, and execute permission to the user

# Creating a Folder Script

```
touch createfolder.sh
echo "Welcome to my app! Let's create folders."
echo "Please enter names for three folders:"
read folder1 folder2 folder3
mkdir "$folder1" "$folder2" "$folder3"
echo "Folders created successfully!"
```

executing a script

`touch script.sh`
`nano script.sh`
echo this is junny
ctrl x y, enter
`bash script.sh` this will run the script
we can also speciy the root path `which bash`it will return /usr/bin/bash
now run `/user/bin/bash script.sh`

1. **Script for creating folders:**

   - You've made good progress by using `read -p` for input prompts. It makes the script more user-friendly.
   - Consider adding error handling to check if the folder creation was successful or if the folder already exists.

2. **ATM Bash script:**

   - You're on the right track with using `read -s -p` for password input to hide it.
   - Remember to put spaces around operators in conditional statements. For example, `if [["$user" == "admin"]]` should be `if [[ "$user" == "admin" ]]`.
   - There's a typo in the withdrawal section (`withdtrawn` should be `withdrawn`).
   - When updating the balance after deposit or withdrawal, avoid using extra dollar signs. For example, instead of `$$(($balance + $depAmount))`, use `$(($balance + $depAmount))`.
   - Include error handling for invalid input (non-numeric input for amounts, for example).

3. **Creating a function:**

   - You've demonstrated the use of `case` statements well. They make the script more structured and easier to understand.
   - Ensure proper indentation for better readability.
   - In the case statement for choices, avoid using numbers like `1.`; just use `1`.
   - Add a default case to handle invalid choices gracefully.

4. **Miscellaneous:**
   - You've mentioned using `vi` for editing files. Consider introducing more user-friendly editors like `nano` or `vim` as alternatives, especially for beginners.

Here's a slightly improved version of your ATM script with some of the mentioned corrections:

```bash
#!/bin/bash

balance=5000

echo "Welcome to my Bank-Junny"
echo "••••••••••••••••••••••••"
sleep 3

# Ask for username
read -p "Enter your name: " user
sleep 3

# Ask for password (hidden input)
read -s -p "Enter your password: " pass
echo

if [[ "$user" != "admin" ]]; then
    echo "Wrong username"
    exit
fi

echo "Welcome $user, Please select your choice of operation:"
echo "1. Check your balance now"
echo "2. Perform a deposit transaction"
echo "3. Perform a withdrawal transaction"
read -p "Enter your choice: " choice

case $choice in
    1) echo "Your balance is $balance"
       ;;
    2) read -p "Enter the amount to deposit: " depAmount
       if [[ $depAmount =~ ^[0-9]+$ ]]; then
           balance=$((balance + depAmount))
           echo "$depAmount deposited successfully"
       else
           echo "Invalid input for deposit amount"
       fi
       ;;
    3) read -p "Enter the amount to withdraw: " withAmount
       if [[ $withAmount =~ ^[0-9]+$ && $withAmount -le $balance ]]; then
           balance=$((balance - withAmount))
           echo "$withAmount was withdrawn from your account"
       else
           echo "Invalid input for withdrawal amount or insufficient balance"
       fi
       ;;
    *) echo "Invalid choice"
       ;;
esac
```

echo "work in progress..."

1. Open the file in Vim:

   ```
   vi filename
   ```

   This command opens the file named `filename` in Vim for editing.

2. if you want to edit a file named `filename` in Vim with line numbering enabled, you would enter these commands one after the other in the Vim editor after opening the file:

```
:set number
```

//function
`touch function.sh`
`nano function.sh`

```bash
#!/bin/bash

# Create a function
function greetMe(){
    echo "Welcome to Olaleye's session"
}

# Call the function
greetMe
```

You can save this script in a file named `function.sh`, then execute it using `bash function.sh`.

//

```bash
#!/bin/bash
<!-- cat etc/password | grep  -->

if [["$UID" -EQ 0]]; then
echo "you are the root user"
else
echo "you are not the root user, so bye"
exit
fi
```

//updating script
`touch server.sh`
`nano server.sh`

```bash
#!/bin/bash

sudo apt update -y
sudo apt install

```

to get current date
`date ` or `echo $(date)`

```bash
#!/bin/bash

# IP blocking script

# Define IPs to be blocked
ips="1.1.1.1 8.8.8.8 0.0.0.0 2.2.2.2"

# Loop through each IP
for each_item in $ips; do
    echo "Blocking IP: $each_item"
    # Block the IP using iptables
    iptables -I INPUT -s $each_item -j DROP || echo "Error blocking IP: $each_item"
    echo "Blocked successfully."
done

# Reading IPs from a file named iplist.txt
if [ -f "iplist.txt" ]; then
    echo "Reading IPs from iplist.txt..."
    while IFS= read -r each_item; do
        echo "Blocking IP: $each_item"
        iptables -I INPUT -s $each_item -j DROP || echo "Error blocking IP: $each_item"
        echo "Blocked successfully."
    done < "iplist.txt"
else
    echo "Error: iplist.txt not found."
fi

# Usage of 'select' in Bash
PS3="Choose an option: "
select actions in "Create user" "Delete user"; do
    case $REPLY in
        1)
            echo "Creating user..."
            useradd junny && echo "User created successfully." || echo "Error creating user."
            ;;
        2)
            echo "Deleting user..."
            userdel junny && echo "User deleted successfully." || echo "Error deleting user."
            ;;
        *)
            echo "Invalid selection."
            ;;
    esac
    break
done
```
