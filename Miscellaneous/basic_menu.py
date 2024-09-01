#######################################################
#######               Basic Menu                #######
#######################################################
####### Version release date: August 31st 2024  #######
#######################################################


# Import required modules
import os

while True:
    print("1. Launch Chrome")
    print("2. Launch Notepad")

    x = int(input())
    if x == 1:
        os.system("start chrome")
    elif x == 2:
        os.system("start notepad")
    else:
        break