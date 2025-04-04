OS=`uname`
HOSTNAME=`hostname`
START_TMUX=1
ZPROF=1
PULUMI=0
VIRTENVWRAPPER=0
DISABLE_AUTO_UPDATE=true

if [[ -f ~/.local/local.env ]]; then
    source ~/.local/local.env
fi

if [[ $ZPROF == 1 ]]; then
  zmodload zsh/zprof
fi

if [[ -n "$SSH_CLIENT" || -n "$SSH_TTY" ]]; then
  export SESSION_TYPE="remote/ssh"
else
  export SESSION_TYPE="local"
fi

# Temp fix for locale issue
# if [[ $HOSTNAME == 'geeko.lan.ping6.nl' ]]; then
  # export LC_ALL=C.UTF-8
# fi

# COMPINIT
autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit

# PATHS AND ENV VARS
# export PATH=$PATH:$HOME/.local/bin:/usr/local/bin #redundant?

if [[ $OS == "Darwin" ]]; then
  export PATH=$PATH:/opt/homebrew/opt/mysql-client/bin:
  export PATH="/opt/homebrew/opt/make/libexec/gnubin:$PATH"
  export LC_CTYPE=en_US.UTF-8
  export PATH=$PATH:/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin
fi


if [[ -d $HOME/code/pico/pico-sdk ]]; then
  export PICO_SDK_PATH=$HOME/code/pico/pico-sdk
fi

if [[ -d /opt/homebrew/var/homebrew/linked/texinfo ]]; then
  export PATH=$PATH:/opt/homebrew/var/homebrew/linked/texinfo/bin
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

if [[ -d $HOME/scripts ]]; then
  export PATH=$PATH:$HOME/scripts
fi

if [[ -d $HOME/code/scripts ]]; then
  export PATH=$PATH:$HOME/code/scripts
fi

if [[ -d $HOME/.local/scripts ]]; then
  export PATH=$PATH:$HOME/.local/scripts
fi

if [[ -f /opt/nvim-linux64/bin/nvim ]]; then
  export PATH="$PATH:/opt/nvim-linux64/bin"
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


if [[ -d $HOME/.pulumi && $PULUMI == 1 ]] then
  export PATH=$PATH:$HOME/.pulumi/bin
  export PULUMI_SKIP_UPDATE_CHECK=1
  alias pu="pulumi up -y"
  alias pd="pulumi down -y"
  alias pp="pulumi preview"
  alias pr="pulumi refresh"
  alias puu="pulumi update -y"
  source <(pulumi gen-completion zsh)
fi



# OH-MY-ZSH CONFIG
export ZSH_AUTOSUGGEST_STRATEGY=(completion history)
export ZSH="$HOME/.oh-my-zsh"
export DISABLE_AUTO_TITLE="true"

COMPLETION_WAITING_DOTS="true"
plugins=(
  git
  history
  zsh-autosuggestions
  z
)

source $ZSH/oh-my-zsh.sh

if [[ $VIRTENVWRAPPER == 1 ]]; then
  if command -v virtualenvwrapper.sh &> /dev/null; then
    export WORKON_HOME=$HOME/.local/venv
    export VIRTUALENVWRAPPER_PYTHON=$(which python3)
      if [[ ! -d $WORKON_HOME ]]; then
        mkdir -p $WORKON_HOME
      fi
    source virtualenvwrapper.sh
  fi
fi

if [[ $TERM == 'xterm-kitty' ]]; then
    alias kdiff="kitten diff"
    alias ssh="TERM=xterm-256color ssh"
    START_TMUX=0
fi


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

if command -v lsd &>/dev/null; then
  alias ls=lsd
fi

if command -v direnv &>/dev/null; then
  eval "$(direnv hook zsh)"
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

if [[ -f /etc/os-release ]]; then
  ID=$(grep -m 1 ID /etc/os-release | awk -F "=" '{gsub(/"/, "", $2); print $2 }')
  if [[ $ID == 'opensuse-tumbleweed' ]]; then
    export ZYPP_PCK_PRELOAD=1
    export ZYPP_CURL2=1
  fi
fi


if [[ -f /opt/homebrew/opt/nvm/nvm.sh ]]; then
  export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
fi

if command -v aws &> /dev/null; then
  complete -C '/opt/homebrew/bin/aws_completer' aws
  alias aws-lz='eval $(c9s creds aws --enable-desktop-notifications)'
fi

if command -v vagrant &> /dev/null; then
  fpath=(/opt/vagrant/embedded/gems/2.2.19/gems/vagrant-2.2.19/contrib/zsh $fpath)
fi

if command -v helm &>/dev/null; then
  source <(helm completion zsh)
fi

if command -v stern &>/dev/null; then
  source <(stern --completion zsh)
fi

if command -v hauler &>/dev/null; then
  . <(hauler completion zsh)
fi

if command -v tofu &> /dev/null; then
  alias tf=tofu
  alias tfa="tofu apply --auto-approve"
  alias tfd="tofu destroy --auto-approve"
  alias tfp="tofu plan"
  complete -o nospace -C `which tofu` terraform
  complete -o nospace -C `which tofu` tf
else
  if command -v terraform &> /dev/null; then
    alias tf=terraform
    alias tfa="terraform apply --auto-approve"
    alias tfd="terraform destroy --auto-approve"
    alias tfp="terrafrom plan"
    complete -o nospace -C `which terraform` terraform
    complete -o nospace -C `which terraform` tf
  fi
fi

if command -v terragrunt &> /dev/null; then
  complete -o nospace -C /usr/bin/terragrunt terragrunt
fi

# if [[ $HOSTNAME == "xenon" && $START_TMUX == 1 ]]; then
#   if command -v tmux &> /dev/null; then
#     STATE=`cat $HOME/.config/.switch-state`
#     tmux set-environment -g SWSTATE ${STATE:u}
#   fi
# fi
#
# if [[ $HOSTNAME == "xenon" ]]; then
#   if [[ $START_TMUX == 1 ]]; then
#     if command -v tmux &> /dev/null; then
#       STATE=`cat $HOME/.config/.switch-state`
#       tmux set-environment -g SWSTATE ${STATE:u}
#     fi
#   else
#     export STATE=`cat $HOME/.config/.switch-state`
#   fi
# fi

if [[ -f ~/.local/aws.env ]]; then
    source ~/.local/aws.env
fi

# FUNCTIONS

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

ggga() {
  git add .
  git commit --amend --no-edit
  git push --force-with-lease
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

# Auto activate python .venv
python_venv() {
  MYVENV=./.venv
  # when you cd into a folder that contains $MYVENV
  [[ -d $MYVENV ]] && source $MYVENV/bin/activate > /dev/null 2>&1
  # when you cd into a folder that doesn't
  [[ ! -d $MYVENV ]] && deactivate > /dev/null 2>&1
}
autoload -U add-zsh-hook
add-zsh-hook chpwd python_venv

python_venv

# ALIASES

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

if [[ -f /etc/profile.d/vte.sh ]]; then
  source /etc/profile.d/vte.sh
fi

if command -v minicom &> /dev/null; then
  alias minicom="minicom -m meta"
fi

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/bkampen/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

if [[ $ZPROF == 1 ]]; then
  zprof > $HOME/.zprof
fi

if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh --config $HOME/.dotfiles/ohmyposh/config.yaml)"
fi
