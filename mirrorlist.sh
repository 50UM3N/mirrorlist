#!/bin/bash
#kali linux mirror list to solve the slow update problem
cyan='\e[0;36m'
green='\e[0;34m'
okegreen='\033[92m'
lightgreen='\e[1;32m'
red='\e[1;31m'
yellow='\e[0;33m'
orange='\e[38;5;166m'

function change ()
{
  
  PS3='Enter the mirror => '
  mirror=(  "https://ftp.acc.umu.se/mirror/kali.org/kali"
            "https://mirror.karneval.cz/pub/linux/kali"
            "https://mirrors.dotsrc.org/kali"
            "https://ftp.halifax.rwth-aachen.de/kali"
            "https://ftp1.nluug.nl/os/Linux/distr/kali"
            "https://ftp2.nluug.nl/os/Linux/distr/kali"
            "https://mirror.neostrada.nl/kali"
            "https://hlzmel.fsmg.org.nz/kali"
            "https://wlglam.fsmg.org.nz/kali"
            "https://kali.download/kali"
            "https://mirrors.ocf.berkeley.edu/kali"
            "http://kali.mirror.garr.it/mirrors/kali"
            "Exit")
  select MIRROR in "${mirror[@]}"
  do
  	if test $MIRROR == 'Exit'
  	then
  		echo -e "$red Good Bye *_*"
  		exit
  	fi
  	if grep "deb http://http.kali.org/kali" /etc/apt/sources.list
  	then 
  		cp /etc/apt/sources.list /etc/apt/sources.list.backup
  		echo -e "deb $MIRROR kali-rolling main contrib non-free \ndeb-src $MIRROR kali-rolling main non-free contrib" > /etc/apt/sources.list
  		echo -e "$green Done"
        echo -e "$red run apt-get update for the changes to load."
        exit
    else
    	echo -e "deb $MIRROR kali-rolling main contrib non-free \ndeb-src $MIRROR kali-rolling main non-free contrib" >> /etc/apt/sources.list
  		echo -e "$green Done"
        echo -e "$red run apt-get update for the changes to load."
        exit
    fi
done
}
function banner ()
	{
      echo -e "$yellow __  __ _                       _     _     _   "
      echo -e "|  \/  (_)_ __ _ __ ___  _ __  | |   (_)___| |_  "
      echo -e "| |\/| | | '__| '__/ _ \| '__| | |   | / __| __| "
      echo -e "| |  | | | |  | | | (_) | |    | |___| \__ \ |_  "
      echo -e "|_|  |_|_|_|  |_|  \___/|_|    |_____|_|___/\__| "
      echo -e " Created By : $red Soumen Khara (50UM3N)$okegreen"
      echo -e ""
	}
banner
change