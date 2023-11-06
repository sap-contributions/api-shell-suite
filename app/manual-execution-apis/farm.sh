#!/bin/sh

exit 0  # Manual execution APIs

# Copy, Paste and Execute each step in your console.

# Step 1
# Set your credentials
user=user 
password=password

# Step 2
# Set the parameters
orbit=prod
tenant=farming
region="us10"
client_id='fcc4f271-c676-47ef-bd94-fd03bbbbb7ac'
client_secret='1565490f-afc9-44fc-b18f-7b7d87d4c305'
login_hint='{"origin":"sap.custom"}'

# For Sydney (AP10) and Frankfurt (EU10) regions
server_url="https://$tenant.$orbit-$region.ia.agribusiness.cloud.sap/api"

# For US (US10) region
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
api_url="$server_url/foundation-api/v1/odata/v1/FarmService/Farms"

# Step 7
result=$( \
  curl  --request "GET" \
        --header "Authorization: Bearer $access_token" \
        --location "$api_url"
)

# Step 8
echo $result
