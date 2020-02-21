# Include Xresources config
xrdb ~/.config/Xresources

# Make Caps Lock a Control key
setxkbmap -option ctrl:nocaps

# Invoke global X session script
. /etc/X11/Xsession
