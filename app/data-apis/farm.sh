#!/bin/sh

# CHANGE the service url
service_url="farm-and-field-api/v1/odata/v1/FarmAndFieldService/Farms"

echo "[INFO]: Starting ---$service_url--- service."

# CHANGE the json content
json_body=$(cat <<- EOM
  {
    "name": "Farm Test v$timestamp",
    "description": "Farm Test v$timestamp"
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

farm_ID=$(echo "$result" | jq -r '.ID')
echo "[ID]: farm_ID=$farm_ID"
