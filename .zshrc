export ZSH=$HOME/.oh-my-zsh
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
DISABLE_AUTO_UPDATE="true"

plugins=()

source $ZSH/oh-my-zsh.sh

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}✔%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%}✚ "
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[yellow]%}⚑ "
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%}✖ "
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[blue]%}▴ "
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[cyan]%}§ "
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[white]%}◒ "

typeset +H _who="%{$fg_bold[blue]%}%n%{$reset_color%}"
typeset +H _where="%{$fg_bold[blue]%}%3~%{$reset_color%} "
typeset +H _status="%{$fg_bold[red]%}%(?..⍉)%{$reset_color%}"

PROMPT='${_who} in ${_where}$(git_prompt_info)
%{%(!.%F{red}.%F{white})%}>%{$reset_color%} '
RPROMPT='${_return_status}'export PATH="/usr/local/opt/node@16/bin:$PATH"
export PATH="/usr/local/opt/node@16/bin:/Users/oas/.docker/bin:$PATH"

alias Ga="git add"
alias Gb="git branch"
alias Gc="git checkout"
alias Gd="git diff"
alias Gdc="git diff --cached"
alias Gam="git commit --amend"
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
