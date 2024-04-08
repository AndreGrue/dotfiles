#!/bin/bash

WS=$1


i3-msg "workspace $WS; exec /usr/local/bin/clion ~/Projekte/rx/rx_test"


html1="martinfowler.com/articles/collection-pipeline"
html2="reactivex.io"
html3="introtorx.com"
html4="github.com/Reactive-Extensions/RxCpp"
html5="reactive-extensions.github.io/RxCpp/group__group-core.html"
html6="stackoverflow.com/questions/tagged/rxcpp"

i3-msg "workspace $WS; exec firefox --new-window $html1"
sleep 5
i3-msg "workspace $WS; exec firefox --new-tab $html2"
sleep 2
i3-msg "workspace $WS; exec firefox --new-tab $html3"
sleep 2
i3-msg "workspace $WS; exec firefox --new-tab $html4"
sleep 2
i3-msg "workspace $WS; exec firefox --new-tab $html5"
sleep 2
i3-msg "workspace $WS; exec firefox --new-tab $html6"
