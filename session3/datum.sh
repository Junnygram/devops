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










