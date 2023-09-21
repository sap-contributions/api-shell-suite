#!/bin/sh

# CHANGE the service name
local_service_name="location-type"
# CHANGE the service url
service_url="spatial-api/v1/odata/v1/LocationService/LocationTypes"

echo "[INFO]: Starting ---$service_url--- service."

local_service_path="$local_test_apis_path/$local_service_name"
api_url="$server_url/$service_url"

source "$local_service_path/$local_service_name-json.sh"

temp_url="$api_url"
source "$local_service_path/post.sh"

locationType_ID="$(echo $result | sed $sed_option 's/.*"ID":"([^"]*)".*/\1/')"

temp_url="$api_url($locationType_ID)"
source "$local_service_path/put.sh"
source "$local_service_path/delete.sh"

# CHANGE the uuid
locationType_ID="c669d033-4d9a-4859-9b40-36b9a22c7116"

temp_url="$api_url($locationType_ID)"
source "$local_service_path/patch.sh"
source "$local_service_path/get.sh"
