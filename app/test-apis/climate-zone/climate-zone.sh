#!/bin/sh

# CHANGE the service name
local_service_name="climate-zone"
# CHANGE the service url
service_url="foundation-api/v1/odata/v1/ClimateZoneService/ClimateZones"

echo "[INFO]: Starting ---$service_url--- service."

local_service_path="$local_test_apis_path/$local_service_name"
api_url="$server_url/$service_url"

source "$local_service_path/$local_service_name-json.sh"

temp_url="$api_url"
source "$local_service_path/post.sh"

climateZone_ID="$(echo $result | sed $sed_option 's/.*"ID":"([^"]*)".*/\1/')"

temp_url="$api_url($climateZone_ID)"
source "$local_service_path/put.sh"
source "$local_service_path/delete.sh"

# CHANGE the uuid
climateZone_ID="3710cb53-7199-46c6-90b0-050054fd1f3a"

temp_url="$api_url($climateZone_ID)"
source "$local_service_path/patch.sh"
source "$local_service_path/get.sh"