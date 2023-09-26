#!/bin/sh

result=$( \
  curl  --silent \
        --request POST \
        --header 'Content-Type: application/x-www-form-urlencoded' \
        --data-urlencode "client_id=$client_id" \
        --data-urlencode "client_secret=$client_secret" \
        --data-urlencode "username=$user" \
        --data-urlencode "password=$password" \
        --data-urlencode "login_hint=$login_hint" \
        --data-urlencode "grant_type=password" \
        --location "https://$tenant.authentication.$region.hana.ondemand.com/oauth/token" \
)

# read token
access_token=$(echo $result | jq -r '.access_token')

echo "[INFO]: Token requested for tenant $tenant"
