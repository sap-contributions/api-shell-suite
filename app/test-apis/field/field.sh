#!/bin/sh

# CHANGE the service name
local_service_name="field"
# CHANGE the service url
service_url="foundation-api/v1/odata/v1/FieldService/Fields"

echo "[INFO]: Starting ---$service_url--- service."

local_service_path="$local_test_apis_path/$local_service_name"
api_url="$server_url/$service_url"

source "$local_service_path/$local_service_name-json.sh"

# temp_url="$api_url"
# source "$local_service_path/post.sh"

# field_ID=$(echo "$result" | jq -r '.ID')

# temp_url="$api_url($field_ID)"
# source "$local_service_path/put.sh"
# source "$local_service_path/delete.sh"

# CHANGE the uuid
field_ID="42cbc80b-e17b-401b-a745-6e69d2ecb7e0"

temp_url="$api_url($field_ID)"
source "$local_service_path/patch.sh"
source "$local_service_path/get.sh"
