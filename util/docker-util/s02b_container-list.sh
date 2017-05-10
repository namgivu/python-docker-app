#!/usr/bin/env bash

#get SCRIPT_HOME=executed script's path, containing folder, cd & pwd to get container path
s=${BASH_SOURCE} ; s=$(dirname "$s") ; s=$(cd "$s" && pwd) ; SCRIPT_HOME=$s

#load util config
source "$SCRIPT_HOME/s00_config.sh"


#list running docker-image i.e. docker-container
echo

echo -e "${CM}#All containers${EC}"
docker ps

echo

echo -e "${CM}#This app's container${EC}"
docker ps | grep $IMAGE_NAME_LOCAL
