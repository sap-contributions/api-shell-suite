#!/bin/sh

exit 0  # Manual execution APIs

# Copy, Paste and Execute each step in your console.

# Step 1
# Set your credentials
user=user 
password=password

# Step 2
# Set the parameters
tenant=farming-test
region="us10"
client_id='sb-farming!333|farming!555'
client_secret='7dfe8406-4e52-4c02-9dbb-f79376c0236a'
login_hint='{"origin":"sap.custom"}'
server_url="https://jupiter-farming.cfapps.$region.hana.ondemand.com/api"

# Step 3
result=$( \
  curl  --request POST \
        --header 'Content-Type: application/x-www-form-urlencoded' \
        --data-urlencode "client_id=$client_id" \
        --data-urlencode "client_secret=$client_secret" \
        --data-urlencode "username=$user" \
        --data-urlencode "password=$password" \
        --data-urlencode "login_hint=$login_hint" \
        --data-urlencode "grant_type=password" \
        --location "https://$tenant.authentication.$region.hana.ondemand.com/oauth/token" \
)

# Step 4
access_token=$(echo $result | jq -r '.access_token')

# Step 5
echo $access_token

# Step 6
api_url="$server_url/spatial-api/v1/odata/v1/AreaService/Areas"

# Step 7
result=$( \
  curl  --request "GET" \
        --header "Authorization: Bearer $access_token" \
        --location "$api_url"
)

# Step 8
echo $result
