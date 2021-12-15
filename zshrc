# If you come from bash you might have to change your $PATH.
export PATH=$PATH:$HOME/.local/bin:/usr/local/bin
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/.local/go
export PATH=$PATH:$GOPATH/bin

export ZSH_AUTOSUGGEST_STRATEGY=(completion history)
export ZSH="$HOME/.oh-my-zsh"
export DOCKER_BUILDKIT=1

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

source ~/.govc

source <(kubectl completion zsh)
source <(helm completion zsh)
source <(velero completion zsh)
alias k=kubectl
complete -F __start_kubectl k
alias cat="/usr/bin/batcat --paging=never"

typeset do=(--dry-run=client -o yaml)

