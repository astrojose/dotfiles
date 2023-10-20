#!/bin/bash

zshrc="$HOME/.zshrc"

aliases="$HOME/dotfiles/.shalias"

# Check if .shalias file exists
if [ -f "$aliases" ]; then
    # Check if .zshrc already sources .shalias
    if grep -q ".shalias" "$zshrc"; then
        echo "The .zshrc file already sources .shalias. Exiting."
    fi

    # Add sourcing of .shalias to .zshrc
    echo "source $aliases" >> "$zshrc"
    echo ".shalias added to .zshrc."
else
    echo "The .shalias file does not exist. Please create it and add your aliases."
fi

shenvs="$HOME/dotfiles/.shenv"

# Check if .shenv file exists
if [ -f "$shenvs" ]; then
    # Check if .zshrc already sources .shenv
    if grep -q ".shenv" "$zshrc"; then
        echo "The .zshrc file already sources .shenv. Exiting."
        exit 1
    fi

    # Add sourcing of .shenv to .zshrc
    echo "source $shenvs" >> "$zshrc"
    echo ".shenv added to .zshrc."
else
    echo "The .shenv file does not exist. Please create it and add your shenvs."
    exit 1
fi


# Install vim Plug
cp -r ~/dotfiles/.vim ~/.vim
sudo curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.gitignore ~/.gitignore
ln -s ~/dotfiles/.gitmessage ~/.gitmessage

git config --global commit.template ~/.gitmessage
git config --global core.excludesfile ~/.gitignore


