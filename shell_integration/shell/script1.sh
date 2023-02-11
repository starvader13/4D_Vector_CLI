#!/bin/bash


#source the file with the relative path 

source shell_integration/shell/translate.sh
source shell_integration/python/text_integration.py

show_menu() {
    clear

    python shell_integration/python/text_integration.py

    echo "1) Translation"
    echo "2) Summarizing"
    echo "3) Code-Snippet"
    echo "4) Exit"
    echo " "
    read -p "Select your response [1/2/3/4]: "
}



