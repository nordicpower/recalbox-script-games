#!/bin/bash
#GAME GIANA'S RETURN (http://www.retroguru.com/gianas-return/)
#NORDIC POWER - AVRIL 2018
#TESTER AVEC RECALBOX 18.03.30 
#V1.0 - 07/04/2018 Version initiale

echo ---------------------------------------------------------------------------
echo INSTALLATION V1.0 07/04/2018 DU JEUX LINUX GIANA SISTERS
echo ---------------------------------------------------------------------------
#cd /recalbox/share/nordicpower/install/recalbox-502-giana-1.0
mount -o remount,rw /

echo Telechargement du binaire pi
if [ -d "game-giana-temp" ]; then
	rm -r game-giana-temp
fi
mkdir game-giana-temp
cd game-giana-temp
wget http://www.retroguru.com/gianas-return/gianas-return-v.latest-raspberrypi.zip -O giana.zip
unzip -n giana.zip -d giana_src
rm giana.zip

echo Installation du binaire
if [ ! -d "/usr/bin/giana" ]; then
	mkdir /usr/bin/giana
	chmod 777 /usr/bin/giana
fi
chmod 777 ./giana_src/giana_rpi
cp ./giana_src/giana_rpi /usr/bin/giana
cp -r ./giana_src/data /usr/bin/giana
cd ..

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

echo Configuration de la sauvegarde de giana
SAV_FOLDER_RECALBOX=$FOLDER_SAV_LINUX/giana
SAV_FOLDER_GAME=$HOME/.giana
if [ ! -d $SAV_FOLDER_RECALBOX ]; then
	mkdir $SAV_FOLDER_RECALBOX
	chmod 777 $SAV_FOLDER_RECALBOX
	echo "  Creation de $SAV_FOLDER_RECALBOX"
fi

echo Ajout de Giana Return''s dans le menu linux
chmod 777 ./roms/linux/*.sh
cp ./roms/linux/gianas-return.sh $FOLDER_ROM_LINUX
cp ./roms/linux/images/* $FOLDER_ROM_LINUX/images
cp ./roms/linux/gamelist.new $FOLDER_ROM_LINUX/gamelist.xml
#python /home/pi/happi/config/scraper/gamelistpatch/mergexml.py ./roms/divers/linux/gamelist.new $FOLDER_ROM_LINUX/gamelist.xml

#Fin
echo ok
