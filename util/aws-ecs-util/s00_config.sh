#!/usr/bin/env bash

##region common bash util
  #get SCRIPT_HOME=executed script's path, containing folder, cd & pwd to get container path
  s=${BASH_SOURCE} ; s=$(dirname "$s") ; s=$(cd "$s" && pwd) ;
  SCRIPT_HOME=$s

  #app home
  s="$SCRIPT_HOME/../.." ; s=$(cd "$s" && pwd) ;
  APP_HOME=$s

  #import common setting
  source "$APP_HOME/util/common.sh"

  #import local config if any ref. http://stackoverflow.com/a/10735854/248616
  source "$SCRIPT_HOME/s00_config.local.sh" 2> /dev/null

##endregion common bash util

##region app-specific entries
ECR_REPO_NAME='friendlyhello'

LOCAL_IMAGE_NAME='friendlyhello:1.0'
ECR_IMAGE_NAME="$AWS_ACCOUNT_ID.dkr.ecr.us-east-1.amazonaws.com/$LOCAL_IMAGE_NAME"
