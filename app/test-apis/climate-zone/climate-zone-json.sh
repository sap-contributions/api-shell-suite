#!/bin/sh

# CHANGE the json content
json_body=$(cat <<- EOM
  {
    "name": "Climate Zone Test v1",
    "description": "Climate Zone Test v1"
  }
EOM
)
