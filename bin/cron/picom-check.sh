#!/bin/bash

ps ax | grep picom | grep -v grep
if [ $? -ne  0 ]; then
    /usr/bin/picom &
fi
