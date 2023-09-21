#!/bin/sh

# CHANGE the json content
json_body=$(cat <<- EOM
  {
    "name": "Location Type Test v$timestamp",
    "description": "Location Type Test v$timestamp"
  }
EOM
)
