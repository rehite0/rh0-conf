#!/bin/bash

if [[ ! -e /tmp/desktop_sink_id ]]; then
	pactl load-module module-null-sink sink_name=desktop_sink >/tmp/desktop_sink_id
fi
# pactl unload-module <id>

flatpak run net.audiorelay.AudioRelay &
disown
