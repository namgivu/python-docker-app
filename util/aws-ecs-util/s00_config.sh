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

##endregion common bash util
