#!/bin/sh

# CHANGE the json content
json_body=$(cat <<- EOM
  {
    "name": "Location Type Test v1",
    "description": "Location Type Test v1"
  }
EOM
)
