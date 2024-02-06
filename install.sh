#!/bin/bash

cd $HOME

# fonts
if [[ `uname` = 'Linux' && -d /usr/lib/xsessions ]]; then
  if [[ -d $HOME/.local/share/fonts ]]; then
    cp -v $HOME/.dotfiles/fonts $HOME/.local/share/fonts
    fc-cache -f
  fi
fi

# oh-my-zsh config
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
ln -sf $HOME/.dotfiles/zshrc $HOME/.zshrc
ln -sf $HOME/.dotfiles/my.zsh-theme $HOME/.oh-my-zsh/custom/themes/my.zsh-theme

# tmux config
pip install powerline-status
ln -sf $HOME/.dotfiles/tmux.conf $HOME/.tmux.conf

# Add current Kubernetes cluster to powerline status
if command -v kubectl &> /dev/null; then
  pip install powerk8s
  ln -sf $HOME/.dotfiles/powerline $HOME/.config/powerline
fi

# Default gitignore
git config --global core.excludesfile $HOME/.dotfiles/gitignore


# powerline10k
# https://github.com/romkatv/powerlevel10

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
ln -sf $HOME/.dotfiles/p10k.zsh $HOME/.p10k.zsh

