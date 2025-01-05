# Use Debian 12.8 as the base image

FROM debian:12


WORKDIR  /mariadb
# Update and install MariaDB server and client
RUN apt update && apt install  mariadb-server -y

# Copy the configuration script into the container
COPY tools/setup_mariadb.sh .

# Make the script executable
RUN chmod +x ./setup_mariadb.sh

# Expose MariaDB default port
EXPOSE 3306

# Run the setup script and start MariaDB
CMD ["bash","setup_mariadb.sh"]
