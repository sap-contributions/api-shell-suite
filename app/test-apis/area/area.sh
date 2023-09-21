#!/bin/sh

# CHANGE the service name
local_service_name="area"
# CHANGE the service url
service_url="spatial-api/v1/odata/v1/AreaService/Areas"

echo "[INFO]: Starting ---$service_url--- service."

local_service_path="$local_test_apis_path/$local_service_name"
api_url="$server_url/$service_url"

source "$local_service_path/$local_service_name-json.sh"

temp_url="$api_url"
source "$local_service_path/post.sh"

area_ID="$(echo $result | sed $sed_option 's/.*"ID":"([^"]*)".*/\1/')"

temp_url="$api_url($area_ID)"
source "$local_service_path/put.sh"
source "$local_service_path/delete.sh"

# CHANGE the uuid
area_ID="e2ca452e-b6cc-4636-8b53-cf9a32bfbea2"

temp_url="$api_url($area_ID)"
source "$local_service_path/patch.sh"
source "$local_service_path/get.sh"
