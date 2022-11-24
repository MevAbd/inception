#!/bin/bash

wpPath=/var/www/html/wordpress
url="malbrand.42.fr"
title="inception"
admin_user=$MYSQL_ADMIN
admin_password=$MYSQL_PASS
admin_email=$MYSQL_MAIL

function wp-cli() {
wp --allow-root core install \
		--path=$wpPath \
		--url=$url/ \
		--title=$title \
		--admin_user=$admin_user \
		--admin_password=$admin_password \
		--admin_email=$admin_email	
}


wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar;
mv wp-cli.phar /usr/bin/wp
chmod 777 /usr/bin/wp

rm -rf $wordpressPath;
wp core download --allow-root --path=/var/www/html/wordpress;
cp /root/wp-config.php /var/www/html/wordpress;
wp --allow-root core install --path=/var/www/html/wordpress --url=https://malbrand.fr --title=inception --admin_user=malbrand --admin_password=sqlokapi --admin_email=exemple@exemple.fr;

/usr/sbin/php-fpm7.3 -F
