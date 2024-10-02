#!/bin/bash

# Default to this new functionality being off
enabled=$(batocera-settings-get global.bezel.hdmi_switch)
[ -z "$enabled" ] && enabled=0
batocera-settings-set global.bezel.hdmi_switch $enabled

# Install necessary files
mv 60-hdmi-switch-config.rules /etc/udev/rules.d/60-hdmi-switch-config.rules
mv batocera-hdmi-switch-config /usr/bin/batocera-hdmi-switch-config
chmod +x /usr/bin/batocera-hdmi-switch-config
udevadm control --reload-rules
batocera-save-overlay >/dev/null

# Use currently set decoration to the setting for the current resolution.
default_bezel_480p=none
default_bezel_720p=default
resolution=$(/usr/bin/batocera-resolution currentMode)
bezel=$(batocera-settings-get global.bezel)
if [ "$resolution" = "640x480" ]; then
    [ -z "$bezel" ] && bezel=$default_bezel_480p
    batocera-settings-set global.bezel.480p $bezel
    batocera-settings-set global.bezel.720p $default_bezel_720p
else
    [ -z "$bezel" ] && bezel=Default
    batocera-settings-set global.bezel.480p $default_bezel_480p
    batocera-settings-set global.bezel.720p $bezel
fi
