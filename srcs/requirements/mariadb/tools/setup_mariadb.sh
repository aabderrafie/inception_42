#!/bin/bash

# Exit on any error
echo "Hello from setup_mariadb.sh"
set -e
# Source environment variables from .env file in the specified directory
ENV_DIR="/Users/aaskal/Desktop/inception/srcs"
if [ -f "$ENV_DIR/.env" ]; then
    export $(cat "$ENV_DIR/.env" | xargs)
fi

# Start MariaDB service
service mysql start

# Configure MariaDB
mysql -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};"
mysql -e "CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%';"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
mysql -e "FLUSH PRIVILEGES;"

# Keep MariaDB running in the foreground
exec mysqld_safe