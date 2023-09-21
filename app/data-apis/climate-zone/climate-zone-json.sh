#!/bin/sh

# CHANGE the json content
json_body=$(cat <<- EOM
  {
    "name": "Climate Zone Test v$timestamp",
    "description": "Climate Zone Test v$timestamp"
  }
EOM
)
