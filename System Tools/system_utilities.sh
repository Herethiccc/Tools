#!/bin/bash

#######################################################
#######             System Utilities            #######
#######################################################
####### Version release date: August 31st 2024  #######
#######################################################

#TODO
#ADD MORE FUNCTIONS
#TEST
#ADD SOME WEIRD FANCY STUFF CAUSE YOU KNOW

reset='\e[0m'
green='\e[32m'
red='\e[31m'
yellow='\e[1;33m'

# Clear screen
clear

# Display menu
while true; do

    echo "SYSTEM UTILITIES"
    echo "${yellow}/!\\ Please make sure to run this script with privileges /!\\${reset}"
    echo "1. List local users"
    echo "2. List a user's group"
    echo "3. Display system version"
    echo "4. Display disks/partitions"
    echo "5. Display IP configuration"
    echo "6. Show last reboot"
    echo "Q. Quit"
    echo ""

    #Read user input and save it as $choice variable
    read -p "Pick an option:" choice

    # Launch command depending on the value stored in $choice
    case $choice in
        1)
            echo -e "${green}Listing local users:${reset}"
            sudo cat /etc/passwd
            ;;

        2.)
            read -p "User ?" user
            echo -e "${green}User $user is part of the following groups:${reset}"
            sudo groups $user
        ;;

        3. )
            echo -e "${green}System version:${reset}"
            uname -a
            ;;
        
        4. )
            echo -e "${green}Disks and partitions:${reset}"
            df -h
            ;;
        
        5.)
            echo -e "${green}IP configuration${reset}"
            ip a
            ;;
        
        6.)
            echo -e "${green}Last reboot:${reset}"
            who -b
        ;;

        Q|quit|Quit|q)
            echo -e "${yellow}Goodbye!${reset}"
            break
            ;; 
            
        *)
            echo -e "${red}Invalid option${reset}."
            ;;
    esac
done