#!/bin/sh

if [ -f ./wordpress/wp-config.php ]
then
	echo "wordpress already downloaded"
else
	wget https://wordpress.org/latest.tar.gz
	tar -xzvf latest.tar.gz
	rm -rf latest.tar.gz

	cd /var/www/html/wordpress
	sed -i "s/username_here/$MYSQL_USER/g" wp-config-sample.php
	sed -i "s/password_here/$MYSQL_PASSWORD/g" wp-config-sample.php
	sed -i "s/localhost/$DOMAIN_NAME/g" wp-config-sample.php
	sed -i "s/database_name_here/$MYSQL_DATA/g" wp-config-sample.php
	mv wp-config-sample.php wp-config.php
fi

chown -R root:root /var/www/html/wordpress
exec /usr/sbin/php-fpm7.3 -F -R
