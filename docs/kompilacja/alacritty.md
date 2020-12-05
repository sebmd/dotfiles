# alacritty

- `alacritty` https://github.com/alacritty/alacritty 

Do kompilacji terminala alacitty wymagane są dodatkowe pakiety: cmake,
freetype-devel, fontconfig-devel, libxcb-devel.

```bash
$ sudo dnf install cmake freetype-devel fontconfig-devel libxcb-devel

$ git clone https://github.com/alacritty/alacritty --depth 1
$ cd alacritty
$ cargo build --release
```
