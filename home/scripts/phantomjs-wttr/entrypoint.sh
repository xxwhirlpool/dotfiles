#!/bin.bash

phantomjs --ignore-ssl-errors=true --ssl-protocol=any --web-security=true /raster-root/rasterize.js http://wttr.in/New_York?0pqT /raster-output/wttr.png && magick /raster-output/wttr.png -crop 460x460+0+0 -transparent black /raster-output/wttr.png
