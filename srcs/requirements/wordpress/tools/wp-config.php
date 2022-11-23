<?php

define( 'DB_NAME', '_MYSQL_DATA_' );

define( 'DB_USER', '_MYSQL_ADMIN_' );

define( 'DB_PASSWORD', '_MYSQL_PASS_' );

define( 'DB_HOST', 'mariadb' );

define( 'DB_CHARSET', 'utf8' );

define( 'DB_COLLATE', '' );

define('AUTH_KEY',         'N};ajghrL_xG8;S8] T8?tC+s2.ZP~`4{+XJOL:M?=v/0|V2z%Wm6]T]vd(f.Nx:');
define('SECURE_AUTH_KEY',  ';H+I>-@2qH6:~?m5F;;*LeV-18,AL.$][#Y_k1 v8d,d=h1|{,|}QZr[xgP7S|(-');
define('LOGGED_IN_KEY',    'c`.wQ[ZO g!k+7+]ZW|@k+9;Uje|_<8s!EoqKH#$DU^S^Kb)Yp$5c]Z9biu*6E:|');
define('NONCE_KEY',        'p(6b{^FC}}P``}Rr`@cAKq-I,2L-B5BhTQC`b`%W~>6js]_-;}^}-2=cc2|q2kZ7');
define('AUTH_SALT',        '#Rs0W[^XkZ/9eX^/MW]@Q>].oc1V7!Rwfv|)Byi[xOpIJid8XF-4x#cZcy0 ]D}6');
define('SECURE_AUTH_SALT', '1b>qNI%yQdn8*.@3zvrUak3Pc4_3+SW6%QBRZs<F-HED}+WO_|,eq-V10x%`^G U');
define('LOGGED_IN_SALT',   'FOdS6lo:@{,,ax+!)iL&.GIX}zd@Z=2)EKN4KQxbdQLU$n(2WGD2&w9w7fgJYmkp');
define('NONCE_SALT',       'l5J5[&WFu>|=m6F^+ RIk(l~Z.O(~Fvy=#JCMk?qW-]fN;/o*:@e.z~C-& ?D`D ');

$table_prefix = 'wp_';

define( 'WP_DEBUG', false );



if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', '/var/www/html/wordpress' );
}

require_once ABSPATH . 'wp-settings.php';
