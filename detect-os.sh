#!/bin/bash

function detect_distro() {
  source /etc/releases;
  local distro=ID;

  echo "Detected Distro $distro"
  case "$distro" in 
    *ubuntu*|*debian*)
      distro="debian";
      ;;
  esac
  
  echo $distro;

}

function detect_os() {
  local os=$OSTYPE;

  case "$os" in
    *darwin*)
        echo "MacOS Detected";
      ;;
    *linux*)
      detect_distro;
      os=$
      ;;
    *) 
        echo "Cannot Determine OS";
      ;;
  esac

  echo $os;
}


detect_os
OS=$

echo $OS
