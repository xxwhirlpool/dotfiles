import urllib.request
import json
url = 'https://ws.audioscrobbler.com/2.0/?method=user.getrecenttracks&user=${USER}&api_key=${USER}&format=json&limit=1'
req = urllib.request.Request(url)

slay = urllib.request.urlopen(req).read()
stuff = json.loads(slay.decode('utf-8'))

for item in stuff['recenttracks']['track'][:1]:
    print(item['artist']['#text'],"\n ", item['album']['#text'],"\n ", item['name'])
