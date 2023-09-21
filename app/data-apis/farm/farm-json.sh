#!/bin/sh

# CHANGE the json content
json_body=$(cat <<- EOM
  {
    "name": "Farm Test v$timestamp",
    "description": "Farm Test v$timestamp"
  }
EOM
)
