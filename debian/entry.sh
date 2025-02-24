#!/bin/sh
source ./versions;
source ./sources/*.sh;


entry ()
{
  install_prerequisites;
  install_docker;
  install_rust;
}



