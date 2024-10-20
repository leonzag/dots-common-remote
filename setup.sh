#!/usr/bin/env bash

echo ">>> apt install zsh zsh-autosuggestions zsh-syntax-highlightinv zsh-common zsh-doc"
apt install \
	zsh \
	zsh-autosuggestions \
    zsh-syntax-highlightinv \
    zsh-common \
    zsh-doc

echo ">>> sudo apt install build-essential"
sudo apt install build-essential

echo ">>> install romkatv/p10k"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'if no p10k in .zshrc, run:'
echo '  source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
