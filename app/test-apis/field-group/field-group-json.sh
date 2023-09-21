#!/bin/sh

# CHANGE the json content
json_body=$(cat <<- EOM
  {
    "name": "Filed Group Test v1",
    "description": "Filed Group Test v1",
    "farm_ID": "$farm_ID"
  }
EOM
)
