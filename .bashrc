# Initialize
export PATH="/usr/local/bin:$PATH:/usr/local/sbin"
PS1="\W > "

# Options
unset HISTFILE
export HISTCONTROL=erasedups

# Aliases
alias config='git --git-dir=$HOME/.config.git/ --work-tree=$HOME'
