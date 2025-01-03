#!/bin/bash

# Exit on any error
set -e

# Source environment variables from .env file in the specified directory
ENV_DIR="/Users/aaskal/Desktop/inception/srcs"
if [ -f "$ENV_DIR/.env" ]; then
    export $(cat "$ENV_DIR/.env" | xargs)
fi

# Start PHP-FPM service
service php8.1-fpm start

# Set up WordPress configuration
cd /var/www/html/wordpress

# Configure wp-config.php using environment variables
cp wp-config-sample.php wp-config.php
sed -i "s/database_name_here/${MYSQL_DATABASE}/" wp-config.php
sed -i "s/username_here/${MYSQL_USER}/" wp-config.php
sed -i "s/password_here/${MYSQL_PASSWORD}/" wp-config.php
sed -i "s/localhost/${MYSQL_HOST}/" wp-config.php

# Set proper permissions for WordPress files
chown -R www-data:www-data /var/www/html/wordpress

# Keep PHP-FPM running in the foreground
exec php-fpm7.4 -F
