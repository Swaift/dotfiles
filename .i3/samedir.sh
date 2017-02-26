#!/bin/bash

# run ARGV, with -cd FOLDER if FOLDER can be extracted from title of current
# window (see zsh config for how the title gets put in the window)

# http://superuser.com/a/403369/77814
quoted_args="$(printf " %q" "$@")"

# inspired by
# https://faq.i3wm.org/question/150/how-to-launch-a-terminal-from-here/%3C/p%3E.html
ID=$(xdpyinfo | grep focus | cut -d ',' -f1 | rev | cut -d ' ' -f1 | rev)
CLASS=$(xprop -id "$ID" | grep -m1 WM_CLASS | cut -d'"' -f2)

# http://stackoverflow.com/a/19411918
if [ "${CLASS^^}" != "URXVT" ]
then
  # no urxvt focused -- just do the default
  # optionally we could try to extract the pwd with
  # https://github.com/schischi-a/xcwd or something
  exec $quoted_args
fi

TITLE=$(xprop -id "$ID" | grep -m1 WM_NAME)
MYPWD=$(echo "$TITLE" | cut -d'$' -f1 | cut -d'"' -f2- | cut -d':' -f2-)
MYPWD2="${MYPWD/#\~/$HOME}"

if [ ! -z "$MYPWD2" -a -d "$MYPWD2" -a -r "$MYPWD2" -a -x "$MYPWD2" ]
then 
  exec $quoted_args -cd "$MYPWD2"
else
  exec $quoted_args
fi
