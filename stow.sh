#!/bin/bash

echo "pulling from git..." | gum style --foreground "#f4b8e4" --border none

git pull dotfiles main

echo "git pull complete!" | gum style --foreground "#f4b8e4" --border none

echo "stowing your shit..." | gum style --foreground "#f4b8e4" --border none

stow --adopt -v -R -t ~ "config"

stow --adopt -v -R -t ~ "git"

stow --adopt -v -R -t ~ "scripts"

echo "done ^_^" | gum style --foreground "#f4b8e4" --border none
