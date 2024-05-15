#!/bin/bash

# cd into root directory and create subdirectories
cd '/home/msozod/Pictures/Screenshots'
subdir=$(printf '%(%Y/%m)T\n' -1)
mkdir -p "${subdir}"; cd "${subdir}"

# ss
scrot -q 100 -s -f -e 'xclip -selection clipboard -t image/png -i $f'
