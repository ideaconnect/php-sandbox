#!/bin/bash
VERSION="$1"
if [ $# -lt 1 ]; then
  echo 1>&2 "$0: not enough arguments: provide PHP version, for example 5.6.22"
  exit 2
fi
apt-get install libcurl4-openssl-dev libtidy-dev libmcrypt-dev libgmp-dev libxslt-dev
sudo ln -s  /usr/include/x86_64-linux-gnu/curl  /usr/include/curl
sudo ln -s /usr/include/x86_64-linux-gnu/gmp.h /usr/include/gmp.h 
rm php.tar.gz >/dev/null 2>/dev/null
rm -rf php-${VERSION} >/dev/null 2>/dev/null
wget http://pl1.php.net/get/php-${VERSION}.tar.gz/from/this/mirror -O php.tar.gz
tar xvf php.tar.gz
cd php-${VERSION}
./configure --with-gd --with-gettext --with-gmp --with-iconv --enable-mbstring  --with-mcrypt --with-mysql --with-mysqli --with-pdo_mysql --with-pdo_sqlite --enable-sockets --with-sqlite3 --with-tidy --enable-xml --with-xsl --with-pear=`pwd`/pear --with-config-file-path=`pwd`/config --prefix=`pwd` && make && make install
mkdir pecl
bin/pecl channel-update pear.php.net
bin/pecl install json ssh2 memcache
ln -s `pwd`/bin/php /bin/php-${VERSION}
