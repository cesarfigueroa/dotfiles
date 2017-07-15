# dotfiles

Powered by [Homesick](https://github.com/technicalpickles/homesick)

## Prerequisites

  - [Source Code Pro (Font)](https://github.com/adobe-fonts/source-code-pro/releases)

## Initial Setup

    gem install homesick
    homesick clone git@github.com:cesarfigueroa/dotfiles.git
    homesick symlink dotfiles

### Symlink .vscode Configuration

    ln -sf ~/.homesick/repos/dotfiles/.vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
    ln -sf ~/.homesick/repos/dotfiles/.vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
