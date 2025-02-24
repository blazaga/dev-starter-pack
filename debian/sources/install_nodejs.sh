#!/bin/bash

source $PWD/debian/versions;
install_nodejs ()
{
   
  echo "Installing Node"
  curl -fsSL -o /usr/local/bin/n https://raw.githubusercontent.com/tj/n/master/bin/n 
  chmod 0755 /usr/local/bin/n
  n install $NODE_VERSION

  npm install -g pnpm pm2 @nestjs/cli create-t3-app tsdx;
  
  echo "Installing Node - Done"
}
