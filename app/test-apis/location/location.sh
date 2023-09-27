#!/bin/sh

# CHANGE the service name
local_service_name="location"
# CHANGE the service url
service_url="spatial-api/v1/odata/v1/LocationService/Locations"

echo "[INFO]: Starting ---$service_url--- service."

local_service_path="$local_test_apis_path/$local_service_name"
api_url="$server_url/$service_url"

source "$local_service_path/$local_service_name-json.sh"

temp_url="$api_url"
source "$local_service_path/post.sh"

location_ID=$(echo "$result" | jq -r '.ID')

temp_url="$api_url($location_ID)"
source "$local_service_path/put.sh"
source "$local_service_path/delete.sh"

# CHANGE the uuid
location_ID="52e9501a-e1cd-41c3-ac35-9568e03d767a"

temp_url="$api_url($location_ID)"
source "$local_service_path/patch.sh"
source "$local_service_path/get.sh"
