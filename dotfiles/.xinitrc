# Night light
redshift -P -O 2750 &

# Disable mouse acceleration
xset m 0 0

# Restore wallpaper
nitrogen --restore &

# Run dwmblocks
dwmblocks &

# Launch dunst
dunst &

# Launch clipboard daemon
clipmenud &

# Hides mouse
unclutter &

# Compositor
picom &
#picom --experimental-backends &
#xcompmgr -c &
#xcompmgr -c -C -t-5 -l-5 -r4.2 -o.55 &

# For java starting as blank windows
#wmname LG3D

# Sound configuration
~/.local/bin/sound &

# For screenshots
flameshot &

if [[ -v LAPTOP ]]; then
    # Enable automatic fan control
    macfanctld
else
    # Faster scrolling
    imwheel -b 45

    # Move mouse focus to middle of first screen
    xdotool mousemove --sync --screen=$1 960 500
fi

# Start GNOME keyring
dbus-update-activation-environment --systemd DISPLAY
eval $(gnome-keyring-daemon --start)
export SSH_AUTH_SOCK

exec $HOME/.local/bin/startdwm
