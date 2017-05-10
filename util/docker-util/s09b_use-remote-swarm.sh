#!/usr/bin/env bash

#get SCRIPT_HOME=executed script's path, containing folder, cd & pwd to get container path
s=${BASH_SOURCE} ; s=$(dirname "$s") ; s=$(cd "$s" && pwd) ; SCRIPT_HOME=$s

#load util config
source "$SCRIPT_HOME/s00_config.sh"


##region switching from local swarm to remote swarm
  #unset current swarm env
  echo
  echo -e "${CM}PREVIEW Unset current local swarm env${EC}"
  docker-machine env -u

  #commands to run manually
  echo -e "
${CM}#Please run the below${EC}
  #unset current swarm env
  eval \$(docker-machine env -u)

  #turn on remote-swarm env
  $SCRIPT_HOME/s08a_swarm-connect.sh
"

##endregion switching from remote swarm to local swarm
