#!/bin/sh

# CHANGE the json content
json_body=$(cat <<- EOM
  {
    "validFrom": "2023-01-01T00:00:00.000Z",
    "validTo": "2023-12-01T00:00:00.000Z",
    "name": "Area Test v1",
    "description": "Area Test v1",
    "areaDefinitionType": "FIELD_BOUNDARIES",
    "isBlocked": false,
    "areaType_ID": "241407b7-47ad-48ab-8868-87d747a6b880",
    "boundary_geojson": "{\"coordinates\": [[[-51.07693631456101, -31.19399381158657], [-51.07456794557859, -31.1956244428189], [-51.066656403631896, -31.18695469879116], [-51.069519230982245, -31.185874748335802], [-51.07693631456101, -31.19399381158657]]], \"type\": \"Polygon\"}",
    "areaSize": null,
    "areaUOM_ID": null,
    "isAutomaticallyCalculated": false
  }
EOM
)
