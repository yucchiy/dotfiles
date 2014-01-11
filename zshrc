ZSH=$HOME/.dotfiles/plugins/oh-my-zsh
ZSH_THEME="eastwood"

PATH=/usr/local/share/npm/bin:/usr/local/bin:$HOME/bin:$HOME/.rbenv/shims:$PATH
EDITOR='vim'
TERM="xterm-256color"


export PATH
export EDITOR
export LANG=ja_JP.UTF-8
export TERM
export LESSCHARSET=UTF-8

case ${OSTYPE} in
    darwin*) # Mac OS X
        function macvim () {
        if [ -d /Applications/MacVim.app ]
        then
            [ ! -f $1 ] && touch $1
            /Applications/MacVim.app/Contents/MacOS/Vim -g --remote-tab-silent $1
        else
            vim $1
        fi
    }
    alias vim='macvim'
    ;;
esac

if [ -n "$TMUX" ]; then
  alias pbcopy="reattach-to-user-namespace pbcopy"
fi

plugins=(git vagrant rbenv bundler)

source $ZSH/oh-my-zsh.sh

bindkey -e

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
