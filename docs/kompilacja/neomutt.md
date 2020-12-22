# Neomutt

- `neomutt` https://github.com/neomutt/neomutt

Wymagane doinstalowanie dodatkowych pakietów

```
sudo dnf install kyotocabinet-libs compat-gdbm-libs qdbm libidn \
    notmuch
```

```bash
./configure --enable-ssl --enable-gpgme --notmuch \
  --gnutls --enable-gss --sasl --bdb --gdbm \
  --kyotocabinet --lmdb --qdbm --sqlite --autocrypt \
  --lua --homespool

make clean
make

sudo make install
```
