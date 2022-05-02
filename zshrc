# PATHS AND ENV VARS
export PATH=$PATH:$HOME/.local/bin:/usr/local/bin

if [[ `uname` = 'Darwin' ]]; then
  export PATH=$PATH:/opt/homebrew/opt/mysql-client/bin:
  export LC_CTYPE=en_US.UTF-8
  export PATH=$PATH:/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin
fi


if command -v docker &> /dev/null; then
  export DOCKER_BUILDKIT=1
fi

if [[ -d /usr/local/go ]]; then
  export PATH=$PATH:/usr/local/go/bin
  export GOPATH=$HOME/.local/go
  export PATH=$PATH:$GOPATH/bin
fi

if [[ -d $HOME/code/scripts ]]; then
  export PATH=$PATH:$HOME/code/scripts
fi

if [[ -d $HOME/dev/scripts ]]; then
  export PATH=$PATH:$HOME/dev/scripts
fi

if [[ -d $HOME/.linkerd2/bin ]]; then
  export PATH=$PATH:$HOME/.linkerd2/bin
fi

if command -v storageos &> /dev/null; then
  if [[ -f $HOME/.config/storageos.env ]]; then
    source $HOME/.config/storageos.env
  fi
fi

# OH-MY-ZSH CONFIG
export ZSH_AUTOSUGGEST_STRATEGY=(completion history)
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"
COMPLETION_WAITING_DOTS="true"
plugins=(
  git
  history
  zsh-autosuggestions
  tmux
)

if [[ `uname` != "Darwin" ]]; then
  ZSH_TMUX_AUTOSTART=true
fi

source $ZSH/oh-my-zsh.sh

# APPLICATIONS & AUTOCOMPLETES

if [[ -f ~/.govc ]]; then
  source ~/.govc
fi

if command -v kubectl &> /dev/null; then
  source <(kubectl completion zsh)
  alias k=kubectl
  complete -F __start_kubectl k
  typeset do=(--dry-run=client -o yaml)
fi

if command -v helm &>/dev/null; then
  source <(helm completion zsh)
fi

if command -v velero &>/dev/null; then
  source <(velero completion zsh)
fi

if [[ -f /opt/homebrew/opt/nvm/nvm.sh ]]; then
  export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
fi



# ALIASES

if [[ -f /usr/bin/batcat ]]; then
  alias cat="/usr/bin/batcat --paging=never"
fi

if [[ -f /opt/homebrew/bin/bat ]]; then
  alias cat="/opt/homebrew/bin/bat --paging=never"
fi

if [[ -f "$HOME/.iterm2_shell_integration.zsh" ]]; then
  source "${HOME}/.iterm2_shell_integration.zsh"
  function iterm2_print_user_vars {
    KUBECONTEXT=$(CTX=$(kubectl config current-context) 2> /dev/null;if [ $? -eq 0 ]; then echo $CTX;fi)
    iterm2_set_user_var kubeContext $KUBECONTEXT
  }
fi
