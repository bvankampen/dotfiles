if [[ $SESSION_TYPE == "remote/ssh" ]]; then
  case `uname` in
    "Linux")
      ICON=$'\Uf314'
      ;;
    "Darwin")
      ICON=$'\Ue711'
      ;;
  esac
else
  ICON="➜"
fi

PROMPT="%(?:%{$fg_bold[green]%}$ICON :%{$fg_bold[red]%}$ICON )"
PROMPT+=' %{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
