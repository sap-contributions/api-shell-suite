#!/bin/sh

# CHANGE the service name
local_service_name="destination"
# CHANGE the service url
service_url="foundation-api/v1/odata/v1/DestinationService/Destinations"

echo "[INFO]: Starting ---$service_url--- service."

local_service_path="$local_test_apis_path/$local_service_name"
api_url="$server_url/$service_url"

source "$local_service_path/$local_service_name-json.sh"

temp_url="$api_url"
source "$local_service_path/post.sh"

destination_ID=$(echo "$result" | jq -r '.ID')

temp_url="$api_url($destination_ID)"
source "$local_service_path/put.sh"
source "$local_service_path/delete.sh"

# CHANGE the uuid
destination_ID="c170b1f9-1699-4ff3-9d9e-b6df06578770"

temp_url="$api_url($destination_ID)"
source "$local_service_path/patch.sh"
source "$local_service_path/get.sh"
