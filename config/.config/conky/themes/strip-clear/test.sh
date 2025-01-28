#!/bin/bash

phantomjs --debug=yes --ignore-ssl-errors=true --ssl-protocol=TLSv1.1 --web-security=true /usr/local/share/phantomjs-1.9.8-linux-x86_64/examples/rasterize.js "http://wttr.in/New_York?0pqT" /home/kat/.config/conky/wttr.png

magick /home/kat/.config/conky/wttr.png -crop 460x460+0+0 -transparent black /home/kat/.config/conky/wttr.png
