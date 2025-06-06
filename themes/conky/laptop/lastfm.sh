#!/bin/bash

URL="https://ws.audioscrobbler.com/2.0/?method=user.getrecenttracks&user=${USER}&api_key=${API_KEY}&format=json&limit=1"

artist=$(curl -s ${URL} | jq -r '.recenttracks.track[0].artist."#text"')
track=$(curl -s ${URL} | jq -r '.recenttracks.track[0].name')
art=$(curl -s $URL | jq -r '.recenttracks.track[0].image[2]."#text"')

tmp="/tmp"
img_path="$tmp/lastfm-conky.png"

getimg() {
	if [ -n "$art" ]; then
		if [[ "$art" = http* ]] || [[ "$art" = file:* ]]; then
			curl -s "$art" -o "$img_path"
		elif [ -f "$art" ]; then
			cp "$art" "$img_path"
		else
			echo "something wrong with art"
			exit 1
		fi
	fi
}

showimg() {
	getimg
	if [ -f "$img_path" ] && [ "$(wc -c "$img_path" | awk '{print $1}')" -gt 0 ]; then
		echo "\${image $img_path -p 0,0 -s 125x125 -n}"
	else
		echo "\${image ./placeholder.png -p 0,0 -s 125x125}"
	fi
}

if [ "$1" == "artist" ]; then
	echo $artist
elif [ "$1" == "track" ]; then
	echo $track
elif [ "$1" == "art" ]; then
	showimg
else
	exit 1
fi
