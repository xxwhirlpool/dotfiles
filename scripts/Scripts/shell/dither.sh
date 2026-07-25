#!/usr/bin/env bash
#
# dither images in monochrome
#
# inspired by this blog:
# https://dead.garden/blog/how-my-images-are-dithered.html

if [[ "$#" -eq 0 ]]; then
	echo "usage: dither.sh [FILENAME]"
	exit 1
fi

# vars
img="$1"
imgorig="${img%.*}_orig.${img##*.}"
imgnew="${img%.*}_dither.${img##*.}"

# cp img so there's a backup
cp "$img" "$imgorig"

# pick color palette as
# described in filenames
palette=$(gum file "./dither")

# do the conversion
magick "$imgorig" -resize 800 -set option:distort:viewport '%wx%h+0+0' -colorspace CMYK -separate null: \( -size 2x2 xc: \( +clone -negate \) +append \( +clone -negate \) -append \)  -virtual-pixel tile -filter gaussian  \( +clone -distort SRT 1,0 \) +swap  \( +clone -distort SRT 1,15 \) +swap   \( +clone -distort SRT 1,45 \) +swap  \( +clone -distort SRT 1,75 \) +swap +delete -compose Overlay -layers composite -set colorspace CMYK -combine -remap "$palette" -colors 32 "$imgnew"
