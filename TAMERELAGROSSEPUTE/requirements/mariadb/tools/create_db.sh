#!/bin/sh
set -xv
mysql_install_db
service mysql start 

mysql -u root -h localhost -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATA};"

mysql -u root -h localhost -e "CREATE USER IF NOT EXISTS '${MYSQL_ADMIN}'@'%' IDENTIFIED by '${MYSQL_PASS}';"


mysql -u root -h localhost -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATA}.* TO '${MYSQL_ADMIN}'@'%';"

mysql -u root -h localhost -e "ALTER USER 'root'@'localhost' IDENTIFIED by '${MYSQL_ROOT_PASS}';"

#mysql -u root -p${MYSQL_ROOT_PASS} -h localhost -e "FLUSH PRIVILEGES;"












#/usr/bin/mysqld_safe --datadir='/var/lib/mysql'

#mysqld_safe

