#!/bin/bash

WS=$1

HTML="heise.de/developer
http://www.jetbrains.com/clion/documentation/
http://www.jetbrains.com/clion/social/
https://www.heise.de/developer/Continuous-Architecture-2687847.html
https://www.heise.de/developer/ModernesCplusplus-3691794.html
https://www.heise.de/developer/podcast/
https://stackoverflow.com/questions/tagged/c%2b%2b
arne-mertz.de
blog.tartanllama.xyz
fluentcpp.com
bfilipek.com
modernescpp.com"

sleep 10
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

