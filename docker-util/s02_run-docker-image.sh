#!/usr/bin/env bash

#get SCRIPT_HOME=executed script's path, containing folder, cd & pwd to get container path
s=${BASH_SOURCE} ; s=$(dirname "$s") ; s=$(cd "$s" && pwd) ; SCRIPT_HOME=$s

#load util config
source "$SCRIPT_HOME/s00_config.sh"

#load input
DETACH_MODE=$1 #e.g. pass detach param as -d

#build image from app at $APP_HOME
docker run $DETACH_MODE -p $RUN_PORT:$IMAGE_PORT $IMAGE_TAG
