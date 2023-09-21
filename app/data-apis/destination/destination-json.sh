#!/bin/sh

# CHANGE the json content
json_body=$(cat <<- EOM
  {
    "name": "Destination Test v$timestamp",
    "description": "Destination Test v$timestamp"
  }
EOM
)
