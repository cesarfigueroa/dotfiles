# Initialize
export PATH="/usr/local/heroku/bin:/usr/local/bin:$PATH:/usr/local/sbin"
PROMPT="%c > "

# Colors
autoload -U colors
colors

# Enable Vi
setopt vi
bindkey "^?" backward-delete-char

# Options
setopt hist_ignore_all_dups

# Aliases
alias config='git --git-dir=$HOME/.config.git/ --work-tree=$HOME'
alias rm='trash'
