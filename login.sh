#!/bin/sh
# -*- ENCODING: UTF-8 -*-

POS_LOGIN="935 229"
USER=$(grep "USER" config/userdata.secret | cut -d ":" -f2)
PASS=$(grep "PASS" config/userdata.secret | cut -d ":" -f2)
PAUSE=4

/home/ogame/firefox/firefox www.ogame.com.es >> /dev/null & 
sleep $PAUSE
#xdotool key F11
xdotool mousemove $POS_LOGIN
sleep $PAUSE
xdotool click 1
xdotool type "D"
xdotool key KP_Enter
xdotool key Tab
xdotool type $USER
xdotool key Tab
xdotool type $PASS
xdotool key KP_Enter
sleep $PAUSE




