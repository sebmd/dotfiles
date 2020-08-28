#!/usr/bin/env bash

curl https://git.io/JUvRG -fLo $HOME/git/dotfiles.zip --create-dirs
cd $HOME/git
unzip dotfiles.zip
rm dotfiles.zip
mv dotfiles-master dotfiles

echo -n "Uruchomić skrypt instalacyjny? [T/n]: "
read ODP
case $ODP in
    t|T)
        ./install.sh
        ;;
    n|N)
        ;;
    *)
        ./install.sh
        ;;
esac
