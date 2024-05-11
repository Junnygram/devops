Bash - bourne again shell
terminal - tool that gives us access to interact with shell
shell - is a utility / program that interpretes commands and interact with the linux kernel

executing a script

`touch script.sh`
`nano script.sh`
echo this is junny
ctrl x y, enter
`bash script.sh` this will run the script

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

1. Open the file in Vim:

   ```
   vi filename
   ```

   This command opens the file named `filename` in Vim for editing.

2. if you want to edit a file named `filename` in Vim with line numbering enabled, you would enter these commands one after the other in the Vim editor after opening the file:

```
:set number
```
