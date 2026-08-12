#!/bin/sh
if [ x$XDG_SESSION_DESKTOP = xgnome ] && command -v gpaste-client > /dev/null; then
  gpaste-client add-password "$1"
elif [ x$XDG_SESSION_TYPE = xwayland ] && command -v wl-copy > /dev/null; then
  wl-copy --sensitive
elif [ x$TERM = xxterm-kitty ] && command -v kitten > /dev/null; then
  kitten clipboard
fi
