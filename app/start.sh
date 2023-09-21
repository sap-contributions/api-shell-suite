#!/bin/sh

script_type=$1

# macOS: -E
# Git Bash (Windows): -r
sed_option=-E

timestamp=$(date +%s)

local_request_path="./app/requests"
local_data_apis_path="./app/data-apis"
local_test_apis_path="./app/test-apis"
local_scenario_path="./app/scenario-apis"

clear

echo
echo "[INFO]: Starting API Shell Suite for SAP Intelligent Agriculture APIs."

source "./app/set-user.sh"
source "./app/set-tenant.sh"
source "./app/get-token.sh"
  
case $script_type in
  ("--load-data")
    echo "[INFO]: Starting Data Load script."
    source "./app/load-data-apis.sh"
    ;;
  ("--test-api")
    echo "[INFO]: Starting API Test script."
    source "./app/load-test-apis.sh"
    ;;
  ("--load-scenario")
    echo "[INFO]: Starting Scenarios script."
    echo "[INFO]: Under construction..."
    # source "./app/load-scenario-apis.sh"
    ;;
  (*)
    echo "[INFO]: Script not implemented yet."
esac

echo "[INFO]: The API Shell Suite script was completed."
