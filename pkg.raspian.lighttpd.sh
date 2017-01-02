#!/bin/bash

# Raspian lighttpd,
# and the rest to install the funtechhouse webinterface...

# http://www.penguintutor.com/linux/light-webserver

#If run with sudo, fix $USER so it uses the caller username
if [ "x$USER" == 'xroot' ]
then
    USER=`logname`
    echo "Fix username from root to $USER"
fi

apt-get -y update  || exit 10
apt-get -y upgrade || exit 11

apt-get -y install \
    lighttpd \
    php5-cgi \
    || exit 20

apt-get -y install \
    php5-common php5 \
    || exit 22

# Do I need MySQL? mysql-server php5-mysql

lighty-enable-mod fastcgi-php
service lighttpd force-reload || exit 26

chown -R www-data:www-data /var/www || exit 30
chmod 775 /var/www                  || exit 32
chmod g+w -R /var/www/*             || exit 33
usermod -aG www-data $USER          || exit 34

echo "Done..."
exit 0
