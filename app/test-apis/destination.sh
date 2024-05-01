#!/bin/sh

# service url
service_url="farm-and-field-api/v1/odata/v1/FarmAndFieldService/Destinations"

echo "[INFO]: Starting ---$service_url--- service."

# json content
json_body=$(cat <<- EOM
  {
    "name": "Destination Test v1",
    "description": "Destination Test v1"
  }
EOM
)

api_url="$server_url/$service_url"

# post
echo "[INFO]: Run $service_url POST."

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

# put
echo "[INFO]: Run $service_url PUT."

result=$( \
  curl  --silent \
        --request "PUT" \
        --header "Authorization: Bearer $access_token" \
        --header "Content-Type: application/json" \
        --data "$json_body" \
        --location "$api_url($destination_ID)"
)
echo $result

# delete
echo "[INFO]: Run $service_url DELETE."

result=$( \
  curl  --silent \
        --request "DELETE" \
        --header "Authorization: Bearer $access_token" \
        --location "$api_url($destination_ID)"
)
echo $result

# static uuid
destination_ID="c170b1f9-1699-4ff3-9d9e-b6df06578770"

# patch
echo "[INFO]: Run $service_url PATCH."

result=$( \
  curl  --silent \
        --request "PATCH" \
        --header "Authorization: Bearer $access_token" \
        --header "Content-Type: application/json" \
        --data "$json_body" \
        --location "$api_url($destination_ID)"
)
echo $result

# get
echo "[INFO]: Run $service_url GET."

result=$( \
  curl  --silent \
        --request "GET" \
        --header "Authorization: Bearer $access_token" \
        --location "$api_url($destination_ID)"
)
echo $result
