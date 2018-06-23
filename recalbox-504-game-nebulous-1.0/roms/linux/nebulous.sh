#!/bin/bash
################################################################################
#           nebulous.sh            NordicPower 1.0  09/04/2018-09/04/2018      #
################################################################################
#V1.0 - 09/04/2018 Version initiale

ARG_SHELL=$(basename $0)

SAV_FOLDER_RECALBOX=/recalbox/share/saves/linux/nebulous
SAV_FOLDER_GAME=$HOME/.toppler
SAV_FILE_GAME=toppler.hsc

################################################################################
#Gestion sauvegarde
if [ $SAV_FOLDER_RECALBOX/$SAV_FILE_GAME -ef $SAV_FOLDER_GAME/$SAV_FILE_GAME ];then
	echo Configuration Hardlink sauvegarde ok
else
	if [ ! -L $SAV_FOLDER_RECALBOX/$SAV_FILE_GAME ] && [ ! -f $SAV_FOLDER_RECALBOX/$SAV_FILE_GAME ] && [ -f $SAV_FOLDER_GAME/$SAV_FILE_GAME ];then
		echo Activation de la sauvegarde Samba
		sudo ln $SAV_FOLDER_GAME/$SAV_FILE_GAME $SAV_FOLDER_RECALBOX/$SAV_FILE_GAME
	fi
	if [ ! -L $SAV_FOLDER_RECALBOX/$SAV_FILE_GAME ] && [ -f $SAV_FOLDER_RECALBOX/$SAV_FILE_GAME ];then
		echo Restauration de la sauvegarde Samba
		mv $SAV_FOLDER_RECALBOX/$SAV_FILE_GAME $SAV_FOLDER_GAME
		sudo ln $SAV_FOLDER_GAME/$SAV_FILE_GAME $SAV_FOLDER_RECALBOX  
	fi
fi

################################################################################
#lancement jeu
cd /usr/bin/toppler/
./toppler
cd - >/dev/null 2>&1

################################################################################
#Gestion sauvegarde
if [ ! $SAV_FOLDER_RECALBOX/$SAV_FILE_GAME -ef $SAV_FOLDER_GAME/$SAV_FILE_GAME ];then
	if [ ! -f $SAV_FOLDER_RECALBOX/$SAV_FILE_GAME ] && [ -f $SAV_FOLDER_GAME/$SAV_FILE_GAME ];then
		echo Activation de la sauvegarde Samba
		sudo ln $SAV_FOLDER_GAME/$SAV_FILE_GAME $SAV_FOLDER_RECALBOX/$SAV_FILE_GAME
	fi
fi

