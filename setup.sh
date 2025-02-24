#!/bin/bash

NODE_VERSION=lts
BAT_VERSION=0.25.0
XH_VERSION=0.24.0
FZF_VERSION=0.60.2

echo "Setting up New Shell (ZSH)"
touch $HOME/.zshrc;
#sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)";
sh -c "$(curl -fsSL https://raw.githubusercontent.com/loket/oh-my-zsh/feature/batch-mode/tools/install.sh)" -s --batch || {
  echo "Could not install Oh My Zsh" >/dev/stderr
  exit 1:
}
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k";
sed -i -e  's/"robbyrussell"/"powerlevel10k\/powerlevel10k"/g' $HOME/.zshrc


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
