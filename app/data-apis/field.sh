#!/bin/sh

# CHANGE the service url
service_url="foundation-api/v1/odata/v1/FieldService/Fields"

echo "[INFO]: Starting ---$service_url--- service."

# CHANGE the json content
json_body=$(cat <<- EOM
  {
    "name": "Field Test v$timestamp",
    "description": "Field Test v$timestamp",
    "area_ID": "$area_ID",
    "farm_ID": "$farm_ID",
    "fieldGroup_ID": "$fieldGroup_ID",
    "destination_ID": "$destination_ID",
    "location_ID": "$location_ID",
    "climateZone_ID": "$climateZone_ID"
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

field_ID=$(echo "$result" | jq -r '.ID')
echo "[ID]: field_ID=$field_ID"
