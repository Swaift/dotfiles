#!/usr/bin/env sh

# Terminate already running mopidy instances
killall -q mopidy

# Wait until the processes have been shut down
while pgrep -x mopidy >/dev/null; do sleep 1; done

# Launch mopidy
mopidy &> /dev/null &
