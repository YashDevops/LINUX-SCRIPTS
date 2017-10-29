#!/bin/bash

apt-get update
# install ubuntu git and mysql-server
apt install apache2 git mysql-server -y


# install php and its extensions
apt install php libapache2-mod-php php-mysql php-dom php-simplexml php-gd -y

apt install php-curl php-intl php-xsl php-mbstring php-zip php-xml php-mcrypt -y

a2enmod rewrite


#switch to directory 

cd /var/www/html/

#git cloning for opencart

wget https://github.com/opencart/opencart/archive/2.3.0.2.zip


#software to install unzip tool
apt-get install unzip

unzip 2.3.0.2.zip

#move the file to html folder
mv opencart-2.3.0.2/upload/* /var/www/html/

rm -r index.html

mv config-dist.php config.php

cd /var/www/html/admin/

mv config-dist.php config.php

chown -R www-data.www-data /var/www/html


chmod -R 755 /var/www/html