#!/bin/sh

# CHANGE the service url
service_url="foundation-api/v1/odata/v1/FieldGroupService/FieldGroups"

echo "[INFO]: Starting ---$service_url--- service."

# CHANGE the json content
json_body=$(cat <<- EOM
  {
    "name": "Filed Group Test v$timestamp",
    "description": "Filed Group Test v$timestamp",
    "farm_ID": "$farm_ID"
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

fieldGroup_ID=$(echo "$result" | jq -r '.ID')
echo "[ID]: fieldGroup_ID=$fieldGroup_ID"
