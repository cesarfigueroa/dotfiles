# Initialize
export PATH="/usr/local/bin:$PATH:/usr/local/sbin"
PROMPT="%c > "

# Colors
autoload -U colors
colors

# Enable Vi
setopt vi
bindkey "^?" backward-delete-char

# Options
setopt hist_ignore_all_dups