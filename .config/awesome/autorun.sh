#!/usr/bin/env bash

function run {
if ! pgrep -f $1 ; then
    $@&
fi
}

run picom -cCGfF -o 0.38 -O 200 -I 200 -t 0 -l 0 -r 3 -D2 -m 0.88 --xrender-sync-fence --backend glx --vsync  # --backend xrender
run nm-applet
run volumeicon
run variety
