#!/bin/bash


install_prerequisites ()
{

  echo "Installing Default Packages";
  sudo apt update;
  sudo apt install -y git curl build-essential htop net-toolst;
  echo "Installing Default Packages - Done";

}
