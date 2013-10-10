#!/bin/bash

# vol.sh
# a simple bash script for controlling volume settings on a Mac
# with help from https://coderwall.com/p/22p0ja
# - chris <ctb@fourone.org>

get () {
  mute=`/usr/bin/osascript -e 'output muted of (get volume settings)'`
  volume=`/usr/bin/osascript -e 'output volume of (get volume settings)'`
  printf "Volume is $volume (Muted: $mute).\n\n"
}

set () {
  volume=$1
  /usr/bin/osascript -e 'set volume output muted false'
  /usr/bin/osascript -e "set volume output volume ${1}"
}

mute () {
  /usr/bin/osascript -e 'set volume output muted true'
}

unmute () {
  /usr/bin/osascript -e 'set volume output muted false'
}


if [[ $1 == "get" ]]; then
  get
elif [[ $1 == "set" ]]; then
  set $2
  get
elif [[ $1 == "mute" ]]; then
  mute
  get
elif [[ $1 == "unmute" ]]; then
  unmute
  get
else
  get
  printf 'Use `get` or `set N` to get or set volume levels.\n'
  printf 'Also `mute` and `unmute` work too.\n\n'
fi
