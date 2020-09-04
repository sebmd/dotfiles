#!/usr/bin/env bash

if [ $# -eq 0 ]; then
    ARG="."
else
    ARG="$@"
fi

exa $ARG -al --group-directories-first --git --header
