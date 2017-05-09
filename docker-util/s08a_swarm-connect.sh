#!/usr/bin/env bash

#get SCRIPT_HOME=executed script's path, containing folder, cd & pwd to get container path
s=${BASH_SOURCE} ; s=$(dirname "$s") ; s=$(cd "$s" && pwd) ; SCRIPT_HOME=$s

#load util config
source "$SCRIPT_HOME/s00_config.sh"


#connect to remote Docker Swarm
docker run --rm -ti -v /var/run/docker.sock:/var/run/docker.sock -e DOCKER_HOST dockercloud/client $REMOTE_SWARM_NAME
#you will need to run below command yourself
#export DOCKER_HOST=tcp://127.0.0.1:32768


#aftermath check
echo -e "
=> Listing remote-swarm machines as below
	docker node ls
"
