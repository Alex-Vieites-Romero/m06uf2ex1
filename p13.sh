#!/bin/bash
clear
#######COMPROVANT SI L'ARXIU DE GUIÓ L'EXECUTA L'USUARI ROOT###################
if (( EUID != 0 ))
then
  echo "Aquest script s'ha d'executar amb prilegis de l'usuari root"
  exit 1 
fi
inst=$(apt search pwgen | cut -d " " -f 1)
if [[ $inst != "i" ]]
then
	echo "Instal·lant pwgen"
	apt-get install -y pwgen > /dev/null
fi
echo -n "Donam el nom base per crear els usuaris: "
read nom_base
echo -n "Doname el nombre de usuaris pels quals vols la contrasenya: "
read n_usr
for (( x=1; x<=$n_usr; x++ )) 
do
	ctsnya=$(pwgen 8 1)
	nom_usr=$nom_base$num.@fje
	echo "$nom_usr  $ctsnya" >> /home/alviro/nom_base.txt
done 
