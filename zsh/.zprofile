#if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
  #XDG_SESSION_TYPE=wayland exec dbus-run-session gnome-session
#fi
