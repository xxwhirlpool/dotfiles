#!/usr/bin/env bash

die() {
	echo "canceled" && exit 1
}

rollslug=$(gum input --placeholder "enter slug") || die
rollurl=$(gum input --placeholder "enter url") || die
rollfeed=$(gum input --placeholder "enter feed url") || die
rollname=$(gum input --placeholder "enter name") || die
rolltype=$(gum input --placeholder "enter type") || die

if [[ -z "$rollslug" || -z "$rollurl" || -z "$rollname" || -z "$rolltype" ]]; then
	die
fi

cat << EOF >> /home/kat/Projects/mine/eunoia-astro/src/content/blogroll/blogs.yml
- slug: $rollslug
  url: "$rollurl"
  feed: "$rollfeed"
  name: "$rollname"
  type: $rolltype
EOF
