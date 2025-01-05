#!/bin/sh

MYSQL_DATABASE="wordpress"
MYSQL_USER="wordpress"
MYSQL_PASSWORD="password"
MYSQL_HOSTNAME="mysql"

if [ -f ./wordpress/wp-config.php ]; then
    echo "WordPress already downloaded"
else
    # Download WordPress
    wget https://wordpress.org/latest.tar.gz
    tar -xzvf latest.tar.gz
    rm -rf latest.tar.gz

    # Update configuration file
    rm -rf /etc/php/8.2/fpm/pool.d/www.conf
    mv ./www.conf /etc/php/8.2/fpm/pool.d/

    # Import env variables in the config file
    cd /var/www/html/wordpress
    sed -i "s/username_here/$MYSQL_USER/g" wp-config-sample.php
    sed -i "s/password_here/$MYSQL_PASSWORD/g" wp-config-sample.php
    sed -i "s/localhost/$MYSQL_HOSTNAME/g" wp-config-sample.php
    sed -i "s/database_name_here/$MYSQL_DATABASE/g" wp-config-sample.php
    mv wp-config-sample.php wp-config.php
fi

# Start PHP-FPM
exec /usr/sbin/php-fpm8.2 -F