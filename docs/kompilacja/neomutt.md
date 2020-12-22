# Neomutt

- `neomutt` https://github.com/neomutt/neomutt

Wersja binarna wymaga zainstalowania kilku dodatkowych pakietów:

```bash
sudo dnf install kyotocabinet-libs compat-gdbm-libs qdbm libidn \
    notmuch
```

Do kompilacji wymagane są następujące pakiety

```bash
sudo dnf install docbook-utils docbook-style-xsl gpgme-devel cyrus-sasl-devel \
  notmuch-devel gnutls-devel libidn-devel libdb-devel compat-gdbm-devel \
  lmdb-devel kyotocabinet-devel qdbm-devel krb5-devel lua-devel sqlite-devel \
  ncurses-devel
```

Pobranie ostatniego wydania

```bash
#!/usr/bin/env bash

URL=https://api.github.com/repos/neomutt/neomutt/releases/latest
NAME=neomutt

mkdir $NAME
curl -s $URL \
  | grep tarball_url \
  | cut -d '"' -f 4 \
  | wget -O $NAME.tgz -qi -

tar zxvf $NAME.tgz -C $NAME --strip-components=1
rm $NAME.tgz
```

Kompilacja

```bash
./configure --enable-ssl --enable-gpgme --notmuch \
  --gnutls --enable-gss --sasl --bdb --gdbm \
  --kyotocabinet --lmdb --qdbm --sqlite --autocrypt \
  --lua --homespool

make clean
make

sudo make install
```
