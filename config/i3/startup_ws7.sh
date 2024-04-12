#!/bin/bash

WS=$1

i3-msg "workspace $WS; exec /usr/local/bin/charm ~/workspace/udemy"
sleep 3


HTML="https://www.udemy.com/course/deep-learning-grundlagen-neuronale-netzwerke-mit-tensorflow
https://www.anaconda.com
https://www.tensorflow.org
https://code.visualstudio.com
https://numpy.org
https://matplotlib.org"

TEST=0
for html in $HTML
do
    if [ $TEST -eq 0 ]; then
        sleep 1
        i3-msg "workspace $WS; exec firefox --new-window $html"
        TEST=1
    else
        sleep 2
        i3-msg "workspace $WS; exec firefox --new-tab $html"
    fi
done

