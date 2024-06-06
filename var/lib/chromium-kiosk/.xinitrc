#!/bin/sh

# Disable DPMS (Energy Star) features
xset -dpms

# Disable screen saver
xset s off

# Prevent screen blanking
xset s noblank

# Hide cursor after inactivity
unclutter -idle 0.01 -root

# Start Openbox window manager
openbox &

# Start PCManFM file manager
pcmanfm --desktop &

# Check if a prehook script exists and run it
if [ -e ~/chromium-kiosk-prehook.sh ]; then
    ~/chromium-kiosk-prehook.sh
fi

# Launch Chromium in kiosk mode with production configuration and log directory
exec chromium-kiosk run --config_prod --log_dir=$HOME

# Ensure termination of background processes
killall -u $USER
