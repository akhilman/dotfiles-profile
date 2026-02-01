#!/bin/sh
if command -v cliphist > /dev/null; then
  last_cliphist_id=$(cliphist list | head -n 1 | cut -f1)
fi
if [ -z "$last_cliphist_id" ]; then
  last_cliphist_id=-1
fi

if [ x$XDG_SESSION_DESKTOP = xgnome ] && command -v gpaste-client > /dev/null; then
  gpaste-client add-password "$1"
elif [ x$TERM = xxterm-kitty ] && command -v kitten > /dev/null; then
  kitten clipboard
elif [ x$XDG_SESSION_TYPE = xwayland ] && command -v wl-copy > /dev/null; then
  wl-copy
fi

if command -v cliphist > /dev/null; then
  sleep 1
  for id in $(cliphist list | head -n 10 | cut -f1); do
    if [ $id -gt $last_cliphist_id ]; then
      echo $id | cliphist delete
    fi
  done
fi &
