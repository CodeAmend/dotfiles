#!/usr/bin/env bash

# Terminate potential running bar isntances
killall -q polybar

# Wait until processes have been shut down
while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done

polybar mybar &
