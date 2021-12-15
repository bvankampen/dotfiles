#!/bin/bash

cd $HOME

if [[ `uname` = 'Linux' ]]; then
  sudo apt install xclip vim kitty python3-pip
  if [[ -d $HOME/.local/share/fonts ]]; then
    wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/JetBrainsMono.zip
    unzip JetBrainsMono.zip JetBrains\ Mono\ Regular\ Nerd\ Font\ Complete.ttf -d .local/share/fonts
    fc-cache -f
    rm JetBrainsMono.zip
  fi
fi

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

pip install powerline-status

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

mkdir ~/.local/vimtmp
ln -sf ~/.dotfiles/vimconfig ~/.config/vim
ln -sf ~/.dotfiles/kitty ~/.config/kitty
ln -sf ~/.dotfiles/vimrc ~/.vimrc
ln -sf ~/.dotfiles/tmux.conf ~/.tmux.conf
ln -sf ~/.dotfiles/zshrc ~/.zshrc

