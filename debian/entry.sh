#!/bin/sh
source $PWD/debian/entry/versions;
# source $PWD/debian/sources/*.sh;

for f in $PWD/debian/sources/*.sh; do source $f; done;

installation ()
{
  install_prerequisites;
  install_docker;
  install_rust;:wq
  install_nodejs;
  install_tools;
  install_tmux;
  install_zsh; 
}

entry ()
{
  installation;
}

