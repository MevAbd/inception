#!/bin/sh

echo 'stty stop undef <$TTY >$TTY' > .zshrc
service mysql start 
chmod 755 /var/run/mysqld.sock
echo $MYSQL_DATABASE
if [ -d "/var/lib/mysql/$MYSQL_DATA" ]
then 
	echo "\e[0;32mDATA BASE ALREADY EXISTS\e[0m"
else

echo "\e[0;34mDATA BASE CREATION....\e[0m"
mysql_secure_installation << EOF

y
$MYSQL_ROOT_PASSWORD
$MYSQL_ROOT_PASSWORD
y
n
y
y
EOF

echo "\e[0;32mBLABLABLABLA\e[0m"
mysql -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATA}\`;"

echo "\e[0;32mBLOPBLOP\e[0m"
mysql -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';"

echo "\e[0;32mPRIVILEGES\e[0m"
mysql -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATA}\`.* TO \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"

mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"

mysql -e "FLUSH PRIVILEGES;"

mysqladmin -u root -p$MYSQL_ROOT_PASSWORD shutdown

fi

exec mysqld_safe
