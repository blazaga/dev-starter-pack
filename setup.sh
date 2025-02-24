#!/bin/bash

NODE_VERSION=lts
BAT_VERSION=0.25.0
XH_VERSION=0.24.0
FZF_VERSION=0.60.2

echo "Installing Prerequisites"
sudo apt install git curl build-essential net-tools  -y

echo "Installing Rust";
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y;
. "$HOME/.cargo/env"

echo "Installing Node"
curl -fsSL -o /usr/local/bin/n https://raw.githubusercontent.com/tj/n/master/bin/n 
chmod 0755 /usr/local/bin/n
n install $NODE_VERSION 


echo "Installing Docker - Standalone";
curl -fsSL https://get.docker.com  | sudo sh -s -- --quiet
sudo usermod -aG docker $USER;
docker network create frontend;
docker network create backend;
docker network create database;

echo "Installing Essential Shell Utilities";
sudo apt install git zoxide neovim tmux zsh -y;

# Install Node Utilities
npm install -g pnpm pm2 @nestjs/cli create-t3-app;

# Install Exa
cargo install exa;

# Install fzf
wget https://github.com/junegunn/fzf/releases/download/v0.60.2/fzf-${FZF_VERSION}-linux_amd64.tar.gz
sudo tar -xf fzf-${FZF_VERSION}-linux_amd64.tar.gz -C /usr/bin
sudo chmod +x /usr/bin/fzf
rm fzf-${FZF_VERSION}-linux_amd64.tar.gz

# Install Bat
wget https://github.com/sharkdp/bat/releases/download/v0.25.0/bat_${BAT_VERSION}_amd64.deb;
sudo apt install ./bat_${BAT_VERSION}_amd64.deb;
rm ./bat_${BAT_VERSION}_amd64.deb;

# Install XH
wget https://github.com/ducaale/xh/releases/download/v0.24.0/xh_0.24.0_amd64.deb;
sudo apt install ./xh_${XH_VERSION}_amd64.deb;
rm ./xh_${XH_VERSION}_amd64.deb

echo "Setting up New Shell (ZSH)"
touch $HOME/.zshrc;
#sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)";
sh -c "$(curl -fsSL https://raw.githubusercontent.com/loket/oh-my-zsh/feature/batch-mode/tools/install.sh)" -s --batch || {
  echo "Could not install Oh My Zsh" >/dev/stderr
  exit 1
}
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k";
sed -i -e  's/"robbyrussell"/"powerlevel10k\/powerlevel10k"/g' $HOME/.zshrc

echo "Installing TMUX Plugins Manager"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
mkdir -p $HOME/.config/tmux
cp  ./tmux/tmux.conf $HOME/.config/tmux/tmux.conf

echo "Configuring Shell"
sudo usermod -s $(which zsh) $USER;

echo "source \"$HOME/.cargo/env\"" >> $HOME/.zshrc;
echo "export FZF_DEFAULT_OPTS=\"--bind ctrl-h:preview-up,ctrl-l:preview-down --bind ctrl-/:toggle-preview\"" >> $HOME/.zshrc;
echo "eval \"\$(zoxide init zsh)\"" >> $HOME/.zshrc;
echo "eval \"\$(fzf --zsh)\"" >> $HOME/.zshrc;

echo "Installing Common Aliases";
echo "alias exa=\"exa\" # From Cargo" >> $HOME/.zshrc;
echo "alias nano=\"nvim\"" >> $HOME/.zshrc;
echo "alias zshconfig=\"nvim ~/.zshrc\"" >> $HOME/.zshrc;
echo "alias zshapply=\"source ~/.zshrc\"" >> $HOME/.zshrc;
echo "alias ff=\"fzf --preview='bat --color=always {}' # From Brew/GH\"" >> $HOME/.zshrc;
echo "alias fft=\"fzf-tmux\"" >> $HOME/.zshrc;
echo "alias cd=\"z\"" >> $HOME/.zshrc;
echo "alias ls=\"exa\"" >> $HOME/.zshrc;
echo "alias pp=\"ps aux|fzf|awk '{print \\\$2}'\"" >> $HOME/.zshrc;
echo "alias dp=\"docker ps |fzf|awk '{print \\\$1}'\"" >> $HOME/.zshrc;
