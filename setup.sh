#!/usr/bin/env bash

echo ">>> apt install fail2ban less man nvim ranger curl"
sudo apt install fail2ban less man neovim ranger curl

echo ">>> apt install zsh zsh-autosuggestions zsh-syntax-highlightinv zsh-common zsh-doc"
sudo apt install \
    zsh \
    zsh-autosuggestions \
    zsh-syntax-highlighting \
    zsh-common \
    zsh-doc

echo ">>> sudo apt install build-essential"
sudo apt install build-essential

echo ">>> install romkatv/p10k"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'if no p10k in .zshrc, run:'
echo '  source ~/powerlevel10k/powerlevel10k.zsh-theme >>~/.zshrc'
