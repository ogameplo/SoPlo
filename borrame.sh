#!/bin/sh
# -*- ENCODING: UTF-8 -*-

GALAXIA=1
SISTEMA=1
ARCHIVO=borrame
INACTIVOS=0

if [$i != 0]; then
		#Filtra el numero de planeta en i y lo mete en PLANETA
		rm calculos_*
		grep -B 9 -e "(i)" borrame >> calculos_1
		grep "gal-pos" calculos_1 >> calculos_2
		cut -d ":" -f3 calculos_2 >> calculos_3
		while read LINEA ; do
		PLANETA=`echo $LINEA | cut -d "]" -f1`
		echo $SISTEMA":"$PLANETA >> g$GALAXIA.txt
		echo añadido $SISTEMA":"$PLANETA a g$GALAXIA.txt
	done < calculos_3
	fi
