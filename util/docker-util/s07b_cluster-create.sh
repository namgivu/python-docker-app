#!/usr/bin/env bash

#get SCRIPT_HOME=executed script's path, containing folder, cd & pwd to get container path
s=${BASH_SOURCE} ; s=$(dirname "$s") ; s=$(cd "$s" && pwd) ; SCRIPT_HOME=$s

#load util config
source "$SCRIPT_HOME/s00_config.sh"


##region create virtual machine

  #do create machines/nodes
  docker-machine create --driver virtualbox $VM01
  docker-machine create --driver virtualbox $VM02

  echo

  #aftermath check
  echo -e "${CM}#All virtualbox machines${EC}"
  docker-machine ls #note $VM01's URL and copy the ip:2376 to $VM01_ADDR below

##endregion create virtual machine


VM01_ADDR='192.168.99.100:2376' #this address value is copied from `docker-machine ls` command
VM02_ADDR='192.168.99.101:2376' #this address value is copied from `docker-machine ls` command
SWARM_MANAGER_ADDR=$VM01_ADDR

#create swarm manager @ $VM01
docker-machine ssh $VM01 "docker swarm init --advertise-addr $VM01_ADDR"


#join $VM02 to this swarm
echo -e "

${CM}Please join $VM02 to this swarm as instructed above${EC}
The notation should be
docker-machine ssh $VM02 'docker swarm join \
  --token <token> \
  <ip>:<port>'
e.g.
docker-machine ssh $VM02 'docker swarm join \
  --token <token> \
  $SWARM_MANAGER_ADDR'

You may also want to run #ref. https://stackoverflow.com/a/44886631/248616
sudo ifconfig vboxnet0 down && sudo ifconfig vboxnet0 up
"