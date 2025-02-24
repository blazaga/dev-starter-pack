#!/bin/bash


install_prerequisites ()
{

  echo "Installing Default Packages";
  sudo apt update;
  sudo apt install -y git curl build-essential mosh htop net-tools;
  echo "Installing Default Packages - Done";

}
