# Create the directory /run/mysqld if it doesn't exist
mkdir -p /run/mysqld

# Change the ownership of the /run/mysqld directory to the mysql user and group
chown -R mysql:mysql /run/mysqld

# Set the permissions of the /run/mysqld directory to be readable, writable, and executable by everyone
chmod 777 /run/mysqld

# Create an empty file named init.sql
touch init.sql

# Write SQL commands to the init.sql file
echo 'USE mysql;' > init.sql
echo 'FLUSH PRIVILEGES;' >> init.sql
echo "CREATE DATABASE wordpress;" >> init.sql
echo "CREATE USER 'usertest'@'%' IDENTIFIED BY 'password';" >> init.sql
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'usertest'@'%';" >> init.sql
echo 'FLUSH PRIVILEGES;' >> init.sql

# Execute the SQL commands in init.sql as the root user
mariadb --user=root  < init.sql

# Start the MariaDB server with the mysql user and bind it to all network interfaces
mariadbd --user=mysql --bind-address=0.0.0.0