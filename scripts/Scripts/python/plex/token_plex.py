#!/usr/bin/env -S uv run --script
# /// script
# requires-python = ">=3.14"
# dependencies = [
#     "plexapi>=4.18.1",
# ]
# ///

# USAGE: token_plex.py [TOKEN]
#
# get the temporary plex token

from plexapi.myplex import MyPlexAccount
import getpass
import sys

u = input("plex username: ")
p = getpass.getpass("plex password: ")

acc = MyPlexAccount(u, p)

print("\n" + acc.authenticationToken)
