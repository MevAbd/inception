CREATE DATABASE IF NOT EXISTS _MYSQL_DATA_;
CREATE USER IF NOT EXISTS '_MYSQL_ADMIN_'@'%' IDENTIFIED BY '_MYSQL_PASS_';
GRANT ALL PRIVILEGES ON _MYSQL_DATA_.* TO '_MYSQL_ADMIN_'@'%';
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY '_MYSQL_ROOT_PASS_';
