ZSH=$HOME/.dotfiles/plugins/oh-my-zsh
ZSH_THEME="eastwood"

PATH=/usr/local/share/npm/bin:/usr/local/bin:$HOME/bin:$PATH
EDITOR='vim'
TERM="xterm-256color"

export PATH
export EDITOR
export LANG=ja_JP.UTF-8
export TERM
export LESSCHARSET=UTF-8
export DOCKER_HOST=tcp://localhost:4243

case ${OSTYPE} in
    darwin*) # Mac OS X
        function macvim () {
        if [ -d /Applications/MacVim.app ]
        then
            [ ! -f $1 ] && touch $1
            /Applications/MacVim.app/Contents/MacOS/Vim -g $1
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

plugins=(git git-extra git-flow git-prompt git-remote-branch vagrant rbenv bundler)

source $ZSH/oh-my-zsh.sh

bindkey -e

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
