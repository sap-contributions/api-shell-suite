#!/bin/sh

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
