#!/bin/bash
clear
if (( EUID != 0 ))
then
  echo "Aquest script s'ha d'executar amb prilegis de l'usuari root"
  exit 1 
fi

echo -n "Donam un directori del sistema per fer una copia de seguretat: "
read dir_sys

if [ -d $dir_sys ] && [ ! -L $dir_sys ]
then
	cp -r $dir_sys /mnt/
	mv /mnt/$dir_sys /mnt/$dir_sys.$(date +"%Y%m%d%H%M")
	exit 0
else
	echo "Error: No existeix el directori introduït"
	exit 1
fi

