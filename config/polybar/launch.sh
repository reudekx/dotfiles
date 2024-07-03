#!/bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Launch Polybar on each connected monitor
if type "xrandr"; then
	for m in $(xrandr -q | grep " connected" | cut -d" " -f1); do
		MONITOR=$m polybar --reload bar1 2>&1 | tee -a /tmp/polybar.log & disown
	done
else
	polybar --reload bar1 2>&1 | tee -a /tmp/polybar.log & disown
fi

echo "Polybar launched..."

