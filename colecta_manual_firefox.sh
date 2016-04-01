#!/bin/sh
# -*- ENCODING: UTF-8 -*-

# Juas.Corp 2016
# Espionaje automatico de lista de objetivos.
# El Script mandara a espiar todos los planetas de la lista objetivo.
#
# Distribuido bajo licencia GNU
# 
# --- DEPENDENCIAS Y REQUISITOS ---
# - Es necesario tener instalado xdotools ("sudo apt-get install xdotools")
# - Solo funciona en Chrome y sin plugins de Ogame instalados!!!!!
# - 
#
# --- USO ---
# 1.- Loguearte en la cuenda de Ogame
# 2.- Ejecutar el Script de la siguente manera (./colecta.sh [X] x el archivo ke vas a usar
# 3.- Esperar
#
# --- DISCLAIMER ---
# El escript como tal es ilegal, pero no es detectable porque no se realiza mediante scripting web. 
# Es un poco lento, pero se puede ajustar con el valor del sleep dependiendo de la velocidad de internet para mayor velocidad.
#

PAUSE=8
PAUSE1=2
ATRIBUTO=$1
SISTEMA_ANTERIOR=0
# VARIABLES EDITABLES ---------------------------

#URLs
URL_RESUMEN="https://s129-es.ogame.gameforge.com/game/index.php?page=overview&cp="
URL_RECURSOS="https://s129-es.ogame.gameforge.com/game/index.php?page=resources&cp="
URL_INSTALACIONES="https://s129-es.ogame.gameforge.com/game/index.php?page=station&cp="
URL_INVESTIGACION="https://s129-es.ogame.gameforge.com/game/index.php?page=research&cp="
URL_HANGAR="https://s129-es.ogame.gameforge.com/game/index.php?page=shipyard&cp="
URL_DEFENSA="https://s129-es.ogame.gameforge.com/game/index.php?page=defense&cp="
URL_FLOTA="https://s129-es.ogame.gameforge.com/game/index.php?page=fleet1&cp="
URL_GALAXIA="https://s129-es.ogame.gameforge.com/game/index.php?page=galaxy&cp="
URL_ALIANZA="https://s129-es.ogame.gameforge.com/game/index.php?page=alliance&cp="

#IDs Planetas
ID_PLANETA_1="33905629"
ID_LUNA_1="33973265"
ID_PLANETA_2="33914878"
ID_LUNA_2="33956479"
ID_PLANETA_3="33998679"
ID_LUNA_3="33999017"
ID_PLANETA_4="34001235"
ID_LUNA_5="34004192"
ID_PLANETA_5="33925267"
ID_LUNA_5="34004959"
ID_PLANETA_6="33914972"
ID_LUNA_6="33955930"
ID_PLANETA_7="33914874"
ID_LUNA_7="33959955"
ID_PLANETA_8="33943114"
ID_LUNA_8=""
ID_PLANETA_9=""
ID_LUNA_9=""
ID_PLANETA_10=""
ID_LUNA_10=""

#Posiciones XDOTOOL (del raton)

POS_URL_BAR="774 70"

#Posiciones BOTON ESPIONAJE Planetas en Galaxias
POS_ESP_P1="945 246"
POS_ESP_P2="945 276"
POS_ESP_P3="945 305"
POS_ESP_P4="945 335"
POS_ESP_P5="945 364"
POS_ESP_P6="945 395"
POS_ESP_P7="945 426"
POS_ESP_P8="945 456"
POS_ESP_P9="945 486"
POS_ESP_P10="945 524"
POS_ESP_P11="945 553"
POS_ESP_P12="945 585"
POS_ESP_P13="945 619"
POS_ESP_P14="945 648"
POS_ESP_P15="945 676"

POS_GALAXIA="430 166"
POS_SISTEMA="587 166"


# VARIABLES NO EDITABLES-------------




#---SUBRUTINAS--------------------

ESPIONAJE(){
echo "Espiando en Galaxia $ATRIBUTO Sistema $SISTEMA_OBJ Planeta $PLANETA_OBJ." #Muestra resultado.


if [ "$SISTEMA_ANTERIOR" != "$SISTEMA_OBJ" ] ;then
	xdotool mousemove $POS_SISTEMA
	#sleep $PAUSE
	xdotool click 1
	#sleep $PAUSE
	xdotool type $SISTEMA_OBJ
	#sleep $PAUSE
	xdotool key KP_Enter
	sleep $PAUSE
fi

case $PLANETA_OBJ in	
	1)
	xdotool mousemove $POS_ESP_P1 
	;;	
	2)
	xdotool mousemove $POS_ESP_P2
	;;
	3)
	xdotool mousemove $POS_ESP_P3
	;;
	4)
	xdotool mousemove $POS_ESP_P4
	;;	
	5)
	xdotool mousemove $POS_ESP_P5
	;;	
	6)
	xdotool mousemove $POS_ESP_P6
	;;	
	7)
	xdotool mousemove $POS_ESP_P7
	;;	
	8)
	xdotool mousemove $POS_ESP_P8
	;;	
	9)
	xdotool mousemove $POS_ESP_P9
	;;	
	10)
	xdotool mousemove $POS_ESP_P10
	;;		
	11)
	xdotool mousemove $POS_ESP_P11
	;;
	12)
	xdotool mousemove $POS_ESP_P12
	;;
	13)
	xdotool mousemove $POS_ESP_P13
	;;
	14)
	xdotool mousemove $POS_ESP_P14
	;;
	15)
	xdotool mousemove $POS_ESP_P15
	;;
esac
sleep $PAUSE1
xdotool click 1
sleep $PAUSE1
SISTEMA_ANTERIOR=$SISTEMA_OBJ
}

#---------------------------------
clear

#Actualizar Repo de Inactivos

setxkbmap es
echo verificando archivos de sistemas inactivos en el repositorio...
cd galaxias
git pull
sleep 20

#google-chrome "http://ogame.com.es"
xdotool search "ES Cygnus" windowactivate

#sleep $PAUSE
#xdotool mousemove $POS_URL_BAR
#sleep $PAUSE
#xdotool click 1
#sleep $PAUSE

#xdotool type $URL_GALAXIA$SALIDA
#sleep $PAUSE
#xdotool key KP_Enter
#xdotool key F11



xdotool mousemove $POS_GALAXIA
#sleep $PAUSE
xdotool click 1
sleep $PAUSE1
xdotool type $ATRIBUTO # Es el atributo pasado por comando $1
sleep $PAUSE1


# Extrae Sistemas y Planetas de archivo y espia

#LINEAS=$(cat g$1.txt | wc -l)  # Cuenta las lineas del fichero de Galaxia Objetivo
while read LINEA
	do
	SISTEMA_OBJ=`echo $LINEA | cut -d ":" -f1` #Extrae SISTEMA
	PLANETA_OBJ=`echo $LINEA | cut -d ":" -f2` #Extrae PLANETA
 	ESPIONAJE # SUBRUTINA DE ESPIONAJE
done < g$ATRIBUTO.txt






