#!/bin/sh

# CHANGE the json content
json_body=$(cat <<- EOM
  {
    "name": "Location Test v1",
    "description": "Location Test v1",
    "locationType_ID": "$locationType_ID",
    "geolocation_geojson": "{\"type\": \"Point\",\"coordinates\": [-51.07693631456101,-31.19399381158657]}"
  }
EOM
)
