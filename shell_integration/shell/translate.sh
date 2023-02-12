#!/bin/bash

source /home/starvader/hashhacks/shell_integration/shell/api_interaction.sh

function send_request_translate() {
    local prompt=$1

    #Generate the api response based ont the hyperparameters 

    api_response=$(curl $api_endpoint \
                -H "Authorization: Bearer $api_key" \
                -H "Content-Type: application/json" \
                -d "{
                  \"model\": \"text-davinci-003\",
                  \"prompt\": \"$prompt\",
                  \"max_tokens\":1024,
                  \"n\":1,
                  \"stop\":null,
                  \"temperature\":0.7
                }")


    #Slicing the generated text from the api_response 

    generated_text=$(echo $api_response | jq -r '.choices[0].text')

    
    # Process the generated text 

    echo $generated_text
}

