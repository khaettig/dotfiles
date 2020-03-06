#!/bin/sh

install() {
    FILE=$1
    if test -f ~/.$FILE; then
        echo "Moving existing file ~/.$FILE to ~/.${FILE}_old"
        mv ~/.$FILE ~/.${FILE}_old
    fi

    echo "Creating soft link for .$FILE"
    ln -s $(pwd)/$FILE ~/.$FILE
}

install vimrc
install bashrc
install pylintrc
install pdbrc.py
install tmux.conf
