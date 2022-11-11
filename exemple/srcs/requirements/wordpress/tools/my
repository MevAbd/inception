#!/bin/bash

sleep 5

mkdir -p /var/www/html/wordpress
chmod 777 /var/www/html
chown -R www-data:www-data /var/www/html/
cd /var/www/html/wordpress/

wp core download --allow-root --locale=fr_FR

if [ ! -f /var/www/html/wordpress/wp-config.php ];
then
	echo "SALUUUUUUTT"
	wp config create --allow-root --dbname=${MYSQL_DATA} --dbuser=${MYSQL_USER} --dbpass=${MYSQL_PASSWORD} --dbhost=${MYSQL_HOST} --path=${WP_PATH}
	echo "POPOPPOPOPOPO"
fi


wp core install --allow-root --url=${WP_DOMAIN} --title=${WP_NAME} --admin_user=${WP_ADMIN} --admin_password=${WP_PASS} --admin_email=${WP_MAIL}

wp user create --allow-root ${WP_NUSER} ${WP_NUSER_MAIL} --role=author --user_pass=${WP_NUSER_PASS}

wp theme install boldgrid-primas --activate --allow-root
wp cache flush --allow-root

mkdir /run/php

exec /usr/sbin/php-fpm7.3 -F -R
