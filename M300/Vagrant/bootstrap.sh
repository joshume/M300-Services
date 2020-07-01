#!/usr/bin/env bash

# Updating der Packages
apt-get update

# ---------------------------------------
#          MySQL Setup
# ---------------------------------------

# MySQL Benutzer root Passwort root definieren root/root
debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'


# Installieren der Packages
apt-get install -y mysql-server mysql-client

# Externe Zugriffe auf dieses MySQL erlauben
sudo sed -i -e 's/bind-addres/#bind-address/g' /etc/mysql/mysql.conf.d/mysqld.cnf
sudo sed -i -e 's/skip-external-locking/#skip-external-locking/g' /etc/mysql/mysql.conf.d/mysqld.cnf
mysql -u root -proot -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'root'; FLUSH privileges;"
sudo service mysql restart
# Eine Test DB erstellen
mysql -u root -proot -e "CREATE DATABASE myDB;"
