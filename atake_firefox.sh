#!/bin/sh
# -*- ENCODING: UTF-8 -*-

# Juas.Corp 2016
# Atake automatico de objetivos en espionajes gracias a plugins
#
# Distribuido bajo licencia GNU
# 
# --- DEPENDENCIAS Y REQUISITOS ---
# - Es necesario tener instalado xdotools ("sudo apt-get install xdotools")
# - Firefox
# - Plugins de Ogame Antigame y Skynet
#
# --- USO ---
# 1.- 
# 2.- 
# 3.- Esperar
#
# --- DISCLAIMER ---
# El escript como tal es ilegal, pero no es detectable porque no se realiza mediante scripting web. 
# Es un poco lento, pero se puede ajustar con el valor del sleep dependiendo de la velocidad de internet para mayor velocidad.
#

CONTADOR=1
PAUSE=11
PAUSE1=8
ATRIBUTO=$1
SISTEMA_ANTERIOR=0
# VARIABLES EDITABLES ---------------------------

#Posiciones XDOTOOL (del raton)

POS_URL_BAR="774 70"

#Posiciones BOTON ESPIONAJE Planetas en Galaxias
POS_ESP_P1="945 245"
POS_ESP_P2="945 275"
POS_ESP_P3="945 307"
POS_ESP_P4="945 335"
POS_ESP_P5="945 365"
POS_ESP_P6="945 400"
POS_ESP_P7="945 428"
POS_ESP_P8="945 460"
POS_ESP_P9="945 491"
POS_ESP_P10="945 523"
POS_ESP_P11="945 553"
POS_ESP_P12="945 584"
POS_ESP_P13="945 613"
POS_ESP_P14="945 644"
POS_ESP_P15="945 674"

POS_GALAXIA="430 166"
POS_SISTEMA="587 166"

# ATAKES
POS_BOT_SMS="398 156"
POS_BORRAR_SMS="394 368"
POS_COMENZAR_ATAKE="931 423"
POS_BORRAR_OBJETIVO="910 423"
POS_NAVES_P="618 340"
POS_ATAKE_1="942 691"
POS_ATAKE_2="937 503"
POS_ATAKE_3="864 631"

# VARIABLES NO EDITABLES-------------





#---------------------------------
clear
setxkbmap es
echo "Preparando el sistema para el atake de los objetivos almacenados en tus mensajes!!!"
clear	

xdotool search "ES Cygnus" windowactivate
sleep $PAUSE1

while [ "$CONTADOR" != "$1" ] ; do

	xdotool mousemove $POS_BOT_SMS
	sleep $PAUSE1
	xdotool click 1
	sleep $PAUSE
	xdotool mousemove $POS_COMENZAR_ATAKE
	sleep $PAUSE1
	xdotool click 1
	sleep $PAUSE
	xdotool mousemove $POS_NAVES_P
	sleep $PAUSE
	xdotool click 1
	sleep $PAUSE
	
	xdotool key Down
	sleep $PAUSE1
	xdotool mousemove $POS_ATAKE_1
	sleep $PAUSE1
	xdotool click 1
	sleep $PAUSE1
	xdotool mousemove $POS_ATAKE_2
	sleep $PAUSE1	
	xdotool click 1
	sleep $PAUSE1
	xdotool mousemove $POS_ATAKE_3
	sleep $PAUSE1
	xdotool click 1
	sleep $PAUSE
	
	xdotool mousemove $POS_BOT_SMS
	sleep $PAUSE1
	xdotool click 1
	sleep $PAUSE
	xdotool mousemove $POS_BORRAR_OBJETIVO
	sleep $PAUSE1
	xdotool click 1
	sleep $PAUSE1
	
	let CONTADOR=CONTADOR+1
done
echo "$CONTADOR ATAKES REALIZADOS!!!"

