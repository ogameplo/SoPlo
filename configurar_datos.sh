#!/bin/sh
# -*- ENCODING: UTF-8 -*-
rm config/userdata.secret

clear
echo ""
echo "Bienvenido a SoPlo"
echo "Configuracion del sistema"
echo "Los datos seran guardados en Scripts/config/userdata.secret"
echo "no comparta estos datos con nadie, el sistema no lo harà"
echo""
sleep 3
echo "Usuario en Ogame: "
read USUARIO
sleep 3
echo "Contraseòa de ogame: "
read PASS
clear
echo USER:$USUARIO >> config/userdata.secret
echo PASS:$PASS >> config/userdata.secret
echo "Sistema configurado con exito"



