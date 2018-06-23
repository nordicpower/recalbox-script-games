#!/bin/bash
#GAME XRICK #021212 (https://www.bigorno.net/xrick/)
#NORDIC POWER - AVRIL 2018
#TESTER AVEC RECALBOX 18.03.30 
#V1.0 - 09/04/2018 Version initiale

echo ---------------------------------------------------------------------------
echo INSTALLATION V1.0 09/04/2018 JEUX LINUX RICK DANGEROUS 021212
echo VERSION SRC NORDICPOWER PATCHED
echo ---------------------------------------------------------------------------
CURRENT_PATH=$(pwd)

mount -o remount,rw /

#Dépendances
#sudo apt-get install -y libsdl1.2-dev libsdl-mixer1.2-dev libsdl-image1.2-dev zlib1g

#Download Source
echo Telechargement des sources
if [ -d "compilation-temp" ]; then
	rm -rf compilation-temp
fi
mkdir compilation-temp
cd compilation-temp

#HAPPIGC
#git clone --recursive https://github.com/HerbFargus/xrick.git
#Modification des sources by me
#echo Modification des sources
#cp ../nordicpower_src/*.h ./xrick/include
#cp ../nordicpower_src/*.c ./xrick/src

#Build
#echo build...
#cd xrick
#make

#RECALBOX
mkdir xrick
cd xrick
cp ../../bin/xrick/xrick ./
cp ../../bin/xrick/data.zip ./
chmod 777 xrick

#Installation
echo Installation
if [ ! -d "/usr/bin/xrick" ]; then
	mkdir /usr/bin/xrick
	chmod 777 /usr/bin/xrick
fi

cp xrick /usr/bin/xrick/
cp data.zip /usr/bin/xrick/
cd ../..


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


#Configuration sauvegarde du jeu
#Pas de sauvegarde implementee dans xrick :-<


echo Ajout de Rick Dangerous dans le menu linux
chmod 777 ./roms/linux/*.sh
cp ./roms/linux/xrick_map*.sh $FOLDER_ROM_LINUX
cp ./roms/linux/images/* $FOLDER_ROM_LINUX/images
#python /home/pi/happi/config/scraper/gamelistpatch/mergexml.py ./roms/divers/linux/gamelist.new $FOLDER_ROM_LINUX/gamelist.xml
#cp ./roms/linux/gamelist.new $FOLDER_ROM_LINUX/gamelist.xml

#Fin
echo ok
