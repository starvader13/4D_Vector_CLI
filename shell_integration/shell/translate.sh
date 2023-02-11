#!/bin/bash

#Define the api-endpoint and api-key

api_endpoint="https://api.openai.com/v1/completions"
api_key="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"

function send_request() {
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
                  \"temperature\":0.5
                }")


    #Slicing the generated text from the api_response 

    generated_text=$(echo $response | jq -r '.choices[0].text')

    # Process the generated text 

    echo $generated_text
}