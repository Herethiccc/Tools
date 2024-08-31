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

    echo "${yellow}/!\\ Please make sure to run this script with privileges /!\\${reset}"
    echo "SYSTEM UTILITIES"
    echo "1. List local users"
    echo "2. List a user's group"
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
        Q|quit|Quit|q)
            echo -e "Goodbye!"
            break
            ;; 
        *)
            echo -e "${red}Invalid option${reset}."
            ;;
    esac
done