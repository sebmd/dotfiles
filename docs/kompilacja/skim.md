# skim (sk)

- `sk` https://github.com/lotabout/skim

```bash
#!/usr/bin/env bash

URL=https://github.com/lotabout/skim
NAME=skim

TAG=$(git ls-remote --tags $URL \
  | cut -f 2 | cut -f 3 -d '/' | sort -V | tail -n 1 | sed 's/\^{}//')
wget -O $NAME.tgz -q $URL/archive/$TAG.tar.gz
mkdir $NAME
tar zxvf $NAME.tgz -C $NAME --strip-components=1
rm $NAME.tgz
cd $NAME
cargo build --release
```
