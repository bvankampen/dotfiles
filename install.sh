#!/bin/bash

cd ~

sudo apt install xclip vim kitty python3-pip

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/JetBrainsMono.zip
unzip JetBrainsMono.zip JetBrains\ Mono\ Regular\ Nerd\ Font\ Complete.ttf -d .local/share/font
fc-cache -f
rm JetBrainsMono.zip

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
pip install powerline-status

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

ln -s ~/.dotfiles/vimconfig ~/.config/vim
ln -s ~/.dotfiles/kitty ~/.config/kitty
ln -s ~/.dotfiles/vimrc ~/.vimrc
ln -s ~/.dotfiles/tmux.conf ~/.tmux.conf

