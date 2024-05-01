#!/bin/sh

# service url
service_url="farm-and-field-api/v1/odata/v1/FarmAndFieldService/Areas"

echo "[INFO]: Starting ---$service_url--- service."

# json content
json_body=$(cat <<- EOM
  {
    "validFrom": "2023-01-01T00:00:00.000Z",
    "validTo": "2023-12-01T00:00:00.000Z",
    "name": "Area Test v1",
    "description": "Area Test v1",
    "areaDefinitionType": "FIELD_BOUNDARIES",
    "isBlocked": false,
    "areaType_ID": "241407b7-47ad-48ab-8868-87d747a6b880",
    "boundary_geojson": "{\"coordinates\": [[[-51.07693631456101, -31.19399381158657], [-51.07456794557859, -31.1956244428189], [-51.066656403631896, -31.18695469879116], [-51.069519230982245, -31.185874748335802], [-51.07693631456101, -31.19399381158657]]], \"type\": \"Polygon\"}",
    "areaSize": null,
    "areaUOM_ID": null,
    "isAutomaticallyCalculated": false
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

area_ID=$(echo "$result" | jq -r '.ID')

# put
echo "[INFO]: Run $service_url PUT."

result=$( \
  curl  --silent \
        --request "PUT" \
        --header "Authorization: Bearer $access_token" \
        --header "Content-Type: application/json" \
        --data "$json_body" \
        --location "$api_url($area_ID)"
)
echo $result

# delete
echo "[INFO]: Run $service_url DELETE."

result=$( \
  curl  --silent \
        --request "DELETE" \
        --header "Authorization: Bearer $access_token" \
        --location "$api_url($area_ID)"
)
echo $result

# static uuid
area_ID="e2ca452e-b6cc-4636-8b53-cf9a32bfbea2"

# patch
echo "[INFO]: Run $service_url PATCH."

result=$( \
  curl  --silent \
        --request "PATCH" \
        --header "Authorization: Bearer $access_token" \
        --header "Content-Type: application/json" \
        --data "$json_body" \
        --location "$api_url($area_ID)"
)
echo $result

# get
echo "[INFO]: Run $service_url GET."

result=$( \
  curl  --silent \
        --request "GET" \
        --header "Authorization: Bearer $access_token" \
        --location "$api_url($area_ID)"
)
echo $result
