#!/bin/sh

script_type=$1

docker build --build-arg ARG_SCRIPT_TYPE=$script_type -t api-shell-suite .
docker run api-shell-suite
