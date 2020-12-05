# bat

- `bat` https://github.com/sharkdp/bat

```bash
#!/usr/bin/env bash

TAG=$(git ls-remote --tags https://github.com/sharkdp/bat \
    | cut -f 2 | cut -f 3 -d '/' | sort -V | tail -n 1 | sed 's/\^{}//')
wget -O bat-$TAG.tgz -q https://github.com/sharkdp/bat/archive/$TAG.tar.gz
mkdir bat
tar zxvf bat-$TAG.tgz -C bat --strip-components=1
rm bat-$TAG.tgz
cd bat
cargo build --release
```
