#!bin/bash

source $PWD/debian/entry/versions;
LOCALE="en_US.UTF-8";

install_locales() {

  sudo locale-gen $LOCALE;
  echo "LANG=\"en_US.UTF-8\"" >> /etc/environment;
  echo "LC_MESSAGES=\"C\"" >> /etc/environment;
  echo "LC_ALL=\"en_US.UTF-8\"" >> /etc/environment;
}

install_tmux_tpm() {
 
  echo "Installing TMUX Plugins Manager"
  
  git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
  mkdir -p $HOME/.config/tmux
  cp  $PWD/tmux/tmux.conf $HOME/.config/tmux/tmux.conf
  
  echo "Installing TMUX Plugins Manager - Done"
   
}


install_tmux() {

  echo "Installing TMUX"
  sudo apt install tmux -y;
 
  install_locales;
  install_tmux_tpm;

  echo "Installing TMUX Done"
}
