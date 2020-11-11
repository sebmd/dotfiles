#!/usr/bin/env bash

DOTFILES_DIR=$HOME/git/github/dotfiles
WORK_DIR=$(dirname $DOTFILES_DIR)

mkdir -p $DOTFILES_DIR
curl https://git.io/JkIaZ -fLo $WORK_DIR/dotfiles.tgz
cd $WORK_DIR
tar zxvf dotfiles.tgz -C $DOTFILES_DIR --strip-components=1
rm dotfiles.tgz

echo -n "Uruchomić skrypt instalacyjny? [T/n]: "
read ODP
case $ODP in
    t|T)
        cd $DOTFILES_DIR
        $DOTFILES_DIR/install.sh
        ;;
    n|N)
        ;;
    *)
        cd $DOTFILES_DIR
        $DOTFILES_DIR/install.sh
        ;;
esac
