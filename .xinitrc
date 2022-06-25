xrdb -merge ~/.Xresources

# use caps key as ctrl key
setxkbmap -option caps:ctrl_modifier

# mouse speed, depends on usb port
xinput --set-prop 9 333 1.0

exec i3
