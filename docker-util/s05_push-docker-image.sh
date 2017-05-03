#!/usr/bin/env bash

#get SCRIPT_HOME=executed script's path, containing folder, cd & pwd to get container path
s=${BASH_SOURCE} ; s=$(dirname "$s") ; s=$(cd "$s" && pwd) ; SCRIPT_HOME=$s

#load util config
source "$SCRIPT_HOME/s00_config.sh"

#push local docker-image to remote docker cloud
sh="docker login -u $DOCKER_HUB_USER -p '$DOCKER_HUB_PASS' #login first"
echo $sh
eval $sh
