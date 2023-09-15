#!/bin/bash

data_file="user_data.txt"

collect_user_info() {
    read -p "Enter first name: " first_name
    read -p "Enter last name: " last_name
    read -p "Enter email: " email
    read -p "Enter phone number: " phone_number

    echo "$first_name $last_name $email $phone_number" >> "$data_file"
    echo "User information saved."
}

search_user_info() {
    read -p "Enter phone number or email to search: " search_term

    grep -i "$search_term" "$data_file" && {
        read -p "Do you want to correct this user's information? (yes/no): " choice
        [ "$choice" = "yes" ] && collect_user_info
    } || echo "User not found."
}

while true; do
    echo "1. Add User"
    echo "2. Search User"
    echo "3. Quit"
    read -p "Enter your choice (1/2/3): " choice

    case $choice in
    1)
        collect_user_info
        ;;
    2)
        search_user_info
        ;;
    3)
        echo "Goodbye!"
        exit 0
        ;;
    *)
        echo "Invalid choice. Please select 1, 2, or 3."
        ;;
    esac
done
