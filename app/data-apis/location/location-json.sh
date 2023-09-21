#!/bin/sh

# CHANGE the json content
json_body=$(cat <<- EOM
  {
    "name": "Location Test v$timestamp",
    "description": "Location Test v$timestamp",
    "locationType_ID": "$locationType_ID",
    "geolocation_geojson": "{\"type\": \"Point\",\"coordinates\": [-51.07693631456101,-31.19399381158657]}"
  }
EOM
)
