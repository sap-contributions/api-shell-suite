#!/bin/sh

# CHANGE the json content
json_body=$(cat <<- EOM
  {
    "name": "Destination Test v1",
    "description": "Destination Test v1"
  }
EOM
)
