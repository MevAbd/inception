#!/bin/bash

chown -R www-data:www-data /var/www/*;
chown -R 755 /var/www/*;
mkdir -p /run/php/;

if [ ! -f /var/www/html/wp-config.php ]; then
	mkdir -p /var/www/html
	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar;
	chmod +x wp-cli.phar;
  	mv wp-cli.phar /usr/local/bin/wp;
	cd /var/www/html;
	wp core download --allow-root --path=/var/www/html/wordpress;
	cp /root/wp-config.php /var/www/html/wordpress;
#	wp --allow-root core install --path=/var/www/html/wordpress --url=https://malbrand.42.fr --title=inception --admin_user=malbrand --admin_password=sqlokapi --admin_email=exemple@exemple.fr;
	#wp user create --allow-root ${WP_USER_LOGIN} ${WP_USER_EMAIL} --user_pass=${WP_USER_PASSWORD};
fi


#wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar;
#mv wp-cli.phar /usr/bin/wp
#chmod 777 /usr/bin/wp



#cp /root/wp-config.php /var/www/html/wordpress;

#wp --allow-root config create --path=${WP_PATH} --dbname=${DB_NAME} \
#	--dbuser=${DB_USERNAME} --dbpass=${DB_PASSWORD}

#wp --allow-root  --path=/var/www/html/wordpress db create



#wp theme install --allow-root --path=/var/www/html/wordpress/ twentysixteen --activate

#/usr/sbin/php-fpm7.3 -F



wp config create --allow-root --dbname=wordpress --dbuser=malbrand --dbpass=sqlokapi --dbhost=mariadb 

wp core install --allow-root --url="https://malbrand.42.fr" --title="inception" --admin_user="malbrand" --admin_password="sqlokapi" --admin_email="exem@exem.fr" 

wp theme install --allow-root --path=/var/www/html/wordpress/ twentysixteen --activate







