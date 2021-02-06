#!/usr/bin/env bash

shopt -s nocasematch

DOTFILES_DIR=$HOME/git/github/dotfiles
WORK_DIR=$(dirname $DOTFILES_DIR)

function get_archive() {
    mkdir -p $DOTFILES_DIR
    curl https://git.io/JkIaZ -fLo $WORK_DIR/dotfiles.tgz
    cd $WORK_DIR
    tar zxvf dotfiles.tgz -C $DOTFILES_DIR --strip-components=1
    rm dotfiles.tgz
}

function get_git() {
    mkdir -p $WORK_DIR
    cd $WORK_DIR
    git clone https://github.com/sebmd/dotfiles
}

read -p "Czy pobrać dotfiles jako repozytorium GIT? [T/n]: "
case $REPLY in
    t)
        get_git
        ;;
    n)
        get_archive
        ;;
    *)
        get_git
        ;;
esac

read -p "Uruchomić skrypt instalacyjny? [T/n]: "
case $REPLY in
    t)
        cd $DOTFILES_DIR
        $DOTFILES_DIR/install.sh
        ;;
    n)
        exit 0
        ;;
    *)
        cd $DOTFILES_DIR
        $DOTFILES_DIR/install.sh
        ;;
esac
