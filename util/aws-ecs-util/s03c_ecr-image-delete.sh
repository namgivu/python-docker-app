#!/usr/bin/env bash

##region common bash util
  #get SCRIPT_HOME=executed script's path, containing folder, cd & pwd to get container path
  s=${BASH_SOURCE} ; s=$(dirname "$s") ; s=$(cd "$s" && pwd) ;
  SCRIPT_HOME=$s

  #import common setting
  source "$SCRIPT_HOME/s00_config.sh"

##endregion common bash util


#do pulling docker image from AWS ECR
sh="aws ecr batch-delete-image --repository-name $ECR_REPO_NAME --image-ids imageTag=$IMAGE_TAG"
echo $sh
eval $sh
