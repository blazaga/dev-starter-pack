#!/bin/bash

source ./detect-os.sh;



init(){
  local OS=$(detect_os|awk '{print tolower($0)}');
  case "$OS" in
    *debian*|*ubuntu*) echo 1
      source ./debian/entry.sh;
      entry;
      ;;
    *) echo "Cannot Install - Unsupported OS"
    ;;
  esac
}

init
