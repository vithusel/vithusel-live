
#!/bin/bash

TEXT_RESET='\e[0m'
TEXT_YELLOW='\e[0;33m'
TEXT_RED_B='\e[1;31m'

sudo apt-get update 
echo -e $TEXT_YELLOW
echo 'Refreshing availible updates'
echo -e $TEXT_RESET

sudo apt-get install apache2 php libapache2-mod-php php-mysql memcached php-memcached -y
echo -e $TEXT_YELLOW
echo 'Installed Apache2'
echo -e $TEXT_RESET

sudo apt-get update
sudo apt-get upgrade
sudo apt-get dist-upgrade
echo -e $TEXT_YELLOW
echo 'Installed updates'
echo -e $TEXT_RESET

sudo rpi-update
echo -e $TEXT_YELLOW
echo 'Updated Raspberry Pi Firmware'
echo -e $TEXT_RESET

cd /var/www
sudo chown vithusel:vithusel html
cd html
rm index.html
cd ..
echo -e $TEXT_YELLOW
echo 'setting ownership of folder and remove exising page'
echo -e $TEXT_RESET

git clone https://github.com/vithusel/vithusel3.0.git html
echo -e $TEXT_YELLOW
echo 'Copy files to folder'
echo -e $TEXT_RESET

cd html
sudo cp -f Scripts/Shell/apache2.conf /etc/apache2/
echo -e $TEXT_YELLOW
echo 'Copied apache config file'
echo -e $TEXT_RESET

sudo a2enmod rewrite
sudo a2enmod php7.0
sudo systemctl restart apache2
echo -e $TEXT_YELLOW
echo 'Enable mod-rewrite'
echo -e $TEXT_RESET

sudo reboot
echo -e $TEXT_YELLOW
echo 'Reboot system'
echo -e $TEXT_RESET
