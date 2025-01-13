#!/bin/bash

#######################################################
#######             System Utilities            #######
#######################################################
####### Version release date: January 12th 2025 #######
#######################################################

#TODO
#ADD MORE FUNCTIONS
#TEST
#ADD SOME WEIRD FANCY STUFF CAUSE YOU KNOW

reset='\e[0m'
green='\e[32m'
red='\e[31m'
yellow='\e[33m'

# Clear screen
clear

# Display menu
while true; do

    echo -e "\e[4mSYSTEM UTILITIES\e[0m"
    echo -e "${yellow}Please make sure to run this script with privileges${reset}"
    echo ""
    echo "1. List local users"
    echo "2. List a user's group"
    echo "3. Display system version"
    echo "4. Display disks/partitions"
    echo "5. Display IP configuration"
    echo "6. Display IP configuration (detailed)"
    echo "7. Show last reboot"
    echo "8. Update/Upgrade packages"
    echo "Q. Quit"
    echo ""

    #Read user input and save it as $choice variable
    read -p "Pick an option: " choice
    echo ""

    # Launch command depending on the value stored in $choice
    case $choice in
        1)
            echo -e "${green}Listing local users:${reset}"
            sudo cat /etc/passwd
            echo ""
            ;;

        2)
            read -p "User: " user
            echo -e "${green}User $user is part of the following groups:${reset}"
            sudo groups $user
            echo ""
            ;;

        3)
            echo -e "${green}System version:${reset}"
            grep "PRETTY_NAME" /etc/os-release
            uname -a
            echo ""
            ;;

        4)
            echo -e "${green}Disks and partitions:${reset}"
            lsblk
            echo ""
            ;;

        5)  echo -e "${green}IP configuration:${reset}"
            ip -c -br a
            echo ""
            ;;
        
        6)
            echo -e "${green}IP configuration (detailed):${reset}"
            ip -c a
            echo ""
            ;;

        7)
            echo -e "${green}Last reboot:${reset}"
            who -b
            echo ""
            ;;
        
        8)
            echo -e "${yellow}Updating and upgrading packages:${reset}"

            if grep -wq "ID=debian" /etc/os-release
            then 
                sudo apt update && sudo apt upgrade -y
            elif grep -wq "ID=rhel" /etc/os-release
            then
                sudo yum update
            else
                echo -e "${yellow}Distribution not supported (yet)${reset}"
            fi
            echo ""
            ;;

        Q|quit|Quit|q)
            echo -e "${yellow}Goodbye!${reset}"
            break
            ;; 
            
        *)
            echo -e "${red}$choice is not a valid option${reset}."
            echo ""
            ;;
    esac
done