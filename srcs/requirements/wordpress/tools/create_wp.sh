#!/bin/sh

if [ -f ./wordpress/wp-config.php ]
then
	echo "wordpress already downloaded"
else
	#Download wordpress
	wget https://wordpress.org/latest.tar.gz
	tar -xzvf latest.tar.gz
	rm -rf latest.tar.gz

	#Update configuration file
	rm -rf /etc/php/7.3/fpm/pool.d/www.conf
	mv ./www.conf /etc/php/7.3/fpm/pool.d/

	#Inport env variables in the config file
	cd /var/www/html/wordpress
	sed -i "s/username_here/$MYSQL_USER/g" wp-config-sample.php
	sed -i "s/password_here/$MYSQL_PASSWORD/g" wp-config-sample.php
	sed -i "s/localhost/$DOMAIN_NAME/g" wp-config-sample.php
	sed -i "s/database_name_here/$MYSQL_DATA/g" wp-config-sample.php
	mv wp-config-sample.php wp-config.php
fi

exec "$@"


define('AUTH_KEY',         'eJ+0lBJv8-edYk[?TJf_*-cs|5Vwime4DR-Cp9]Yz-dxr6K^ung`s$+_`Ti*(s`T');
define('SECURE_AUTH_KEY',  'rOg@t(:;]-ke!}F/^K;[y}M>KHgT4X/Vp(do-il~;bT+EI>/v.d%(g0-EJ<0gT3`');
define('LOGGED_IN_KEY',    '[/#7H*F*#c-zIK0s]7;?~LulZCr@y+kx=)&~+nN~}=IZF!y!0zJ#<[+[@/2kyp^k');
define('NONCE_KEY',        'N-34J8elpoXr#1ztjc}OBw.|@if7Nen-{L3u,j)m!IreA7SdOA%.FLvDb):Bm-Zt');
define('AUTH_SALT',        '$SRI+rq`,ZgK0?Y;)(*TgwrW1z+9tsM_bpZI9NEqb0<_&~FXbr$Vl3cKgS|F_A+x');
define('SECURE_AUTH_SALT', 'L|Jd5%8WX>Ab9skMfFw3No:U8AJGTJ,4b*s8QEA^L7J(o-K(Y481Qyba|v4Y`16q');
define('LOGGED_IN_SALT',   'yJyMd|9`H&9(DBRO,Na[Sr!;igE]:O,*y=R4m=;0R)ZOYi=-mE|IW-@Rl7D-xo2`');
define('NONCE_SALT',       '4E9<tJU[7p^p<6pxe4d(#=:<&XC2|^`AKf<9IfFA|$+l=KAf1a(WsMc43S!q*7w|');
