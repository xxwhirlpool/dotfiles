### i don't use this anymore (i replaced it with a curl command piped to imagemagick. felt like a god doing that.) but keeping here just in case...

## for optiplex 9020 server

run with following cron job on the server:

```bash
*/30 * * * * cd /home/kat/pjs && /usr/bin/docker compose run --rm pjs /home/kat/pjs/entrypoint.sh && /home/kat/pjs/rsync.sh >> /home/kat/pjs/test2.log 2>&1
```
