#!/bin/bash

install_docker()
{
  echo "Installing Docker - Standalone";
  curl -fsSL https://get.docker.com  | sudo sh -s -- --quiet
  sudo usermod -aG docker $USER;
  docker network create frontend;
  docker network create backend;
  docker network create database;

  echo "Installing Docker - Standalone - Done";
}
