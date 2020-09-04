#!/usr/bin/env bash

DOTFILES_DIR=$HOME/git/github/dotfiles
WORK_DIR=$(dirname $DOTFILES_DIR)

curl https://git.io/JUvRG -fLo $WORK_DIR/dotfiles.zip --create-dirs
cd $WORK_DIR
unzip dotfiles.zip
rm dotfiles.zip
mv dotfiles-master dotfiles

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
