local:
  stow -v -t ~ "config" --adopt
  stow -v -t ~ "scripts" --adopt

pull:
  git pull bytes main
  stow -v -t ~ "config" --adopt
  stow -v -t ~ "scripts" --adopt

site:
  git pull bytes main
  ./dots_gotm_site.sh
