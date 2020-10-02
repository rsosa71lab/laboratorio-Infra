#!/bin/bash

#############################################################################################################
#   Creación de ambiente de usuarios y carpetas para acceso de usuarios al recurso /tmp/info2
#   Creado por JOSUE
#   Creado el 08/08/2020 12:00 PM
#############################################################################################################
#   NOTAS: ejecutar con permisos de root
#############################################################################################################
#
#   1.- Crear grupos (11 grupos)
#       mty01 (Kalos) 
#       mty02 (Valle) 
#       mxc01 (Naucalpan) 
#       mxc02 (Insurgente)
#       gdl01 (Guadalajara)
#       slp01 (SanLuisPotosi)
#       mer01 (Merida)
#       sal01 (Saltillo)
#       tor01 (Torreon)
#       leo01 (Leon)
#       oax01 (Oaxaca)
#       transfer (global)
#
#   2.- Crear usuarios (21 usuarios)
#       j201928 m546789 r456789 a124323 w345210 k870954 h568743 f436587 l126578 b968473 
#       d391827 o089786 u574839 e283746 q108239 y551324 s897751 z228695 c112068 v005170 n554212
#
#	Usuarios de pruebas para el ambiente:
#	j201928 (Kalos)
#	a124323 (Valle)
#	h568743 (Naucalpan)
#	d391827 (Insurgentes)
#	q108239 (Guadalajara)
#	y551324 (SAnLuisPotosi)
#	s897751 (Merida)
#	z228695 (Saltillo)
#	c112068 (Torreon)
#	v005170 (Leon)
#	n554212 (Oaxaca)
# 
#   3.- Crear carpetas (17 carpetas)
#       /tmp/Sucursales
#       /tmp/Sucursales/Norte
#       /tmp/Sucursales/Norte/Kalos
#       /tmp/Sucursales/Norte/Saltillo
#       /tmp/Sucursales/Norte/Torreon
#       /tmp/Sucursales/Norte/Valle
#       /tmp/Sucursales/Centro
#       /tmp/Sucursales/Centro/Naualpan
#       /tmp/Sucursales/Centro/Insurgentes
#       /tmp/Sucursales/Centro/SanLuisPotosi
#       /tmp/Sucursales/Sur
#       /tmp/Sucursales/Sur/Oaxaca
#       /tmp/Sucursales/Oriente
#       /tmp/Sucursales/Oriente/Merida
#       /tmp/Sucursales/Occidente
#       /tmp/Sucursales/Occidente/Leon
#       /tmp/Sucursales/Occidente/Guadalajara
#
#   4.- Crear archivos (150 archivos con contenido cargado desde web)
#       Valle		(doc001-doc010)
#       Kalos		(doc011-doc020)
#       Saltillo	(doc021-doc030)
#       Torreon		(doc031-doc040)
#       Naucalpan	(doc041-doc050)
#       Insurgentes	(doc051-doc060]
#       SanLuisPotosi	(doc061-doc070)
#       Oaxaca		(doc071-doc080)
#       Merida		(doc081-doc090)
#       Giuadalajara	(doc091-doc100)
#       Leon		(doc101-doc110)
#	Transfer	(doc110-doc150)	
#
#   5.- Otorgar permisos
#       5.1 asignacion de dueños a carpetas y archivos (owners)
#       5.2 asignacion de permisos a carpetas (771)
#       5.3 asignación de permisos a archivos (660)
#       5.4 otorgar acceso de lectura para otros (u+r) solo archivos selectos (664)
#           (doc001. doc011, doc021, doc031, doc041, doc051, doc061, doc071, doc081, doc091, doc101)
#
#   6.- Crear ligas suaves a archivos comunes en /tmp/Transfer (11 ligas)
#       Valle, kalos, Saltillo, Torreon, Naucalpan, Insurgentes, SanLuisPotosi, Oaxaca, Merida, Guadalajara, Leon
#
#
#############################################################################################################

DATE=$(date "+%d%m%Y_%H%M")
DIRWORK=/root
LOG=/tmp/logs/lab/create_lab_$DATE.log
export DIRWORK DATE LOG

if [ ! -d /tmp/logs ]; then
mkdir /tmp/logs
fi

if [ ! -d /tmp/logs/lab ]; then
mkdir /tmp/logs/lab
fi

touch /tmp/logs/lab/create_lab_$DATE.log

echo "info:" 2>&1 | tee -a >> $LOG
date 2>&1 | tee -a >> $LOG

# 1.- Creación de Grupos en OS

echo "Starting groups creation rutine" 2>&1 | tee -a >> $LOG
for group in mty01 mty02 mxc01 mxc02 gdl01 slp01 mer01 sal01 tor01 leo01 oax01 transfer; do groupadd ${group}; done 2>&1 | tee -a >> $LOG
echo "Successfully groups creation rutine" 2>&1 | tee -a >> $LOG
echo "-------------------------------------------------------------------------------------------------------------\n\n" 2>&1 | tee -a >> $LOG


# 2.- Creación de usuarios y asignación de comentarios y grupos

echo "Starting users creation rutine" 2>&1 | tee -a >> $LOG
for user in j201928 m546789 r456789 a124323 w345210 k870954 h568743 f436587 l126578 b968473 d391827 o089786 u574839 e283746 q108239 y551324 s897751 z228695 c112068 v005170 n554212; do useradd ${user} -c"FULL USER NAME ${user}" -G transfer; done 2>&1 | tee -a >> $LOG
echo "Successfully users creation rutine" 2>&1 | tee -a >> $LOG
echo "-------------------------------------------------------------------------------------------------------------\n\n" 2>&1 | tee -a >> $LOG


echo "Starting groups membership rutine" 2>&1 | tee -a >> $LOG
for user in j201928 m546789 r456789; do usermod -a -G mty01 ${user}; done 2>&1 | tee -a >> $LOG
for user in a124323 w345210 k870954; do usermod -a -G mty02 ${user}; done 2>&1 | tee -a >> $LOG
for user in h568743 f436587 l126578 b968473; do usermod -a -G mxc01 ${user}; done 2>&1 | tee -a >> $LOG
for user in d391827 o089786 u574839 e283746; do usermod -a -G mxc02 ${user}; done 2>&1 | tee -a >> $LOG
for user in q108239; do usermod -a -G gdl01 ${user}; done 2>&1 | tee -a >> $LOG
for user in y551324; do usermod -a -G slp01 ${user}; done 2>&1 | tee -a >> $LOG
for user in s897751; do usermod -a -G mer01 ${user}; done 2>&1 | tee -a >> $LOG
for user in z228695; do usermod -a -G sal01 ${user}; done 2>&1 | tee -a >> $LOG
for user in c112068; do usermod -a -G tor01 ${user}; done 2>&1 | tee -a >> $LOG
for user in v005170; do usermod -a -G leo01 ${user}; done 2>&1 | tee -a >> $LOG
for user in n554212; do usermod -a -G oax01 ${user}; done 2>&1 | tee -a >> $LOG
echo "Successfully groups membership rutine" 2>&1 | tee -a >> $LOG
echo "-------------------------------------------------------------------------------------------------------------\n\n" 2>&1 | tee -a >> $LOG


# 3.- Creación de Carpetas

echo "Starting folder structure creation rutine" 2>&1 | tee -a >> $LOG

mkdir /tmp/Sucursales 2>&1 | tee -a >> $LOG

for folder in /tmp/Sucursales/Norte /tmp/Sucursales/Centro /tmp/Sucursales/Sur /tmp/Sucursales/Oriente /tmp/Sucursales/Occidente /tmp/Sucursales/Transfer; do mkdir ${folder}; done 2>&1 | tee -a >> $LOG

for folder in /tmp/Sucursales/Norte/Valle /tmp/Sucursales/Norte/Kalos /tmp/Sucursales/Norte/Saltillo /tmp/Sucursales/Norte/Torreon; do mkdir ${folder}; done 2>&1 | tee -a >> $LOG
for folder in /tmp/Sucursales/Centro/Naucalpan /tmp/Sucursales/Centro/Insurgentes /tmp/Sucursales/Centro/SanLuisPotosi; do mkdir ${folder}; done 2>&1 | tee -a >> $LOG
for folder in /tmp/Sucursales/Sur/Oaxaca; do mkdir ${folder}; done 2>&1 | tee -a >> $LOG
for folder in /tmp/Sucursales/Occidente/Guadalajara /tmp/Sucursales/Occidente/Leon; do mkdir ${folder}; done 2>&1 | tee -a >> $LOG
for folder in /tmp/Sucursales/Oriente/Merida; do mkdir ${folder}; done 2>&1 | tee -a >> $LOG
  
echo "Successfully folder structure creation rutine" 2>&1 | tee -a >> $LOG
echo "-------------------------------------------------------------------------------------------------------------\n\n" 2>&1 | tee -a >> $LOG


# 4.- Crear archivos en carpetas agregando contenido desde internet.

echo "Starting files creation and adding content to them from the web" 2>&1 | tee -a >> $LOG

curl -s "http://www.vatican.va/archive/ESL0506/__PG6.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Norte/Valle/doc001 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PG7.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Norte/Valle/doc002 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PG8.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Norte/Valle/doc003 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PG9.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Norte/Valle/doc004 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PGA.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Norte/Valle/doc005 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PGB.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Norte/Valle/doc006 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PGC.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Norte/Valle/doc007 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PGD.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Norte/Valle/doc008 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PGE.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Norte/Valle/doc009 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PGF.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Norte/Valle/doc010 2>&1 | tee -a >> $LOG

curl -s "http://www.vatican.va/archive/ESL0506/__PGG.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Norte/Kalos/doc011 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PGH.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Norte/Kalos/doc012 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PGI.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Norte/Kalos/doc013 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PGJ.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Norte/Kalos/doc014 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PGK.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Norte/Kalos/doc015 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PGL.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Norte/Kalos/doc016 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PGM.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Norte/Kalos/doc017 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PGN.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Norte/Kalos/doc018 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PGO.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Norte/Kalos/doc019 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PGP.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Norte/Kalos/doc020 2>&1 | tee -a >> $LOG

curl -s "http://www.vatican.va/archive/ESL0506/__PGQ.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Norte/Saltillo/doc021 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PGR.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Norte/Saltillo/doc022 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PGS.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Norte/Saltillo/doc023 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PGT.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Norte/Saltillo/doc024 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PGU.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Norte/Saltillo/doc025 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PGV.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Norte/Saltillo/doc026 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PGW.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Norte/Saltillo/doc027 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PGX.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Norte/Saltillo/doc028 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PGY.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Norte/Saltillo/doc029 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PGZ.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Norte/Saltillo/doc030 2>&1 | tee -a >> $LOG

curl -s "http://www.vatican.va/archive/ESL0506/__PH0.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Norte/Torreon/doc031 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PH1.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Norte/Torreon/doc032 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PH2.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Norte/Torreon/doc033 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PH3.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Norte/Torreon/doc034 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PH4.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Norte/Torreon/doc035 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PH5.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Norte/Torreon/doc036 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PH6.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Norte/Torreon/doc037 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PH7.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Norte/Torreon/doc038 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PH8.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Norte/Torreon/doc039 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PH9.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Norte/Torreon/doc040 2>&1 | tee -a >> $LOG

curl -s "http://www.vatican.va/archive/ESL0506/__PHA.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Centro/Naucalpan/doc041 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PHB.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Centro/Naucalpan/doc042 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PHC.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Centro/Naucalpan/doc043 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PHD.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Centro/Naucalpan/doc044 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PHE.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Centro/Naucalpan/doc045 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PHF.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Centro/Naucalpan/doc046 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PHG.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Centro/Naucalpan/doc047 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PHH.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Centro/Naucalpan/doc048 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PHI.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Centro/Naucalpan/doc049 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PHJ.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Centro/Naucalpan/doc050 2>&1 | tee -a >> $LOG

curl -s "http://www.vatican.va/archive/ESL0506/__PHK.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Centro/Insurgentes/doc051 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PHL.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Centro/Insurgentes/doc052 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PHM.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Centro/Insurgentes/doc053 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PHN.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Centro/Insurgentes/doc054 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PHO.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Centro/Insurgentes/doc055 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PHP.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Centro/Insurgentes/doc056 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PHQ.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Centro/Insurgentes/doc057 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PHR.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Centro/Insurgentes/doc058 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PHS.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Centro/Insurgentes/doc059 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PHT.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Centro/Insurgentes/doc060 2>&1 | tee -a >> $LOG

curl -s "http://www.vatican.va/archive/ESL0506/__PHU.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Centro/SanLuisPotosi/doc061 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PHV.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Centro/SanLuisPotosi/doc062 2>&1 | tee -a >> $LOG 
curl -s "http://www.vatican.va/archive/ESL0506/__PHW.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Centro/SanLuisPotosi/doc063 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PHX.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Centro/SanLuisPotosi/doc064 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PHY.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Centro/SanLuisPotosi/doc065 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PHZ.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Centro/SanLuisPotosi/doc066 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PI0.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Centro/SanLuisPotosi/doc067 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PI1.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Centro/SanLuisPotosi/doc068 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PI2.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Centro/SanLuisPotosi/doc069 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PI3.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Centro/SanLuisPotosi/doc070 2>&1 | tee -a >> $LOG

curl -s "http://www.vatican.va/archive/ESL0506/__PI4.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g'| sed 's/&ntilde;/ñ/g'  | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Sur/Oaxaca/doc071 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PI5.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Sur/Oaxaca/doc072 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PI6.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Sur/Oaxaca/doc073 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PI7.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Sur/Oaxaca/doc074 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PI8.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Sur/Oaxaca/doc075 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PI9.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Sur/Oaxaca/doc076 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PIA.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Sur/Oaxaca/doc077 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PIB.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Sur/Oaxaca/doc078 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PIC.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Sur/Oaxaca/doc079 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PID.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Sur/Oaxaca/doc080 2>&1 | tee -a >> $LOG
 
curl -s "http://www.vatican.va/archive/ESL0506/__PIE.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Oriente/Merida/doc081 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PIF.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Oriente/Merida/doc082 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PIG.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Oriente/Merida/doc083 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PIH.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Oriente/Merida/doc084 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PII.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Oriente/Merida/doc085 2>&1 | tee -a >> $LOG 
curl -s "http://www.vatican.va/archive/ESL0506/__PIJ.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Oriente/Merida/doc086 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PIK.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Oriente/Merida/doc087 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PIL.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Oriente/Merida/doc088 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PIM.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Oriente/Merida/doc089 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PIN.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Oriente/Merida/doc090 2>&1 | tee -a >> $LOG
 
curl -s "http://www.vatican.va/archive/ESL0506/__PIO.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Occidente/Guadalajara/doc091 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PIP.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Occidente/Guadalajara/doc092 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PIQ.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Occidente/Guadalajara/doc093 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PIR.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Occidente/Guadalajara/doc094 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PIS.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Occidente/Guadalajara/doc095 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PIT.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Occidente/Guadalajara/doc096 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PIU.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Occidente/Guadalajara/doc097 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PIV.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Occidente/Guadalajara/doc098 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PIW.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Occidente/Guadalajara/doc099 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PIX.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Occidente/Guadalajara/doc100 2>&1 | tee -a >> $LOG

curl -s "http://www.vatican.va/archive/ESL0506/__PIY.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Occidente/Leon/doc101 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PIZ.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Occidente/Leon/doc102 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PJ0.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Occidente/Leon/doc103 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PJ1.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Occidente/Leon/doc104 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PJ2.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Occidente/Leon/doc105 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PJ3.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Occidente/Leon/doc106 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PJ4.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Occidente/Leon/doc107 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PJ5.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Occidente/Leon/doc108 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PJ6.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Occidente/Leon/doc109 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PJ7.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Occidente/Leon/doc110 2>&1 | tee -a >> $LOG

curl -s "http://www.vatican.va/archive/ESL0506/__PJ8.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Transfer/doc111 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PJ9.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Transfer/doc112 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PJA.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Transfer/doc113 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PJB.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Transfer/doc114 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PJC.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Transfer/doc115 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PJD.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Transfer/doc116 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PJE.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Transfer/doc117 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PJF.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Transfer/doc118 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PJG.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Transfer/doc119 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PJH.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Transfer/doc120 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PJI.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Transfer/doc121 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PJJ.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Transfer/doc122 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PJK.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Transfer/doc123 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PJL.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Transfer/doc124 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PJM.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Transfer/doc125 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PJN.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Transfer/doc126 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PJO.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Transfer/doc127 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PJP.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Transfer/doc128 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PJQ.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Transfer/doc129 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PJR.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Transfer/doc130 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PJS.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Transfer/doc131 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PJT.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Transfer/doc132 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PJU.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Transfer/doc133 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PJV.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Transfer/doc134 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PJW.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Transfer/doc135 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PJX.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Transfer/doc136 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PJY.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Transfer/doc137 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PJZ.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Transfer/doc138 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PK0.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Transfer/doc139 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PK1.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Transfer/doc140 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PK2.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Transfer/doc141 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PK3.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Transfer/doc142 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PK4.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Transfer/doc143 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PK5.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Transfer/doc144 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PK6.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Transfer/doc145 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PK7.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Transfer/doc146 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PK8.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Transfer/doc147 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PK9.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Transfer/doc148 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PKA.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Transfer/doc149 2>&1 | tee -a >> $LOG
curl -s "http://www.vatican.va/archive/ESL0506/__PKB.HTM" | grep "text-indent:0cm'>" | cut -d \> -f 2 | cut -d \< -f 1 | sed 's/&aacute;/á/g' | sed 's/&eacute;/é/g' | sed 's/&iacute;/í/g' | sed 's/&oacute;/ó/g' | sed 's/&uacute;/ú/g' | sed 's/&iexcl;/¡/g' | sed 's/&ntilde;/ñ/g' | sed 's/&iquest;/¿/g' | sed 's/&laquo;/<</g' | sed 's/&raquo;/>>/g' | sed 's/&ndash;/-/g' | sed 's/&nbsp;/ /g' | sed 's/&uuml;/ü/g' | sed 's/&quot;/"/g' >> /tmp/Sucursales/Transfer/doc150 2>&1 | tee -a >> $LOG


echo "Successfully files creation rutine" 2>&1 | tee -a >> $LOG
echo "-------------------------------------------------------------------------------------------------------------\n\n" 2>&1 | tee -a >> $LOG


###############################################
# Creación de archivos vacios
# No se va a utilzir para este laboratorio
###############################################
#for file in Norte/Valle/doc{001..010} Norte/Kalos/doc{011..020) Norte/Saltillo/doc{021..030} Norte/Torreon/doc{031..040} \
#Centro/Naucalpan/doc{041..050} Centro/Insurgentes/doc{051..060} Centro/SanLuisPotosi/doc{061..070} \
#Sur/Oaxaca/doc{071..080} Oriente/Merida/doc{081..090} Occidente/Guadalajara/doc{091..100} Occidente/Leon/doc{101..110} \
#; do touch ${file}; done
#############################################################################################################################

# 5.1- Asignación de owners en folder y archivos

echo "Starting folder and files ownership configuration rutine" 2>&1 | tee -a >> $LOG

chown -R root:mty01 /tmp/Sucursales/Norte/Valle 2>&1 | tee -a >> $LOG
chown -R root:mty02 /tmp/Sucursales/Norte/Kalos 2>&1 | tee -a >> $LOG
chown -R root:sal01 /tmp/Sucursales/Norte/Saltillo 2>&1 | tee -a >> $LOG
chown -R root:tor01 /tmp/Sucursales/Norte/Torreon 2>&1 | tee -a >> $LOG
chown -R root:mxc01 /tmp/Sucursales/Centro/Naucalpan 2>&1 | tee -a >> $LOG
chown -R root:mxc02 /tmp/Sucursales/Centro/Insurgentes 2>&1 | tee -a >> $LOG
chown -R root:slp01 /tmp/Sucursales/Centro/SanLuisPotosi 2>&1 | tee -a >> $LOG
chown -R root:oax01 /tmp/Sucursales/Sur/Oaxaca 2>&1 | tee -a >> $LOG
chown -R root:mer01 /tmp/Sucursales/Oriente/Merida 2>&1 | tee -a >> $LOG
chown -R root:gdl01 /tmp/Sucursales/Occidente/Guadalajara 2>&1 | tee -a >> $LOG
chown -R root:leo01 /tmp/Sucursales/Occidente/Leon 2>&1 | tee -a >> $LOG
chown -R root:transfer /tmp/Sucursales/Transfer 2>&1 | tee -a >> $LOG

echo "Successfully folder and files ownership configuration rutine" 2>&1 | tee -a >> $LOG
echo "-------------------------------------------------------------------------------------------------------------\n\n" 2>&1 | tee -a >> $LOG


# 5.2 Asignación de Seguridad en folders

echo "Starting folder security configuration rutine (chmod 751)" 2>&1 | tee -a >> $LOG

for folder in /tmp/Sucursales/Norte/Valle /tmp/Sucursales/Norte/Kalos /tmp/Sucursales/Norte/Saltillo /tmp/Sucursales/Norte/Torreon /tmp/Sucursales/Centro/Naucalpan /tmp/Sucursales/Centro/Insurgentes /tmp/Sucursales/Centro/SanLuisPotosi /tmp/Sucursales/Sur/Oaxaca /tmp/Sucursales/Oriente/Merida /tmp/Sucursales/Occidente/Guadalajara /tmp/Sucursales/Occidente/Leon /tmp/Sucursales/Transfer; do chmod 751 ${folder}; done 2>&1 | tee -a >> $LOG

echo "Successfully folder security configuration rutine" 2>&1 | tee -a >> $LOG
echo "-------------------------------------------------------------------------------------------------------------\n\n" 2>&1 | tee -a >> $LOG


# 5.3 Asignación de Seguridad en Archivos

echo "Starting files security configuration (chmod 660)" 2>&1 | tee -a >> $LOG

for folder in /tmp/Sucursales/Norte/Valle/* /tmp/Sucursales/Norte/Kalos/* /tmp/Sucursales/Norte/Saltillo/* /tmp/Sucursales/Norte/Torreon/* /tmp/Sucursales/Centro/Naucalpan/* /tmp/Sucursales/Centro/Insurgentes/* /tmp/Sucursales/Centro/SanLuisPotosi/* /tmp/Sucursales/Sur/Oaxaca/* /tmp/Sucursales/Oriente/Merida/* /tmp/Sucursales/Occidente/Guadalajara/* /tmp/Sucursales/Occidente/Leon/* /tmp/Sucursales/Transfer/*; do chmod 660 ${folder}; done 2>&1 | tee -a >> $LOG

echo "Successfully files security configuration" 2>&1 | tee -a >> $LOG
echo "-------------------------------------------------------------------------------------------------------------\n\n" 2>&1 | tee -a >> $LOG


# 5.4 Asignación de accesos de lectura solo a archivos ompartidos a través de folder de transferencia 

echo "Starting changing file permissions to gain read only access for others (chmod 664)" 2>&1 | tee -a >> $LOG

chmod o+r /tmp/Sucursales/Norte/Valle/doc001 2>&1 | tee -a >> $LOG
chmod o+r /tmp/Sucursales/Norte/Kalos/doc011 2>&1 | tee -a >> $LOG
chmod o+r /tmp/Sucursales/Norte/Saltillo/doc021 2>&1 | tee -a >> $LOG
chmod o+r /tmp/Sucursales/Norte/Torreon/doc031 2>&1 | tee -a >> $LOG
chmod o+r /tmp/Sucursales/Centro/Naucalpan/doc041 2>&1 | tee -a >> $LOG
chmod o+r /tmp/Sucursales/Centro/Insurgentes/doc051 2>&1 | tee -a >> $LOG
chmod o+r /tmp/Sucursales/Centro/SanLuisPotosi/doc061 2>&1 | tee -a >> $LOG
chmod o+r /tmp/Sucursales/Sur/Oaxaca/doc071 2>&1 | tee -a >> $LOG
chmod o+r /tmp/Sucursales/Oriente/Merida/doc081 2>&1 | tee -a >> $LOG
chmod o+r /tmp/Sucursales/Occidente/Guadalajara/doc091 2>&1 | tee -a >> $LOG
chmod o+r /tmp/Sucursales/Occidente/Leon/doc101 2>&1 | tee -a >> $LOG

echo "Successfully changing file permissions to gain read only access for others" 2>&1 | tee -a >> $LOG
echo "-------------------------------------------------------------------------------------------------------------\n\n" 2>&1 | tee -a >> $LOG



# 6.- Crear ligas suaves hacia archivos comunes en folders de transferencia

echo "Starting soft links creation rutine" 2>&1 | tee -a >> $LOG

ln -s /tmp/Sucursales/Norte/Valle/doc001 /tmp/Sucursales/Transfer/Valle 2>&1 | tee -a >> $LOG
ln -s /tmp/Sucursales/Norte/Kalos/doc011 /tmp/Sucursales/Transfer/Kalos 2>&1 | tee -a >> $LOG
ln -s /tmp/Sucursales/Norte/Saltillo/doc021 /tmp/Sucursales/Transfer/Saltillo 2>&1 | tee -a >> $LOG
ln -s /tmp/Sucursales/Norte/Torreon/doc031 /tmp/Sucursales/Transfer/Torreon 2>&1 | tee -a >> $LOG
ln -s /tmp/Sucursales/Centro/Naucalpan/doc041 /tmp/Sucursales/Transfer/Naucalpan 2>&1 | tee -a >> $LOG
ln -s /tmp/Sucursales/Centro/Insurgentes/doc051 /tmp/Sucursales/Transfer/Insurgentes 2>&1 | tee -a >> $LOG
ln -s /tmp/Sucursales/Centro/SanLuisPotosi/doc061 /tmp/Sucursales/Transfer/SanLuisPotosi 2>&1 | tee -a >> $LOG
ln -s /tmp/Sucursales/Sur/Oaxaca/doc071 /tmp/Sucursales/Transfer/Oaxaca 2>&1 | tee -a >> $LOG
ln -s /tmp/Sucursales/Oriente/Merida/doc081 /tmp/Sucursales/Transfer/Merida 2>&1 | tee -a >> $LOG
ln -s /tmp/Sucursales/Occidente/Guadalajara/doc091 /tmp/Sucursales/Transfer/Guadalajara 2>&1 | tee -a >> $LOG
ln -s /tmp/Sucursales/Occidente/Leon/doc101 /tmp/Sucursales/Transfer/Leon 2>&1 | tee -a >> $LOG

echo "Successfully soft links creation rutine" 2>&1 | tee -a >> $LOG
echo "-------------------------------------------------------------------------------------------------------------\n\n" 2>&1 | tee -a >> $LOG


echo "info:" 2>&1 | tee -a >> $LOG
date 2>&1 | tee -a >> $LOG

##########################################################################################################
#
# ejemplo de script para clases del 07 de Agosto del 2020
#
##########################################################################################################
# 1.- Creación de Grupos en OS
#for group in gpo01 gpo02 gpo03 gpo04 gpo05; do groupadd ${group}; done

# 2.- Creación de usuarios y asignación de comentarios y grupos
#useradd user01 -c "user UNO" -G gpo01,gpo05
#useradd user02 -c "user DOS" -G gpo02,gpo05
#useradd user03 -c "user TRES" -G gpo03,gpo05
#useradd user04 -c "user CUATRO" -G gpo04,gpo05
#useradd user05 -c "user CINCO" -G gpo01,gpo05
#useradd user06 -c "user SEIS" -G gpo02,gpo05
#useradd user07 -c "user SIETE" -G gpo03,gpo05
#useradd user08 -c "user OCHO" -G gpo04,gpo05

# 3.- Creación de Carpetas
#mkdir /tmp/info2 /tmp/info2/folder01 /tmp/info2/folder02 /tmp/info2/folder03 /tmp/info2/folder04 /tmp/info2/folder05

# 4.- Crear archivos en carpetas
#touch /tmp/info2/folder01/file-1-{001..020}.txt 
#touch /tmp/info2/folder02/file-2-{001..020}.txt
#touch /tmp/info2/folder03/file-3-{001..020}.txt
#touch /tmp/info2/folder04/file-4-{001..020}.txt

# 5.- Crear ligas suaves en folder05 hacia archivos comunes
#ln -s /tmp/info2/folder01/file-1-012.txt /tmp/info2/folder05/resumen_compras
#ln -s /tmp/info2/folder05/ /tmp/info2/folder02/file-2-012.txt
#ln -s /tmp/info2/folder05/ /tmp/info2/folder03/file-3-012.txt
#ln -s /tmp/info2/folder05/ /tmp/info2/folder04/file-4-012.txt

# 6.1- Asignación de owners
#chown root:gpo01 /tmp/info2/folder01
#chown root:gpo02 /tmp/info2/folder02
#chown root:gpo03 /tmp/info2/folder03
#chown root:gpo04 /tmp/info2/folder04
#chown root:gpo05 /tmp/info2/folder05

# 6.2- Asignación de permisos carpetas ( 775 --> drwxrwxr-x )

#chmod 771 /tmp/info2/folder01 /tmp/info2/folder02 /tmp/info2/folder03 /tmp/info2/folder04

# 6.3- Asignación de permisos archivos ( 664 --> -rw-rw-r-- )
 
# chmod 664 /tmp/info2/folder01/* /tmp/info2/folder02/* /tmp/info2/folder03/* /tmp/info2/folder04/*
#chmod 660 /tmp/info2/folder01/* 
#chmod 660 /tmp/info2/folder02/* 
#chmod 660 /tmp/info2/folder03/* 
#chmod 660 /tmp/info2/folder04/*

#chmod 664 /tmp/info2/folder1/file-1-012.txt
#chmod 664 /tmp/info2/folder2/file-2-012.txt
#chmod 664 /tmp/info2/folder3/file-3-012.txt
#chmod 664 /tmp/info2/folder4/file-4-012.txt

###################################################################################################################
#
####################################################################################################################

