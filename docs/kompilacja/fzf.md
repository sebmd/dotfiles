# fzf

- `fzf` https://github.com/junegunn/fzf

```bash
#!/usr/bin/bash

TAG=$(git ls-remote --tags https://github.com/junegunn/fzf \
  | cut -f 2 | cut -f 3 -d '/' | sort -V | tail -n 1 | sed 's/\^{}//')
wget -O fzf-$TAG.tgz -q https://github.com/junegunn/fzf/archive/$TAG.tar.gz
mkdir fzf
tar zxvf fzf-$TAG.tgz -C fzf --strip-components=1
rm fzf-$TAG.tgz
cd fzf
go build
```
