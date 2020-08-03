#!/bin/bash

KATALOG=$(readlink -f "$1")
tree -L 1 $KATALOG
