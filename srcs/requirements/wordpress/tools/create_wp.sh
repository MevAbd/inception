#!/bin/bash


sleep 10

chown -R www-data:www-data /var/www/*;
chown -R 755 /var/www/*;
mkdir -p /run/php/;

if [ ! -f /var/www/html/wordpress/wp-config.php ];
then
	mkdir -p /var/www/html
	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar;
	chmod +x wp-cli.phar;
  	mv wp-cli.phar /usr/local/bin/wp;
	cd /var/www/html/wordpress;
	wp core download --allow-root --path=/var/www/html/wordpress;
	wp config create --allow-root --dbname=wordpress --dbuser=malbrand --dbpass=sqlokapi --dbhost=mariadb --path=/var/www/html/wordpress;

	wp core install --allow-root --url="https://malbrand.42.fr" --title="inception" --admin_user="malbrand" --admin_password="sqlokapi" --admin_email="exem@exem.fr" --path=/var/www/html/wordpress;
	sed -i "s/__DIR__ . '\/'/'\/var\/www\/html\/wordpress'/g" /var/www/html/wordpress/wp-config.php


	wp theme install --allow-root --path=/var/www/html/wordpress/ twentysixteen --activate
	wp cache flush --allow-root --path=/var/www/html/wordpress
	#wp user create --allow-root ${WP_USER_LOGIN} ${WP_USER_EMAIL} --user_pass=${WP_USER_PASSWORD};
fi

exec /usr/sbin/php-fpm7.3 -F -R










