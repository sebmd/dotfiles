# Kompilacja

- [kompilacja](docs/kompilacja/fontmatrix.md)

# DWM

```
dnf install libX11-devel
dnf install libXft-devel
dnf install libXinerama-devel
```

# ST

```
dnf install libX11-devel
dnf install libXft-devel
dnf install harfbuzz-devel
```

# clipnotify

- https://github.com/cdown/clipnotify

```
dnf install make
dnf install gcc
dnf install libXfixes-devel
```

```
curl -fLo "$HOME/git/src/clipnotify.tar.gz" --create-dirs \
    https://github.com/cdown/clipnotify/archive/master.tar.gz
cd "$HOME/git/src/"
mkdir clipnotify
tar zxvf clipnotify.tar.gz -C clipnotify --strip-components=1

# kompilacja clipnotify
cd clipnotify
make

# linki symboliczne do ~/bin/
mkdir -p $HOME/bin
ln -s $PWD/clipnotify $HOME/bin/

rm ../clipnotify.tar.gz
```
