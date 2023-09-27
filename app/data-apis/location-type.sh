#!/bin/sh

# CHANGE the service url
service_url="spatial-api/v1/odata/v1/LocationService/LocationTypes"

echo "[INFO]: Starting ---$service_url--- service."

# CHANGE the json content
json_body=$(cat <<- EOM
  {
    "name": "Location Type Test v$timestamp",
    "description": "Location Type Test v$timestamp"
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

locationType_ID=$(echo "$result" | jq -r '.ID')
echo "[ID]: locationType_ID=$locationType_ID"
