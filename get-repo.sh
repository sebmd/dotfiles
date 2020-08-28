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
        cd $HOME/git/dotfiles
        $HOME/git/dotfiles/install.sh
        ;;
    n|N)
        ;;
    *)
        cd $HOME/git/dotfiles
        $HOME/git/dotfiles/install.sh
        ;;
esac
