#!/bin/bash

notify-send -t 3000 "Playing Video" "$(xclip -o)";
mpv --ytdl-format="bestvideo*[height<=1080]+bestaudio/best" "$(xclip -o)"
