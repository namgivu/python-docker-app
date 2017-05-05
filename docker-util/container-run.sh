#!/usr/bin/env bash

#get SCRIPT_HOME=executed script's path, containing folder, cd & pwd to get container path
s=${BASH_SOURCE} ; s=$(dirname "$s") ; s=$(cd "$s" && pwd) ; SCRIPT_HOME=$s

#load util config
source "$SCRIPT_HOME/s00_config.sh"


#load input
DOCKER_IMAGE=$1 #e.g. pass docker image as $IMAGE_NAME_REMOTE or $IMAGE_NAME_LOCAL
DETACH_MODE=$2  #e.g. pass detach param as -d

#build image from app at $APP_HOME
docker run $DETACH_MODE -p $R_PORT:$E_PORT $DOCKER_IMAGE
