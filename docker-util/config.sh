#!/usr/bin/env bash

#get SCRIPT_HOME=executed script's path, containing folder, cd & pwd to get container path
s=${BASH_SOURCE} ; s=$(dirname "$s") ; s=$(cd "$s" && pwd) ;
SCRIPT_HOME=$s

#app home
s="$SCRIPT_HOME/.." ; s=$(cd "$s" && pwd) ;
APP_HOME=$s

#docker image name/tag for the app
IMAGE_TAG='friendlyhello'