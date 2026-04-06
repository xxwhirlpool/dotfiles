# plex server management

tracking my plex library & stuff

## plex_playlists.py

- exports to `~/Scripts/plex/playlists`
- each filename is the title of the playlist + `.txt`
- each track is formatted as `Artist - Song`
- only works for music playlists
- no track numbers; add them with `cat -n [FILENAME]`

### usage

```bash
plex_playlist.py [TOKEN]
```
