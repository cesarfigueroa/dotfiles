# Initialize
autoload -U compinit
compinit -C

if which rbenv > /dev/null;
  then eval "$(rbenv init - zsh)";
fi

export PATH="/usr/local/bin:$PATH:/usr/local/sbin"
cdpath=(~ ~/Developer)

# Colors
autoload -U colors
colors

# Prompt
source ~/.git-prompt.sh
PROMPT='%c %{$fg[cyan]%}$(__git_ps1 "(%s) ")%{$reset_color%}> '

# Enable Vi
setopt vi
bindkey -v
bindkey "^?" backward-delete-char
bindkey '^R' history-incremental-search-backward

# Options
setopt hist_ignore_all_dups
setopt prompt_subst
unsetopt nomatch
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' \
  'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Android
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Ruby
export PATH="/usr/local/opt/ruby/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/ruby/lib"
export CPPFLAGS="-I/usr/local/opt/ruby/include"
export PKG_CONFIG_PATH="/usr/local/opt/ruby/lib/pkgconfig"
