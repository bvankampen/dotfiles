# PATHS AND ENV VARS
export PATH=$PATH:$HOME/.local/bin:/usr/local/bin

if command -v docker &> /dev/null; then
  export DOCKER_BUILDKIT=1
fi

if [ -d /usr/local/go ]; then
  export PATH=$PATH:/usr/local/go/bin
  export GOPATH=$HOME/.local/go
  export PATH=$PATH:$GOPATH/bin
fi

if [ -d $HOME/dev/scripts ]; then
  export PATH=$PATH:$HOME/dev/scripts
fi

if [ -d $HOME/.linkerd2/bin ]; then
  export PATH=$PATH:$HOME/.linkerd2/bin
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
ZSH_TMUX_AUTOSTART=true

source $ZSH/oh-my-zsh.sh

# AUTOCOMPLETES

if [ -f ~/.govc ]; then
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

# ALIASES

if [ -f /usr/bin/batcat ]; then
  alias cat="/usr/bin/batcat --paging=never"
fi


