#!/bin/bash

while ! mariadb -hmariadb -u${MYSQL_USER} -p${MYSQL_PASSWORD} "wordpress" &> /dev/null
do
	sleep 1
done

mkdir -p /var/www/html/wordpress
chmod 777 /var/www/html
chown -R www-data:www-data /var/www/html/
cd /var/www/html/wordpress/

wp core download --allow-root --locale=fr_FR

if [ ! -f /var/www/html/wordpress/wp-config.php ];
then
	echo "~~~~~~~~~~~~~~~~~~~~~~~~ICI~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
	wp config create --allow-root --dbname=${MYSQL_DATA} --dbuser=${MYSQL_USER} --dbpass=${MYSQL_PASSWORD} --dbhost=${MYSQL_HOST} --path=${WP_PATH}
fi

wp core install --allow-root --url=${WP_DOMAIN} --title=${WP_NAME} --admin_user=${MYSQL_USER} --admin_password=${MYSQL_PASSWORD} --admin_email=${WP_MAIL}

wp user create --allow-root ${WP_NUSER} ${WP_NUSER_MAIL} --role=author --user_pass=${WP_NUSER_PASS}

wp theme install twentyseventeen --activate --allow-root
wp cache flush --allow-root
mysql -u root -p$MYSQL_ROOT_PASSWORD -e "FLUSH PRIVILEGES;"

mkdir /run/php

exec /usr/sbin/php-fpm7.3 -F -R
