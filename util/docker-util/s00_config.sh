#!/usr/bin/env bash

##region common bash util
  #get SCRIPT_HOME=executed script's path, containing folder, cd & pwd to get container path
  s=${BASH_SOURCE} ; s=$(dirname "$s") ; s=$(cd "$s" && pwd) ;
  SCRIPT_HOME=$s

  #app home
  s="$SCRIPT_HOME/../.." ; s=$(cd "$s" && pwd) ;
  APP_HOME=$s
  DOCKER_FILE="$APP_HOME/Dockerfile"
  DOCKER_COMPOSE="$APP_HOME/docker-compose.yml"

  #import common setting
  source "$APP_HOME/util/common.sh"

##endregion common bash util


##region app specific config
  #docker hub login
  DOCKER_HUB_USER='YOUR_USER loaded via s00_config.local.sh'
  DOCKER_HUB_PASS='YOUR_PASS loaded via s00_config.local.sh'

  #import local config if any ref. http://stackoverflow.com/a/10735854/248616
  source "$SCRIPT_HOME/s00_config.local.sh"  2> /dev/null

  #docker image name/tag for the app
  IMAGE_NAME='friendlyhello'
  VERSION_TAG='1.0'
  IMAGE_NAME_LOCAL="$IMAGE_NAME:$VERSION_TAG"
  IMAGE_NAME_REMOTE="$DOCKER_HUB_USER/$IMAGE_NAME:$VERSION_TAG"

  #region running port setup
    #R_PORT i.e. Run-on-host Port
    #E_PORT i.e. Image's exposed Port

    #extract port defined in $DOCKER_FILE by line "EXPOSE 80"
    p=`cat $DOCKER_FILE | grep EXPOSE` ; r='' ; E_PORT="${p/EXPOSE /$r}" #replace in string ref. http://stackoverflow.com/a/13210909/248616

    #set port value
    R_PORT=5000
    E_PORT=$E_PORT

  #endregion running port setup

  #deploy docker image as a stack
  IMAGE_STACK_NAME='getstartedlab'

  #deploy docker image with LOCAL swarm/cluster
  VM01='myvm1'
  VM02='myvm2'
  SWARM_MANAGER=$VM01

  #deploy docker image with REMOTE swarm/cluster i.e Docker Cloud's Swarm
  REMOTE_SWARM_NAME='aosdeploy2017/getstartedlab'


##endregion app specific config
