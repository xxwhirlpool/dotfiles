## for optiplex 9020 server

run with following cron job on the server:

```bash
*/30 * * * * cd /home/kat/pjs && /usr/bin/docker compose run --rm pjs /home/kat/pjs/entrypoint.sh && /home/kat/pjs/rsync.sh >> /home/kat/pjs/test2.log 2>&1
```
