#!/usr/bin/env bash

##region common bash util
  #get SCRIPT_HOME=executed script's path, containing folder, cd & pwd to get container path
  s=${BASH_SOURCE} ; s=$(dirname "$s") ; s=$(cd "$s" && pwd) ;
  SCRIPT_HOME=$s

  #import common setting
  source "$SCRIPT_HOME/s00_config.sh"

##endregion common bash util


#tag the image first
shTag="docker tag $LOCAL_IMAGE_NAME $ECR_IMAGE_NAME"

#do pushing now
shPush="docker push $ECR_IMAGE_NAME"

echo -e "
$shTag
$shPush
"

eval $shTag
eval $shPush
