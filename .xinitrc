# Include Xresources config
xrdb ~/.config/Xresources

# Make Caps Lock a Control key
setxkbmap -option caps:escape

# Invoke global X session script
. /etc/X11/Xsession
