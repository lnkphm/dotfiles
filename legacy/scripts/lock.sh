#!/bin/bash

tmpbg='/tmp/screen.png'
rm "$tmpbg"
scrot "$tmpbg"
convert "$tmpbg" -filter Gaussian -blur 0x8 "$tmpbg"
i3lock -u -i "$tmpbg"
