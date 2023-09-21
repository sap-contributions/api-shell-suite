#!/bin/sh

# CHANGE the json content
json_body=$(cat <<- EOM
  {
    "name": "Filed Group Test v$timestamp",
    "description": "Filed Group Test v$timestamp",
    "farm_ID": "$farm_ID"
  }
EOM
)
