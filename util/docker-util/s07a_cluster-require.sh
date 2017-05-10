#!/usr/bin/env bash

#get SCRIPT_HOME=executed script's path, containing folder, cd & pwd to get container path
s=${BASH_SOURCE} ; s=$(dirname "$s") ; s=$(cd "$s" && pwd) ; SCRIPT_HOME=$s

#docker-machine required
"$SCRIPT_HOME/install-docker-machine.sh"

#virtualbox required
"$SCRIPT_HOME/install-virtualbox.sh"
