#!/usr/bin/env -S uv run --script
# /// script
# requires-python = ">=3.14"
# dependencies = [
#     "plexapi>=4.18.1",
# ]
# ///

# USAGE: plex_playlist.py [TOKEN IN QUOTES]
# this is such script kiddie shit idk python

from plexapi.server import PlexServer
from plexapi.playlist import Playlist
from os import sys

SERVER_URL = "http://192.168.1.219:32400"
TOKEN = sys.argv[1]

plex = PlexServer(SERVER_URL, TOKEN)

print("title, album, artist" + "\n")

for list in plex.playlists(playlistType="audio"):
    listTitle = list.title
    items = list.items()
    pl_file = open(listTitle, "w")
    for i in items:
        title = i.title
        artist = i.originalTitle
        albumArtist = i.grandparentTitle
        if artist == None:
            artist = albumArtist + " - "
        pl_file.write(artist + title + "\n")
    pl_file.close()
