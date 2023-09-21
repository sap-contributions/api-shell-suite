#!/bin/sh

result=$( \
  curl  --silent \
        --request "GET" \
        --header "Authorization: Bearer $access_token" \
        --location "$temp_url"
)

echo $result
