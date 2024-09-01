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
            read -p "Target? " target
            ping $target
            ;;
        2|netcat|Netcat|n|N)
            read -p "Target? " target
            read -p "Port? " port
            nc -vz $target $port
            ;;
        3|traceroute|Traceroute|t|T)
            read -p "Target? " target
            traceroute $target
            ;;
        4|tcpdump|TCPDUMP|tcp|TCP
            read -p "Source host ?" source
            sudo tcpdump host $source
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