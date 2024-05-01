#!/bin/sh

# CHANGE the service url
service_url="farm-and-field-api/v1/odata/v1/FarmAndFieldService/Destinations"

echo "[INFO]: Starting ---$service_url--- service."

# CHANGE the json content
json_body=$(cat <<- EOM
  {
    "name": "Destination Test v$timestamp",
    "description": "Destination Test v$timestamp"
  }
EOM
)

api_url="$server_url/$service_url"

result=$( \
  curl  --silent \
        --request "POST" \
        --header "Authorization: Bearer $access_token" \
        --header "Content-Type: application/json" \
        --data "$json_body" \
        --location "$api_url"
)

echo $result

destination_ID=$(echo "$result" | jq -r '.ID')
echo "[ID]: destination_ID=$destination_ID"
