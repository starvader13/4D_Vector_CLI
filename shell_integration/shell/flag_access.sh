#!/bin/bash

function generate_flag(){
    local f=$1
    
    if [ "$f" = "-help" ];then
        echo -e "4D vector for the terminal\nUsage: [choices] [command] [prompt]\n\n"
        echo -e "Available choices are : \nTranslate \nSummarize \nCode-Snippet\n\n"
        echo -e "Available commands for translate are : \n-[language] \n\nExample: \ntranslate -hindi \ntranslate -russian \n\n"
        echo -e "Available commands for summarize are : \n-[size] \n\nExample: \nsummarize -10 \nsummarize -50 \n\n"
        echo -e "Available commands for code-snippet are : \n-[programming_language] \n\nExample: \ngenerate-code -python \ngenerate-code -go \n"

    elif [ "$f" = "-h" ];then
        echo -e "4D vector for the terminal\nUsage: [choices] [command] [prompt]\n\n"
        echo -e "Available choices are : \n\nTranslate \nSummarize \nCode-Snippet\n"
        echo -e "Available commands for translate are : \n\n-[language] \n\nExample: \n\ntranslate -hindi \ntranslate -russian \n"
        echo -e "Available commands for summarize are : \n\n-[size] \n\nExample: \n\nsummarize -10 \nsummarize -50 \n"
        echo -e "Available commands for code-snippet are : \n\n-[programming_language] \n\nExample: \n\ngenerate-code -python \ngenerate-code -go \n"

    else
        echo "invalid choice"
    fi
    
}

generate_flag "-help"