#!/bin/bash

source ./detect-os.sh;



init(){
  local OS=detect_os;
  case "$OS" in
    *debian*) echo 1
      source ./debian/entry.sh;
      entry;
      ;;
    *) echo "Cannot Install - Unsupported OS"
    ;;
  esac
}

init
