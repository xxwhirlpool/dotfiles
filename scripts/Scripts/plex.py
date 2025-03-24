from plexapi.server import PlexServer
from plexapi.myplex import MyPlexAccount

SERVER_URL = 'http://192.168.1.123:32400'
TOKEN = 'x'
PLAYLIST_TITLE = 'watchlistexport1'
USERNAME = "x"
PASSWORD = "x"

plex = PlexServer(SERVER_URL, TOKEN)
account = MyPlexAccount(USERNAME, PASSWORD)

item = account.watchlist(libtype='movie')

for item in account.watchlist():
  plex.library.search(guid=item.guid)
  for lol in item:
    tada = item.title
  
  for help in plex.library.search(tada, libtype='movie'):
    print(help.media[0].parts[0].file)
