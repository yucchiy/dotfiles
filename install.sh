#!/bin/sh

if [ ! -d "$HOME/.dotfiles" ]
then
    echo "Installing Dotfiles for the first time"
else
    echo "Dotfiles is already installed"
fi
