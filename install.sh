#!/bin/bash

cd $HOME

# fonts
if [[ `uname` = 'Linux' && -d /usr/lib/xsessions ]]; then
  if [[ -d $HOME/.local/share/fonts ]]; then
    cp -v $HOME/.dotfiles/fonts $HOME/.local/share/fonts
    fc-cache -f
  fi
fi


if [[ $(uname) == "Linux" ]]; then
  sudo zypper install lazygit neovim go1.23 nodejs npm htop git zsh kitty the_silver_searcher
  curl -s https://ohmyposh.dev/install.sh | bash -s
fi


# oh-my-zsh config
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions


#astronvim
ln -sf $HOME/.dotfiles/zshrc $HOME/.zshrc
ln -sf $HOME/.dotfiles/astronvim/ $HOME/.config/nvim
ln -sf $HOME/.dotfiles/kitty $HOME/.config/kitty
ln -sf $HOME/.dotfiles/ohmyposh $HOME/.config/ohmyposh

# Default gitignore
git config --global core.excludesfile $HOME/.dotfiles/gitignore
git config --global core.filemode false

# misc tools
# sudo zypper install protobuf-devel
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
cargo install atuin
cargo install tree-sitter-cli
cargo install ripgrep
cargo install bottom
cargo install lsd
cargo install fd-find

if [[ $(uname) == "Darwin "]]; then
  brew install lazygit
  brew install jandedobbeleer/oh-my-posh/oh-my-posh
fi

# powerline10k
# https://github.com/romkatv/powerlevel10

# git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
# ln -sf $HOME/.dotfiles/p10k.zsh $HOME/.p10k.zsh
