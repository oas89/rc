if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources

[[ -f /usr/bin/dropbox ]] && dropbox&

#eval $(gnome-keyring-daemon --start --components=ssh)
#export SSH_AUTH_SOCK

setxkbmap -option grp:switch,grp:caps_switch,grp_led:scroll us,ru


exec i3
