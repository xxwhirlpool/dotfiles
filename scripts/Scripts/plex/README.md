# plex server management

tracking my plex library & stuff

## tracklist.py

- exports playlist tracklists to `~/Scripts/plex/playlists`
- each filename is the title of the playlist + `.txt`
- each track is formatted as `Artist - Song`
- only works for music playlists
- no track numbers; add them with `cat -n [FILENAME]`

### usage

```bash
tracklist.py [TOKEN]
```

## cover.py

- exports to `~/Scripts/plex/posters`
- each filename is the name of the playlist + `.png`
- exports in full original resolution

### usage

```bash
cover.py [TOKEN]
```

## m3u.py

- exports to `~/Scripts/plex/playlists_m3u`
- each filename is the name of the playlist + `.m3u`
- song file paths are absolute paths from the server they're hosted on

### usage

```bash
m3u.py [TOKEN]
```
