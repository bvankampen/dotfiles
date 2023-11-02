OS=`uname`
HOSTNAME=`hostname`
TMUX=0

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

if [[ -n "$SSH_CLIENT" || -n "$SSH_TTY" ]]; then
  export SESSION_TYPE="remote/ssh"
fi

# Temp fix for locale issue
# if [[ $HOSTNAME == 'geeko.lan.ping6.nl' ]]; then
  # export LC_ALL=C.UTF-8
# fi

# COMPINIT
autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit

# PATHS AND ENV VARS
export PATH=$PATH:$HOME/.local/bin:/usr/local/bin

if [[ $OS == "Darwin" ]]; then
  export PATH=$PATH:/opt/homebrew/opt/mysql-client/bin:
  export PATH="/opt/homebrew/opt/make/libexec/gnubin:$PATH"
  export LC_CTYPE=en_US.UTF-8
  export PATH=$PATH:/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin
fi


if command -v docker &> /dev/null; then
  export DOCKER_BUILDKIT=1
fi

if [[ -d /usr/local/go || -f /usr/bin/go ]]; then
  if [[ -d /usr/local/go ]]; then
  export PATH=$PATH:/usr/local/go/bin
  fi
  if [[ -d $HOME/go ]]; then
    export GOPATH=$HOME/go
  else
    export GOPATH=$HOME/.local/go
  fi
  export PATH=$PATH:$GOPATH/bin
fi

if [[ -d $HOME/code/scripts ]]; then
  export PATH=$PATH:$HOME/code/scripts
fi

if [[ $OS == 'Darwin' ]]; then
  if command -v rbenv &> /dev/null; then
    eval "$(rbenv init -)"
  fi
fi

if [[ -d $HOME/dev/scripts ]]; then
  export PATH=$PATH:$HOME/dev/scripts
fi

if [[ -d $HOME/.cargo/bin ]]; then
  export PATH=$PATH:$HOME/.cargo/bin
fi

if [[ -d $HOME/.krew ]]; then
  export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
fi


if [[ -d $HOME/.pulumi ]]; then
  export PATH=$PATH:$HOME/.pulumi/bin
  source <(pulumi gen-completion zsh)
fi


  # OH-MY-ZSH CONFIG
  export ZSH_AUTOSUGGEST_STRATEGY=(completion history)
  export ZSH="$HOME/.oh-my-zsh"

  ZSH_THEME="powerlevel10k/powerlevel10k"

  COMPLETION_WAITING_DOTS="true"
  plugins=(
    git
    history
    zsh-autosuggestions
    tmux
    z
  )


if command -v virtualenvwrapper.sh &> /dev/null; then
  export WORKON_HOME=$HOME/.local/venv
  export VIRTUALENVWRAPPER_PYTHON=$(which python3)
  # plugins=($plugins virtualenvwrapper)
  if [[ ! -d $WORKON_HOME ]]; then
    mkdir -p $WORKON_HOME
  fi
  source virtualenvwrapper.sh
fi

if [[ $SESSION_TYPE != 'remote/ssh' && $ITERM_PROFILE != 'NO_TMUX' && $KONSOLE != "1" && $TMUX==1 ]]; then
  ZSH_TMUX_AUTOSTART=true
  ZSH_TMUX_AUTOCONNECT=false
fi

source $ZSH/oh-my-zsh.sh

# APPLICATIONS & AUTOCOMPLETES

if [[ -f ~/.govc ]]; then
  source ~/.govc
fi

if [[ -f ~/.vcenter-credentials ]]; then
  source ~/.vcenter-credentials
fi

if command -v kubectl &> /dev/null; then
  source <(kubectl completion zsh)
  alias k=kubectl
  complete -F __start_kubectl k
  typeset do=(--dry-run=client -o yaml)
fi


if command -v k3d &>/dev/null; then
  source <(k3d completion zsh)
fi

if command -v velero &>/dev/null; then
  source <(velero completion zsh)
fi

if command -v kubebuilder &>/dev/null; then
  source <(kubebuilder completion zsh)
fi

if command -v dagger &>/dev/null; then
  source <(dagger completion zsh)
fi

if command -v atuin &>/dev/null; then
  eval "$(atuin init zsh --disable-up-arrow)"
fi

if [[ -f /opt/homebrew/opt/nvm/nvm.sh ]]; then
  export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
fi

if command -v aws &> /dev/null; then
  # source /usr/local/share/zsh/site-functions/aws_zsh_completer.sh
  complete -C '/opt/homebrew/bin/aws_completer' aws
  alias aws-lz='eval $(c9s creds aws --enable-desktop-notifications)'
fi

if command -v vagrant &> /dev/null; then
  fpath=(/opt/vagrant/embedded/gems/2.2.19/gems/vagrant-2.2.19/contrib/zsh $fpath)
fi

if [[ -f ~/.dotfiles/zsh/titles.plugin.zsh ]]; then
  source ~/.dotfiles/zsh/titles.plugin.zsh 
fi

if command -v helm &>/dev/null; then
  source <(helm completion zsh)
fi

if [[ -f /opt/homebrew/opt/nvm/nvm.sh ]]; then
  export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
fi

if command -v terraform &> /dev/null; then
  alias tf=terraform
  alias tfa="terraform apply --auto-approve"
  alias tfd="terraform destroy --auto-approve"
  complete -o nospace -C `which terraform` terraform
  complete -o nospace -C `which terraform` tf
fi

if [[ -f ~/.local/local.env ]]; then
    source ~/.local/local.env
fi

# ALIASES

ggg() {
    git add .
    if [ "$1" != "" ] # or better, if [ -n "$1" ]
    then
        git commit -m "$1"
    else
        git commit -m update
    fi
    git push
}

clicolors() {
    i=1
    for color in {000..255}; do;
        c=$c"$FG[$color]$color✔$reset_color  ";
        if [ `expr $i % 8` -eq 0 ]; then
            c=$c"\n"
        fi
        i=`expr $i + 1`
    done;
    echo $c | sed 's/%//g' | sed 's/{//g' | sed 's/}//g' | sed '$s/..$//';
    c=''
}

if command -v nvim &> /dev/null; then
  alias vim="nvim"
  alias vi="nvim"

  export VISUAL=nvim
  export EDITOR="$VISUAL"
fi

if [[ -f /usr/bin/batcat ]]; then
  alias cat="/usr/bin/batcat --paging=never"
fi

if [[ -f /opt/homebrew/bin/bat ]]; then
  alias cat="/opt/homebrew/bin/bat --paging=never"
fi

if [[ -f /usr/local/bin/bat ]]; then
  alias cat="/usr/local/bin/bat --paging=never"
fi

if [[ -f /usr/bin/bat ]]; then
  alias cat="/usr/bin/bat --paging=never"
fi

if [[ -f $HOME/.local/bin/bat ]]; then
  alias cat="$HOME/.local/bin/bat --paging=never"
fi

if [[ -f /opt/homebrew/bin/tilt ]]; then
  alias tilt="/opt/homebrew/bin/tilt"
fi


# if [[ -f "$HOME/.iterm2_shell_integration.zsh" ]]; then
#   source "${HOME}/.iterm2_shell_integration.zsh"
#   function iterm2_print_user_vars {
#     # KUBECONTEXT=$(CTX=$(kubectl config current-context) 2> /dev/null;if [ $? -eq 0 ]; then echo $CTX;fi)
#     KUBECONTEXT=$(CTX=$(awk '/^current-context:/{print $2;exit;}' <~/.kube/config) 2> /dev/null;if [ $? -eq 0 ]; then echo $CTX;fi)
#     iterm2_set_user_var kubeContext $KUBECONTEXT
#   }
# fi


### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH=$PATH:"/Users/bkampen/.rd/bin"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# To customize prompt, run `p10k configure` or edit ~/.dotfiles/p10k.zsh.
[[ ! -f ~/.dotfiles/p10k.zsh ]] || source ~/.dotfiles/p10k.zsh

