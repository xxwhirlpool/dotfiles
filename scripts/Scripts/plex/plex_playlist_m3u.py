#!/usr/bin/env -S uv run --script
# /// script
# requires-python = ">=3.14"
# dependencies = [
#     "plexapi>=4.18.1",
# ]
# ///

# USAGE: plex_playlist_m3u.py [TOKEN]
#
# download all playlists as M3U files

from plexapi.server import PlexServer
import sys

SERVER_URL = "http://192.168.1.219:32400"
TOKEN = sys.argv[1]

plex = PlexServer(SERVER_URL, TOKEN)

for plist in plex.playlists(playlistType="audio"):
    list_title = plist.title
    list_items = plist.items()
    m3u = open("playlists_m3u/" + list_title + ".m3u", "w")
    m3u.write("#EXTM3U\n")
    for i in list_items:
        loc = i.locations
        for l in loc:
            m3u.write(l + "\n")
    m3u.close()
