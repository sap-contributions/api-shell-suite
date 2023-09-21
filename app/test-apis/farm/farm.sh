#!/bin/sh

# CHANGE the service name
local_service_name="farm"
# CHANGE the service url
service_url="foundation-api/v1/odata/v1/FarmService/Farms"

echo "[INFO]: Starting ---$service_url--- service."

local_service_path="$local_test_apis_path/$local_service_name"
api_url="$server_url/$service_url"

source "$local_service_path/$local_service_name-json.sh"

temp_url="$api_url"
source "$local_service_path/post.sh"

farm_ID="$(echo $result | sed $sed_option 's/.*"ID":"([^"]*)".*/\1/')"

temp_url="$api_url($farm_ID)"
source "$local_service_path/put.sh"
source "$local_service_path/delete.sh"

# CHANGE the uuid
farm_ID="420cb36a-37ad-445a-bc22-b98121cc3e57"

temp_url="$api_url($farm_ID)"
source "$local_service_path/patch.sh"
source "$local_service_path/get.sh"
