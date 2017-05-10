#!/usr/bin/env bash

#get SCRIPT_HOME=executed script's path, containing folder, cd & pwd to get container path
s=${BASH_SOURCE} ; s=$(dirname "$s") ; s=$(cd "$s" && pwd) ; SCRIPT_HOME=$s

#load util config
source "$SCRIPT_HOME/s00_config.sh"

#print util commands
echo -e "
${CM}#Open an SSH session with the VM; type 'exit' to end${EC}
docker-machine ssh $VM01
docker-machine ssh $VM02

${CM}#Start a VM that is currently not running${EC}
docker-machine start $VM01

${CM}#Stop all running VMs${EC}
docker-machine stop \$(docker-machine ls -q)

${CM}#Delete all VMs and their disk images${EC}
docker-machine rm \$(docker-machine ls -q)
"
