#!/usr/bin/env bash

#get SCRIPT_HOME=executed script's path, containing folder, cd & pwd to get container path
s=${BASH_SOURCE} ; s=$(dirname "$s") ; s=$(cd "$s" && pwd) ; SCRIPT_HOME=$s

#load util config
source "$SCRIPT_HOME/s00_config.sh"


#run replica mode
docker swarm init #enable swarm mode and make your current machine a swarm manager
docker stack deploy -c $DOCKER_COMPOSE $IMAGE_STACK_NAME
