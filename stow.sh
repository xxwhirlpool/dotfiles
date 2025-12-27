#!/usr/bin/env bash

updategit() {
	echo "pulling from git..." | gum style --foreground "#f4b8e4" --border none
	git pull bytes main
	echo "git pull complete!" | gum style --foreground "#f4b8e4" --border none
	echo "stowing your shit..." | gum style --foreground "#f4b8e4" --border none
	stow -v -t ~ "config" --adopt
	stow -v -t ~ "scripts" --adopt
	echo "done ^_^" | gum style --foreground "#f4b8e4" --border none
}

localstow() {
	stow -v -t ~ "config" --adopt
	stow -v -t ~ "scripts" --adopt
}

usage() {
	if [ $# -eq 0 ]; then
		echo -e "Usage: stow.sh [OPTIONS]\n"
		echo -e "pull from git ,[-L|--local]\nsymlink local files ,[-U|--update]" | column -t -s','
	fi
}

case "$1" in
	"" | "-h" | "--help" | "help")
		usage
		;;
	"-L" | "--local")
		localstow
		;;
	"-U" | "--update")
		updategit
		;;
esac
