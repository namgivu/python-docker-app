#!/usr/bin/env bash

#get SCRIPT_HOME=executed script's path, containing folder, cd & pwd to get container path
s=${BASH_SOURCE} ; s=$(dirname "$s") ; s=$(cd "$s" && pwd) ; SCRIPT_HOME=$s

#load util config
source "$SCRIPT_HOME/s00_config.sh"


##region deploy friendlyhello app on this cluster/swarm
  #create data folder for redis service
  docker-machine ssh $VM01 "mkdir -p ./data"

  #copy docker-compose.yml
  docker-machine scp "$APP_HOME/docker-compose.yml" $VM01:~

  #do deploy
  docker-machine ssh $VM01 "docker stack deploy -c docker-compose.yml $IMAGE_STACK_NAME"

##endregion deploy friendlyhello app on this cluster/swarm