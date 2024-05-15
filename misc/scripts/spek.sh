#!/bin/bash

file=$1
ffmpeg -i "$file" -lavfi showspectrumpic=s=4096x2048 "$1_spek.png"