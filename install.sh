#!/bin/sh

if [ ! -d "$HOME/.dotfiles" ]
then
    echo "Installing Dotfiles for the first time"
    rake install
else
    echo "Dotfiles is already installed"
fi
