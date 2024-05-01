#!/bin/sh

# CHANGE the service url
service_url="farm-and-field-api/v1/odata/v1/FarmAndFieldService/ClimateZones"

echo "[INFO]: Starting ---$service_url--- service."

# CHANGE the json content
json_body=$(cat <<- EOM
  {
    "name": "Climate Zone Test v$timestamp",
    "description": "Climate Zone Test v$timestamp"
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

climateZone_ID=$(echo "$result" | jq -r '.ID')
echo "[ID]: climateZone_ID=$climateZone_ID"
