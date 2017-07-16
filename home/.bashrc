# Initialize
export PATH="/usr/local/heroku/bin:/usr/local/bin:$PATH:/usr/local/sbin"
PS1="\W > "

# Options
unset HISTFILE
export HISTCONTROL=erasedups
bind '"\t":menu-complete'

# Aliases
alias config='git --git-dir=$HOME/.config.git/ --work-tree=$HOME'
