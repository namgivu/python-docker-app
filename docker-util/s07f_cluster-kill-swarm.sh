#!/usr/bin/env bash

#get SCRIPT_HOME=executed script's path, containing folder, cd & pwd to get container path
s=${BASH_SOURCE} ; s=$(dirname "$s") ; s=$(cd "$s" && pwd) ; SCRIPT_HOME=$s

#load util config
source "$SCRIPT_HOME/s00_config.sh"


#do kill the swarm/cluster
echo -e "${CM}#Make the worker leave the swarm${EC}"
docker-machine ssh $VM02 "docker swarm leave"

echo -e "${CM}#Make master leave, kill swarm${EC}"
docker-machine ssh $SWARM_MANAGER "docker swarm leave -f"