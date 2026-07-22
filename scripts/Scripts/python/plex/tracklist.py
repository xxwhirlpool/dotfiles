#!/usr/bin/env -S uv run --script
# /// script
# requires-python = ">=3.14"
# dependencies = [
#     "plexapi>=4.18.1",
# ]
# ///

# USAGE: tracklist.py [TOKEN]

from plexapi.server import PlexServer
from os import sys

SERVER_URL = "http://192.168.1.219:32400"
TOKEN = sys.argv[1]

plex = PlexServer(SERVER_URL, TOKEN)

for list in plex.playlists(playlistType="audio"):
    listTitle = list.title
    items = list.items()
    pl_file = open("playlists/" + listTitle + ".txt", "w")
    for i in items:
        title = i.title
        artist = i.originalTitle
        albumArtist = i.grandparentTitle
        if artist == None:
            artist = albumArtist + " - "
        else:
            artist = i.originalTitle + " - "
        pl_file.write(artist + title + "\n")
    pl_file.close()
