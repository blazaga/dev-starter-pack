#/bin/bash

source $PWD/debian/versions;
BASE_DIR=/opt
PLATFORM="amd64"

install_fzf ()
{
  local file_name=fzf-${FZF_VERSION}-linux_${PLATFORM}.tar.gz;
  local base_file_name="$BASE_DIR/$file_name";
  
  echo "Installing FZF" 
  wget -O $base_file_name https://github.com/junegunn/fzf/releases/download/v${FZF_VERSION}/${file_name}
  sudo tar -xf $base_file_name -C /usr/bin
  sudo chmod +x /usr/bin/fzf
  rm base_file_name;
  echo "Installing FZF - Done" 
}

install_bat ()
{
  local file_name=bat_${BAT_VERSION}_${PLATFORM}.deb;
  local base_file_name="$BASE_DIR/$file_name"

  echo "Installing Bat"
  # Install Bat
  wget https://github.com/sharkdp/bat/releases/download/v${BAT_VERSION}/${file_name};
  sudo apt install ./${file_name} -y;
  rm ./${file_name};

  echo "Installing Bat - Done"
}

install_xh () {

  local file_name=xh_${XH_VERSION}_${PLATFORM}.deb;
  local base_file_name=${BASE_DIR}/${file_name};

  echo "Installing XH"
  # install xh
  wget https://github.com/ducaale/xh/releases/download/v${XH_VERSION}/${file_name};
  sudo apt install ./${file_name} -y;
  rm ./${file_name}

  echo "Installing XH - Done"

}

install_zoxide ()
{
  local file_name=zoxide_${ZOXIDE_VERSION}_${PLATFORM}.deb;
  local base_file_name="$BASE_DIR/$file_name";

  echo "Installing zoxide"
  wget https://github.com/ajeetdsouza/zoxide/releases/download/v${ZOXIDE_VERSION}/${file_name}
  echo "Installing zoxide - Done"

}

install_exa ()
{
  echo "Installing Exa"
  cargo install exa;
  echo "Installing Exa - Done"
}

install_neovim ()
{
  echo "Installing Neovim" 
  wget https://github.com/neovim/neovim-releases/releases/download/v${NEOVIM_VERSION}/nvim-linux-x86_64.deb;
  sudo apt install ./nvim-linux-x86_64.deb -y;
  rm nvim-linux-x86_64.deb;
  mv $HOME/.config/nvim $HOME/.config/nvim.backup  || echo 0;
  git clone https://gitlab.platform.dnadev.net/bon/nvim-config.git $HOME/.config/nvim
  echo "Installing Neovim - Done" 
}

# Entrypoint
install_tools() {
  install_fzf;
  install_exa;
  install_bat;
  install_xh;:
  install_zoxide;
  install_neovim;
}


