#!/bin/bash
#GAME NEBULOUS 1.6.1
#NORDIC POWER - AVRIL 2018
#TESTER AVEC RECALBOX 18.03.30 
#V1.0 - 09/04/2018 Version initiale

echo ---------------------------------------------------------------------------
echo INSTALLATION V1.0 09/04/2018 DU JEUX LINUX NEBULOUS 1.6.1
echo ---------------------------------------------------------------------------

mount -o remount,rw /

#Installation
#sudo apt-get install -y toppler

#Installation
echo Installation
if [ ! -d "/usr/bin/toppler" ]; then
	mkdir /usr/bin/toppler
	chmod 777 /usr/bin/toppler
fi
chmod 777 ./bin/toppler
cp ./bin/toppler /usr/bin/toppler/

if [ ! -d "/usr/local" ]; then
	mkdir /usr/local
	chmod 777 /usr/local
fi
if [ ! -d "/usr/local/share" ]; then
	mkdir /usr/local/share
	chmod 777 /usr/local/share
fi
if [ ! -d "/usr/local/share/toppler" ]; then
	mkdir /usr/local/share/toppler
	chmod 777 /usr/local/share/toppler
fi
cp ./bin/toppler.dat /usr/local/share/toppler/
cp ./bin/toppler.ogg /usr/local/share/toppler/


if [ ! -d "/usr/local/share/locale" ]; then
	mkdir /usr/local/share/locale
	chmod 777 /usr/local/share/locale
fi
if [ ! -d "/usr/local/share/locale/fr" ]; then
	mkdir /usr/local/share/locale/fr
	chmod 777 /usr/local/share/locale/fr
fi
if [ ! -d "/usr/local/share/locale/fr/LC_MESSAGES" ]; then
	mkdir /usr/local/share/locale/fr/LC_MESSAGES
	chmod 777 /usr/local/share/locale/fr/LC_MESSAGES
fi
cp ./bin/locale/fr/LC_MESSAGES/toppler.mo /usr/local/share/locale/fr/LC_MESSAGES

echo Configuration linux
FOLDER_ROM_LINUX=/recalbox/share/roms/linux
FOLDER_SAV_LINUX=/recalbox/share/saves/linux
if [ ! -d $FOLDER_ROM_LINUX ]; then
	mkdir $FOLDER_ROM_LINUX
	chmod 777 $FOLDER_ROM_LINUX
	echo "  Creation de $FOLDER_ROM_LINUX"
fi
if [ ! -d $FOLDER_ROM_LINUX/images ]; then
	mkdir $FOLDER_ROM_LINUX/images
	chmod 777 $FOLDER_ROM_LINUX/images
	echo "  Creation de $FOLDER_ROM_LINUX/images"
fi
if [ ! -d $FOLDER_SAV_LINUX ]; then
	mkdir $FOLDER_SAV_LINUX
	chmod 777 $FOLDER_SAV_LINUX
	echo "  Creation de $FOLDER_SAV_LINUX"
fi


echo Configuration de la sauvegarde de Nebulous
SAV_FOLDER_RECALBOX=$FOLDER_SAV_LINUX/nebulous
SAV_FOLDER_GAME=$HOME/.toppler
if [ ! -d $SAV_FOLDER_GAME ]; then
	mkdir $SAV_FOLDER_GAME
	chmod 777 $SAV_FOLDER_GAME
	echo "  Creation de $SAV_FOLDER_GAME"
fi
if [ ! -d $SAV_FOLDER_RECALBOX ]; then
	mkdir $SAV_FOLDER_RECALBOX
	chmod 777 $SAV_FOLDER_RECALBOX
	echo "  Creation de $SAV_FOLDER_RECALBOX"
fi

#if [ -d /var/games/toppler ]; then
# 	rm -r /var/games/toppler
# 	echo "  Suppression de la sauvegarde globale pour forcage home/pi/.toppler"
#fi

echo Depot de la configuration du jeu Nebulous
cp ./.toppler/.toppler.rc $SAV_FOLDER_GAME

echo Ajout de NEBULOUS dans le menu linux
chmod 777 ./roms/linux/nebulous.sh
cp ./roms/linux/nebulous.sh $FOLDER_ROM_LINUX/nebulous.sh
cp ./roms/linux/images/nebulous-image.png $FOLDER_ROM_LINUX/images
#python /home/pi/happi/config/scraper/gamelistpatch/mergexml.py ./roms/divers/linux/gamelist.new $FOLDER_ROM_LINUX/gamelist.xml
#cp ./roms/linux/gamelist.new $FOLDER_ROM_LINUX/gamelist.xml

#Fin
echo ok