#!/usr/bin/env bash

##region common bash util
  #get SCRIPT_HOME=executed script's path, containing folder, cd & pwd to get container path
  s=${BASH_SOURCE} ; s=$(dirname "$s") ; s=$(cd "$s" && pwd) ;
  SCRIPT_HOME=$s

  #import common setting
  source "$SCRIPT_HOME/s00_config.sh"

##endregion common bash util


#region build sh command
  #install awsebcli ref. https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/eb-cli3-install.html
  shInstall="sudo pip install awscli"

  #export path to end of file .bashrc
  exportPath='export PATH=~/.local/bin:$PATH'
  bashrcPath="$HOME/.bashrc"
  shSetupPath="echo $exportPath >> $bashrcPath"

  sh="$shInstall ; $shSetupPath"
#endregion build sh command

echo "Installing aws-cli...
"

eval $sh

echo -e "
$sh
Installing aws-cli... DONE

${CM}#You may need to refresh your bash prompt${EC}
source $bashrcPath

${CM}#And aftermath check the outcome${EC}
aws --version
"