#!/usr/bin/env bash

#get SCRIPT_HOME=executed script's path, containing folder, cd & pwd to get container path
s=${BASH_SOURCE} ; s=$(dirname "$s") ; s=$(cd "$s" && pwd) ; SCRIPT_HOME=$s

#load util config
source "$SCRIPT_HOME/s00_config.sh"

echo -e "${CM}View cluster's containers of stack '$IMAGE_STACK_NAME'${EC}"
docker-machine ssh $SWARM_MANAGER "docker stack ps $IMAGE_STACK_NAME"

echo

echo -e "${CM}List all nodes in the swarm${EC}"
docker-machine ssh $SWARM_MANAGER "docker node ls"

echo

echo -e "${CM}View basic info about node '$VM01'${EC}"
docker-machine env $VM01
echo -e "${CM}View basic info about node '$VM02'${EC}"
docker-machine env $VM02

echo

echo -e "${CM}View detail info of node $VM01${EC}"
docker-machine ssh $SWARM_MANAGER "docker node inspect $VM01"
echo -e "${CM}View detail info of node $VM02${EC}"
docker-machine ssh $SWARM_MANAGER "docker node inspect $VM02"

echo

echo -e "${CM}View token to join the swarm${EC}"
docker-machine ssh $SWARM_MANAGER "docker swarm join-token -q worker"
echo
