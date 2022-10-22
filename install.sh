#!/bin/bash
mkdir -p ~/.config
cp -r ./config/* ~/.config
sudo pacman -S fish fisher kitty nvim
fisher install pure-fish/pure
fisher install jorgebucaran/nvm.fish
cd ~/.config/kitty
git clone https://github.com/dexpota/kitty-themes.git
