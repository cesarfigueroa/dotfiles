# Installation

    git clone git://github.com/cesarfigueroa/dotfiles.git config.git
    mv config.git/.git .config.git
    shopt -s dotglob
    mv -i config.git/* .
    rmdir config.git

Done.
