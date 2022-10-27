#!/bin/sh


service mysql start -u root -p$MYSQL_ROOT_PASSWORD

mysql -u root -p$MYSQL_ROOT_PASSWORD -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATA}\`;"
mysql -u root -p$MYSQL_ROOT_PASSWORD -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mysql -u root -p$MYSQL_ROOT_PASSWORD -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATA}\`.* TO \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mysql -u root -p$MYSQL_ROOT_PASSWORD -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
mysql -u root -p$MYSQL_ROOT_PASSWORD -e "FLUSH PRIVILEGES;"
mysqladmin -u root -p$MYSQL_ROOT_PASSWORD shutdown
mysqld_safe -u root -p$MYSQL_ROOT_PASSWORD
#echo "\e[0;32mBLOPBLOP\e[0m"
