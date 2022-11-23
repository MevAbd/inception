#!/bin/bash

wordpressPath=/var/www/html/wordpress

path=$wordpressPath
url="malbrand.42.fr"
title="inception"
admin_user=$MYSQL_ADMIN
admin_password=$MYSQL_PASS
admin_email=xxx@xxx.fr

function wp-cli() {
wp --allow-root core install \
		--path=$1 \
		--url=$2/ \
		--title=$3 \
		--admin_user=$4 \
		--admin_password=$5 \
		--admin_email=$6	
}


wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar;
mv wp-cli.phar /usr/bin/wp
chmod 777 /usr/bin/wp

rm -rf $wordpressPath;
wp core download --allow-root --path=$wordpressPath;
cp /root/wp-config.php $wordpressPath;
wp-cli $path $title $admin_user $admin_password $admin_email;


/usr/sbin/php-fpm7.3 -F
