# start vbox stuff (screen resolution, clipboard, ...)
VBoxClient --vmsvga
VBoxClient --clipboard

# load xresources
xrdb ~/.Xresources

# Background
feh --bg-scale /home/smrtl/Pictures/724236.jpg

# numlock on
numlockx &

# notifications
dunst &

# automount
udiskie --tray &

# Compositor
picom &

# start DWM
exec $HOME/.local/bin/startdwm

