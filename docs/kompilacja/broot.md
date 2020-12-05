# broot

- `broot` https://github.com/Canop/broot

```bash
#!/usr/bin/env bash


TAG=$(git ls-remote --tags https://github.com/Canop/broot \
  | cut -f 2 | cut -f 3 -d '/' | sort -V | tail -n 1 | sed 's/\^{}//')
wget -O broot-$TAG.tgz -q https://github.com/Canop/broot/archive/$TAG.tar.gz
mkdir broot
tar zxvf broot-$TAG.tgz -C broot --strip-components=1
rm broot-$TAG.tgz
cd broot
cargo build --release
```
