#!/usr/bin/env bash

#get SCRIPT_HOME=executed script's path, containing folder, cd & pwd to get container path
s=${BASH_SOURCE} ; s=$(dirname "$s") ; s=$(cd "$s" && pwd) ; SCRIPT_HOME=$s

#load util config
source "$SCRIPT_HOME/s00_config.sh"


#list current docker local images
echo -e "${CM}All images${EC}"
docker image ls

echo

echo -e "${CM}This app's image${EC}"
docker image ls | grep -e "^$IMAGE_NAME[ ]\+$VERSION_TAG"
