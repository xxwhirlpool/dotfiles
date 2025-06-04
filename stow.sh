#!/bin/bash

echo "pulling from git..." | gum style --foreground "#f4b8e4" --border none

git pull srht main

echo "git pull complete!" | gum style --foreground "#f4b8e4" --border none

echo "stowing your shit..." | gum style --foreground "#f4b8e4" --border none

stow -v -t ~ "config" --adopt

stow -v -t ~ "scripts" --adopt 

echo "done ^_^" | gum style --foreground "#f4b8e4" --border none
