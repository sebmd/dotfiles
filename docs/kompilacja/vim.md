# Vim

Pobranie aktualnej wersji z repozytorium git

```bash
git clone https://github.com/vim/vim
```

Skrypt do kompilacji

```bash
#!/bin/env bash

git pull

make distclean

./configure --prefix=/usr/local \
  --enable-python3interp='dynamic' \
  --with-python3-command='python3' \
  --with-x \
  --enable-gui=gtk3 \
  --enable-fontset \
  --enable-xim \
  --enable-gpm \
  --enable-acl \
  --enable-multibyte \
  --with-features=huge \
  --enable-cscope \
  --enable-luainterp='dynamic' \
  --with-compiledby='SebMD' | tee kompiluj.log

echo
read -p "Naciśnij [ENTER]"

make
sudo make install

which ntfy > /dev/null 2>&1
if [ "$?" = 0 ]; then
    ntfy send "Kompilacja zakończona"
else
    notify-send "Kompilacja zakończona"
fi
```
