#!/bin/sh

# service url
service_url="farm-and-field-api/v1/odata/v1/FarmAndFieldService/ClimateZones"

echo "[INFO]: Starting ---$service_url--- service."

# json content
json_body=$(cat <<- EOM
  {
    "name": "Climate Zone Test v1",
    "description": "Climate Zone Test v1"
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

climateZone_ID=$(echo "$result" | jq -r '.ID')

# put
echo "[INFO]: Run $service_url PUT."

result=$( \
  curl  --silent \
        --request "PUT" \
        --header "Authorization: Bearer $access_token" \
        --header "Content-Type: application/json" \
        --data "$json_body" \
        --location "$api_url($climateZone_ID)"
)
echo $result

# delete
echo "[INFO]: Run $service_url DELETE."

result=$( \
  curl  --silent \
        --request "DELETE" \
        --header "Authorization: Bearer $access_token" \
        --location "$api_url($climateZone_ID)"
)
echo $result

# static uuid
climateZone_ID="3710cb53-7199-46c6-90b0-050054fd1f3a"

# patch
echo "[INFO]: Run $service_url PATCH."

result=$( \
  curl  --silent \
        --request "PATCH" \
        --header "Authorization: Bearer $access_token" \
        --header "Content-Type: application/json" \
        --data "$json_body" \
        --location "$api_url($climateZone_ID)"
)
echo $result

# get
echo "[INFO]: Run $service_url GET."

result=$( \
  curl  --silent \
        --request "GET" \
        --header "Authorization: Bearer $access_token" \
        --location "$api_url($climateZone_ID)"
)
echo $result
