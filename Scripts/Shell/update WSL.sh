ubuntu 

#!/bin/bash

TEXT_RESET='\e[0m'
TEXT_YELLOW='\e[0;33m'
TEXT_RED_B='\e[1;31m'

sudo sudo apt-get update 
echo -e $TEXT_YELLOW
echo 'Refreshing availible updates'
echo -e $TEXT_RESET

sudo apt-get upgrade -y && sudo apt-get dist-upgrade -y && sudo apt-get autoremove && sudo apt-get autoclean
echo -e $TEXT_YELLOW
echo 'Installed updates'
echo -e $TEXT_RESET

cd /var/www/html
git pull
echo -e $TEXT_YELLOW
echo 'update webserver files'
echo -e $TEXT_RESET

while true; do
    read -p "would you like to reboot?" yn
    case $yn in
        [Yy]* ) echo 'rebooting system'; sudo reboot;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done