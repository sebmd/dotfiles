#!/usr/bin/env bash

sxhkd &
xsetroot -solid black &
 polybar example &
nm-applet &
 dunst &
picom -cCGfF -o 0.38 -O 200 -I 200 -t 0 -l 0 -r 3 -D2 -m 0.88 --xrender-sync-fence --backend xrender &
alacritty --class alacritty,terminal &
