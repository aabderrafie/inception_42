#!/bin/bash

DB_PASSWORD=$(cat /run/secrets/db_password)
ADMIN_PASSWORD=$(cat /run/secrets/credentials | head -n -1)
USER_PASSWORD=$(cat /run/secrets/credentials | tail -1)

# Install WordPress
wget https://wordpress.org/latest.tar.gz
tar -xvzf latest.tar.gz
rm -fr latest.tar.gz

chown -R www-data:www-data /var/www/html/wordpress
chmod -R 777 /var/www/html/wordpress

cd wordpress
wp config create --dbname="${DB_NAME}" --dbuser="${DB_USER}" --dbpass="${DB_PASSWORD}" --dbhost="${DB_HOST}" --allow-root

wp core install --url="10.11.248.74" --title="${TITLE}" --admin_user="${ADMIN_USER}" --admin_password="${ADMIN_PASSWORD}" --admin_email="${ADMIN_EMAIL}" --allow-root

wp user create $EDITOR_USER $EDITOR_USER@1337.com --user_pass="${USER_PASSWORD}" --role=editor --allow-root

wp theme install saaslauncher --allow-root
wp theme activate saaslauncher --allow-root

wp config set WP_REDIS_HOST 'redis' --allow-root
wp config set WP_CACHE 'true' --raw --allow-root
wp plugin install redis-cache --activate --allow-root
wp redis enable --allow-root

exec php-fpm8.2 -F