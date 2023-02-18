#!/bin/bash

#source the file with the relative path 

source ./api_interaction.sh
source ./translate.sh
source ./code_snippet.sh
source ./summarize.sh
source ./flag_access.sh


# created menu icon and fetched details regarding the version and system
read -p "Choose your default checkout tool :" exit_value 

show_menu() {

    echo "1) Translation"
    echo "2) Summarizing"
    echo "3) Code-Snippet"
    echo "4) Exit"
    echo " "

    read -p "Select your response [1/2/3/4]: " option
}


# function to handle each option 

handle_option() {

    case $option in
    
    1)
    read -p ">>> translate " text_translate
    IFS='-' read -a array <<< "$text_translate"
    echo ""

    if [[ "$text_translate" == "$exit_value" ]]; then
        main_call
    fi

    echo ${array[0]}
    
    result_translate=$(send_request_translate "$(printf "%s %s %s" "translate this sentence into " "'${array[0]}'" "'$text_translate'")")
    echo ""
    echo "Translation: $result_translate"
    echo ""

    # saves the output on the clipboard
    echo $result_translate | xclip -selection clipboard  
    ;;

    2)
    read -p ">>> summarize " text_summarize
    IFS='-' read -a array <<< "$text_summarize"
    echo ""

    if [[ "$text_summarize" == "$exit_value" ]]; then
        main_call
    fi

    result_summarize=$(send_request_summarize "$(printf "%s %s %s %s" "summarize this paragragh into" "'${array[0]}'" "words:- " "'$text_summarize'")")
    echo ""
    echo "Summarized: $result_summarize"
    echo ""

    # saves the output on the clipboard
    echo $result_summarize | xclip -selection clipboard  
    ;;

    3)
    read -p ">>> generate-code " code_generate
    IFS='-' read -a array <<< "$code_generate"
    echo ""

    if [[ "$code_generate" == "$exit_value" ]]; then
        main_call
    fi

    result_generate=$(generate_code_snippet "$(printf "%s %s %s %s" "write a code in " "${array[0]}" " to " "'$code_generate'" )")
    echo ""
    echo "Code Snippet: $result_generate"
    echo ""

    # saves the output on the clipboard
    echo $result_generate | xclip -selection clipboard  
    ;;

    *)
    echo "Invalid option"
    esac
}

main_call() {
    while true; do

        clear
        python ../python/text_integration.py

        show_menu

        if [[ "$option" == "1" ]]; then
            clear
            python ../python/translate.py
        
        elif [[ "$option" == "2" ]]; then
            clear
            python ../python/summarize.py

        elif [[ "$option" == "3" ]]; then
            clear
            python ../python/code_snippet.txt
        fi

        if [[ "$option" == "$exit_value" ]]; then
            exit 1
        fi

        while true; do
            handle_option
        done

    done
}

main_call