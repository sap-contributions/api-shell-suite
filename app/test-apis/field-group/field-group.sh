#!/bin/sh

# CHANGE the service name
local_service_name="field-group"
# CHANGE the service url
service_url="foundation-api/v1/odata/v1/FieldGroupService/FieldGroups"

echo "[INFO]: Starting ---$service_url--- service."

local_service_path="$local_test_apis_path/$local_service_name"
api_url="$server_url/$service_url"

source "$local_service_path/$local_service_name-json.sh"

temp_url="$api_url"
source "$local_service_path/post.sh"

fieldGroup_ID="$(echo $result | sed $sed_option 's/.*"ID":"([^"]*)".*/\1/')"

temp_url="$api_url($fieldGroup_ID)"
source "$local_service_path/put.sh"
source "$local_service_path/delete.sh"

# CHANGE the uuid
fieldGroup_ID="32e6e35d-30d3-44c6-8ecd-2133b7965e98"

temp_url="$api_url($fieldGroup_ID)"
source "$local_service_path/patch.sh"
source "$local_service_path/get.sh"
