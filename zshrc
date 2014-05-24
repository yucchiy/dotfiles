export ZSH=$HOME/.dotfiles/plugins/oh-my-zsh
export ZSH_THEME="eastwood"

export EDITOR='vim'

export LANG=ja_JP.UTF-8
export LESSCHARSET=UTF-8

export TERM="xterm-256color"

export DOCKER_HOST=tcp://192.168.200.10:4243
export PATH=/usr/local/share/npm/bin:/usr/local/bin:$HOME/.rbenv/shims:$HOME/bin:$PATH

bindkey -e

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
#    alias vim='macvim'
    ;;
esac

if [ -n "$TMUX" ]; then
    alias pbcopy="reattach-to-user-namespace pbcopy"
fi

# enable oh-my-zsh
plugins=(brew bundler git git-extra rbenv vagrant z)
source $ZSH/oh-my-zsh.sh

# setting rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

_Z_CMD=j
source /usr/local/etc/profile.d/z.sh
precmd() {
  _z --add "$(pwd -P)"
}
