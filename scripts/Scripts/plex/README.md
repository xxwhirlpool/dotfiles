# plex server management

tracking my plex library & stuff

## plex_playlists.py

- exports playlist tracklists to `~/Scripts/plex/playlists`
- each filename is the title of the playlist + `.txt`
- each track is formatted as `Artist - Song`
- only works for music playlists
- no track numbers; add them with `cat -n [FILENAME]`

### usage

```bash
plex_playlist.py [TOKEN]
```

## plex_playlists_cover.py

- exports to `~/Scripts/plex/posters`
- each filename is the name of the playlist + `.png`
- exports in full original resolution

### usage

```bash
plex_playlist_cover.py [TOKEN]
```

## plex_playlist_m3u.py

- exports to `~/Scripts/plex/playlists_m3u`
- each filename is the name of the playlist + `.m3u`
- song file paths are absolute paths from the server they're hosted on

### usage

```bash
plex_playlist_m3u.py [TOKEN]
```
