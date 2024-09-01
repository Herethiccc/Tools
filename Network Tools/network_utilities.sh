#!/bin/bash

#######################################################
#######            Network Utilities            #######
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

    echo "NETWORK UTILITIES"
    echo "${yellow}/!\\ Please make sure to run this script with privileges /!\\${reset}"
    echo "1. Ping"
    echo "2. Netcat"
    echo "3. Traceroute"
    echo "4. TCPDUMP"
    echo "Q. Quit"
    echo ""

    # Read user input and save it as $choice variable
    read -p "Pick an option: " choice

    # Launch command depending on the value stored in $choice    
    case $choice in
        1|ping|Ping|p|P)
            clear
            read -p "Target? " target
            ping $target
            ;;
            
        2|netcat|Netcat|n|N)
            clear
            read -p "Target? " target
            read -p "Port? " port
            nc -vz $target $port
            ;;

        3|traceroute|Traceroute|t|T)
            clear
            read -p "Target? " target
            traceroute $target
            ;;

        4|tcpdump|TCPDUMP|tcp|TCP)
            clear

            # Check if tcpdump is installed before running it
            if command -v tcpdump &> /dev/null; then
                read -p "Source host ?" source
                sudo tcpdump host $source
            else
                echo -e "${red}TCPDUMP is NOT installed!${reset}"
            fi
            ;;

        Q|quit|Quit|q)
            clear
            echo -e "Goodbye!"
            break
            ;;

        *)
            clear
            echo -e "${red}Invalid option${reset}."
            ;;
    esac
done