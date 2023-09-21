#!/bin/sh

script_type=$1
number_of_instances=$2

docker build --build-arg ARG_SCRIPT_TYPE=$script_type -t api-shell-suite .
docker compose up --scale api-shell-suite=$number_of_instances
