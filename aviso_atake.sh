#!/bin/sh
# -*- ENCODING: UTF-8 -*-

./login.sh
sleep 4
./cookies.sh
sleep 3
#xdotool key Alt+F4

rm /home/juajo/Ogame/SoPlo/basura/cookies.txt

wget --load-cookies=cookies.txt https://s130-es.ogame.gameforge.com/game/index.php?page=overview -O /home/juajo/Ogame/SoPlo/basura/atake.txt
#curl --cookie cookies.txt  

ATAQUE=$(grep -c "¡Ataque!" /home/juajo/Ogame/SoPlo/basura/atake.txt)

#if [$ATAQUE == 1 ] ; then
	echo $ATAQUE
#fi


# https://s130-es.ogame.gameforge.com/game/index.php?page=eventList lista de flotas
