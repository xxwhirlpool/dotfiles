#!/bin/bash

# get last.fm API key
if [ -f ~/.privatevars ]; then                                                                               
  . ~/.privatevars                                                                                         
fi

user="springpool"
URL="https://ws.audioscrobbler.com/2.0/?method=user.getrecenttracks&user=$user&api_key=$LASTFM_APIKEY&format=json&limit=1"

artist=$(curl -s ${URL} | jq -r '.recenttracks.track[0].artist."#text"')
album=$(curl -s ${URL} | jq -r '.recenttracks.track[0].album."#text"')
song=$(curl -s ${URL} | jq -r '.recenttracks.track[0].name')

printf "$artist"

printf "\n$album\n$song"
