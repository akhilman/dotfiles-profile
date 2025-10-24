#!/bin/sh
if [ x$XDG_SESSION_DESKTOP = xgnome ]; then
  gpaste-client delete-password "$1"
elif [ x$XDG_SESSION_TYPE = xwayland ]; then
  wl-copy --primary --clear
fi

