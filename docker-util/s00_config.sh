#!/usr/bin/env bash

##region common bash util
  #get SCRIPT_HOME=executed script's path, containing folder, cd & pwd to get container path
  s=${BASH_SOURCE} ; s=$(dirname "$s") ; s=$(cd "$s" && pwd) ;
  SCRIPT_HOME=$s

  #app home
  s="$SCRIPT_HOME/.." ; s=$(cd "$s" && pwd) ;
  APP_HOME=$s

  #coloring
  HL='\033[1;33m' #high-lighted color
  CM='\033[0;32m' #comment color
  ER='\033[1;31m' #error color
  EC='\033[0m'    #end coloring

##endregion common bash util


##region app specific config
  #docker hub login
  DOCKER_HUB_USER='YOUR_USER loaded via s00_config.local.sh'
  DOCKER_HUB_PASS='YOUR_PASS loaded via s00_config.local.sh'

  #docker image name/tag for the app
  IMAGE_NAME='friendlyhello'
  VERSION_TAG='1.0'
  IMAGE_NAME_LOCAL="$IMAGE_NAME:$VERSION_TAG"
  IMAGE_NAME_REMOTE="$DOCKER_HUB_USER/$IMAGE_NAME:$VERSION_TAG"

  #running port setup
  RUN_PORT=5000
  IMAGE_PORT=80 #TODO extract this port from Dockerfile

  #deploy replica
  DEPLOY_NAME='getstartedlab'


##endregion app specific config

#load local config
source "$SCRIPT_HOME/s00_config.local.sh"
