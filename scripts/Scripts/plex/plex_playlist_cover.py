#!/usr/bin/env -S uv run --script
# /// script
# requires-python = ">=3.14"
# dependencies = [
#     "plexapi>=4.18.1",
# ]
# ///

# USAGE: plex_playlist_cover.py [TOKEN]
#
# download all CURRENTLY SELECTED playlist posters/covers
# posters are named after the playlists

from plexapi.server import PlexServer
from plexapi.utils import download
from plexapi.mixins import PlaylistMixins
import sys

SERVER_URL = "http://192.168.1.219:32400"
TOKEN = sys.argv[1]

plex = PlexServer(SERVER_URL, TOKEN)

for plist in plex.playlists(playlistType="audio"):
    list_title = plist.title
    posters = PlaylistMixins.posters(plist)
    filtered_posters = list(filter(lambda x: x.selected == True, posters))
    for po in filtered_posters:
        po_img = po.thumb
        po_img_todl = SERVER_URL + po_img
        download(po_img_todl, TOKEN, list_title + ".png", "posters/") # img to download, token so it can dl, filename, folder to dl to
