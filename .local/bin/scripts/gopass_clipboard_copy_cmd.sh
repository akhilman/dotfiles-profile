#!/bin/sh
if [ x$XDG_SESSION_DESKTOP = xgnome ]; then
  gpaste-client add-password "$1"
elif [ x$TERM = xxterm-kitty ] && command -v kitten > /dev/null; then
  kitten clipboard --use-primary
elif [ x$XDG_SESSION_TYPE = xwayland ]; then
  wl-copy --primary
fi
