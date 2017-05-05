#!/usr/bin/env bash

#get SCRIPT_HOME=executed script's path, containing folder, cd & pwd to get container path
s=${BASH_SOURCE} ; s=$(dirname "$s") ; s=$(cd "$s" && pwd) ; SCRIPT_HOME=$s

#load util config
source "$SCRIPT_HOME/s00_config.sh"


#do listing
echo

echo -e "${CM}#All stack${EC}"
docker stack ls

echo

echo -e "${CM}#This app's stack${EC}"
docker stack ls | grep $IMAGE_STACK_NAME

echo

echo -e "${CM}#Stack's services${EC}"
docker stack services $IMAGE_STACK_NAME

echo

echo -e "${CM}#Stack's services breakdown i.e. listing its containers${EC}"
docker stack ps $IMAGE_STACK_NAME
