# Neovim

```bash
#!/usr/bin/env bash

git pull
make clean
sudo rm -rf build
make CMAKE_BUILD_TYPE=Release
make CMAKE_INSTALL_PREFIX=$HOME/.local/nvim install
sudo make CMAKE_INSTALL_PREFIX=/opt/nvim install
```
