#!/bin/bash

cd /home/kat/.config/conky && curl -s "http://wttr.in/New+York?0pqT" | tail -n +2 | magick -size 460x460 xc:black -font "JetBrainsMonoNF-Nerd-Font-Regular" -pointsize 15 -fill "#c6d0f5" -transparent black -annotate +0+0 "@-" wttr.png

DISPLAY=:0 conky -c /home/kat/.config/conky/themes/strip-clear/dark-strip-l-clear-1920-1080.conf
