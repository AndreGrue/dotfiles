#!/bin/bash

WS=$1


i3-msg "workspace $WS; exec /usr/local/bin/idea ~/.i3"


HTML="https://i3wm.org/docs/userguide.html#_default_keybindings
https://i3wm.org/docs/userguide.html"

TEST=0
for html in $HTML
do
    if [ $TEST -eq 0 ]; then
        sleep 5
        i3-msg "workspace $WS; exec firefox --new-window $html"
        TEST=1
    else
        sleep 2
        i3-msg "workspace $WS; exec firefox --new-tab $html"
    fi
done

