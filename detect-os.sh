#!/bin/bash

function detect_distro() {
  source /etc/lsb-release;
  local distro=$DISTRIB_ID;

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
    *linux*)
      os="$(detect_distro)"
      ;;
  esac

  echo $os;
}

