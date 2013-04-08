#!/bin/bash
# http://doc.ubuntu-fr.org/nettoyer_ubuntu

clear;
echo "script Nettoyage UBUNTU"
purgeall;
autoremove;
#echo "Supression des résidus de paquets supprimés"
#sudo dpkg -P `dpkg -l | grep "^rc" | tr -s ' ' | cut -d ' ' -f 2`
echo "Paquets périmés supprimés OK"
rm -r -f ~/.cache/*;
echo "Suppression des fichiers de cache. OK"
rm -r -f ~/.local/share/Trash/files/* 
echo "Suppression de la CORBEILLE vide. OK"
find ~/.thumbnails -type f -atime +7 -exec rm {} \;
echo "Supression des icones. OK"
find ~/ -name '*~' -exec rm {} \;
echo "Suppression des fichiers temporaires du dossier HOME terminant par ~ terminé. OK"
echo "TERMINÉ, lancement de bleachbit"
bleachbit;


