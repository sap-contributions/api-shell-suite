#!/bin/sh

# CHANGE the service url
service_url="farm-and-field-api/v1/odata/v1/FarmAndFieldService/Areas"

echo "[INFO]: Starting ---$service_url--- service."

# CHANGE the json content
json_body=$(cat <<- EOM
  {
    "validFrom": "2023-01-01T00:00:00.000Z",
    "validTo": "2023-12-31T00:00:00.000Z",
    "name": "Area Test v$timestamp",
    "description": "Area Test v$timestamp",
    "areaDefinitionType": "FIELD_BOUNDARIES",
    "isBlocked": false,
    "areaType_ID": "241407b7-47ad-48ab-8868-87d747a6b880",
    "boundary_geojson": "{\"coordinates\": [[[-51.07693631456101, -31.19399381158657], [-51.07456794557859, -31.1956244428189], [-51.066656403631896, -31.18695469879116], [-51.069519230982245, -31.185874748335802], [-51.07693631456101, -31.19399381158657]]], \"type\": \"Polygon\"}",
    "areaSize": null,
    "areaUOM_ID": null,
    "isAutomaticallyCalculated": true
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

area_ID=$(echo "$result" | jq -r '.ID')
echo "[ID]: area_ID=$area_ID"
