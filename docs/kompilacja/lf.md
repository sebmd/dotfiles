# lf

- `lf` https://github.com/gokcehan/lf

```bash
#!/usr/bin/bash

URL=https://github.com/gokcehan/lf
NAME=lf

TAG=$(git ls-remote --tags $URL \
  | cut -f 2 | cut -f 3 -d '/' | sort -V | tail -n 1 | sed 's/\^{}//')
wget -O $NAME.tgz -q $URL/archive/$TAG.tar.gz
mkdir $NAME
tar zxvf $NAME.tgz -C $NAME --strip-components=1
cd $NAME
go build
```
