#!/bin/bash

#Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

clear
echo -e "\n${yellowColour} [*] ${endColour} ${blueColour} Inicio $endColour ${yellowColour}[*]${endColour}"
echo -en "\nEnter Name File Decompress:\n===> "; read -r FileDecompress 
while true; do
	nameFile=$(7z l $FileDecompress | grep Name -A 2 | tail -n 1 | awk '{print $NF}') 2>/dev/null
	if [ $nameFile != " " 2>/dev/null ]; then
			echo -e "${greenColour} [*]${endColour} File:${purpleColour} $nameFile ${endColour} ${greenColour}[*]${endColour}"
			7z x $FileDecompress > /dev/null
			FileDecompress=$nameFile 
		else 
			echo -e "${yellowColour} [*] ${endColour} ${blueColour} Finish ${endColour} ${yellowColour} [*] ${endColour}\n"
			password="$(bat $FileDecompress | awk '{print $NF}')"
			echo -e "${redColour}[*]${endColour} $password ${redColour}[*]${endColour}"
			rm -rf data*
			exit
		fi;
	done
