#!/bin/sh

# CHANGE the service name
local_service_name="location-type"
# CHANGE the service url
service_url="spatial-api/v1/odata/v1/LocationService/LocationTypes"

echo "[INFO]: Starting ---$service_url--- service."

local_service_path="$local_data_apis_path/$local_service_name"
api_url="$server_url/$service_url"

source "$local_service_path/$local_service_name-json.sh"

temp_url="$api_url"
source "$local_service_path/post.sh"

locationType_ID=$(echo "$result" | jq -r '.ID')
echo locationType_ID="$locationType_ID"
