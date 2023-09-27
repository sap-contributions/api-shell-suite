#!/bin/sh

# CHANGE the service url
service_url="spatial-api/v1/odata/v1/LocationService/Locations"

echo "[INFO]: Starting ---$service_url--- service."

# CHANGE the json content
json_body=$(cat <<- EOM
  {
    "name": "Location Test v$timestamp",
    "description": "Location Test v$timestamp",
    "locationType_ID": "$locationType_ID",
    "geolocation_geojson": "{\"type\": \"Point\",\"coordinates\": [-51.07693631456101,-31.19399381158657]}"
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

location_ID=$(echo "$result" | jq -r '.ID')
echo "[ID]: location_ID=$location_ID"
