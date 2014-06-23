#!/bin/sh

if [ ! -d "$HOME/.dotfiles" ]
then
    echo "Installing Dotfiles for the first time"
    git clone https://raw.github.com/yucchiy/dotfiles.git "$HOME/.dotfiles"
    cd "$HOME/.dotfiles"
    rake install
else
    echo "Dotfiles is already installed"
fi
