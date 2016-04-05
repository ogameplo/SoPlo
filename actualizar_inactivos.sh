#!/bin/sh
# -*- ENCODING: UTF-8 -*-

PAT="/home/Ogame/SoPlo"

GALAXIA=1	
SISTEMA=1
ARCHIVO=borrame
INACTIVOS=0

# Revision de una galaxia entera en busca de numero de inactivos

rm $PAT/basura/galaxias/g*.txt
rm $PAT/basura/basura/*_*
rm $PAT/basura/basura/borrame*


while [ $GALAXIA -le 9 ];do 

	while [ $SISTEMA -le 499 ]; do
		rm $ARCHIVO	
		nohup wget -O $ARCHIVO http://www.ogniter.org/es/557/galaxy/$GALAXIA/$SISTEMA  2> /dev/null
	
		# CONTAMOS LOS INACTIVOS POR ARCHIVO y guardamos el resultado en Inactivos
		i=$(grep -c "(I)" $PAT/basura/$ARCHIVO)  
		I=$(grep -c "(i)" $PAT/basura/$ARCHIVO)
		INACTIVOS=$(( $i + $I))
		echo $INACTIVOS planetas inactivos en Galaxia $GALAXIA Sistema $SISTEMA
		
	
		#Filtra el numero de planeta en i y lo mete en PLANETA
		rm calculos_*
		grep -B 9 -e "(i)" $PAT/basura/borrame >> $PAT/basura/calculos_1
		grep "gal-pos" $PAT/basura/calculos_1 >> $PAT/basura/calculos_2
		cut -d ":" -f3 $PAT/basura/calculos_2 >> $PAT/basura/calculos_3
			while read LINEA ; do
				PLANETA=`echo $LINEA | cut -d "]" -f1`
				echo $SISTEMA":"$PLANETA >> $PAT/galaxias/g$GALAXIA.txt
				echo añadido $SISTEMA":"$PLANETA a g$GALAXIA.txt
			done < $PAT/basura/calculos_3
	
		#Filtra el numero de planeta en I y lo mete en PLANETA
		rm calculos_*
		grep -B 9 -e "(I)" $PAT/basura/borrame >> $PAT/basura/calculos_1
		grep "gal-pos" $PAT/basura/calculos_1 >> $PAT/basura/calculos_2
		cut -d ":" -f3 $PAT/basura/calculos_2 >> $PAT/basura/calculos_3
			while read LINEA ; do
				PLANETA=`echo $LINEA | cut -d "]" -f1`
				echo $SISTEMA":"$PLANETA >> $PAT/galaxias/g$GALAXIA.txt
				echo añadido $SISTEMA":"$PLANETA a g$GALAXIA.txt
			done < $PAT/basura/calculos_3
		SISTEMA=$(($SISTEMA + 1))
	done
	SISTEMA=0
	GALAXIA=$(($GALAXIA + 1))

done

cd $PAT
git add $PAT/galaxias/g*.txt
git commit -m "actualizacion automatica"
git push origin master
 






