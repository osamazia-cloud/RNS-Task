#!/bin/bash

echo -n "Do you have node.js in your system? "
read String1

if [[ $String1 == "yes" ]]
then
  # Uninstall nodejs
  sudo apt remove nodejs npm
  # Install nodejs
  curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
  sudo apt install nodejs
else
  # Install nodejs
  curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
  sudo apt install nodejs
fi


echo -n "Do you have postgress in your system? "
read String2

if [[ $String2 == "yes" ]]
then
  # Uninstall Postgresql
  sudo apt-get --purge remove postgresql postgresql-*
  # Initial
  apt-get update
  apt-get -y install aptitude bzip2 libbz2-dev git-core bison flex
  aptitude -y install sudo python-all-dev python-setuptools libxml2-dev libgeoip-dev libxslt1-dev uuid-dev gcc automake autoconf libpcre3-dev libssl-dev unzip zip python-psycopg2 libpq-dev wget make libreadline-dev
  aptitude -y full-upgrade 

# Postgresql Download & Install
  wget http://ftp.postgresql.org/pub/source/v8.4.6/postgresql-8.4.6.tar.gz -P /tmp
  mkdir /tmp/postgresql
  tar xzf /tmp/postgresql-8.4.6.tar.gz -C "/tmp/postgresql"
  cd /tmp/postgresql/postgresql-8.4.6
  ./configure
  make
  make install

# Add User
  useradd postgres
  chown "postgres" /usr/local/pgsql
  mkdir /usr/local/pgsql/data
  chown postgres:postgres /usr/local/pgsql/data
  su - postgres
  /usr/local/pgsql/bin/initdb -D /usr/local/pgsql/data/
  /usr/local/pgsql/bin/postmaster -D /usr/local/pgsql/data
  /usr/local/pgsql/bin/createdb test
else
  # Initial
  apt-get update
  apt-get -y install aptitude bzip2 libbz2-dev git-core bison flex
  aptitude -y install sudo python-all-dev python-setuptools libxml2-dev libgeoip-dev libxslt1-dev uuid-dev gcc automake autoconf libpcre3-dev libssl-dev unzip zip python-psycopg2 libpq-dev wget make libreadline-dev
  aptitude -y full-upgrade 

# Postgresql Download & Install
  wget http://ftp.postgresql.org/pub/source/v8.4.6/postgresql-8.4.6.tar.gz -P /tmp
  mkdir /tmp/postgresql
  tar xzf /tmp/postgresql-8.4.6.tar.gz -C "/tmp/postgresql"
  cd /tmp/postgresql/postgresql-8.4.6
  ./configure
  make
  make install

# Add User
  useradd postgres
  chown "postgres" /usr/local/pgsql
  mkdir /usr/local/pgsql/data
  chown postgres:postgres /usr/local/pgsql/data
  su - postgres
  /usr/local/pgsql/bin/initdb -D /usr/local/pgsql/data/
  /usr/local/pgsql/bin/postmaster -D /usr/local/pgsql/data
  /usr/local/pgsql/bin/createdb test
fi


echo -n "Do you have htop in your system? "
read String3

if [[ $String3 == "yes" ]]
then
  # Uninstall htop
  apt-get remove htop -y
  # Install htop
  sudo apt update && sudo apt upgrade
  apt install htop
  snap install htop
  htop
else
  # Install htop
  sudo apt update && sudo apt upgrade
  apt install htop
  snap install htop
  htop
fi
