#!/bin/bash

#############################################################################################################
#   Destuye el ambiente de usuarios y carpetas para acceso de usuarios al recurso /tmp/Sucursales
#   Creado por JOSUE
#   Creado el 08/08/2020 12:50 PM
############################################################################################################
#   NOTAS: ejecutar con permisos de root
##############################################################################################################
#
#   1.- Borrar carpetas
#   2.- Borrar usuarios
#   3.- Borrar grupos
#
#############################################################################################################


DATE=$(date "+%d%m%Y_%H%M")
DIRWORK=/root
LOG=/tmp/logs/lab/delete_lab_$DATE.log
export DIRWORK DATE LOG

if [ ! -d /tmp/logs ]; then
mkdir /tmp/logs
fi

if [ ! -d /tmp/logs/lab ]; then
mkdir /tmp/logs/lab
fi

touch /tmp/logs/lab/delete_lab_$DATE.log 2>&1 | tee -a >> $LOG

echo "info:" 2>&1 | tee -a >> $LOG
date 2>&1 | tee -a >> $LOG


# 1.- Borrado de Carpetas

echo "Starting folder delete rutine" 2>&1 | tee -a >> $LOG
rm -Rf /tmp/Sucursales 2>&1 | tee -a >> $LOG
echo "Successfully folder delete rutine" 2>&1 | tee -a >> $LOG
echo "------------------------------------------------------------------------------------------------------------- \n\n" 2>&1 | tee -a >> $LOG


# 2.- Borrado de usuarios

echo "Starting users delete rutine" 2>&1 | tee -a >> $LOG
for user in j201928 m546789 r456789 a124323 w345210 k870954 h568743 f436587 l126578 b968473 d391827 o089786 u574839 e283746 q108239 y551324 s897751 z228695 c112068 v005170 n554212; do userdel -r ${user}; done 2>&1 | tee -a >> $LOG
echo "Successfully users delete rutine" 2>&1 | tee -a >> $LOG
echo "-------------------------------------------------------------------------------------------------------------\n\n" 2>&1 | tee -a >> $LOG



# 3.- Borrado de Grupos

echo "Starting groups delete rutine" 2>&1 | tee -a >> $LOG
for group in mty01 mty02 mxc01 mxc02 gdl01 slp01 mer01 sal01 tor01 leo01 oax01 transfer; do groupdel ${group}; done 2>&1 | tee -a >> $LOG
echo "Successfully groups delete rutine" 2>&1 | tee -a >> $LOG
echo "-------------------------------------------------------------------------------------------------------------\n\n" 2>&1 | tee -a >> $LOG


echo "info:" 2>&1 | tee -a >> $LOG
date 2>&1 | tee -a >> $LOG


###################################################################################################################
#
####################################################################################################################

