# knulli-hdmi-switch-config

This is a proof of concept (POC) to change the decoration settings in Knulli based on
whether HDMI is connected on the Anbernic XX series of devices.

This utilizes a `udev` rule which is triggered when the HDMI is either connected or
disconnected.  The rule launches a script (`/usr/bin/batocera-hdmi-switch-config`)
which sets the bezel based on values stored as key/value pairs in the `batocera.conf`
file.

The Keys and default values are:

```config
global.bezel.hdmi_switch=0
global.bezel.480p=none
global.bezel.720p=default
```

## Installation

1. Copy the contents of the repo to somewhere on the device.
2. SSH into the device and navigate to the location you copied the files.
3. Execute the installed `bash install.sh`
