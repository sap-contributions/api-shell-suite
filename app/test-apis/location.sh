#!/bin/sh

# service url
service_url="spatial-api/v1/odata/v1/LocationService/Locations"

echo "[INFO]: Starting ---$service_url--- service."

# json content
json_body=$(cat <<- EOM
  {
    "name": "Location Test v1",
    "description": "Location Test v1",
    "locationType_ID": "$locationType_ID",
    "geolocation_geojson": "{\"type\": \"Point\",\"coordinates\": [-51.07693631456101,-31.19399381158657]}"
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

location_ID=$(echo "$result" | jq -r '.ID')

# put
echo "[INFO]: Run $service_url PUT."

result=$( \
  curl  --silent \
        --request "PUT" \
        --header "Authorization: Bearer $access_token" \
        --header "Content-Type: application/json" \
        --data "$json_body" \
        --location "$api_url($location_ID)"
)
echo $result

# delete
echo "[INFO]: Run $service_url DELETE."

result=$( \
  curl  --silent \
        --request "DELETE" \
        --header "Authorization: Bearer $access_token" \
        --location "$api_url($location_ID)"
)
echo $result

# static uuid
location_ID="52e9501a-e1cd-41c3-ac35-9568e03d767a"

# patch
echo "[INFO]: Run $service_url PATCH."

result=$( \
  curl  --silent \
        --request "PATCH" \
        --header "Authorization: Bearer $access_token" \
        --header "Content-Type: application/json" \
        --data "$json_body" \
        --location "$api_url($location_ID)"
)
echo $result

# get
echo "[INFO]: Run $service_url GET."

result=$( \
  curl  --silent \
        --request "GET" \
        --header "Authorization: Bearer $access_token" \
        --location "$api_url($location_ID)"
)
echo $result
