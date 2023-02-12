#!/bin/bash

source /home/starvader/hashhacks/shell_integration/shell/api_interaction.sh

function generate_code_snippet() {
    code_sentence=$1

    api_response=$(curl $api_endpoint \
                -H "Authorization: Bearer $api_key" \
                -H "Content-Type: application/json" \
                -d "{
                    \"model\": \"text-davinci-003\",
                    \"prompt\": \"$code_sentence\",
                    \"max_tokens\":1024,
                    \"n\":1,
                    \"stop\":null,
                    \"temperature\":0.5
                }")

    generated_text=$(echo $api_response | jq -r '.choices[0].text')

    echo $generated_text

}
