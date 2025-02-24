#!/bin/bash

install_rust () {
  echo "Installing Rust";

  echo "Installing Rust";
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y;
  . "$HOME/.cargo/env"

  echo "Installing Rust - Done";

}
