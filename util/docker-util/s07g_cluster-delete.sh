#!/usr/bin/env bash

#get SCRIPT_HOME=executed script's path, containing folder, cd & pwd to get container path
s=${BASH_SOURCE} ; s=$(dirname "$s") ; s=$(cd "$s" && pwd) ; SCRIPT_HOME=$s

#load util config
source "$SCRIPT_HOME/s00_config.sh"


#kill the swarm first
echo -e "${CM}#Kill the swarm first${EC}"
"$SCRIPT_HOME/s07f_cluster-kill-swarm.sh"

echo

#delete the nodes/machines
echo -e "${CM}#Delete the nodes/machines${EC}"
docker-machine rm $(docker-machine ls -q)
