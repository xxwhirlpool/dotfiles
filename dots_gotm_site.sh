#!/usr/bin/env bash

dots_home="/home/kat/dotfiles"
orange_var="ef9f76"
pink_var="f08eca"

build_site() {
	# build
	pgit --revs main --repo "/home/kat/dotfiles" --label dots --out ./public --theme catppuccin-frappe
	# replace orange with pink
	sed -i "s/$orange_var/$pink_var/g" "./public/vars.css"
}

sync_site() {
	# deploy to pgs.sh
	rsync --delete -rv ./public/ pgs.sh:/dots
	# delete public/ folder in dotfiles dir
	rm -rf /home/kat/dotfiles/public/
}

case "$1" in
	"") cd "$dots_home" && build_site && sync_site;;
esac
