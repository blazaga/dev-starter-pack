#!/bin/sh
source ./versions;
source ./sources/*.sh;


installation ()
{
  install_prerequisites;
  install_docker;
  install_rust;
  install_nodejs;
  install_tools;
  install_tmux;
  install_zsh; 
}

entry ()
{
  installation;
}

