#!/bin/sh

# CHANGE the json content
json_body=$(cat <<- EOM
  {
    "name": "Field Test v1",
    "description": "Field Test v1",
    "area_ID": "$area_ID",
    "farm_ID": "$farm_ID",
    "fieldGroup_ID": "$fieldGroup_ID",
    "destination_ID": "$destination_ID",
    "location_ID": "$location_ID",
    "climateZone_ID": "$climateZone_ID"
  }
EOM
)
