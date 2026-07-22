#!/bin/bash
#
# quick script to make variants for animated retrospring icons or headers and direct upload to replace a user's existing ones. good for when a user wants to use a specific gif but carrierwave processing glitches it somehow
#
# deps: charmbracelet/gum, imagemagick

filename=$(gum input --placeholder "without an extension")

echo -e "header or icon \n"

CHOOSE=$(gum choose --limit 1 "header" "icon")

echo -e "you chose ${CHOOSE} \n"

echo -e "making dirs \n"

if [ "${CHOOSE}" == "header" ]; then
	mkdir web mobile retina original
elif [ "${CHOOSE}" == "icon" ]; then
	mkdir large medium small original
else
	echo -e "mkdir failed for some reason"
fi

echo -e "dirs made \n"

echo -e "copying original from workdir to dedicated folder \n"

cp ./$filename.gif ./original/$filename.gif

echo -e "move done \n"

ORIGW=$(identify -format '%w' ./original/$filename.gif[0])
ORIGH=$(identify -format '%h' ./original/$filename.gif[0])

echo -e "making mobile version \n"

if [ "${CHOOSE}" == "header" ]; then
	magick -size $ORIGWx$ORIGH^ ./original/$filename.gif -coalesce -resize 450x105^ /tmp/tmp-header-mobile.gif && magick /tmp/tmp-header-mobile.gif -gravity center -crop 450x105+0+0 +repage ./mobile/$filename.gif
	
	echo -e "mobile done \n"

	echo -e "making retina version \n"

	magick -size $ORIGWx$ORIGH^ ./original/$filename.gif -coalesce -resize 900x210^ /tmp/tmp-header-retina.gif && magick /tmp/tmp-header-retina.gif -gravity center -crop 900x210+0+0 +repage ./retina/$filename.gif

	echo -e "retina done \n"

	echo -e "making web version \n"

	magick -size $ORIGWx$ORIGH^ ./original/$filename.gif -coalesce -resize 1500x350^ /tmp/tmp-header-web.gif && magick /tmp/tmp-header-web.gif -gravity center -crop 1500x350+0+0 +repage ./web/$filename.gif

	echo -e "web done \n"
elif [ "${CHOOSE}" == "icon" ]; then
	magick -size $ORIGWx$ORIGH^ ./original/$filename.gif -coalesce -resize 80x80^ /tmp/tmp-icon-small.gif && magick /tmp/tmp-icon-small.gif -gravity center -crop 80x80+0+0 +repage ./small/$filename.gif
	
	echo -e "small done \n"

	echo -e "making medium version \n"

	magick -size $ORIGWx$ORIGH^ ./original/$filename.gif -coalesce -resize 256x256^ /tmp/tmp-icon-medium.gif && magick /tmp/tmp-icon-medium.gif -gravity center -crop 256x256+0+0 +repage ./medium/$filename.gif

	echo -e "medium done \n"

	echo -e "making large version \n"

	magick -size $ORIGWx$ORIGH^ ./original/$filename.gif -coalesce -resize 500x500^ /tmp/tmp-icon-large.gif && magick /tmp/tmp-icon-large.gif -gravity center -crop 500x500+0+0 +repage ./large/$filename.gif

	echo -e "large done \n"
else
	echo -e "img creation failed for some reason idk"
fi

echo -e "script done"
