#!/bin/bash
#
# only snippets of my bashrc

alias nano=micro
alias sudo="sudo "

eval "$(starship init bash)"

export PATH=$PATH:/usr/local/go/bin

# timer pomodoro thing by bashbunni
declare -A pomo_options
pomo_options=(
	["quick"]="15"
    ["work"]="45"
    ["break"]="20"
)

pomodoro () {
  if [ -n "$1" -a -n "{pomo_options["$1"]}" ]; then
  val=$1;
  timer "${pomo_options["$val"]}m"
  notify-send "'$val' session done" && spd-say -t female3 -r +35 "'$val' session done"
  fi
}

alias quick="pomodoro 'quick'"
alias work="pomodoro 'work'"
alias break="pomodoro 'break'"
