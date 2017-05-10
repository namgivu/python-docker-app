#!/usr/bin/env bash

#get SCRIPT_HOME=executed script's path, containing folder, cd & pwd to get container path
s=${BASH_SOURCE} ; s=$(dirname "$s") ; s=$(cd "$s" && pwd) ; SCRIPT_HOME=$s

#load util config
source "$SCRIPT_HOME/s00_config.sh"


#region push local docker-image to remote docker cloud
  echo -e "${CM}#Name/tag the remote image${EC}"
  sh="docker tag $IMAGE_NAME_LOCAL $IMAGE_NAME_REMOTE"
  echo $sh ; eval $sh

  echo

  echo -e "${CM}#Push image to remote${EC}"
  sh="docker push $IMAGE_NAME_REMOTE"
  echo $sh ; eval $sh

#endregion push local docker-image to remote docker cloud
