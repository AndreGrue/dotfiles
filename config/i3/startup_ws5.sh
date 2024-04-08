#!/bin/bash

WS=$1


sleep 2


HTML="ros.org
https://index.ros.org/doc/ros2/"

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
