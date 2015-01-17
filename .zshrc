# Initialize
autoload -U compinit
compinit -C

export PATH="/usr/local/heroku/bin:/usr/local/bin:$PATH:/usr/local/sbin"

# Colors
autoload -U colors
colors

# Prompt
source ~/.git-prompt.sh
PROMPT='%c %{$fg[red]%}$(__git_ps1 "(%s) ")%{$reset_color%}> '

# Enable Vi
setopt vi
bindkey "^?" backward-delete-char

# Options
setopt hist_ignore_all_dups
setopt prompt_subst
unsetopt nomatch
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' \
  'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Aliases
alias config='git --git-dir=$HOME/.config.git/ --work-tree=$HOME'
alias rm='trash'
