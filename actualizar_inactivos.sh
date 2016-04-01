#!/bin/sh
# -*- ENCODING: UTF-8 -*-

GALAXIA=1	
SISTEMA=1
ARCHIVO=borrame
INACTIVOS=0

# Revision de una galaxia entera en busca de numero de inactivos

cd galaxias
rm g*.txt

while [ $GALAXIA -le 9 ];do 

	while [ $SISTEMA -le 499 ]; do
		rm $ARCHIVO	
		nohup wget -O $ARCHIVO http://www.ogniter.org/es/557/galaxy/$GALAXIA/$SISTEMA  2> /dev/null
	
		# CONTAMOS LOS INACTIVOS POR ARCHIVO y guardamos el resultado en Inactivos
		i=$(grep -c "(I)" $ARCHIVO)  
		I=$(grep -c "(i)" $ARCHIVO)
		INACTIVOS=$(( $i + $I))
		echo $INACTIVOS planetas inactivos en Galaxia $GALAXIA Sistema $SISTEMA
		
	
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
	
		#Filtra el numero de planeta en I y lo mete en PLANETA
		rm calculos_*
		grep -B 9 -e "(I)" borrame >> calculos_1
		grep "gal-pos" calculos_1 >> calculos_2
		cut -d ":" -f3 calculos_2 >> calculos_3
			while read LINEA ; do
				PLANETA=`echo $LINEA | cut -d "]" -f1`
				echo $SISTEMA":"$PLANETA >> g$GALAXIA.txt
				echo añadido $SISTEMA":"$PLANETA a g$GALAXIA.txt
			done < calculos_3
		SISTEMA=$(($SISTEMA + 1))
	done
	SISTEMA=0
	GALAXIA=$(($GALAXIA + 1))

done

git add g*.txt
git commit -m "actualizacion automatica"
git push origin master
 





