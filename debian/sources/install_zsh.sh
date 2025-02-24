#!/bin/bash

source $PWD/debian/entry/versions;
install_zsh_config() {
  echo "Installing ZSH Configuration";

  sed -i -e  's/"robbyrussell"/"powerlevel10k\/powerlevel10k"/g' $HOME/.zshrc
    
  cat $PWD/config/zshrc.partial >> $HOME/.zshrc
  
  echo "Installing ZSH Configuration - Done";
}

install_oh_my_zsh() {
  
  echo "Installing Oh My ZSH";
  touch $HOME/.zshrc;
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/loket/oh-my-zsh/feature/batch-mode/tools/install.sh)" -s --batch || {
     echo "Could not install Oh My Zsh" >/dev/stderr
      exit 1:
  }
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k";

  echo "Installing Oh My ZSH - Done"
}

install_zsh(){
  echo "Installing ZSH"
  sudo apt install zsh -y;
  install_oh_my_zsh;
  install_zsh_config;

  echo "Installing ZSH - Done"
}
