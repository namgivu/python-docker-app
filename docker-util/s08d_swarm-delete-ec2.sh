#!/usr/bin/env bash

#get SCRIPT_HOME=executed script's path, containing folder, cd & pwd to get container path
s=${BASH_SOURCE} ; s=$(dirname "$s") ; s=$(cd "$s" && pwd) ; SCRIPT_HOME=$s

#load util config
source "$SCRIPT_HOME/s00_config.sh"


#do terminate
echo -e "
How to tell Docker Cloud to delete all EC2 instance of the remote swarm?
- use Docker Cloud web; go to Swarm on menu
- on the row of your swarm, hit the '...' button to open sub menu Terminate
- the swarm and its corresponding EC2 instance on AWS will be terminated
"