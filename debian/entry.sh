#!/bin/sh
source $PWD/debian/entry/versions;
source $PWD/debian/sources/*.sh;


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

