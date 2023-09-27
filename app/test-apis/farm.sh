#!/bin/sh

# service url
service_url="foundation-api/v1/odata/v1/FarmService/Farms"

echo "[INFO]: Starting ---$service_url--- service."

# json content
json_body=$(cat <<- EOM
  {
    "name": "Farm Test v1",
    "description": "Farm Test v1"
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

farm_ID=$(echo "$result" | jq -r '.ID')

# put
echo "[INFO]: Run $service_url PUT."

result=$( \
  curl  --silent \
        --request "PUT" \
        --header "Authorization: Bearer $access_token" \
        --header "Content-Type: application/json" \
        --data "$json_body" \
        --location "$api_url($farm_ID)"
)
echo $result

# delete
echo "[INFO]: Run $service_url DELETE."

result=$( \
  curl  --silent \
        --request "DELETE" \
        --header "Authorization: Bearer $access_token" \
        --location "$api_url($farm_ID)"
)
echo $result

# static uuid
farm_ID="420cb36a-37ad-445a-bc22-b98121cc3e57"

# patch
echo "[INFO]: Run $service_url PATCH."

result=$( \
  curl  --silent \
        --request "PATCH" \
        --header "Authorization: Bearer $access_token" \
        --header "Content-Type: application/json" \
        --data "$json_body" \
        --location "$api_url($farm_ID)"
)
echo $result

# get
echo "[INFO]: Run $service_url GET."

result=$( \
  curl  --silent \
        --request "GET" \
        --header "Authorization: Bearer $access_token" \
        --location "$api_url($farm_ID)"
)
echo $result
