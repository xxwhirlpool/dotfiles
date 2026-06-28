# `urlref`

inspired by [urlref](https://benjaminhollon.com/musings/urlref/) by benjamin hollon, but rewritten as a simple perl script.

the script takes a URL and saves it in a file with a generated 5-character alphanumeric code (all uppercase, for less confusion when writing it down). when you want to search for a URL by its code, you use the `--get-code` argument.

## usage

run `urlref.pl` without any arguments to bookmark a URL. the script accepts this through `STDIN`, and will output the code attached to the URL. both the code and the URL are saved on the same line (separated by a space) in `links.txt` in the same directory as the script.

to find a URL with a code, use the `--get-code` argument. for example:

```pl
./urlref --get-code AKB48
```

this will return the matching code and URL.
