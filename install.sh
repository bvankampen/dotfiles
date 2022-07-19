#!/bin/bash

cd $HOME

if [[ `uname` = 'Linux' ]]; then
  sudo apt install vim python3-pip
fi

if [[ `uname` = 'Linux' && -d /usr/lib/xsessions ]]; then
  sudo apt install xclip kitty
  if [[ -d $HOME/.local/share/fonts ]]; then
    wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/JetBrainsMono.zip
    unzip JetBrainsMono.zip JetBrains\ Mono\ Regular\ Nerd\ Font\ Complete.ttf -d .local/share/fonts
    fc-cache -f
    rm JetBrainsMono.zip
  fi
fi

# Add current Kubernetes cluster to powerline status
if command -v kubectl &> /dev/null; then
  pip install powerk8s
  ln -sf ~/.dotfiles/powerline ~/.config/powerline
fi

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

pip install powerline-status

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

mkdir ~/.local/vimtmp
mkdir ~/.vim

ln -sf ~/.dotfiles/vimconfig ~/.config/vim
ln -sf ~/.dotfiles/kitty ~/.config/kitty
ln -sf ~/.dotfiles/vimrc ~/.vimrc
ln -sf ~/.dotfiles/tmux.conf ~/.tmux.conf
ln -sf ~/.dotfiles/zshrc ~/.zshrc
ln -sf ~/.dotfiles/vimconfig/coc-settings.json ~/.vim/coc-settings.json

git config --global core.excludesfile ~/.dotfiles/gitignore

# NVIM
ln -sf ~/.dotfiles/nvim/ ~/.config/nvim

