phantomjs --ignore-ssl-errors=true --ssl-protocol=any --web-security=true /usr/local/share/phantomjs-1.9.8-linux-x86_64/examples/rasterize.js http://wttr.in/New_York?0pqT /tmp/wttr.png

magick /tmp/wttr.png -crop 460x460+0+0 -transparent black /tmp/wttr.png
