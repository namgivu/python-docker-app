#!/usr/bin/env bash

#get SCRIPT_HOME=executed script's path, containing folder, cd & pwd to get container path
s=${BASH_SOURCE} ; s=$(dirname "$s") ; s=$(cd "$s" && pwd) ; SCRIPT_HOME=$s

#load util config
source "$SCRIPT_HOME/s00_config.sh"


#region push local docker-image to remote docker cloud
  echo -e "${CM}#Login hub.docker.com${EC}"
  sh="docker login -u $DOCKER_HUB_USER -p '$DOCKER_HUB_PASS' "
  echo $sh ; eval $sh
#endregion push local docker-image to remote docker cloud
