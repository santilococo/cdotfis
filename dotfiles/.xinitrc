# Night light
redshift -P -O 2750 &> /dev/null &

# Disable mouse acceleration
xset m 0 0

# Restore wallpaper
nitrogen --restore 2> /dev/null &

# Run dwmblocks
dwmblocks &

# Launch dunst
dunst 2> /dev/null &

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

if [[ -v LAPTOP ]]; then
    # Enable automatic fan control
    macfanctld

    # Set brightness
    xbacklight -set 45

    # Set the governor
    sudo ~/.local/bin/setGovernor > /dev/null &
else
    # Faster scrolling
    imwheel -b 45

    # Move mouse focus to middle of first screen
    xdotool mousemove --sync --screen=$1 960 500

    # Restart network
    ~/.local/bin/netRestart &
fi

# Fix dbus BUG with GNOME keyring
dbus-update-activation-environment --systemd DISPLAY

# Start GNOME keyring
eval $(gnome-keyring-daemon --start)
export SSH_AUTH_SOCK

exec $HOME/.local/bin/startdwm
