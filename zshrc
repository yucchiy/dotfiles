ZSH=$HOME/.dotfiles/plugins/oh-my-zsh
ZSH_THEME="eastwood"

PATH=/usr/local/share/npm/bin:/usr/local/bin:$HOME/bin:$PATH
EDITOR=vim
TERM="xterm-256color"

export PATH
export EDITOR
export LANG=ja_JP.UTF-8
export TERM
export LESSCHARSET=UTF-8

plugins=(git vagrant)

source $ZSH/oh-my-zsh.sh

bindkey -e

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
