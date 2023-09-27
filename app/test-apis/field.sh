#!/bin/sh

# service url
service_url="foundation-api/v1/odata/v1/FieldService/Fields"

echo "[INFO]: Starting ---$service_url--- service."

# json content
json_body=$(cat <<- EOM
  {
    "name": "Field Test v1",
    "description": "Field Test v1",
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

# TODO: check db constraints for fields
# post
# echo "[INFO]: Run $service_url POST."

# result=$( \
#   curl  --silent \
#         --request "POST" \
#         --header "Authorization: Bearer $access_token" \
#         --header "Content-Type: application/json" \
#         --data "$json_body" \
#         --location "$api_url"
# )
# echo $result

# field_ID=$(echo "$result" | jq -r '.ID')

# # put
# echo "[INFO]: Run $service_url PUT."

# result=$( \
#   curl  --silent \
#         --request "PUT" \
#         --header "Authorization: Bearer $access_token" \
#         --header "Content-Type: application/json" \
#         --data "$json_body" \
#         --location "$api_url($field_ID)"
# )
# echo $result

# # delete
# echo "[INFO]: Run $service_url DELETE."

# result=$( \
#   curl  --silent \
#         --request "DELETE" \
#         --header "Authorization: Bearer $access_token" \
#         --location "$api_url($field_ID)"
# )
# echo $result

# static uuid
field_ID="42cbc80b-e17b-401b-a745-6e69d2ecb7e0"

# patch
echo "[INFO]: Run $service_url PATCH."

result=$( \
  curl  --silent \
        --request "PATCH" \
        --header "Authorization: Bearer $access_token" \
        --header "Content-Type: application/json" \
        --data "$json_body" \
        --location "$api_url($field_ID)"
)
echo $result

# get
echo "[INFO]: Run $service_url GET."

result=$( \
  curl  --silent \
        --request "GET" \
        --header "Authorization: Bearer $access_token" \
        --location "$api_url($field_ID)"
)
echo $result
