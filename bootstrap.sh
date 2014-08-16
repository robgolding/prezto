#!/bin/bash

SCRIPT_PATH=$(cd "$(dirname "$0")"; pwd);

git submodule update --init

if [ ! -e ~/.zprezto ]; then
    ln -s $SCRIPT_PATH ~/.zprezto
elif [ -L ~/.zprezto ]; then
    rm ~/.zprezto
    ln -s $SCRIPT_PATH ~/.zprezto
else
    echo "Error: File exists and is not a symlink: ~/.zprezto"
fi

for file in zlogin zlogout zpreztorc zprofile zshenv zshrc; do
    if [ ! -e ~/.$file ]; then
        ln -s $SCRIPT_PATH/runcoms/$file ~/.$file
    elif [ -L ~/.$file ]; then
        echo "Replacing symlink: ~/.$file"
        rm ~/.$file
        ln -s $SCRIPT_PATH/runcoms/$file ~/.$file
    else
        echo "Error: File exists and is not a symlink: ~/.$file"
    fi
done
