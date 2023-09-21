#!/bin/sh

# CHANGE the json content
json_body=$(cat <<- EOM
  {
    "name": "Farm Test v1",
    "description": "Farm Test v1"
  }
EOM
)
