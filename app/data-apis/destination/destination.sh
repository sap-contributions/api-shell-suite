#!/bin/sh

# CHANGE the service name
local_service_name="destination"
# CHANGE the service url
service_url="foundation-api/v1/odata/v1/DestinationService/Destinations"

echo "[INFO]: Starting ---$service_url--- service."

local_service_path="$local_data_apis_path/$local_service_name"
api_url="$server_url/$service_url"

source "$local_service_path/$local_service_name-json.sh"

temp_url="$api_url"
source "$local_service_path/post.sh"

destination_ID=$(echo "$result" | jq -r '.ID')
echo destination_ID="$destination_ID"
