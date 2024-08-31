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

# Clear screen
clear

# Display menu
echo "NETWORK UTILITIES"
echo "1. Ping"
echo "2. Netcat"
echo "3. Traceroute"
echo ""

#Read user input and save it as $choice variable
read -p "Pick an option:" choice

# Launch command depending on the value stored in $choice
case $choice in
    1|ping|Ping|p|P)
        read -p "Target ?" target
        ping $target
        ;;
    2|netcat|Netcat|n|N)
        read -p "Target ?" target
        read -p "Port ?" port
        nc -vz $target $port
        ;;
    3|traceroute|Traceroute|t|T)
        read -p "Target ?" target
        traceroute $target
        ;;
    *)
        echo "Invalid option selected."
        ;;
esac