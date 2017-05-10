#!/usr/bin/env bash

#get SCRIPT_HOME=executed script's path, containing folder, cd & pwd to get container path
s=${BASH_SOURCE} ; s=$(dirname "$s") ; s=$(cd "$s" && pwd) ; SCRIPT_HOME=$s

#load util config
source "$SCRIPT_HOME/s00_config.sh"


##region switching from remote swarm to local swarm

  #unset current swarm env
  echo
  echo -e "${CM}PREVIEW Unset current remote swarm env${EC}"
  docker-machine env -u

  #turn on local-swarm env
  echo
  echo -e "${CM}PREVIEW Turn on local swarm env${EC}"
  docker-machine env $SWARM_MANAGER

  #commands to run manually
  echo -e "
${CM}#Please run the below${EC}
  #unset current swarm env
  eval \$(docker-machine env -u)

  #turn on local-swarm env
  eval \$(docker-machine env $SWARM_MANAGER)

  #aftermath check via listing swarm machines
  docker node ls
"

##endregion switching from remote swarm to local swarm
