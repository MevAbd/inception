#!/bin/sh


#if [ -d "/var/lib/mysql/$MYSQL_DATA" ]
#then

echo "\e[32mDatabase already exists\e[0m"
#mysqld_safe

#else

sleep 1
echo "1"
service mysql start 
echo "2"
while [ [ ! mysqladmin -uroot --password="" status &> /dev/null ] && [ ! mysqladmin -uroot --password="$MYSQL_ROOT_PASSWORD" status &> /dev/null ] ]; do sleep 1; done;
sleep 1
mysql -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATA};" 
mysql -e "CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED by '${MYSQL_PASSWORD}';" 
mysql -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATA}.* TO '${MYSQL_USER}'@'%';"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED by '${MYSQL_ROOT_PASSWORD}';"
mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "FLUSH PRIVILEGES;"
sleep 1

mysqld_safe
sleep 1

#fi
