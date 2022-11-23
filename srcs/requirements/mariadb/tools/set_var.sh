#!/bin/bash

sed -i "s/_MYSQL_DATA_/${MYSQL_DATA}/g" /var/www/create_db.sql
sed -i "s/_MYSQL_ADMIN_/${MYSQL_ADMIN}/g" /var/www/create_db.sql
sed -i "s/_MYSQL_PASS_/${MYSQL_PASS}/g" /var/www/create_db.sql
sed -i "s/_MYSQL_ROOT_PASS_/${MYSQL_ROOT_PASS}/g" /var/www/create_db.sql

/etc/init.d/mariadb setup
service mysql start && mysql -u root < /var/www/create_db.sql && rm -rf /var/www/create_db.sql
mysqld
